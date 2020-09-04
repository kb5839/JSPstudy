<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 객체</title>
</head>
<body>
	: jsp 페이지에 대해 최초의 요청이 발생하면, 생성되는 서블릿 소스가 파싱되는 시점에 자동으로 생성되는 객체
	
	1.request(HttpServletRequest) : 클라이언트와 요청에 대한 모든 정보를 캡슐화한 객체.(요청분석)
	2.response(HttpServletResponse) : 클라리언트쪽으로 전송될 응답에 대한 모든 정보를 캡슐화한 객체
	3.out(JspWriter) : 응답버퍼에 데이터를 기록하기 위한 스트림 객체이면서, 응답버퍼의 관리자
	4.session(HttpSession) : 한 클라이언트의 세션에 대한 모든 정보를 캡슐화한 객체
	5.application(ServletContext) : 하나의 어플리케이션과 서버에 대한 모든 정보를 캡슐화한 객체
	6.page(Object) : 현재 페이지에 대해 생성된 서블릿 싱글톤 객체의 레퍼런스(참조)
	7.config(ServlerConfig) : 서블릿이 등록되고 매핑되는 과정의 모든 메타데이터를 캡슐화한 객체(서블릿과 1:1)
	8.exception(Throwable) : 에러 처리 페이지에서 발생한 에러나 예외에 대한 정보를 참조할 때 사용
	9.******pageContext(PageCOntext) : 모든 기본객체중 가장먼저 생성되면서, 나머지 기본객체들을 모두 가진 객체
</body>
</html>