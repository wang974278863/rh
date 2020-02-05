package com.qihang.controller;

import java.util.Date;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

	/**
	 * 进入主页
	 * 
	 * @return
	 */
	@RequestMapping("")
	public String toIndex() {
		return "index";
	}
	
	
	
	/**
	 * 进入主页
	 * 
	 * @return
	 */
	@RequestMapping("/login")
	public String tologin() {
		return "login";
	}

	/**
	 * 进入我的桌面
	 * 
	 * @return
	 */
	@RequestMapping("/myDeskTop")
	public String myDeskTop(HttpServletRequest request, Model model) {
		Properties props = System.getProperties();

		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
				+ "/";
		String fwqIP = request.getLocalAddr(); // 取得服务器IP
		int fwqDk = request.getLocalPort(); // 取得服务器端口
		String fwqym = request.getServerName();
		String xtszwjj = request.getSession().getServletContext().getRealPath("/");

		String javaVersion = props.getProperty("java.version"); //Java的运行环境版本
		String czxt = props.getProperty("os.name"); //操作系统的名称
		String czxtjg = props.getProperty("os.arch"); //操作系统的构架
		String czxtbb = props.getProperty("os.version"); //操作系统的版本
		
		int cpuNum = Runtime.getRuntime().availableProcessors(); //CPU总数
		long totalMemory = Runtime.getRuntime().totalMemory(); //获取java虚拟机中的内存总量  
		long kxnc = Runtime.getRuntime().freeMemory(); //虚拟机空闲内存量
		model.addAttribute("fwqjsjm", basePath);
		model.addAttribute("fwqIP", fwqIP);
		model.addAttribute("fwqDk", fwqDk);
		model.addAttribute("fwqym", fwqym);
		model.addAttribute("xtszwjj", xtszwjj);
		model.addAttribute("javaVersion", javaVersion);
		model.addAttribute("czxt", czxt);
		model.addAttribute("czxtjg", czxtjg);
		model.addAttribute("czxtbb", czxtbb);
		model.addAttribute("dqsj", new Date());
		model.addAttribute("cpuNum", cpuNum);
		model.addAttribute("totalMemory", totalMemory);
		model.addAttribute("kxnc", kxnc);
		return "common/myDeskTop";
	}

}
