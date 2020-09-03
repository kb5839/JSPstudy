<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06/oageMoeve.jsp</title>
</head>
<body>
<h4>페이지 이동 방식(흐름제어</h4>
<pre>
	A ---> B
	Http : Stateless(무상태, 비상태유지)
1.Request Dispatch : 최초의 요청을 그대로 유지 (상태유지)하면서 도착지로 이동하는 방식
	<%
	RequestDispatcher rd =  request.getRequestDispatcher("/03/standard.jsp");
// 	rd.forward(request, response);
	rd.include(request, response);
	%>
2.Redirect : 최초의 요청에 대한 응답이 이동전에 클라이언트로 전송
		body는 없고, line(302,307)/header(location=B) 로만 구성된 응답이 전송
		새로운 요청(B)가 클라이언트로 부터 발생  - statless 주의!
		<%--
		response.sendRedirect(request.getContextPath()+"/03/standard.jsp");
		--%>
</pre>
</body>
</html>