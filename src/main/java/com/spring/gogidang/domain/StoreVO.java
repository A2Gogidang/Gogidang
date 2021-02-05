package com.spring.gogidang.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StoreVO {
   private int s_num;
   private String u_id;
   private String thumbnail;
   private String s_name;
   private String s_addr;
   private String s_phone;
   private String s_img;
   private int delivery;
   private String s_hour;

   private int confirm;
   
   private Double avgStar;
   
   /* menu column*/
   private int menu_num; 
   private int meat;
   private String menu_name;
   private String price;
   private String img;
   private int grade;
   
   
   
}