<%@page import="java.util.Objects"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
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
	<pre>
	<%
	String opParam = request.getParameter("op");
	if(StringUtils.isNotBlank(opParam) && StringUtils.isNumeric(opParam)){
	int num = Integer.parseInt(opParam);
	StringBuffer expr = new StringBuffer();
	long result = factorial(num, expr);
	%>
	<%=String.format("!%d= %s = %d", num, expr, result) %>
	<%
	}	
	%>
	</pre>
	<form>  <!-- 액션을 생략할 때는 상대경로 -->
	피연산자 : <input type="text" name="op" value="<%=Objects.toString(opParam,"") %>" required>
	<input type="submit" value="전송">
</form>
</body>
</html>