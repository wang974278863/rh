package com.qihang.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qihang.pojo.Content;
import com.qihang.service.ContentService;

@RequestMapping("/jybz")
@Controller
public class JybzController {


	@Autowired
	private ContentService contentService;
	
	
	@RequestMapping("")
	public String index(Model model){
		model.addAttribute("module", "jybz");
		//职业规划指导
		String code1 = "zyghzd";
		//企业招聘
		String code2 = "qyzp";
		//学员简历及就业指导 
		String code3 = "xyjljjyzd";
		//成功案例
		String code4 = "cgal";
		
		String[] str = {code1,code2,code3,code4};
		
		for (String string : str) {
			List<Content> list = contentService.findTop(5, string);
			model.addAttribute(string, list);
		}
		
		return "jybz/view";
	}
	
}
