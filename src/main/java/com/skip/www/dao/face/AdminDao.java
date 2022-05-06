package com.skip.www.dao.face;

import com.skip.www.dto.Admin;

public interface AdminDao {

	/**
	 * id/pw가 일치하는 관리자 수를 반환한다
	 * 
	 * @param admin - 조회할 id/pw를 가진 객체
	 * @return 조회된 행 수
	 */
	public int selectCntAdmin(Admin admin);

	/**
	 * 관리자 id가 존재하는 값인지 확인한다
	 * 중복된 id인지 확인
	 * 
	 * @param admin - 조회하려는 관리자의 id를 가진 객체
	 * @return 존재 여부 (0 - 없음, 1 - 있음)
	 */
	public int selectCntById(Admin admin);

	/**
	 * 신규 관리자의 정보를 새롭게 삽입한다
	 * 
	 * @param admin - 신규 관리자 정보
	 */
	public void insert(Admin admin);

	/**
	 * 관리자 정보를 수정한다
	 * 
	 * @param admin - 수정하려는 관리자
	 * @throws Exception
	 */
	public void update(Admin admin) throws Exception;

	/**
	 * 일치하는 관리자가입인증번호 반환한다
	 * 
	 * @param adminAuth - 관리자가입인증번호
	 * @return 존재 여부 (0 - 없음, 1 - 있음)
	 */
	public int selectAdminAuth(String adminAuth);

}
