<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>session(HttpSession)</h4>
<pre>
세션이란?
	통로(DB) : 클라이언트와 서버사이의 유일한 개방 통로
	시간(web) : 클라이언트가 서버의 어플리케이션을 사용하고 있는 동안을 한 세션으로 정의함.
				최초의 요청(세션 생성의 대상은 브라우저) ~~ 종료 조건(1. timeout 이내의 새로운 요청이 없을 때)
								(2. 브라우저의 종료)
								(3. 더이상 쿠키(JSESSIONID) 전송이 없을때)
								(4. 직접 로그아웃을 한 경우)
	session(HttpSession) : 한 세션 내에서 발생한 클라이언트의 모든 정보를 캡슐화한 객체
	세션 ID : <%=session.getId() %>
	<a href="sessionDesc.jsp;jsessionid=<%=session.getId() %>">세션 파라미터를 통한 세션 유지</a>
	세션 생성 시점(최초 요청 시점) : <%=new Date(session.getCreationTime()) %>
	<%=new Date(session.getLastAccessedTime()) %>
	timeout : <%=session.getMaxInactiveInterval() %>s
	<%
	session.setMaxInactiveInterval(2*60);
	%>
	timeout : <%=session.getMaxInactiveInterval() %>s
	세션 트래킹 : 세션 아이디를 통해 세션을 식별하는 방법
	트래킹 모드
	1.COOKIE : ex) JSESSIONID 와 같은 세션 아이디를 식별할 수 있는 쿠키를 C/S 사이에서 주고 받는 방법
	2.SSL : secure layer 를 통해 세션 아이디를 주고 받는 방법. 전송 계층을 보안 처리 하여 데이터를 보호하는 방법의 일종
	3.URL : 세션 식별을 위한 아이디를 request line 을 통해 주고 받는 방법
</pre>
</body>
</html>