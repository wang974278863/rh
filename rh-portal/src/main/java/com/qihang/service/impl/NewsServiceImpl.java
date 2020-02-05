package com.qihang.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.*;

import com.github.pagehelper.PageHelper;
import com.qihang.common.pojo.Page;
import com.qihang.mapper.NewsMapper;
import org.springframework.stereotype.Service;

import com.qihang.pojo.AdminExample;
import com.qihang.pojo.News;
import com.qihang.pojo.NewsExample;
import com.qihang.pojo.NewsExample.Criteria;
import com.qihang.service.NewsService;

@Service
public class NewsServiceImpl implements NewsService {

	@Autowired
	private NewsMapper newsMapper;



	@Override
	public Page findByPage(News news, Page page) {
		Map<String, String> parameter = new HashMap<>();
		NewsExample example = new NewsExample();
		Criteria criteria = example.createCriteria();
		if(StringUtils.isNotBlank(news.getTitle())){
			parameter.put("title", news.getTitle());
			criteria.andTitleLike("%" + news.getTitle() +"%");
		}
		PageHelper.startPage(page.getCurrentPage(), page.getPageSize(), page.getOrder());
		List<News> list = newsMapper.selectByExample(example);
		page.setResult(list);
		return page;
	}


	@Override
	public News getById(Integer id) {
		NewsExample example = new NewsExample();
		example.createCriteria().andIdEqualTo(id).andIsVerifyEqualTo(true).andIsDelEqualTo(false);
		List<News> list = newsMapper.selectByExampleWithBLOBs(example);
		if(list != null && list.size() == 1){
			return list.get(0);
		}
		return null;
	}

	@Override
	public Page findByPage2(News news, Page page) {
		Map<String, String> parameter = new HashMap<>();
		NewsExample example = new NewsExample();
		Criteria criteria = example.createCriteria();
		if(StringUtils.isNotBlank(news.getTitle())){
			parameter.put("title", news.getTitle());
			criteria.andTitleLike("%" + news.getTitle() +"%");
		}
		criteria.andIsVerifyEqualTo(true).andIsDelEqualTo(false);
		PageHelper.startPage(page.getCurrentPage(), page.getPageSize(), page.getOrder());
		List<News> list = newsMapper.selectByExample(example);
		page.setResult(list);
		return page;
	}

}
