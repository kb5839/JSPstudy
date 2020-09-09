<%@page import="kr.or.ddit.servlet04.ServerExplorerServlet.CommandType"%>
<%@page import="kr.or.ddit.vo.FileCommandVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>09/actionTageDesc.jsp</title>
</head>
<body>
<h4>액션 태그</h4>
<pre>
Custom Tag?
&lt;prefix:TagName attributes /&gt;
<!-- <my:test></my:test> -->
	액션 태그? 커스텀 태그 중 일부를 jsp 스펙에 기본 포함시킨 것들.
<%-- 	<jsp:forward page="/03/standard.jsp"></jsp:forward> --%>
<%-- 	<jsp:include page="/03/standard.jsp"></jsp:include> --%>
<%
// request.getRequestDispatcher("/03/standard.jsp").include(request, response);
%>
JavaBean : 자바빈 규약에 따라 정의된 재 사용 가능한 객체???
JavaBean - VO(Value Object) -DTO(Data Transfer Object) - Model
1. 값(데이터)을 가질수 있는 property 존재.
2. property 는 캡슐화함.
3. 캡슐화된 property에 접근할 수 있는 인터페이스 제공
4. 객체의 상태를 비교할 수 있는 방법 제공(equals 재정의)
5. 객체의 상태를 확인할 수 있는 방법 제공(toString)
6. 직렬화 가능
<%
FileCommandVO fc = new FileCommandVO();
fc.setCommand(CommandType.COPY);
request.setAttribute("fcvo2", fc);
%>
<jsp:useBean id="fcvo1" class="kr.or.ddit.vo.FileCommandVO" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="fcvo1" />
<jsp:getProperty property="command" name="fcvo1" />
1. id에 해당하는 속성데이터를 scope에서 검색.
2. 존재하지 않는다면, 해당 객체를 생성하고, 변수에 할당.
3. 생성된 객체를 해당 scope에 속성 데이터로 저장

<%=fcvo1 %>
<%=fc==fcvo1 %>
<%=fc.equals(fcvo1) %>
</pre>
</body>
</html>