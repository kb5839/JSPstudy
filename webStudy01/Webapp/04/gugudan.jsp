<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<pre>
<table border=2>
<%
for (int i = 2; i < 10; i++) {
	%><tr>
	<%
	for (int j = 1; j < 10; j++) {
		%>
		<%=String.format("<td>"+i+" x "+j+" = "+i*j+"</td>") %>
		<%
	}
	%>
	</tr>
	<%
}

		%>
</table>
</pre>
</body>
</html>