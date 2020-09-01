<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03/practice.jsp</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/03/recursive3.jsp">
	<input type="number" name="data" required>
	<input type="submit" value="전송">
</form>
<div id="result">

</div>
</body>
</html>