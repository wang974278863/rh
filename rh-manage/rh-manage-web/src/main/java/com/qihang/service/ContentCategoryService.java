package com.qihang.service;

import java.util.List;

import com.qihang.common.pojo.RetInfo;
import com.qihang.pojo.ContentCategory;

public interface ContentCategoryService {

	RetInfo insert(ContentCategory category);
	
	int delete(Integer id); 
	
	int update(ContentCategory category);
	
	List<ContentCategory> findAll(Integer parentId);
	
	
}
