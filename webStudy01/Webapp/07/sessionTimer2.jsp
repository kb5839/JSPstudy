<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 1.스케쥴링 함수를 이용하여, 1초마다 차감되는 타이머 구현. -->
<!-- 2.1분남은 시점에 메시지를 출력,세션 연장 여부를 확인한 다음, -->
<!-- 	연장을 선택하면, 타이머가 2분으로 리셋. -->
<!-- 	연장하지 않겠다면, 타이머는 0:0 순간 멈춤 -->
<input type="button" value="연장" id="btn">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$("#btn").hide();
	var time = 120;
var times = setInterval(() => {
	var min = parseInt(time/60);
	var sec = time%60;
	document.getElementById("resultArea").innerHTML = min+":"+sec;
	time--;
	if(min=0){
		$("#btn").show();
	}
	
	}, 1000);

</script>
<div id="resultArea">
s
</div>
</body>
</html>