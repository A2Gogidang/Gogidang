package com.spring.gogidang.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Getter
@AllArgsConstructor
@Data
public class QnaStorePageDTO {
	
	private int qnastoreCnt;
	private List<QnaStoreVO> list;

}
