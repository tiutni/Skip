package com.skip.www.dao.face;

import java.util.HashMap;

import com.skip.www.dto.ConUserLevel;
import com.skip.www.dto.ExUserLevel;
import com.skip.www.dto.User;

public interface UserDao {

	/**
	 * ID/PW가 일치하는지 확인한다
	 * @param user - 조회할 ID/PW를 가진 객체
	 * @return 조회된 행 수
	 */
	public int selectCntByIdPw(User user);
	
	/**
	 * 회원 번호를 조회한다
	 * @param userId - 조회할 회원의 ID를 가진 객체
	 * @return 조회된 회원 번호
	 */
	public int selectNoById(String userId);

	/**
	 * 중복된 ID가 존재하는지 확인한다
	 * @param user - 조회할 ID를 가진 객체
	 * @return 존재 여부 (0 - 없음, 1 - 존재)
	 */
	public int selectCntById(User user);
	/**
	 * 중복된 닉네임이 존재하는지 확인한다
	 * @param user - 조회할 닉네임을 가진 객체
	 * @return 존재 여부 (0 - 없음, 1 - 존재)
	 */
	public int selectCntByNick(User userNick);
	
	/**
	 * 중복된 이메일이 존재하는지 확인한다
	 * @param user - 조회할 이메일을 가진 객체
	 * @return 존재 여부 (0 - 없음, 1 - 존재)
	 */
	public int selectCntByEmail(User userEmail);
	
	/**
	 * 중복된 주민등록번호가 존재하는지 확인한다
	 * @param user - 조회할 주민등록번호를 가진 객체
	 * @return 존재 여부 (0 - 없음, 1 - 존재)
	 */
	public int selectCntByRrn(User userRrn);
	
	/**
	 * 중복된 핸드폰 번호가 존재하는지 확인한다
	 * @param user - 조회할 핸드폰 번호를 가진 객체
	 * @return 존재 여부 (0 - 없음, 1 - 존재)
	 */
	public int selectCntByPhone(User userPhone);
	
	/**
	 * 중복된 카카오 ID가 존재하는지 확인한다
	 * @param userIfno - 조회할 카카오 ID를 가진 객체
	 * @return 존재 여부 (0 - 없음, 1 - 존재) 
	 */
	public int selectCntByKakaoId(HashMap<String, Object> userIfno);
	
	/**
	 * 신규 회원 정보를 삽입한다
	 * @param user - 신규 회원 정보
	 */
	public void insertInfo(User user);
	
	/**
	 * 가입된 회원인지 확인한다
	 * @param user - 조회할 회원의 이름, 통신사, 핸드폰 번호를 가진 객체
	 * @return 존재 여부 (0 - 없음, 1 - 존재)
	 */
	public int selectCntByNamePhone(User user);
	
	/**
	 * 회원의 이름, 통신사, 핸드폰 번호를 가진 객체를 이용해 ID를 조회한다
	 * @param user - 조회할 회원의 이름, 통신사, 핸드폰 번호를 가진 객체
	 * @return - 조회된 ID
	 */
	public String selectIdByNamePhone(User user);
	
	/**
	 * 회원의 이름, 통신사, 핸드폰 번호를 가진 객체를 이용해 이메일을 조회한다
	 * @param user - 조회할 회원의 이름, 통신사, 핸드폰 번호를 가진 객체
	 * @return - 조회된 이메일
	 */
	public String selectEamilByIdNamePhone(User user);
	
	/**
	 * 비밀번호를 임시 비밀번호로 변경한다
	 * @param user - 비밀번호를 변경할 회원의 ID, 이름, 통신사, 핸드폰 번호를 가진 객체
	 */
	public void updatePw(User user);
	
	/**
	 * 변경된 임시 비밀번호를 조회한다
	 * @param user - 회원의 ID, 이름, 통신사, 통신사, 핸드폰 번호를 가진 객체
	 * @return - 조회된 임시 비밀번호
	 */
	public String selectPwByIdNamePhone(User user);
}
