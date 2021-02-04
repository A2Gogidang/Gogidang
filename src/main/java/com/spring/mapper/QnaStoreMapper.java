package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.QnaStoreVO;
import com.spring.gogidang.domain.QnaVO;


public interface QnaStoreMapper {
	
	public int qnaInsert(QnaStoreVO qna);
	public List<QnaStoreVO> getList(int s_num);
	
	public int getListCounts(); 
	public List<QnaStoreVO> getQnaList(HashMap<String, Integer> hashmap);
	public QnaStoreVO getDetail(int qnastore_num);
	public int qnaModify(QnaStoreVO qna);
	public int qnaDelete(int qnastore_num);
	public int isBoardWriter(HashMap<String, String> hashmap);
	public int qnaReplyupdate(QnaStoreVO qna);
	public int qnaReply(QnaStoreVO qna);

}