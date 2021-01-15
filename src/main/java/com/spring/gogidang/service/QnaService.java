package com.spring.gogidang.service;

import java.util.HashMap;
import java.util.List;

import com.spring.gogidang.domain.QnaVO;





public interface QnaService {
	
	public int getListCount(); // 글 개수 구하기 
	public List<QnaVO> getQnaList(HashMap<String, Integer> hashmap); // 글 목록 보기
	public int qnaInsert(QnaVO qna);
	public QnaVO getDetail(int qna_num);
	public int qnaModify(QnaVO qna);
	public QnaVO qnaModifyForm(int qna_num);
	public int qnaDelete(HashMap<String, String> hashmap);
	public int qnaReply(QnaVO qna);
	


}
