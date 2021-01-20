package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.QnaStoreVO;


public interface QnaStoreMapper {
	
	public int insert(QnaStoreVO vo);
	
	public QnaStoreVO read(int qs_num);
	
	public int delete(int qs_num);
	
	public int update(QnaStoreVO qna);
	
	public List<QnaStoreVO> getListWithPaging(@Param("s_num") int s_num,
											  @Param("cri") Criteria cri);
	
	public int getCountByS_num(int s_num);

}
