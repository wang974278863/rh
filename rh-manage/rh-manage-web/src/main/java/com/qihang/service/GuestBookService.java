package com.qihang.service;

import com.qihang.common.pojo.Page;
import com.qihang.pojo.GuestBook;

public interface GuestBookService {

	int update(GuestBook guestBook);
	
	Page findByPage(Page page,GuestBook guestBook);
	
	int delete(Integer id);
	
	GuestBook getById(Integer id);
}
