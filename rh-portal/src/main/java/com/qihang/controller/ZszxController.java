package com.qihang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qihang.common.pojo.Page;
import com.qihang.pojo.Content;
import com.qihang.service.ContentService;

@RequestMapping("/zszx")
@Controller
public class ZszxController {

	@Autowired
	private ContentService contentService;
	
	
	
	@RequestMapping("/{code}")
	public String kbsj(Model model,@PathVariable String code,Page page){
		//获取轮播图
//		List<Content> list = contentService.findByCode("zszxlbt");
//		model.addAttribute("zszxlbt", list);
//		model.addAttribute("module", "zszx");
		
		//获取内容
//		List<Content> list2 = contentService.findByCode(code);
//		if(list2 != null && list2.size() == 1){
//			model.addAttribute("obj", list2.get(0));
//		}
		
		model.addAttribute("module", "zszx");
		
		page.setUrl("/zszx/" + code);
		page = contentService.findByPage(code, page);
		model.addAttribute("page", page);
		model.addAttribute("category", contentService.findCategoryByCode(code));
		return "zszx/list";
	}
	
	

	@RequestMapping("/view/{id}")
	public String view(Model model,@PathVariable Integer id) {
		model.addAttribute("obj", contentService.getContent(id));
		return "zszx/view";
	}
	
	
	
	
	
	
}
