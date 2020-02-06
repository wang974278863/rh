package com.qihang.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qihang.pojo.Content;
import com.qihang.service.ContentService;

@RequestMapping("/kcxy")
@Controller
public class KcxyController {

	@Autowired
	private ContentService contentService;
	
	
	@RequestMapping("/zyxz")
	public String zyxz(Model model){
		Pattern pattern = Pattern.compile("href=\"(.*)\" titl");

		//获取内容
		List<Content> list = contentService.findByCode("zyxz");
		for (Content content : list) {
			String href = "";
			Matcher matcher = pattern.matcher(content.getContent());
			while (matcher.find()){
				href = matcher.group(1);
				content.setHref(href);
			}
		}
		model.addAttribute("zyxz", list);
		return "kcxy/zyxz";
	}
	
	
	@RequestMapping("/{code}")
	public String kcxy(Model model,@PathVariable String code){
		//获取内容
		List<Content> list2 = contentService.findByCode(code);
		if(list2 != null && list2.size() == 1){
			model.addAttribute("obj", list2.get(0));
		}
		
		return "kcxy/view";
	}
}
