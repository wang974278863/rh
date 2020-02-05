package com.qihang.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qihang.common.pojo.Page;
import com.qihang.common.utils.JsonUtils;
import com.qihang.pojo.Content;
import com.qihang.pojo.Course;
import com.qihang.pojo.GuestBook;
import com.qihang.service.ContentService;
import com.qihang.service.CourseService;
import com.qihang.service.GuestBookService;

@Controller
public class CacheController {

	@Autowired
	private ContentService contentService;
	
	@Autowired
	private GuestBookService guestBookService;
	
	@Autowired
	private CourseService courseService;

	
	@RequestMapping("/cache/{code}")
	@ResponseBody
	private String clearCache(@PathVariable String code,HttpSession session){
		if(StringUtils.isBlank(code)){
			return null;
		}
		if("guestBook".equals(code)){
			List<GuestBook> list = guestBookService.findTop(6);
			session.getServletContext().setAttribute("guestBooks", list);
			System.out.println("*********************留言板加载成功！" + JsonUtils.objectToJson(list));
			return "success";
		}
		if("kbsj".equals(code)){
			List<Content> list = contentService.findTop(8, code);
			session.getServletContext().setAttribute("kbsj", list);
			System.out.println("*********************开班时间加载成功！" + JsonUtils.objectToJson(list));
			return "success";
		}
		if("xyfczs".equals(code)){
			List<Content> list = contentService.findTop(12, code);
			session.getServletContext().setAttribute("xyfc", list);
			System.out.println("*********************学员风采加载成功！" + JsonUtils.objectToJson(list));
			return "success";
		}
		if("kcxy".equals(code)){
			Page page = new Page();
			page.setCurrentPage(1);
			page.setPageSize(8);
			page.setOrder("create_date desc");
			page = courseService.findByPage(page, new Course());
			session.getServletContext().setAttribute("kcxy", page.getResult());
			System.out.println("*********************学员风采加载成功！" + JsonUtils.objectToJson(page.getResult()));
			return "success";
		}
		List<Content> list = contentService.findByCode(code);
		session.getServletContext().setAttribute(code, list);
		System.out.println("********************重新加载缓存成功！********************" + code);
		return "success";
		
	}
	
}
