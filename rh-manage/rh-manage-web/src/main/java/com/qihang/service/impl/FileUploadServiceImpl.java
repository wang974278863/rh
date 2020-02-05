package com.qihang.service.impl;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.qihang.common.pojo.Constants;
import com.qihang.common.pojo.RetInfo;
import com.qihang.common.utils.FtpUtil;
import com.qihang.common.utils.IDUtils;
import com.qihang.service.FileUploadService;

@Service
public class FileUploadServiceImpl implements FileUploadService {

	@Value("${host}")
	private String host;
	
	@Value("${ftp_username}")
	private String ftp_username;
	
	@Value("${ftp_password}")
	private String ftp_password;
	
	@Value("${basePath}")
	private String basePath;
	
	@Value("${urlPrex}")
	private String urlPrex;
	
	@Value("${port}")
	private int port;
	
	
	@Override
	public RetInfo upload(MultipartFile file) {
		RetInfo retInfo = new RetInfo();
		try {
			// 取源文件的原始文件名
			String oldName = file.getOriginalFilename();
			String entendsName = oldName.substring(oldName.lastIndexOf("."));
			// 生成新的文件名
			String newName = IDUtils.genImageName();
			newName += entendsName;
			String imagePath = new SimpleDateFormat("/yyyy/MM/dd/").format(new Date());
			
			InputStream in = file.getInputStream();
			boolean uploadFile = FtpUtil.uploadFile(host, port, ftp_username, ftp_password, basePath, imagePath, newName, in);
			if(!uploadFile){
				retInfo.setRetMsg("上传失败！");
			}else{
				retInfo = new RetInfo(Constants.SUCCESS,"上传成功", urlPrex + imagePath + newName);
			}
		} catch (Exception e) {
			e.printStackTrace();
			retInfo.setRetMsg("系统繁忙！");
		}
		return retInfo;
	}

}
