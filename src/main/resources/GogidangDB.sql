/* 문의 */
CREATE TABLE QNA (
	qna_num NUMBER NOT NULL, /* 글번호 */
	u_id VARCHAR2(100) NOT NULL, /* 아이디 */
	title VARCHAR2(100) NOT NULL, /* 글제목 */
	content VARCHAR2(2000) NOT NULL, /* 글내용 */
	re_date DATE default sysdate, /* 문의등록날짜 */
	qna_pasword VARCHAR2(100), /* 게시글 비밀번호 */
	re_ref NUMBER NOT NULL, /*원글번호*/
	re_lev NUMBER NOT NULL, /*답글번호 */
	re_seq NUMBER NOT NULL /*답글에 답글번호*/
);
alter table QNA add constraint pk_QNA primary key (qna_num);
create sequence seq_QNA;

/* 찜 */
CREATE TABLE like_store (
	like_num NUMBER NOT NULL, /* 찜번호 */
	s_num VARCHAR2(100) NOT NULL, /* 사업자등록번호 */
	u_id VARCHAR2(100) NOT NULL /* 아이디 */
);
alter table like_store add constraint pk_like_store primary key (like_num);
create sequence seq_like_store;

/* 공지사항 수정전  */
CREATE TABLE notice (
	notice_num NUMBER NOT NULL, /* 글번호 */
	admin_id VARCHAR2(100) NOT NULL, /* 관리자아이디 */
	title VARCHAR2(100) NOT NULL, /* 글제목 */
	hit NUMBER NOT NULL, /* 글조회수 */
	content VARCHAR2(2000) NOT NULL, /* 글내용 */
	re_date DATE default sysdate, /* 공지사항등록날짜 */
	photo VARCHAR2(100) /* 사진 */
);

/* 공지사항  수정후 */ 
CREATE TABLE notice (
	notice_num NUMBER NOT NULL, /* 글번호 */
	u_id VARCHAR2(100) NOT NULL, /* 아이디 */
	title VARCHAR2(100) NOT NULL, /* 글제목 */
	content VARCHAR2(2000) NOT NULL, /* 글내용 */
	notice_password VARCHAR2(100) NOT NULL /*공지사항 비밀번호*/
	re_date DATE default sysdate, /* 공지사항등록날짜 */
	re_ref NUMBER /* 원글번호 */
);

/* 결제 */
CREATE TABLE pay (
	pay_num NUMBER NOT NULL, /* 결제번호 */
	booking_num VARCHAR2(100) NOT NULL, /* 예약번호 */
	u_id VARCHAR2(100) NOT NULL, /* 아이디 */
	s_num VARCHAR2(100) NOT NULL, /* 사업자등록번호 */
	approval_num NUMBER NOT NULL, /* 승인번호 */
	pay_code VARCHAR2(100) NOT NULL, /* 결제상태코드 */
	pay_price NUMBER NOT NULL /* 총액 */
);
alter table pay add constraint pk_pay primary key (pay_num);
create sequence seq_pay;

/* 예약시간 */
CREATE TABLE bookingtime (
	time NUMBER NOT NULL, /* 시간 */
	s_num VARCHAR2(100) NOT NULL, /* 사업자등록번호 */
	u_id VARCHAR2(100) NOT NULL, /* 아이디 */
	table_count NUMBER NOT NULL /* 테이블 */
);


/* 가게등록 */
CREATE TABLE shop_reg (
	s_num VARCHAR2(100) NOT NULL, /* 사업자등록번호 */
	u_id VARCHAR2(100) NOT NULL, /* 아이디 */
	thumbnail VARCHAR2(100) NOT NULL, /* 메인사진 */
	s_name VARCHAR2(100) NOT NULL, /* 가게이름 */
	s_addr VARCHAR2(100) NOT NULL, /* 가게주소 */
	s_phone VARCHAR2(100) NOT NULL, /* 가게전화번호 */
	s_img VARCHAR2(100) NOT NULL, /* 사업자등록증 */
	s_hour VARCHAR2(100) NOT NULL, /* 가게운영시간 */
	delibery NUMBER default 0, /* 배달가능여부 */
	confirm NUMBER default 0 /* 가게등록승인여부 */
);
alter table shop_reg add constraint pk_shop_reg primary key (s_num);
create sequence seq_shop_reg;

/* 이벤트 */
CREATE TABLE event (
	event_num number NOT NULL, /* 글숫자 */
	admin_id VARCHAR2(100) NOT NULL, /* 관리자아이디 */
	photo VARCHAR2(100), /* 사진 */
	thumbnail VARCHAR2(100) NOT NULL, /* 메인사진 */
	content VARCHAR2(2000) NOT NULL, /* 글내용 */
	re_date DATE default sysdate /* 이벤트등록일 */
);
alter table event add constraint pk_event primary key (event_num);
create sequence seq_event;

