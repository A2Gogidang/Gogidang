package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.gogidang.domain.Criteria;
import com.spring.gogidang.domain.ReviewVO;

public interface ReviewMapper {

	// taehyun
	public List<ReviewVO> getListWithPaging(Criteria cri);
	public List<ReviewVO> getUidListWithPaging(@Param("pageNum") int pageNum, @Param("amount") int amount, @Param("u_id") String u_id);
	public List<ReviewVO> getSnumListWithPaging(@Param("pageNum") int pageNum, @Param("amount") int amount, @Param("s_num") int s_num);
	public void reviewReg(ReviewVO review);
	public int update(ReviewVO review);
	public int delete(int review_num);
	public ReviewVO read(int review_num);
	public int getTotalCount(Criteria cri);
}
