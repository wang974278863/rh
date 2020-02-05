package com.qihang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qihang.common.pojo.Constants;
import com.qihang.common.pojo.RetInfo;
import com.qihang.mapper.ContentCategoryMapper;
import com.qihang.mapper.ContentMapper;
import com.qihang.pojo.ContentCategory;
import com.qihang.pojo.ContentCategoryExample;
import com.qihang.pojo.ContentExample;
import com.qihang.service.ContentCategoryService;

@Service
public class ContentCategoryServiceImpl implements ContentCategoryService {

	@Autowired
	private ContentCategoryMapper categoryMapper;
	
	@Autowired
	private ContentMapper contentMapper;

	@Override
	public RetInfo insert(ContentCategory category) {
		//判断之前的是否存在
		ContentCategoryExample example = new ContentCategoryExample();
		example.createCriteria().andCodeEqualTo(category.getCode());
		List<ContentCategory> list = categoryMapper.selectByExample(example);
		if(list != null && list.size() > 0){
			return new RetInfo(Constants.FAIL, "编码已存在！");
		}
		categoryMapper.insertSelective(category);
		Integer parentId = category.getParentId();
		ContentCategory parentCategory = categoryMapper.selectByPrimaryKey(parentId);
		if(parentCategory != null){
			parentCategory.setIsParent(true);
			categoryMapper.updateByPrimaryKeySelective(parentCategory);
		}
		return new RetInfo(Constants.SUCCESS);
	}

	@Override
	public int delete(Integer id) {
		ContentCategory category = categoryMapper.selectByPrimaryKey(id);
		if(category != null){
			ContentExample example = new ContentExample();
			example.createCriteria().andCategoryCodeEqualTo(category.getCode());
			contentMapper.deleteByExample(example);
		}
		
		
		//判断父节点是否有子类
		Integer parentId = category.getParentId();
		ContentCategoryExample example = new ContentCategoryExample();
		example.createCriteria().andParentIdEqualTo(parentId);
		List<ContentCategory> list = categoryMapper.selectByExample(example);
		if(list == null || list.size() == 1){
			ContentCategory parent = categoryMapper.selectByPrimaryKey(parentId);
			if(parent != null){
				parent.setIsParent(false);
				categoryMapper.updateByPrimaryKeySelective(parent);
			}
		}
		
		return categoryMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int update(ContentCategory category) {
		return categoryMapper.updateByPrimaryKeySelective(category);
	}

	@Override
	public List<ContentCategory> findAll(Integer parentId) {
		ContentCategoryExample example = new ContentCategoryExample();
		if(parentId != null){
			example.createCriteria().andParentIdEqualTo(parentId);
		}
		return categoryMapper.selectByExample(example);
	}

}
