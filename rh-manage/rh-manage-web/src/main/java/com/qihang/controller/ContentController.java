package com.qihang.controller;

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
import com.qihang.pojo.Content;
import com.qihang.service.CacheService;
import com.qihang.service.ContentService;

import javax.servlet.http.HttpServletRequest;


@RequestMapping("/content")
@Controller
public class ContentController {

	
	@Autowired
	private ContentService contentService;
	
	@Autowired
	private CacheService cacheService;
	
	
	@RequestMapping("/toadd/{code}")
	public String toadd(@PathVariable String code,Model model){
		model.addAttribute("code", code);
		return "content/add";
	}
	
	@RequestMapping("/toedit/{id}")
	public String toedit(@PathVariable Integer id,Model model){
		model.addAttribute("content", contentService.getContent(id));
		return "content/add";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public RetInfo add(Content content){
		String retMsg = "";
		if(content.getId() != null){ //更新
			Content contentDB = contentService.getContent(content.getId());
			contentDB.setPic(content.getPic());
			contentDB.setContent(content.getContent());
			contentDB.setTitle(content.getTitle());
			contentDB.setHref(content.getHref());
			contentService.update(contentDB);
			retMsg = "编辑成功";
			cacheService.clearCache(contentDB.getCategoryCode());
		}else{
			if(StringUtils.isBlank(content.getCategoryCode())){
				return new RetInfo(Constants.FAIL, "分类编码不能为空！");
			}
				contentService.insert(content);
				retMsg = "添加成功";
				cacheService.clearCache(content.getCategoryCode());
		}
		return new RetInfo(Constants.SUCCESS, retMsg);
		
	}
	
	
	@RequestMapping("/delete/{id}")
	@ResponseBody
	public RetInfo delete(@PathVariable Integer id){
		Content content = contentService.getContent(id);
		contentService.delete(id);
		if(content != null){
			cacheService.clearCache(content.getCategoryCode());
		}
		return new RetInfo(Constants.SUCCESS);
		
	}
	
	@RequestMapping("/{id}")
	@ResponseBody
	public String getContent(@PathVariable Integer id){
		Content content = contentService.getContent(id);
		if(content != null){
			return content.getContent();
		}
		return null;
	}
	
	
	@RequestMapping("/list/{code}")
	public String list(@PathVariable String code, Model model, Page page, HttpServletRequest request){
		page.setUrl(request.getContextPath() + "/content/list/" + code);
		page.setOrder("update_date desc");
		page = contentService.findByPage(code, page);
		model.addAttribute("page", page);
		return "content/list";
	}
}
