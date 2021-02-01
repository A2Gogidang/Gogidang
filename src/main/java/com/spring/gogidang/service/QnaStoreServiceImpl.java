package com.spring.gogidang.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.QnaStoreVO;
import com.spring.gogidang.domain.QnaVO;
import com.spring.mapper.QnaMapper;
import com.spring.mapper.QnaStoreMapper;



@Service("qnastoreService")
public class QnaStoreServiceImpl implements QnaStoreService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getListCounts() {
		QnaStoreMapper qnastoreMapper = sqlSession.getMapper(QnaStoreMapper.class);
		int res= qnastoreMapper.getListCounts();
		return res;
	}

	@Override
	public List<QnaStoreVO> getQnaList(HashMap<String, Integer> hashmap) {
		QnaStoreMapper qnastoreMapper = sqlSession.getMapper(QnaStoreMapper.class);
		List<QnaStoreVO> qnalist = qnastoreMapper.getQnaList(hashmap);
		return qnalist;
	}
	
	@Override
	public int qnaInsert(QnaStoreVO qna) {
		QnaStoreMapper qnastoreMapper = sqlSession.getMapper(QnaStoreMapper.class);
		int res= qnastoreMapper.qnaInsert(qna);
		return res;
	}
	
	@Override
	public QnaStoreVO getDetail(int qnastore_num) {
		QnaStoreMapper qnastoreMapper = sqlSession.getMapper(QnaStoreMapper.class);
		QnaStoreVO qna = qnastoreMapper.getDetail(qnastore_num);
		return qna;
	}
	
	@Override
	public QnaStoreVO qnaModifyForm(int qnastore_num) {
		QnaStoreMapper qnastoreMapper = sqlSession.getMapper(QnaStoreMapper.class);
		QnaStoreVO qna = qnastoreMapper.getDetail(qnastore_num);
		return qna;
	}
	
	@Override
	public int qnaModify(QnaStoreVO qna) {
		QnaStoreMapper qnastoreMapper = sqlSession.getMapper(QnaStoreMapper.class);
		int res = qnastoreMapper.qnaModify(qna);
		return res;
	}
	
	  @Override
	   public int qnaDelete(HashMap<String, String> hashmap) {
		  QnaStoreMapper qnastoreMapper = sqlSession.getMapper(QnaStoreMapper.class);
	      int res= qnastoreMapper.isBoardWriter(hashmap);
	      int qnastore_num= Integer.parseInt(hashmap.get("qnastore_num"));
	      if(res==1) {
	         res=qnastoreMapper.qnaDelete(qnastore_num);
	      }
	      return res;
	   }
	  
	   @Override
	   public int qnaReply(QnaStoreVO qna) {
		  QnaStoreMapper qnastoreMapper = sqlSession.getMapper(QnaStoreMapper.class);
		  qnastoreMapper.qnaReplyupdate(qna);
		   qna.setRe_seq(qna.getRe_seq()+1);
		   qna.setRe_lev(qna.getRe_lev()+1);
	      int res = qnastoreMapper.qnaReply(qna);
	      return res;
	   }
	
}

