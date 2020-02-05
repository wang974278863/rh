package com.qihang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.qihang.common.pojo.Page;
import com.qihang.mapper.GuestBookMapper;
import com.qihang.pojo.GuestBook;
import com.qihang.pojo.GuestBookExample;
import com.qihang.service.GuestBookService;

@Service
public class GuestBookServiceImpl implements GuestBookService {

	@Autowired
	private GuestBookMapper guestBookMapper;
	
	
	@Override
	public int update(GuestBook guestBook) {
		return guestBookMapper.updateByPrimaryKeySelective(guestBook);
	}

	@Override
	public Page findByPage(Page page, GuestBook guestBook) {
		PageHelper.startPage(page.getCurrentPage(), page.getPageSize(),page.getOrder());
		List<GuestBook> list = guestBookMapper.selectByExample(null);
		page.setResult(list);
		return page;
	}

	@Override
	public int delete(Integer id) {
		return guestBookMapper.deleteByPrimaryKey(id);
	}

	@Override
	public GuestBook getById(Integer id) {
		return guestBookMapper.selectByPrimaryKey(id);
	}
	

}
