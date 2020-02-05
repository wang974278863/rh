package com.qihang.service;

import java.util.List;

import com.qihang.common.pojo.Page;
import com.qihang.pojo.Content;

public interface ContentService {

	int insert(Content content);
	
	int delete(Integer id);
	
	List<Content> findByCode(String code);
	
	Content getContent(Integer id);
	
	int update(Content content);
	
	Page findByPage(String code,Page page);
}
