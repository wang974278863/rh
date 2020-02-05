package com.qihang.service;

import java.util.List;

import com.qihang.common.pojo.Page;
import com.qihang.pojo.Content;
import com.qihang.pojo.ContentCategory;

public interface ContentService {

	
	List<Content> findByCode(String code);
	
	Content getContent(Integer id);

	Page findByPage(String code,Page page);
	
	List<Content> findTop(int top,String code);
	
	ContentCategory findCategoryByCode(String code);
}
