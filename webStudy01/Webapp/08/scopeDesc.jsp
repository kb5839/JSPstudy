<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>Scope(영역)</h4>
<pre>
	: 웹어플리케이션내에서 데이터를 공유하기 위해 사용하는 저장 공간
	: 해당 영역에 저장된 속성(attribute)데이터의 사용 범위에 따른 분류
	: 각 기본 객체가 소유한 Map
	1. Page Scope (pageContext) : 한 JSP 페이지 내에서만 유효.
	2. Request Scope (request) : 한 request 가 유지되는 동안 유효.
	3. Session Scope (session) : 한 session 이 유지되는 동안 유효.
	4. Application Scope (application) : 하나의 SevletContext가 유지되는 동안 유효.
	setAttribute, getAttribute, removeAttribute
	<%
		pageContext.setAttribute("pageAttr", "페이지속성");
		request.setAttribute("requestAttr", "요청속성");
		session.setAttribute("sessionAttr", "세션속성");
		application.setAttribute("applicationAttr", "servlet context 속성");
	%>
	
	<%=pageContext.getAttribute("pageAttr") %>
	<%=request.getAttribute("requestAttr") %>
	<%=session.getAttribute("sessionAttr") %>
	<%=application.getAttribute("applicationAttr") %>
	<%
// 	request.getRequestDispatcher("viewAttribute.jsp").forward(request, response);
	response.sendRedirect(request.getContextPath()+"/08/viewAttribute.jsp");
	%>
	<a href="viewAttribute.jsp">viewAttribute.jsp</a>
</pre>
</body>
</html>