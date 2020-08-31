<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02/resourceIdentify.jsp</title>
</head>
<body>
<h4>웹상의 자원을 식별하는 방법</h4>
<pre>
자원의 종류 - 자원에 접근하기 위한 경로 표기방식
1.파일시스템 리소스 : ex) e:/contents
2.클래스패스 리소스 : ex) /kr/or/ddit/list.tmpl
3.웹 리소스 : ex) http://localhost/image/test.jsp

web resource 식별 방법 (URI : Uniform Resource Identifier)
URL (Uniform Resource Locator)
URN (Uniform Resource Naming)
URC (Uniform Resource Contents)

URL 표기방법

1.절대경로 : 루트부터 뎁스 구조 상의 모든 경로를 표기하는 방식.
http://localhost/webStudy01/images/cat1.jpg
**client side 절대경로 : 반드시 context root 부터 시작되는 경로
/webStudy01/images/cat1.jpg
**server side 절대경로 : context root를 제외한 이후의 경로를 표기
반드시 절대경로만을 사용함
2.상대경로 : (브라우저의)현재 위치를 기준점으로 잡고, 최종 경로를 표기하는 방식

<!-- /webStudy01/Webapp/images/11.png -->
</pre>
<img alt="" src="<%=request.getContextPath() %>/images/11.png">
<img alt="" src="../images/22.png">
</body>
</html>