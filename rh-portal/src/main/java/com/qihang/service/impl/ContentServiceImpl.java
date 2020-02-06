package com.qihang.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.qihang.common.pojo.Page;
import com.qihang.mapper.ContentCategoryMapper;
import com.qihang.mapper.ContentMapper;
import com.qihang.pojo.Content;
import com.qihang.pojo.ContentCategory;
import com.qihang.pojo.ContentCategoryExample;
import com.qihang.pojo.ContentExample;

@Service
public class ContentServiceImpl implements com.qihang.service.ContentService {

	
	
	@Autowired
	private ContentMapper contentMapper;
	
	@Autowired
	private ContentCategoryMapper categoryMapper;
	

	@Override
	public List<Content> findByCode(String code) {
		ContentExample example = new ContentExample();
		example.createCriteria().andCategoryCodeEqualTo(code);
		return contentMapper.selectByExampleWithBLOBs(example);
	}

	@Override
	public Content getContent(Integer id) {
		return contentMapper.selectByPrimaryKey(id);
	}

	@Override
	public Page findByPage(String code, Page page) {
		page.setOrder("update_date desc");
		PageHelper.startPage(page.getCurrentPage(), page.getPageSize(), page.getOrder());
		Map<String, String> parameter = new HashMap<>();
		parameter.put("code", code);
		page.setParameter(parameter);
		ContentExample example = new ContentExample();
		example.createCriteria().andCategoryCodeEqualTo(code);
		List<Content> list = contentMapper.selectByExample(example);
		page.setResult(list);
		return page;
	}

	
	@Override
	public List<Content> findTop(int top, String code) {
		PageHelper.startPage(1, top,"update_date desc");
		ContentExample example  = new ContentExample();
		example.createCriteria().andCategoryCodeEqualTo(code);
		List<Content> list = contentMapper.selectByExample(example);
		return list;
	}

	@Override
	public ContentCategory findCategoryByCode(String code) {
		ContentCategoryExample example = new ContentCategoryExample();
		example.createCriteria().andCodeEqualTo(code);
		List<ContentCategory> list = categoryMapper.selectByExample(example);
		if(list != null && list.size() == 1){
			return list.get(0);
		}
		return null;
	}

}
