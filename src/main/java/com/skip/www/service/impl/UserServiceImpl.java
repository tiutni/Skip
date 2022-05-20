package com.skip.www.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.UUID;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.skip.www.dao.face.UserDao;
import com.skip.www.dto.User;
import com.skip.www.service.face.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired UserDao userDao;

	// 로그인
	@Override
	public boolean login(User user) {
		int loginChk = userDao.selectCntByIdPw(user);
		
		if (loginChk > 0) {
			return true;
		}
		return false;
	}
	
	// 카카오 사용자 AccessToken
	public String getAccessToken(String authorizeCode) {
		String accessToken = "";
		String refreshToken = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
	        
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=20a036a9e9a4a55d7de23fa420405573");
			sb.append("&redirect_uri=http://localhost:8088/user/kakaoLogin");
			sb.append("&code=" + authorizeCode);
			bw.write(sb.toString());
			bw.flush();
	        
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
	        
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
	        
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
	        
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
	        
			accessToken = element.getAsJsonObject().get("access_token").getAsString();
			refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
	        
			System.out.println("access_token : " + accessToken);
			System.out.println("refresh_token : " + refreshToken);
	        
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return accessToken;
	}
	
	// 카카오 사용자 정보
	public HashMap<String, Object> getUserInfo(String accessToken) {

		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String userEmail = kakaoAccount.getAsJsonObject().get("email").getAsString();

			userInfo.put("userEmail", userEmail);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
	
	// 카카오 사용자 ID 중복 확인
	public boolean kakaoIdCheck(HashMap<String, Object> userIfno) {
		
		// 카카오 ID 중복 확인
		if(userDao.selectCntByKakaoId(userIfno) > 0 ) {
			return false;
		} 
		return true;
	}
	
	// 회원번호
	@Override
	public int getUserNo(String userId) {
		return userDao.selectNoById(userId);
	}
	
	// 회원가입
	@Override
	public boolean join(User user) {
		
		String userAddr_tmp = user.getUserAddr();
		String userAddr = userAddr_tmp.replace(",", " ");
		
		user.setUserAddr(userAddr);
		
		// 회원 가입
		userDao.insertInfo(user);
		
		// 회원가입 결과 확인
		if(userDao.selectCntById(user) > 0) {
			return true;
		}
		return false;
	}
	
	// 회원 ID 중복 확인
	public int checkId(User userId) {
		return userDao.selectCntById(userId);
	}
	
	// 회원 닉네임 중복 확인
	public int checkNick(User userNick) {
		return userDao.selectCntByNick(userNick);
	}
	
	// 회원 이메일 중복 확인
	public int checkEmail(User userEmail) {
		return userDao.selectCntByEmail(userEmail);
	}
	
	// 회원 주민등록번호 중복 확인
	public int checkRrn(User userRrn) {
		return userDao.selectCntByRrn(userRrn);
	}
	
	// 회원 핸드폰 번호 중복 확인
	public int checkPhone(User userPhone) {
		return userDao.selectCntByPhone(userPhone);
	}
	
	// 가입된 사용자인지 확인
	public boolean idCheck(User user) {
		if (userDao.selectCntByNamePhone(user) > 0) {
			return true;
		}
		return false;
	}
	
	// 사용자 ID 찾기
	public String findId(User user) {
		return userDao.selectIdByNamePhone(user);
	}

	// 비밀번호 찾기(임시비밀번호 생성)
	public void findPw(User user) {
		
		String tmpPw = UUID.randomUUID().toString().replace("-", "");
		tmpPw = tmpPw.substring(0, 10);
		
		user.setUserPw(tmpPw);
		userDao.updatePw(user);
	}
	
	// 비밀번호 찾기(임시비밀번호) 이메일 발송
	public void sendPwByEmail(User user) {
		
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "admdev.skip";
		String hostSMTPpwd = "skip1234";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "admdev.skip@gmail.com";
		String fromName = "SKIP";
		
		String subject = "";
		String msg = "";

		subject = "[SKIP] 임시 비밀번호 발급 안내";
		msg += "<div align='left'>";
		msg += "임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.";
		msg += "<p>임시 비밀번호 : ";
		msg += userDao.selectPwByIdNamePhone(user) + "</p></div>";

		// 받는 사람 E-Mail 주소
		String userEmail = userDao.selectEamilByIdNamePhone(user);
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(userEmail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
}
