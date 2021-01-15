package com.spring.gogidang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UploadController {
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		
		for (MultipartFile multipartFile : uploadFile) {
			log.info("===============");
			log.info("name" + multipartFile.getOriginalFilename());
			log.info("size" + multipartFile.getSize());
			
		}
	}
}
