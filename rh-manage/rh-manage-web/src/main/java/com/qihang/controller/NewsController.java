package com.qihang.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		page.setOrder("create_time desc");
		page = newsService.findByPage(news, page);
		model.addAttribute("page",page);
		return "news/list";
	}
	
	@RequestMapping("/verify/{id}")
	@ResponseBody
	public RetInfo verify(@PathVariable Integer id,String type){
		if(newsService.updateVerify(id, type) == 1){
			return new RetInfo(Constants.SUCCESS);
		}
		return new RetInfo(Constants.FAIL, "操作失败");
		
	}
	
	@RequestMapping("/delete/{id}")
	@ResponseBody
	public RetInfo delete(@PathVariable Integer id){
		if(newsService.deleteById(id) == 1){
			return new RetInfo(Constants.SUCCESS);
		}
		return new RetInfo(Constants.FAIL, "删除失败");
		
	}
		

	/**
	 * 添加新闻
	 * 
	 * @param news
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public RetInfo add(News news,HttpSession session) {
		if (StringUtils.isBlank(news.getTitle())) {
			return new RetInfo(Constants.FAIL, "新闻标题不能为空！");
		}
		if (StringUtils.isBlank(news.getContent())) {
			return new RetInfo(Constants.FAIL, "新闻内容不能为空！");
		}
		Admin admin = (Admin) session.getAttribute("admin");
		news.setCreater(admin.getAdminName());
		news.setIsVerify(false);
		news.setViews(0);
		int i = newsService.insert(news);
		if (i == 1) {
			return new RetInfo(Constants.SUCCESS);
		} else {
			return new RetInfo(Constants.FAIL, "添加失败");
		}

	}

	@RequestMapping("/toadd")
	public String toadd(Model model) {
		return "news/add";
	}
	
	

}
