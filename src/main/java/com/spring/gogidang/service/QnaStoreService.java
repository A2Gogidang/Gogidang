package com.spring.gogidang.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.QnaStoreVO;
import com.spring.gogidang.domain.QnaVO;

public interface QnaStoreService {
	
	public int getListCounts(); // 글 개수 구하기 
	public List<QnaStoreVO> getQnaList(HashMap<String, Integer> hashmap); // 글 목록 보기
	public int qnaInsert(QnaStoreVO qna);
	public QnaStoreVO getDetail(int qnastore_num);
	public QnaStoreVO qnaModifyForm(int qnastore_num);
	public int qnaDelete(HashMap<String, String> hashmap);
	public int qnaReply(QnaStoreVO qna);
	
	public List<QnaStoreVO> getList(int s_num);
	public int qnaModify(QnaStoreVO qna);
}
