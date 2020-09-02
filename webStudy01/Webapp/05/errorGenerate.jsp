<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../error/errorProcess.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	if(1==1)
	throw new NullPointerException("강제 발생 예외");
 %>
</body>
</html>