/* 예약 */
CREATE TABLE booking (
	booking_num VARCHAR2(100) NOT NULL, /* 예약번호 */
	u_id VARCHAR2(100) NOT NULL, /* 아이디 */
	s_num VARCHAR2(100) NOT NULL, /* 사업자등록번호 */
	time VARCHAR2(100) NOT NULL, /* 시간 */
	head_count NUMBER NOT NULL, /* 인원수 */
	table_charge NUMBER NOT NULL, /* 상차림비 */
	pay_price NUMBER NOT NULL, /* 총액 */
	pay_code VARCHAR2(100) NOT NULL, /* 결제상태코드 */
	booking_state NUMBER NOT NULL /* 예약상태 */
);
alter table booking add constraint pk_booking primary key (booking_num);
create sequence seq_booking;

/* 메뉴등록 */
CREATE TABLE menu_reg (
	menu_num NUMBER NOT NULL, /* 번호 */
	u_id VARCHAR2(100) NOT NULL, /* 아이디 */
	s_num VARCHAR2(100) NOT NULL, /* 사업자등록번호 */
	meat NUMBER NOT NULL, /* 고기(소,돼지) */
	menu_name VARCHAR2(100) NOT NULL, /* 부위 */
	price VARCHAR2(100) NOT NULL, /* 가격 */
	img VARCHAR2(100) NOT NULL, /* 사진 */
	grade NUMBER NOT NULL, /* 등급 */
	gram NUMBER NOT NULL /* 그램수*/
);
alter table menu_reg add constraint pk_menu_reg primary key (menu_num);
create sequence seq_menu_reg;

/* 리뷰 */
CREATE TABLE review (
	review_num NUMBER NOT NULL, /* 리뷰번호 */
	u_id VARCHAR2(100) NOT NULL, /* 아이디 */
	nickname VARCHAR2(100) NOT NULL, /* 소비자닉네임 */
	s_num VARCHAR2(100) NOT NULL, /* 사업자등록번호 */
	s_name VARCHAR2(100) NOT NULL, /* 가게명 */
	title VARCHAR2(100) NOT NULL, /* 리뷰제목 */
	content VARCHAR2(2000) NOT NULL, /* 리뷰내용 */
	star NUMBER NOT NULL, /* 별점 */
	photo1 VARCHAR2(100), /* 리뷰사진1 */
	photo2 VARCHAR2(100), /* 리뷰사진2 */
	photo3 VARCHAR2(100), /* 리뷰사진3 */
	review_date DATE default sysdate /* 리뷰등록일 */
);
alter table review add constraint pk_review primary key (review_num);
create sequence seq_review;

/* 리뷰댓글 */
CREATE TABLE sub_review (
	comment_num NUMBER NOT NULL, /* 댓글번호 */
	review_num NUMBER NOT NULL, /* 리뷰번호 */
	u_id VARCHAR2(100) NOT NULL, /* 아이디 */
	s_num VARCHAR2(100) NOT NULL, /* 사업자등록번호 */
	re_content VARCHAR2(100) NOT NULL, /* 내용 */
	re_date DATE default sysdate /* 등록날짜 */
);
alter table sub_review add constraint pk_sub_review primary key (comment_num);
create sequence seq_sub_review;

/* 회원가입 */
CREATE TABLE member (
	u_id VARCHAR2(100) NOT NULL, /* 아이디 */
	u_pw VARCHAR2(100) NOT NULL, /* 비밀번호 */
	u_name VARCHAR2(100) NOT NULL, /* 이름 */
	u_nick VARCHAR2(100) NOT NULL, /* 닉네임 */
	u_birth DATE NOT NULL, /* 생년월일 */
	u_addr VARCHAR2(100) NOT NULL, /* 주소 */
	u_email VARCHAR2(100) NOT NULL, /* 이메일 */
	u_phone VARCHAR2(100) NOT NULL, /* 전화번호 */
	seller_key NUMBER default 0 /* 판매자식별 */
);
alter table member add constraint pk_member primary key (u_id);
create sequence seq_member;

/* 가게문의 */
CREATE TABLE QNA_store (
	qs_num NUMBER NOT NULL, /* 글번호 */
	u_id VARCHAR2(100) NOT NULL, /* 아이디 */
	s_num VARCHAR2(100) NOT NULL, /* 사업자등록번호 */
	title VARCHAR2(100) NOT NULL, /* 글제목 */
	content VARCHAR2(2000) NOT NULL, /* 글내용 */
	qna_date DATE default sysdate /* 문의날짜 */
);
alter table QNA_store add constraint pk_QNA_store primary key (qs_num);
create sequence seq_QNA_store;

/* 가게문의 댓글 */
CREATE TABLE sub_qna_store (
	s_comment_num NUMBER NOT NULL, /* 댓글번호 */
	qs_num NUMBER NOT NULL, /* 글번호 */
	s_num VARCHAR2(100) NOT NULL, /* 사업자등록번호 */
	u_id VARCHAR2(100) NOT NULL, /* 아이디 */
	re_content VARCHAR2(2000) NOT NULL, /* 내용 */
	re_date DATE default sysdate /* 등록날짜 */
);
alter table sub_qna_store add constraint pk_sub_qna_store primary key (s_comment_num);
create sequence seq_sub_qna_store;
