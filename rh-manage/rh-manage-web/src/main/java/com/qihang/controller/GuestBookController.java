package com.qihang.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

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
import com.qihang.service.CacheService;
import com.qihang.service.GuestBookService;

@RequestMapping("/guestBook")
@Controller
public class GuestBookController {

	
	@Autowired
	private GuestBookService guestBookService;
	
	@Autowired
	private CacheService cacheService;
	
	
	@RequestMapping("/list")
	public String list(Model model,GuestBook guestBook,Page page,HttpServletRequest request){
		page.setUrl("/guestBook/list");
		page = guestBookService.findByPage(page, guestBook);
		model.addAttribute("page", page);
		return "guestBook/list";
	}
	
	
	@RequestMapping("/delete/{id}")
	@ResponseBody
	public RetInfo delete(@PathVariable Integer id){
		guestBookService.delete(id);
		cacheService.clearCache("guestBook");
		return new RetInfo(Constants.SUCCESS);
	}
	
	
	
	
	@RequestMapping("/reply/{id}")
	@ResponseBody
	public RetInfo reply(@PathVariable Integer id,String reply){
		if(StringUtils.isBlank(reply)){
			return new RetInfo(Constants.FAIL, "回复内容不能为空！");
		}
		GuestBook bookDB = guestBookService.getById(id);
		bookDB.setReply(reply);
		bookDB.setIsReply(true);
		bookDB.setReplyDate(new Date());
		guestBookService.update(bookDB);
		return new RetInfo(Constants.SUCCESS);
	}
	
	
	
	@RequestMapping("/verify/{id}")
	@ResponseBody
	public RetInfo verify(@PathVariable Integer id,String type){
		GuestBook bookDB = guestBookService.getById(id);
		if("1".equals(type)){ //审核通过
			bookDB.setIsVerify(true);
		}else{ //审核不通过
			bookDB.setIsVerify(false);
			
		}
		guestBookService.update(bookDB);
		cacheService.clearCache("guestBook");
		return new RetInfo(Constants.SUCCESS);
	}
	
	
	
	
	
	
}
