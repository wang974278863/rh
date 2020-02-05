package com.qihang.service;

import java.util.List;

import com.qihang.common.pojo.Page;
import com.qihang.pojo.GuestBook;

public interface GuestBookService {

	int insert(GuestBook guestBook);
	
	Page findByPage(GuestBook book,Page page);
	
	
	List<GuestBook> findTop(int top);
	
	
	GuestBook getById(Integer id);
	
}
