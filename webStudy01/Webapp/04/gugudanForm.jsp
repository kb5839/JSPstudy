<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
구구단의 범위 입력.
<form id="gugudan" action="<%=request.getContextPath() %>/04/methodGugudan.jsp" method="post">
	<select id="minDan" name="minDan">
	<option value>단</option>
	<%
	String pattern = "<option value='%1$d'>%1$d단</option>";
	for(int dan=2; dan<=9; dan++){
		out.println(String.format(pattern, dan));
	}
	%>
	</select>
	<select name="maxDan">
	<option value>단</option>
	<%
	String pattern2 = "<option value='%1$d'>%1$d단</option>";
	for(int dan=2; dan<=9; dan++){
		out.println(String.format(pattern2, dan));
	}
	%>
	</select>
	<button type="submit">send</button>
</form>
<div id="result">

</div>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/calForm.js"></script>
<script type="text/javascript">
$(function() {
	var result = $("#result");
	
	var minDanTag = $("[name='minDan']").on("change", function() {
		let minDan = $(this).val();
		let currentIndex = minDan-1;
		$("[name='maxDan']").find("option:gt(0)").hide();
		if(currentIndex<=1){
			$("[name='maxDan']").find("option").show();
		}else{
			$("[name='maxDan']").find("option:gt("+(currentIndex-1)+")").show();
		}
	});
	var maxDanTag = $("[name='maxDan']");
	var form = $("form:nth(0)").convertForm({
			success : function(resp) {
		result.html(resp);
		result.css({
			border : "1px solid black",
			backgroundColor : "red"
		});
			},
		validation:function(){
			let minDan = minDanTag.val();
			let maxDan = maxDanTag.val();
			let valid =  minDan<=maxDan;
			if(!valid){
				form.after("<h4 class='errors'>입력 데이터에 문제있음</h4>");
			}
			return valid;
		},
		init:function(){
			$("h4.errors").remove();
			result.empty();
		}
	});
	console.log(form);
});
</script>
</body>
</html>