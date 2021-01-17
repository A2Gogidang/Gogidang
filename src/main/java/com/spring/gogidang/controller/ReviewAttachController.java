package com.spring.gogidang.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.gogidang.domain.ReviewAttachVO;
import com.spring.gogidang.service.ReviewAttachService;

@Controller
public class ReviewAttachController {
	
	@Autowired
	ReviewAttachService reviewAttachService;
	
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	private boolean checkImageType(File file) {

		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}
	
	@PostMapping(value = "/uploadAjaxAction.up", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ReviewAttachVO uploadAjaxPost(MultipartFile[] uploadFile) {
		
		ReviewAttachVO attachDTO = new ReviewAttachVO();
		String uploadFolder = "/Users/taehyun/Documents/Spring_Source/Gogidang/src/main/webapp/resources/upload";
		
		String uploadFolderPath = getFolder();
		// make folder --------
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// make yyyy/MM/dd folder
		
		for (MultipartFile multipartFile : uploadFile) {
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				// check image type file
				if (checkImageType(saveFile)) {
					
					attachDTO.setFileType(true);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		} // end for
		
		reviewAttachService.insert(attachDTO);
		
		return attachDTO;
	}
}
