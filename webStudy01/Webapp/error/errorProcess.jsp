<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
누군가의 예외를 처리하고 있음.
<%=exception==null?"":exception.getMessage() %>
<%
	ErrorData ed = pageContext.getErrorData();
	String uri = ed.getRequestURI();
	int sc = ed.getStatusCode();
	Throwable e = ed.getThrowable();
	out.println(e==exception);
%>
</body>
</html>