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
	public int insert(GuestBook guestBook) {
		return guestBookMapper.insertSelective(guestBook);
	}

	@Override
	public Page findByPage(GuestBook book, Page page) {
		PageHelper.startPage(page.getCurrentPage(), page.getPageSize(), page.getOrder());
		GuestBookExample example = new GuestBookExample();
		example.createCriteria().andIsVerifyEqualTo(true);
		List<GuestBook> list = guestBookMapper.selectByExample(example);
		page.setResult(list);
		return page;
	}

	@Override
	public List<GuestBook> findTop(int top) {
		if (top == 0) {
			top = 10;
		}
		PageHelper.startPage(1, top, "create_date desc");
		GuestBookExample example = new GuestBookExample();
		example.createCriteria().andIsVerifyEqualTo(true);
		List<GuestBook> list = guestBookMapper.selectByExample(example);
		return list;
	}

	@Override
	public GuestBook getById(Integer id) {
		return guestBookMapper.selectByPrimaryKey(id);
	}

}
