package com.spring.gogidang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.gogidang.domain.QnaStoreVO;
import com.spring.gogidang.domain.ReviewReplyVO;
import com.spring.gogidang.service.QnaStoreService;
import com.spring.gogidang.service.ReviewReplyService;

@RequestMapping("/reviewreply/")
@RestController
public class ReviewReplyController {
	
	@Autowired
	ReviewReplyService service;

	
	@PostMapping(value="/new.qs", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	//@PostMapping(value="/new.qs", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> create(@RequestBody ReviewReplyVO vo) {
		int insertCount = service.register(vo);
		
		return insertCount == 1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);		
	}

}
