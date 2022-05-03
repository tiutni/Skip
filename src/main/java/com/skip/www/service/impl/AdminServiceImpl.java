package com.skip.www.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skip.www.dao.face.AdminDao;
import com.skip.www.dto.Admin;
import com.skip.www.service.face.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao adminDao;

	@Override
	public boolean login(Admin admin) {
		int loginChk = adminDao.selectCntAdmin(admin);

		if (loginChk > 0)
			
			return true;
			
			return false;
	}

	@Override
	public boolean join(Admin admin) {

		// 중복된 id인지 확인
		if (adminDao.selectCntById(admin) > 0) {

			return false;
		}

		// 관리자 생성(삽입)
		adminDao.insert(admin);

		// 관리자 생성 확인
		if (adminDao.selectCntById(admin) > 0) {

			return true;
		}

			return false;
		}

	@Override
	public void update(Admin admin) throws Exception {
		adminDao.update(admin);
		
		}

	@Override
	public boolean checkAuth(String adminAuth) {
		if (adminDao.selectAdminAuth(adminAuth) == 1) {
			
			return true;
		
			}
		
			return false;

			}

}
