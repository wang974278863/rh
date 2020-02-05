package com.qihang.service.impl;

import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qihang.mapper.AccessLogMapper;
import com.qihang.pojo.AccessLog;
import com.qihang.pojo.AccessLogExample;
import com.qihang.service.AccessLogService;

@Service
public class AccessLogServiceImpl implements AccessLogService {

	@Autowired
	private AccessLogMapper accessLogMapper;
	
	@Override
	public int getTotalAccessNumToday() {
		AccessLogExample example = new AccessLogExample();
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		Date beginTime = calendar.getTime();
		example.createCriteria().andAccessTimeGreaterThan(beginTime);
		return accessLogMapper.countByExample(example);
	}

	@Override
	public void insert(AccessLog accessLog) {
		accessLogMapper.insertSelective(accessLog);
	}

}
