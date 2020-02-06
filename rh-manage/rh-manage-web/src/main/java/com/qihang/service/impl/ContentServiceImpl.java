package com.qihang.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.qihang.common.pojo.Page;
import com.qihang.mapper.ContentMapper;
import com.qihang.pojo.Content;
import com.qihang.pojo.ContentExample;

@Service
public class ContentServiceImpl implements com.qihang.service.ContentService {

	
	
	@Autowired
	private ContentMapper contentMapper;
	
	@Override
	public int insert(Content content) {
		content.setUpdateDate(new Date());
		int i = contentMapper.insertSelective(content);
		return i;
	}

	@Override
	public int delete(Integer id) {
		return contentMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Content> findByCode(String code) {
		ContentExample example = new ContentExample();
		example.createCriteria().andCategoryCodeEqualTo(code);
		return contentMapper.selectByExample(example);
	}

	@Override
	public Content getContent(Integer id) {
		return contentMapper.selectByPrimaryKey(id);
	}

	/**
	 * 更新
	 */
	@Override
	public int update(Content content) {
		content.setUpdateDate(new Date());
		return contentMapper.updateByPrimaryKeyWithBLOBs(content);
	}

	@Override
	public Page findByPage(String code, Page page) {
		ContentExample example = new ContentExample();
		example.createCriteria().andCategoryCodeEqualTo(code);
		PageHelper.startPage(page.getCurrentPage(), page.getPageSize(),page.getOrder());
		List<Content> list = contentMapper.selectByExample(example);
		page.setResult(list);
		return page;
	}

	
	
}
