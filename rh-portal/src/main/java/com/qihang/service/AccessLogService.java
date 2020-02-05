package com.qihang.service;

import com.qihang.pojo.AccessLog;

public interface AccessLogService {

	int getTotalAccessNumToday();
	
	void insert(AccessLog accessLog);
	
}
