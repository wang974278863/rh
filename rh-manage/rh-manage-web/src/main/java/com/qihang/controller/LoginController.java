package com.qihang.controller;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qihang.common.pojo.Constants;
import com.qihang.common.pojo.RetInfo;
import com.qihang.common.utils.IpUtils;
import com.qihang.pojo.Admin;
import com.qihang.service.AdminService;

@Controller
public class LoginController {
	
	@Autowired
	private AdminService adminService;

	@RequestMapping("/tologin")
	@ResponseBody
	public RetInfo login(Admin admin, String captcha, HttpSession session,HttpServletRequest request) {

//		if (StringUtils.isBlank(captcha)) {
//			return new RetInfo(Constants.FAIL, "验证码不能为空！");
//		}
//
		if (StringUtils.isBlank(admin.getAdminName())) {
			return new RetInfo(Constants.FAIL, "用户名不能为空！");
		}
		
		if (StringUtils.isBlank(admin.getAdminPwd())) {
			return new RetInfo(Constants.FAIL, "密码不能为空！");
		}
//		String sessionCaptcha = (String) session.getAttribute("captcha");
//		if (!captcha.equalsIgnoreCase(sessionCaptcha)) {
//			return new RetInfo(Constants.FAIL, "验证码错误！");
//		}
		
		Admin adminDB = adminService.findByAdminName(admin.getAdminName());
		
		if(adminDB == null){
			return new RetInfo(Constants.FAIL, "用户名或密码错误！");
		}
		
		if(!DigestUtils.md5Hex(admin.getAdminPwd()).equals(adminDB.getAdminPwd())){
			return new RetInfo(Constants.FAIL, "用户名或密码错误！");
		}
		
		admin.setLastLoginIp(adminDB.getLastLoginIp());
		admin.setLastLoginDate(adminDB.getLastLoginDate());
		admin.setLoginTimes(adminDB.getLoginTimes() + 1);
		/*更新管理员*/
		adminDB.setLastLoginDate(new Date());
		adminDB.setLastLoginIp(IpUtils.getIpAddress(request));
		adminDB.setLoginTimes(adminDB.getLoginTimes() + 1);
		
		int row = adminService.updateAdmin(adminDB);
		if(row != 1){
			return new RetInfo(Constants.FAIL, "登录失败！");
		}
		session.setAttribute("admin", admin);
		return new RetInfo(Constants.SUCCESS);
	}

	
	/**
	 * 
	 * <p>Title: 退出登录</p>
	 * <p>Description: </p>
	 * @param session
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session,HttpServletRequest request) {
		session.invalidate();
		return "redirect:/";
	}
	
}
