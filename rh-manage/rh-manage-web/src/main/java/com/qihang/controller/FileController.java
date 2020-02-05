package com.qihang.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.qihang.common.pojo.RetInfo;
import com.qihang.service.FileUploadService;

@Controller
public class FileController {

	@Autowired
	private FileUploadService fileUploadService;
	
	@RequestMapping("/pic/upload")
	@ResponseBody
	public RetInfo uploadPic(MultipartFile file){
		RetInfo retInfo = new RetInfo();
		try {
			retInfo = fileUploadService.upload(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return retInfo;
		
	}
	
	
}
