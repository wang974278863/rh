package com.qihang.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.qihang.common.pojo.Page;
import com.qihang.mapper.CourseMapper;
import com.qihang.pojo.Course;
import com.qihang.pojo.CourseExample;
import com.qihang.pojo.CourseExample.Criteria;
import com.qihang.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseMapper courseMapper;
	
	
	@Override
	public int insert(Course course) {
		course.setUpdateDate(new Date());
		return courseMapper.insertSelective(course);
	}

	@Override
	public Page findByPage(Page page, Course course) {
		PageHelper.startPage(page.getCurrentPage(), page.getPageSize(),page.getOrder());
		Map<String, String> parameter = new HashMap<>();
		CourseExample example = new CourseExample();
		Criteria criteria = example.createCriteria();
		if(!StringUtils.isBlank(course.getTitle())){
			parameter.put("title", course.getTitle());
			criteria.andTitleEqualTo(course.getTitle());
		}
		if(!StringUtils.isBlank(course.getTeacher())){
			parameter.put("teacher", course.getTeacher());
			criteria.andTitleEqualTo(course.getTeacher());
		}
		page.setParameter(parameter);
		List<Course> list = courseMapper.selectByExample(example);
		page.setResult(list);
		return page;
	}

	@Override
	public int delete(Integer id) {
		return courseMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int update(Course course) {
		course.setUpdateDate(new Date());
		return courseMapper.updateByPrimaryKeyWithBLOBs(course);
	}

	@Override
	public Course getById(Integer id) {
		return courseMapper.selectByPrimaryKey(id);
	}

}
