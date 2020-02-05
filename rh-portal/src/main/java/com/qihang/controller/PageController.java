package com.qihang.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qihang.common.pojo.Page;
import com.qihang.pojo.Content;
import com.qihang.service.ContentService;

@Controller
public class PageController {

	@Autowired
	private ContentService contentService;
	/**
	 * 进入主页
	 * 
	 * @return
	 */
	@RequestMapping("")
	public String toIndex(Model model) {
		model.addAttribute("module", "index");
		return "index";
	}
	
	
	@RequestMapping("/aboutsUS")
	public String aboutsUS(Model model){
		model.addAttribute("module", "aboutsUS");
		model.addAttribute("module2", "aboutsUS");
		return "aboutsUS";
	}
	
	@RequestMapping("/contactUs")
	public String contactUs(Model model){
		model.addAttribute("module", "aboutsUS");
		model.addAttribute("module2", "contactUs");
		return "aboutsUS";
	}
	
	@RequestMapping("/bzzx")
	public String bzzx(Model model,HttpSession session){
		model.addAttribute("module", "aboutsUS");
		model.addAttribute("module2", "bzzx");
		
		List<Content> contents = (List<Content>) session.getServletContext().getAttribute("bzzx");
		model.addAttribute("list", contents);
		
		return "bzzx";
	}
	
	@RequestMapping("/question/{id}")
	public String bzzx(Model model,HttpSession session,@PathVariable Integer id){
		model.addAttribute("module", "aboutsUS");
		model.addAttribute("module2", "question");
		Content content = contentService.getContent(id);
		model.addAttribute("obj", content);
		
		return "aboutsUS";
	}
	
	@RequestMapping("/course")
	public String kcxy(Model model,HttpSession session){
		model.addAttribute("module", "course");
		return "course/list";
	}
	
	@RequestMapping("/course/view/{id}")
	public String courseView(Model model,HttpSession session,@PathVariable Integer id){
		model.addAttribute("module", "course");
		return "course/view";
	}
	

	@RequestMapping("/xytd")
	public String xytd(Model model,HttpSession session){
		model.addAttribute("module", "xytd");
		
		//获取前8作品展
		List<Content> list4 = contentService.findTop(8, "xszpz");
		model.addAttribute("xszpz", list4);
		
		//获取前8学员风采
		List<Content> list2 = contentService.findTop(8, "xyfczs");
		model.addAttribute("xyfczs", list2);
		return "xytd";
	}
	
	
	@RequestMapping("/xyfc/list")
	public String xyfc(Model model,HttpSession session,Page page){
		model.addAttribute("module", "xyfczs");
		page.setUrl("/xyfc/list");
		page = contentService.findByPage("xyfczs", page);
		model.addAttribute("page", page);
		return "xyfc/list";
	}
	
	@RequestMapping("/xyfc/{id}")
	public String view(Model model,HttpSession session,@PathVariable Integer id){
		model.addAttribute("module", "xyfczs");
		Content content = contentService.getContent(id);
		model.addAttribute("content", content);
		return "xyfc/view";
	}
	

	
	@RequestMapping("/xszpz/list")
	public String xszpz(Model model,HttpSession session,Page page){
		model.addAttribute("module", "xszpz");
		page.setUrl("/xszpz/list");
		page = contentService.findByPage("xszpz", page);
		model.addAttribute("page", page);
		return "xyfc/list";
	}
	
	
	
}
