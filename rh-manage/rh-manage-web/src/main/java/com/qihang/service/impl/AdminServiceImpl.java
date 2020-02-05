package com.qihang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qihang.mapper.AdminMapper;
import com.qihang.pojo.Admin;
import com.qihang.pojo.AdminExample;
import com.qihang.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	
	@Override
	public Admin findByAdminName(String adminName) {
		AdminExample example = new AdminExample();
		example.createCriteria().andAdminNameEqualTo(adminName);
		List<Admin> list = adminMapper.selectByExample(example);
		if(list != null  && list.size() == 1){
			return list.get(0);
		}
		return null;
	}

	@Override
	public int updateAdmin(Admin admin) {
		return adminMapper.updateByPrimaryKeySelective(admin);
	}

}
