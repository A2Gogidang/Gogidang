package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.gogidang.domain.BookingVO;



public interface BookingMapper {
   public ArrayList<BookingVO> getBookingList(String id);
   public int insertBooking(BookingVO bookingVO);
   public int cancelBooking(int booking_num);
   public int customerBooking(HashMap<String,String>hashmap);

}