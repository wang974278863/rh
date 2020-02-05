package com.qihang.service;

import org.springframework.web.multipart.MultipartFile;

import com.qihang.common.pojo.RetInfo;

public interface FileUploadService {

	RetInfo upload(MultipartFile file);
}
