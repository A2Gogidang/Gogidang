package com.spring.gogidang.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.gogidang.domain.BookingVO;

public interface BookingService {
	
   public ArrayList<BookingVO> getBookingList(String u_id);
   public int insertBooking(BookingVO bookingVO);
   public int cancelBooking(HashMap<String,String> hashmap);
}
