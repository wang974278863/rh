package com.qihang.service;

import com.qihang.pojo.Admin;

public interface AdminService {

	Admin findByAdminName(String adminName);
	
	int updateAdmin(Admin admin);
	
}
