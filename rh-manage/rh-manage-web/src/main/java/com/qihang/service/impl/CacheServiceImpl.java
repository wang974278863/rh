package com.qihang.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.qihang.common.utils.HttpClientUtil;
import com.qihang.service.CacheService;

@Service
public class CacheServiceImpl implements CacheService{

	@Value("${portal_url}")
	private String portal_url;
	
	
	@Override
	public void clearCache(String code) {
		List<String> codeList = new ArrayList<>();
		codeList.add("zylbt");//主页轮播图
		codeList.add("logo");//主页轮播图
		codeList.add("bzzx");//帮助中心
		codeList.add("gywm");//关于我们
		codeList.add("lxwm");//联系我们
		codeList.add("kbsj"); //开班时间
		codeList.add("gsjj"); //公司简介
		codeList.add("xyfczs"); //学员风采
		codeList.add("kcxy"); //课程学习
		codeList.add("xyzx"); //校园资讯
		codeList.add("xzjy"); //校长寄语
		codeList.add("guestBook"); //留言管理

		for (String string : codeList) {
			if(code.equals(string)){
				String result = HttpClientUtil.doGet(portal_url + "/cache/" + code);
				if(StringUtils.isNotBlank(result)){
					System.out.println("**************清理前台缓存成功**************" + code );
				}else{
					System.out.println("!!!!!!!!!!!!!!!清理前台缓存失败!!!!!!!!!!!!!" + code );
				}
			}
		}
		
	}

}
