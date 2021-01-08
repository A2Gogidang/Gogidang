package com.spring.gogidang.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.domain.BookingVO;
import com.spring.mapper.BookingMapper;


@Service("bookingService")
public class BookingServiceImpl implements BookingService{
   
   @Autowired
   private SqlSession sqlSession;
   
   @Override
   public ArrayList<BookingVO> getBookingList(String u_id){
      BookingMapper bookingmapper =sqlSession.getMapper(BookingMapper.class);
      ArrayList<BookingVO>bookingList=new ArrayList<BookingVO>();
      bookingList = bookingmapper.getBookingList(u_id);
         
      return bookingList;
   }
   
   @Override
   public int insertBooking(BookingVO bookingVO) {
      BookingMapper bookingMapper = sqlSession.getMapper(BookingMapper.class);
      int res = bookingMapper.insertBooking(bookingVO);
      
      return res;
   }
   
   @Override
   public int cancelBooking(HashMap<String,String>hashmap) {
      BookingMapper bookingMapper = sqlSession.getMapper(BookingMapper.class);
      int res = bookingMapper.customerBooking(hashmap);
      int booking_num = Integer.parseInt(hashmap.get("booking_num"));
      if(res==1) {
         res=bookingMapper.cancelBooking(booking_num);
      }
      return res;
   }
   
}