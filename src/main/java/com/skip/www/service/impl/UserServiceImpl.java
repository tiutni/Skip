package com.skip.www.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.skip.www.dao.face.UserDao;
import com.skip.www.dto.ConUserLevel;
import com.skip.www.dto.ExUserLevel;
import com.skip.www.dto.User;
import com.skip.www.service.face.UserService;


@Service
public  class UserServiceImpl implements UserService {

	private static final Logger logger = LoggerFactory.getLogger(UserService.class);

	@Autowired UserDao userDao;

	// 로그인
	@Override
	public boolean login(User user) {
		int loginChk = userDao.selectCntUser(user);

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
		return userDao.selectUserNoByUser(userId);
	}

	// 회원가입
	@Override
	public boolean join(User user) {

		// ID 중복 확인
		if(userDao.selectCntById(user) > 0 ) {
			return false;
		}

		// 회원 가입
		userDao.insert(user);

		// 회원가입 결과 확인
		if(userDao.selectCntById(user) > 0 ) {

			return true;
		}

		return false;
	}

	@Override
	public ConUserLevel viewConLevel(int userNo) {

		logger.info("info() 호출");

		return userDao.selectByConUserLevelconuserlevelno(userNo);
	}

	@Override
	public ExUserLevel viewExLevel(int userNo) {
		logger.info("info()호출");
		return userDao.selectByExUserLevelconuserlevelno(userNo);
	}



	@Override
	public User viewUserInfo(int userNo) {
		return userDao.selectUserinfo(userNo);
	}


	@Override
	public void updateUserinfo(User updateUser) {
		userDao.updateUserInfo(updateUser);
	}

	//회원탈퇴를 위한 회원 정보 검증
	@Override
	public boolean deleteUserInfo(User user) {
		
		
		if( userDao.selectcountUserInfo(user) > 0 ) {
			userDao.deleteUserinfo(user);
			return true;
		}

		return false;


	}

	
	




}
















