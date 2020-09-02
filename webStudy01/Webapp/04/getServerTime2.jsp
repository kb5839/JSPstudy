<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<head>
<title>현재시간</title>
<script type="text/javascript">
function time(){
var time= new Date(); 
document.getElementById("now").innerHTML=time.getHours()+"시"+time.getMinutes()+"분"+time.getSeconds()+"초";
}
</script>
</head>
<body onload="time()"> 
<h2> 현재 시간: <span id="now"></span></h2>
</body>
</html>