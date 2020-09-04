<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="8kb" autoFlush="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07/outDesc.jsp</title>
</head>
<body>
<h4>응답 버퍼의 관리자</h4>
<%
String pattern = "%s:%s\n";
int bufferSize = out.getBufferSize();
out.println(String.format(pattern, "버퍼크기", bufferSize));
int remaining = out.getRemaining();
out.println(String.format(pattern, "남은용량", remaining));
boolean autoFlush = out.isAutoFlush();
out.println(String.format(pattern, "autoFlush 지원여부", autoFlush));
for(int i=0; i<=100; i++){
	if(out.getRemaining()<80){
		out.flush();
	}
	out.println(i+"번째 반복문 출력");
}

request.getRequestDispatcher("/03/standard.jsp").forward(request, response);
%>
</body>
</html>