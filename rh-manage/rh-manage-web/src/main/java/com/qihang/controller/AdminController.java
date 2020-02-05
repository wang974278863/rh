package com.qihang.controller;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {

	
	public static void main(String[] args) {
		String md5Hex = new DigestUtils().md5Hex("luanlaoshi");
		System.out.println(md5Hex);
	}
	
	
}
