<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>웰컴 페이지</h4>
<%
String authId = (String)session.getAttribute("authId");
if(StringUtils.isNotBlank(authId)){
	%>
	<form name="logoutForm" action="<%=request.getContextPath() %>/login/logout.do" method="post"></form>
	현재 로그인 유저 : <%=authId %> <a href="#" onclick="document.logoutForm.submit();">로그아웃</a>
	<%
}else{
	%>
	<a href="<%=request.getContextPath() %>/login/loginForm.jsp">로그인하기</a>
<%
}
%>
</body>
</html>