$.fn.convertForm = function(object){
	var element = this.on("submit", function(event){
		event.preventDefault();
		if(object.init){
			object.init();
		}
		if(object.validation && !object.validation()){
			return false;
		}
		var inputs = $(this).find(":input");
		let obj = {};
		let url = this.action;
		let method = this.method;
		inputs.each(function(index, tag){
			let name = tag.name;
			if(name){	
				let value = tag.value;
//  			out.put("leftOp", value);
//  			obj.leftOp = value
 				obj[name] = value;
// 				console.log(obj);
			}
		});
		//동기 처리를 비동기로 전환
		//주소, 파라미터(데이터), method, 응답데이터의 mime(dataType), 성공(success), 실패(error)
		$.ajax({
			url : url,
			data : obj,
			method : method,
			success : object.success 
		});
		return false;
	});
	return this;
}

