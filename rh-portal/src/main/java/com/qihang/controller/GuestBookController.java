package com.qihang.controller;

import java.util.Date;

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
import com.qihang.pojo.GuestBook;
import com.qihang.service.GuestBookService;

@Controller
@RequestMapping("/guestBook")
public class GuestBookController {

	@Autowired
	private GuestBookService guestBookService;
	
	
	@RequestMapping("/list")
	public String list(Page page,GuestBook guestBook,Model model){
		page = guestBookService.findByPage(guestBook, page);
		page.setUrl("/guestBook/list");
		model.addAttribute("module", "aboutsUS");
		model.addAttribute("module2", "lyb");
		model.addAttribute("page", page);
		return "guestBook/list";
	}
	
	
	@RequestMapping("/{id}")
	public String getById(@PathVariable Integer id,Model model){
		GuestBook guestBook = guestBookService.getById(id);
		model.addAttribute("module2", "lyb");
		model.addAttribute("guestBook", guestBook);
		return "guestBook/list";
	}
	
	
	@RequestMapping("/add")
	@ResponseBody
	public RetInfo insert(GuestBook guestBook,String captcha,HttpSession session){
//		if(StringUtils.isBlank(captcha)){
//			return new RetInfo(Constants.FAIL, "请输入验证码！");
//		}
//		
//		if(!captcha.equalsIgnoreCase((String) session.getAttribute("captcha"))){
//			return new RetInfo(Constants.FAIL, "验证码不正确！");
//		}

		if(StringUtils.isBlank(guestBook.getContent())){
			return new RetInfo(Constants.FAIL, "请输入留言内容！");
		}
		
		guestBook.setIsVerify(false);
		guestBook.setCreateDate(new Date());
		guestBook.setIsReply(false);
		guestBookService.insert(guestBook);
		
		return new RetInfo(Constants.SUCCESS);
				
	}
	
	
	
}
