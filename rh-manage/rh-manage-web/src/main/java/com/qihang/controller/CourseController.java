package com.qihang.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qihang.common.pojo.Constants;
import com.qihang.common.pojo.Page;
import com.qihang.common.pojo.RetInfo;
import com.qihang.pojo.Course;
import com.qihang.service.CacheService;
import com.qihang.service.CourseService;

@Controller
@RequestMapping("/course")
public class CourseController {

	@Autowired
	private CourseService courseService;
	
	@Autowired
	private CacheService cacheService;

	@RequestMapping("/list")
	public String list(Page page, Model model, Course course, HttpServletRequest request) {
		page.setUrl(request.getContextPath() + "/course/list");
//		page.setPageSize(2);
		page.setOrder("create_date desc");
		page = courseService.findByPage(page, course);
		model.addAttribute("page", page);
		return "course/list";
	}

	@RequestMapping("/toadd")
	public String toadd() {
		return "course/add";
	}

	@RequestMapping("/verify/{id}")
	@ResponseBody
	public RetInfo verify(@PathVariable Integer id, String type) {

		Course courseDB = courseService.getById(id);
		if (id == null) {
			return new RetInfo(Constants.FAIL, "ID不能为空！");
		}

		if ("1".equals(type)) {
			courseDB.setIsVerify(true);
		} else {
			courseDB.setIsVerify(false);
		}
		courseService.update(courseDB);
		cacheService.clearCache("kcxy");
		return new RetInfo(Constants.SUCCESS);
	}

	@RequestMapping("/toUpdate/{id}")
	public String toUpdate(@PathVariable Integer id, Model model) {
		Course course = courseService.getById(id);
		model.addAttribute("course", course);
		return "course/add";
	}

	@RequestMapping("/add")
	@ResponseBody
	public RetInfo add(Course course) {
		if (StringUtils.isBlank(course.getTitle())) {
			return new RetInfo(Constants.FAIL, "标题不能为空！");
		}
		if (StringUtils.isBlank(course.getTeacher())) {
			return new RetInfo(Constants.FAIL, "讲师不能为空！");
		}

		if (StringUtils.isBlank(course.getType())) {
			return new RetInfo(Constants.FAIL, "请选择课程类型！");
		}

		if ("1".equals(course.getType())) { //视频
			if(StringUtils.isBlank(course.getVideoUrl())){
				return new RetInfo(Constants.FAIL, "请输入视频链接地址！");
			}
		}

		courseService.insert(course);
		cacheService.clearCache("kcxy");
		return new RetInfo(Constants.SUCCESS);
	}

	@RequestMapping("/update")
	@ResponseBody
	public RetInfo update(Course course) {
		if (course.getId() == null) {
			return new RetInfo(Constants.FAIL, "ID不能为空！");
		}

		if (StringUtils.isBlank(course.getTitle())) {
			return new RetInfo(Constants.FAIL, "标题不能为空！");
		}

		Course courseDB = courseService.getById(course.getId());
		courseDB.setTitle(course.getTitle());
		courseDB.setPic(course.getPic());
		courseDB.setTeacher(course.getTeacher());
		if ("1".equals(course.getType())) { // 视频
			courseDB.setVideoUrl(course.getVideoUrl());
			courseDB.setVideoIntroduction(course.getVideoIntroduction());
		} else {
			courseDB.setContent(course.getContent());
		}
		courseService.update(courseDB);
		cacheService.clearCache("kcxy");
		return new RetInfo(Constants.SUCCESS);
	}
	
	
	@RequestMapping("/delete/{id}")
	@ResponseBody
	public RetInfo delete(@PathVariable Integer id){
		courseService.delete(id);
		cacheService.clearCache("kcxy");
		return new RetInfo(Constants.SUCCESS);
	}
	
	
	

}
