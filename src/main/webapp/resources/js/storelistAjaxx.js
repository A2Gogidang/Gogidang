		$(document).ready(function() {
	
		commentList();
	});
	
	//상점 목록
	function commentList(){
		$('#review_content').empty();
	  $.ajax({
	     url : 'reviewListAjax.re',
	     contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	     success: function(data) {
	    	 	var output = '';
				$.each(data, function(index, item) {
					output += '<div class="col-lg-4 col-md-6 col-sm-6">';
					output += '<div class="product-item">';
					output += '<div><img src="resources/img/store/store_gogi.png"></div></div>';
					output += '<div class="card_store_name"><div class="text_right"><h5>';
					output += '<a href="#" style="display: inline">' + item.title + '</a>';
					output += '<input type="hidden" id="avgStar" class="avgStar" name="avgStar" value="' + item.star + '" style="border: none" />' +item.star;
					output += '</h5></div></div></div>';
				});
				$('#review_content').append(output);
			},
			error:function() {
				alert("ajax통신 실패");
			}
	  });
	}
	
 	var s_addr = [];
	var meat =[];  
	var star = [];
	
	$('#checkBtn').click(function() {
		s_addr = [];
		meat = [];
		star = [];
		
		if($('input[name=f_Acheck]').is(":checked") == true) {
			$('input[name=f_Acheck]:checked').each(function() {
				s_addr.push($(this).val());
			});
		}
		
		if($('input[name=f_Mcheck]').is(":checked") == true){
			$('input[name=f_Mcheck]:checked').each(function() {
				meat.push($(this).val());
			});
		}
		
		star.push($('input[name=f_Scheck]:checked').val());
		
		getlist(s_addr, meat,star);

	});
	
	function getlist(s_addr, meat, star) {
		var params = {"s_addr" : s_addr, "meat" : meat, "star" : star};
	 	$.ajax({
				//type:'post',
				url:'./storelist_ajax.li',
				contentType : "application/json; charset=utf-8",
				data: JSON.stringify(params),
				type : "POST",
				dataType: 'json',
				
				success : function(data)
				{
					$('#card_row').empty();
					$.each(data, function(index, item){
						console.log(item)
						var output= '';
						
						if (item.meat == 0){
							meat = '소고기'
						} else if (item.meat == 1) {
							meat = '돼지고기'
						} else {
							meat = '가게'
						}
						
						output += '<div class="card_store_box">'+
									'<div class="card_store_addr" >'+
										'<div class="text_left">'+
											'<h5>'+ item.s_addr + '</h5>'+
										'</div>'+
									'</div>';
						output += '<div class="card_store_img" >' + 
									'<div>'+
										'<img src=resources/img/store/'+ item.thumbnail +'>' +
									'</div>' +
								'</div>';
						output += '<div class="card_store_name" >'+
									'<div class="text_right">' +
										'<h5>' +
											'<a href="#" style="display:inline">' + item.s_name + '</a>'+
											'<input type="hidden" id="avgStar" class="avgStar" name="avgStar" value="' + item.avgStar + '" style="border:none" />' + item.avgStar +
										'</h5>' +
									'</div>' +
								'</div>' ;
						output += '<div class="card_store_tag" >' +
										'<div class="text_right">'+
											meat +
										'</div>' +
									'</div>' +
								'</div>'; //class="card_store_box" 끝
								
						$('#card_row').append(output);
						
					});//each 끝			
				}, //success 끝  
				error : function(Request,Status, error) { 
					alert("결과값이 없습니다!");
				}//error 끝
			}); //ajax끝
		};//input:checked끝
		
		
		$('#sortBtn').click(function() {
			
			var avgStar = [];
			
			$('input[name=avgStar]').each(function() {
				avgStar.push($(this).val());
			});
			avgStar.sort();
			alert(avgStar);
		});

			
		
		
	
	
	
	
	
	
	
	
	
	
//	$('[name=f_Acheck]').change(function(){	
//		
//		s_addr = [];
//		
//		if($('input[name=f_Acheck]').is(":checked") == true){
//			
//			$('input[name=f_Acheck]:checked').each(function(){
//				s_addr.push($(this).val());
//			});
//			alert(s_addr);
//			getlist(s_addr,meat);
//		} else {
//			alert("체크를 해주세요!");
//		}
//	});	
//	
//
//	$('[name=f_Mcheck]').change(function(){	
//			
//			meat = []
//			
//			if($('input[name=f_Mcheck]').is(":checked") == true){
//				console.log (meat);
//					$('input[name=f_Mcheck]:checked').each(function(){
//						meat.push($(this).val());
//					});
//				alert(meat);
//				getlist(s_addr,meat);
//			} else {
//				alert("체크를 해주세요!");
//			};
//		}); 
	
	
	
			
		
			