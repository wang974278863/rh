package com.qihang.service;

import com.qihang.common.pojo.Page;
import com.qihang.pojo.Course;

public interface CourseService {

	int insert(Course course);
	
	Page findByPage(Page page,Course course);
	
	int delete(Integer id);
	
	int update(Course course);
	
	Course getById(Integer id);
}
