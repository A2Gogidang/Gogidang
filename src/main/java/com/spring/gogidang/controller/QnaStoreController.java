package com.spring.gogidang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.QnaStorePageDTO;
import com.spring.gogidang.domain.QnaStoreVO;
import com.spring.gogidang.service.QnaStoreService;

@RequestMapping("/qnastore/")
@RestController
public class QnaStoreController {

	@Autowired
	QnaStoreService service;

	
	@PostMapping(value="/new.qs", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	//@PostMapping(value="/new.qs", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> create(@RequestBody QnaStoreVO vo) {
		int insertCount = service.register(vo);
		
		return insertCount == 1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);		
	}

	
	/*
	 * @RequestMapping(value="/{s_num}.qs", produces = {
	 * MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	 * public ResponseEntity<List<QnaStoreVO>> getList(@PathVariable int s_num) {
	 * 
	 * 
	 * 
	 * return new ResponseEntity<>(service.getList(s_num),HttpStatus.OK); }
	 */
	
	@RequestMapping(value="/pages/{s_num}/{page}.qs", produces = { 
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<QnaStorePageDTO> getList(@PathVariable("page") int page,
												   @PathVariable("s_num") int s_num) {
		
		Criteria cri = new Criteria(page, 10);
		
		System.out.println("get qnastore List s_num:"+s_num);
		System.out.println("cri:"+cri);
		
		
		
		return new ResponseEntity<>(service.getListPage(cri,s_num),HttpStatus.OK);		
	}
	
	@GetMapping(value="/get/{qs_num}.qs",
			produces = { MediaType.APPLICATION_XML_VALUE,
						 MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<QnaStoreVO> get(@PathVariable("qs_num") int qs_num)   {
		
		
			
		return new ResponseEntity<QnaStoreVO>(service.get(qs_num),HttpStatus.OK);		
	}
	
	
	@DeleteMapping(value="/remove/{qs_num}.qs", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("qs_num") int qs_num) {
		return service.remove(qs_num) == 1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);		
	}
	
	@RequestMapping(method = {RequestMethod.PUT,RequestMethod.PATCH},
			value="/modify/{qs_num}.qs",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(
			@RequestBody QnaStoreVO vo,
			@PathVariable("qs_num") int qs_num) {
		
			vo.setQs_num(qs_num);

		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);		
	}
	
	
}
