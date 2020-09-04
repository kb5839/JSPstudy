<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>Model2 구조로 webStudy01 컨텍스트의 익스플로러 구현</h4>
<%
File[] listFiles = (File[])request.getAttribute("listFiles");
%>
<ul>
	<li class="dir" id="/01">01</li>
	<li class="dir" id="/02">02</li>
	<li class="dir" id="/03">03</li>
	<li class="dir" id="/04">04</li>
	<li class="dir" id="/05">05</li>
	<li class="dir" id="/06">06</li>
	<li class="dir" id="/07">07</li>
</ul>
</body>
</html>