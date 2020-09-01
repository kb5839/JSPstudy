<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
private long factorial(int num, StringBuffer expr){
	if(num<=0){
		throw new IllegalArgumentException("음수와 0은 처리 불가능");
	}else if(num==1){
		expr.append(num);
		return num;
	}else{
		expr.append(num+"*");
		return num*factorial(num-1, expr);
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03/practice.jsp</title>
</head>
<body>
<!-- 	1.브라우저에 1~10까지의 숫자 출력  -->
<!-- 	2.브라우저에 !10 연산의 결과를 !10=?? 와 같은 형식으로 출력  -->
<!-- 	3.재귀호출구조를 이용하여 2번을 다시 처리  -->
<!-- 	4.2~9단을 구구단으로 출력, 승수는 1~9까지 table태그를 사용하여 2차원 행렬 형태로출력  -->
<!-- 	5.구구단의 곱하기 연산을 수행하는 메소드를 분리하여 처리 -->

 <%--
 try{
 	factorial(10);
 }catch(IllegalArgumentException e){
	e.printStackTrace();
 }
 --%> 

<form action="">
	<input type="number" name="data" required>
	<input type="submit" value="전송">
</form>
	<pre>
	<%
	String data = "";
	int num = Integer.parseInt(data);
	StringBuffer expr = new StringBuffer();
	long result = factorial(num, expr);
	%>
	<%=String.format("!%d= %s = %d", num, expr, result) %>
	</pre>
</body>
</html>