console.log("Reply Module........");

var qnaService = (function(){
	
	function add(qnastore,callback,error) {
		$.ajax({
			type : 'post',
			url :'/qnastore/new.qs',
			data : JSON.stringify(qnastore),
			contentType : "application/json; charset=utf-8",
			success : function(result , status,xhr) {
				
				if(callback) {
				}
			},
			error : function(xhr,status,er) {
				
				if(error){
					error(er);
				}
			}
		})
	}
	
	function getList(param,callback,error) {
		var s_num = param.s_num;
		
		$.getJSON("/qnastore/"+s_num+".qs",
				function data(data){
					if(callback) {
						callback(data);
				}
		}).fail(function(xhr,status,err){
			if(error) {
				error();
			}
		});
		
}
	
	function remove(qs_num,callback,error) {
		alert("qs_num=" + qs_num);
		$.ajax({
			type :'delete',
			url : '/qnastore/remove/'+qs_num+'.qs',
			success : function(deleteResult,status,xhr) {
				if(callback) {
					callback(deleteResult);
					alert("hi1111");
				}
			},
			error : function(xhr,status,er) {
				    alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				
			}
		});
	}
	
	function update(qnastore,callback,error) {
		alert("qs_num=" + qnastore.qs_num);
		$.ajax({
			type :'put',
			url : '/qnastore/modify/'+qnastore.qs_num+'.qs',
			data : JSON.stringify(qnastore),
			contentType : "application/json; charset=utf-8",
			success : function(result,status,xhr) {
				if(callback) {
					callback(result);
					alert("hi1111");
				}
			},
			error:function(xhr,status,error){
			    alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
			    
			}

			
		});
	}
	
	function get(qs_num,callback,error) {
		
		$.get("/qnastore/get/"+qs_num+".qs", function(result) {
			
			if(callback) {
				callback(result);
			}
			
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	
function displayTime(timeValue) {
		
		var today = new Date();
		
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		var str = "";
		
		if (gap < (1000 * 60 * 60 * 24)) {
			
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
		
			
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
				':', (ss > 9 ? '' : '0') + ss].join('');
		}
	}
	
	
	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		get : get,
		displayTime : displayTime
	};
})();