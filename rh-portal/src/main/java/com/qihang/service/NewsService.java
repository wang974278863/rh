package com.qihang.service;


import com.qihang.common.pojo.Page;
import com.qihang.pojo.News;

public interface NewsService {

	
	
	Page findByPage(News news,Page page);
	
	Page findByPage2(News news,Page page);
	
	
	News getById(Integer id);
}
