package com.qihang.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qihang.common.pojo.Constants;
import com.qihang.common.pojo.Page;
import com.qihang.common.pojo.RetInfo;
import com.qihang.pojo.Admin;
import com.qihang.pojo.News;
import com.qihang.service.NewsService;


@RequestMapping("/news")
@Controller
public class NewsController {

	@Autowired
	private NewsService newsService;
	

	@RequestMapping("/list")
	public String list(Model model,Page page,News news,HttpServletRequest request) {
		page.setUrl(request.getContextPath() +"/news/list");
		page.setOrder("sort desc,create_time asc");
		page = newsService.findByPage2(news, page);
		model.addAttribute("page",page);
		model.addAttribute("module", "newscenter");
		return "news/list";
	}
	
	
	@RequestMapping("/{id}")
	public String view(Model model,@PathVariable Integer id) {
		model.addAttribute("news", newsService.getById(id));
		model.addAttribute("module", "newscenter");
		return "news/view";
	}
	
	
	

}
