package com.qihang.service;

import java.util.List;

import com.qihang.common.pojo.Page;
import com.qihang.pojo.News;

public interface NewsService {

	int insert(News news);
	
	List<News> findAll(boolean isDel);
	
	Page findByPage(News news,Page page);
	
	Page findByPage2(News news,Page page);
	
	int deleteById(Integer id);
	
	int updateVerify(Integer id,String type);
	
	News getById(Integer id);
}
