package com.qihang.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qihang.common.pojo.Constants;
import com.qihang.common.pojo.RetInfo;
import com.qihang.pojo.ContentCategory;
import com.qihang.service.ContentCategoryService;

@Controller
@RequestMapping("/category")
public class ContentCategoryController {

	@Autowired
	private ContentCategoryService categoryService;
	
	@RequestMapping("/toadd")
	public String toadd(Model model){
		List<ContentCategory> list = categoryService.findAll(null);
		model.addAttribute("categorys", list);
		return "category/add";
	}
	
	@RequestMapping("/delete/{id}")
	@ResponseBody
	public RetInfo delete(@PathVariable Integer id){
		categoryService.delete(id);
		return new RetInfo(Constants.SUCCESS);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public RetInfo update(ContentCategory category){
		categoryService.update(category);
		return new RetInfo(Constants.SUCCESS);
	}
	
	@RequestMapping("/list")
	public String list(Model model,Integer parentId){
		if(parentId == null){
			parentId = 0;
		}
		model.addAttribute("list", categoryService.findAll(parentId));
		return "category/list";
	}
	
	
	@RequestMapping("/add")
	@ResponseBody
	public RetInfo insert(ContentCategory category){
		if(StringUtils.isBlank(category.getName())){
			return new RetInfo(Constants.FAIL, "分类名称不能为空");
		}
		
		if(category.getParentId() == null ){
			category.setParentId(0);
		}
		
		if(StringUtils.isBlank(category.getCode())){
			return new RetInfo(Constants.FAIL, "分类编码不能为空");
		}
		category.setIsParent(false);
		return categoryService.insert(category);
	}
	
	@RequestMapping("/batchDelete")
	@ResponseBody
	public RetInfo batchDelete(@RequestBody String[] ids){
		for (String id : ids) {
			categoryService.delete(Integer.parseInt(id));
		}
		
		return new RetInfo(Constants.SUCCESS);
	}
	
	
	
}
