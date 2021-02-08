//	$(document).ready(function() {
//		
//		$('input[name=f_Mcheck]').change(function() {
//			$('input[name=f_Mcheck]:checked').each(function() {
//				var mk = "";
//				if($(this).val() == 0) {
//					alert("cow1");
//					mk += '<div class="shoplistfoo"><h5>부위</h5></div>';
//					mk += '<div class="shoplistfot">';
//					mk += '<li><input type="checkbox" id="cow_1" class="f_check" name="f_MKcheck" value="등심">등심</li>';
//					mk += '<li><input type="checkbox" id="cow_2" class="f_check" name="f_MKcheck" value="안심">안심</li>';
//					mk += '<li><input type="checkbox" id="cow_3" class="f_check" name="f_MKcheck" value="채끝살">채끝살</li>';
//					mk += '<li><input type="checkbox" id="cow_4" class="f_check" name="f_MKcheck" value="살치살">살치살</li>';
//					mk += '</div>';
//				} else {
//					alert("pig1");
//					mk += '<div class="shoplistfoo"><h5>부위</h5></div>';
//					mk += '<div class="shoplistfot">';
//					mk += '<li><input type="checkbox" id="pig_1" class="f_check" name="f_MKcheck" value="삼겹살">삼겹살</li>';
//					mk += '<li><input type="checkbox" id="pig_1" class="f_check" name="f_MKcheck" value="항정살">항정살</li>';
//					mk += '<li><input type="checkbox" id="pig_1" class="f_check" name="f_MKcheck" value="목살">목살</li>';
//					mk += '<li><input type="checkbox" id="pig_1" class="f_check" name="f_MKcheck" value="부속고기">부속고기</li>';
//					mk += '</div>';
//				}
//				$('.shoplistfo').append(mk);
//			});
//		})
//	});
	
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
					$('#store_list').empty();
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
						
						output += 
						'<div class="col-lg-9">' +
						'<div class="shoping__cart__table">' +
							'<table>' +
								'<thead>' +
									'<tr>' +
										'<th class="shoping__product"><span style="margin-left: 130px;"><a href="./storeInfo.st?s_num='+ item.s_num +'">'+item.s_name+'</a></span></th>' +
										'<th>지역</th>' +
										'<th>품목</th>' +
										'<th>별점</th>' +
									'</tr>' +
								'</thead>' +
								'<tbody>' +
									'<tr>' +
										'<td class="shoping__cart__item" style="display: inline-flex;">' +
											'<img src="resources/img/store/'+ item.thumbnail  +'" alt="" style="width: 400px; height: 250px;"><br>' +
											'<h5 style="display: flex; margin-left: 140px; margin-top: 82px;"></h5>' +
										'</td>' +
										'<td class="shoping__cart__price">'+ item.s_addr +'</td>' +
										'<td class="shoping__cart__quantity">' + meat + '</td>' +
										'<td class="shoping__cart__total"><input type="hidden" id="avgStar" class="avgStar" name="avgStar" value="'+item.avgStar+'" style="border: none" />'+ item.avgStar +
										'</td>' +
									'</tr>' +
								'</tbody>' +
							'</table>' +
						'</div>' +
					'</div>';
		
						$('#store_list').append(output);
						
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
	
	
	
			
		
			