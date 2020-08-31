$.fn.convertForm = function(resultArea){
	resultArea = $(resultArea);
	var element = this.on("submit", function(event){
		event.preventDefault();
		var inputs = $(this).find(":input");
		let obj = {};
		let url = this.action;
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
		$.ajax({
			url : url,
			data : obj,
			success : function(resp){
				resultArea.text(resp);
			}
		})
		return false;
	});
}

