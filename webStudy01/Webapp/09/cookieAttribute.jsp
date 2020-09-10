<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>쿠키의 속성</h4>
<pre>
1. 필수 속성(String) : name, value
	RFC-2396규약.(% 인코딩, url 인코딩)
	<%--
	String koreanvalue = URLEncoder.encode("한글", "UTF-8");
	Cookie koreanCookie = new Cookie("kc",koreanvalue);
	response.addCookie(koreanCookie);
	--%>
2. 부가 속성
	1) expires/max-age : 만료시간설정. 기본값은 세션과 동일
		0 : 쿠키 삭제 (주의! name, value, 그외의 모든 속성이 동일)
	<%--
	Cookie longLiveCookie = new Cookie("longLive", "Long~~");
	longLiveCookie.setMaxAge(-1);
	response.addCookie(longLiveCookie);
	--%>
	2) domain(host) : 다음번 요청 발생시 서버로 재전송 여부를 결정하는 기준.
	   domain 구조(level구조), 저수준의 도메인은 고수준의 도메인에 소속됨
	   3레벨(GTLD) : www.naver.com
	   4레벨(NTLD) : www.naver.co.kr
	   ex) .naver.com : naver 도메인의 모든 host를 대상으로 쿠키를 재전송.
	   	mail.naver.com : 네이버의 메일 서버로만 재전송
	   	session id : <%=session.getId() %>
	   	<%--
	   	Cookie allDomainCookie = new Cookie("allDomain","allDomain~" );
	   	allDomainCookie.setDomain("www.chy.com");
	   	response.addCookie(allDomainCookie);
	   	--%>
	3) path : 쿠키의 재전송 여부를 결정. 기본값은 쿠키를 생성한 경로
	<%
	Cookie allPath = new Cookie("allPath", "all~~Path~~");
	response.addCookie(allPath);
	allPath.setPath(request.getContextPath());
// 	allPath.set;
	%>
	<a href="<%=request.getContextPath() %>/09/viewCookie.jsp">09</a>
	<a href="<%=request.getContextPath() %>/08/viewCookie.jsp">08</a>
	<a href="<%=request.getContextPath() %>/09/inner/viewCookie.jsp">뎁스구조</a>
	4) 기타 : httpOnly, secure(secure protocol 을 사용하는 요청에 대해서만 재전송)
</pre>
</body>
</html>