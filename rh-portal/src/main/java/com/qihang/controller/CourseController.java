package com.qihang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qihang.common.pojo.Page;
import com.qihang.pojo.Course;
import com.qihang.service.CourseService;

@Controller
@RequestMapping("/course")
public class CourseController {

	
	@Autowired
	private CourseService courseService;
	
	
	@RequestMapping("/list")
	public String list(Page page,Model model,Course course){
		page.setUrl("/course/list");
		page.setPageSize(20);
		page = courseService.findByPage(page, course);;
		model.addAttribute("page", courseService.findByPage(page, course));
		model.addAttribute("module", "kcxy");
		return "course/list";
		
	}
	
	
	
	@RequestMapping("/{id}")
	public String get(@PathVariable Integer id,Model model){
		Course courseDB = courseService.getById(id);
		model.addAttribute("course", courseDB);
		model.addAttribute("module", "course");
		return "course/view";
		
	}
	
	
	
	
}
