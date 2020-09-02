<%@page import="java.util.Objects"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<%!
private long factorial(int num, StringBuffer expr){
	if(num<=0){
		throw new IllegalArgumentException("음수와 0은 처리 불가능");
	}else if(num==1){
		expr.append(num);
		return num;
	}else{
		expr.append(num+"*");
		return num*factorial(num-1, expr);
	}
}
%>
	<%
	String accept  = request.getHeader("Accept");
	String mime = "text/html;charset=UTF-8";
	if(accept.contains("json")){
		mime = "applictaion/json;charset=UTF-8";
	}
	response.setContentType(mime);
	String opParam = request.getParameter("op");
	if(StringUtils.isNotBlank(opParam) && StringUtils.isNumeric(opParam)){
	int num = Integer.parseInt(opParam);
	StringBuffer expr = new StringBuffer();
	long result = factorial(num, expr);
	%>
	{
	"expression":"<%=String.format("!%d= %s = %d", num, expr, result) %>"
	}
	<%
	}else{	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03/practice.jsp</title>
</head>
<body>
	<form>  <!-- 액션을 생략할 때는 상대경로 -->
	피연산자 : <input type="text" name="op" value="<%=Objects.toString(opParam,"") %>" required>
	<input type="submit" value="전송">
</form>
<div id="resultArea">

</div>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
var resultArea = $("#resultArea");
$("form").on("submit",function(event) {
	event.preventDefault();
	//동기요청을 비동기로 전환
	let url = this.action? this.action : "";
	let data = {};
	let inputs = $(this).find(":input");
	$.each(inputs, function(index, input){
        let nameAttr = input.name;
        if(nameAttr){
           let valueAttr = input.value;
           data[nameAttr] = valueAttr;
        }
     });
	let method = this.method ? this.method : "get";
	
	$.ajax({
		url : url,
		data : data,
		method : method,
		dataType : "text", //request header : Accept, response header : Content-Type
		success : function(resp){
			resultArea.html(resp);
		},
		error : function(errorResp) {
			console.log(errorResp);
		}
	});
	return false;
});
</script>
</body>
</html>
<% 
}
%>