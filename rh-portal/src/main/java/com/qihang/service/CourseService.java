package com.qihang.service;

import com.qihang.common.pojo.Page;
import com.qihang.pojo.Course;

public interface CourseService {

	Course getById(Integer id);

	Page findByPage(Page page,Course course);

	
	
}
