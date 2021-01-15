package com.spring.gogidang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.QnaStoreVO;
import com.spring.mapper.QnaStoreMapper;

@Service
public class QnaStoreServiceImpl implements QnaStoreService {
	
	@Autowired
	private QnaStoreMapper mapper;
	
	@Override
	public int register(QnaStoreVO vo) {
		// TODO Auto-generated method stub
		return mapper.insert(vo);
	}

	@Override
	public QnaStoreVO get(int qs_num) {
		// TODO Auto-generated method stub
		return mapper.read(qs_num);
	}

	@Override
	public int remove(int qs_num) {
		// TODO Auto-generated method stub
		return mapper.delete(qs_num);
	}

	@Override
	public int modify(QnaStoreVO qna) {
		// TODO Auto-generated method stub
		return mapper.update(qna);
	}

	@Override
	public List<QnaStoreVO> getList(int s_num) {
		// TODO Auto-generated method stub
		return mapper.getListWithS_num(s_num);
	}

}
