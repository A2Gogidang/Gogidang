package com.spring.gogidang.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.QnaVO;
import com.spring.mapper.QnaMapper;



@Service("qnaService")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getListCount() {
		QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
		int res= qnaMapper.getListCount();
		return res;
	}

	@Override
	public List<QnaVO> getQnaList(HashMap<String, Integer> hashmap) {
		QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
		List<QnaVO> qnalist = qnaMapper.getQnaList(hashmap);
		return qnalist;
	}
	
	@Override
	public int qnaInsert(QnaVO qna) {
		QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
		int res= qnaMapper.qnaInsert(qna);
		return res;
	}
	
	@Override
	public QnaVO getDetail(int qna_num) {
		QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
		QnaVO qna = qnaMapper.getDetail(qna_num);
		return qna;
	}
	
	@Override
	public QnaVO qnaModifyForm(int qna_num) {
		QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
		QnaVO qna = qnaMapper.getDetail(qna_num);
		return qna;
	}
	
	@Override
	public int qnaModify(QnaVO qna) {
		QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
		int res = qnaMapper.qnaModify(qna);
		return res;
	}
	
	  @Override
	   public int qnaDelete(HashMap<String, String> hashmap) {
	      QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
	      int res= qnaMapper.isBoardWriter(hashmap);
	      int qna_num= Integer.parseInt(hashmap.get("qna_num"));
	      if(res==1) {
	         res=qnaMapper.qnaDelete(qna_num);
	      }
	      return res;
	   }
	  
	   @Override
	   public int qnaReply(QnaVO qna) {
		  QnaMapper qnaMapper = sqlSession.getMapper(QnaMapper.class);
	      qnaMapper.qnaReplyupdate(qna);
	      qna.setRe_seq(qna.getRe_seq()+1);
	      qna.setRe_lev(qna.getRe_lev()+1);
	      int res = qnaMapper.qnaReply(qna);
	      return res;
	   }
	
}

