<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03/standard.jsp</title>
</head>
<body>
<h4>JSP(Java Server Page)</h4>
<pre>
	: template 기반의 스크립트 코드 형태를 가진 스펙.
	** JSP 소스 구성 요소(View 제작에 특화)
	1. 정적 테스트 : HTML, JavaScript, CSS, 일반 테스트...
	2. Scriptlet
		1) Directive(지시자) &lt;%@ 지시자명 속성="값" %&gt; : JSP 페이지에 대한 환경 설정 혹은 전처리에 사용됨.
		-page : 설정정보
		-include : 동적내포
		-taglib : custom tag library 로딩에 사용
		2) Scriptlet <%
		//자바코드
		String test = "test"; //지역화 (in method : _jspService)
		for(int i=0; i<5; i++){
			%>
			<%=String.format("%s, %d번째\n",test,i) %>
			<%
		}
		%>
		3) Expression(표현식)<%="출력하고 싶은 값이나 변수" %>, <%=test %>
		4) Declaration(선언식)
		<%! 
		public String sample = "전역변수";
		%>
		5) Comment(주석)<%-- --%>
			-client side comment : html, javascript, css
			-server side comment : java, jsp
	3. 기본객체
	4. 액션태그
	5. EL(표현언어)
	6. JSTL(tag library)
	
	
	객체지향 설계의 5가지 원칙
	SRP : 단일 책임의 원칙
	OCP
	LSP
	ISP
	DIP
	
</pre>
</body>
</html>