package com.qihang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qihang.common.pojo.Page;
import com.qihang.pojo.Content;
import com.qihang.service.ContentService;

@Controller
@RequestMapping("/content")
public class ContentController {

	
	@Autowired
	private ContentService contentService;
	
	@RequestMapping("/list")
	public String list(Model model,String code,Page page){
		page.setUrl("/content/list");
		page.setOrder("create_date desc");
		page = contentService.findByPage(code, page);
		model.addAttribute("page", page);
		return "content/list";
	}
	
	
	
	
	@RequestMapping("/{id}")
	public String get(Model model,@PathVariable Integer id){
		Content content = contentService.getContent(id);
		model.addAttribute("content", content);
		return "content/view";
	}
	
	
	
	
	
}
