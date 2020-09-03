<%@page import="java.util.Calendar"%>
<%@ page language="java" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta http-equiv="Refresh" content="1"> -->
<script type="text/javascript"src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
	var jogId = null;
	$(".timeControl").on("click", function() {
		console.log(this);
		let value = this.value;
		console.log(value);
		if(value=="stop"){
			$("[value='start']").prop("disabled", false);
			clearInterval(jogId);			
		}else if(value="start"){
			$("[value='stop']").prop("disabled", false);
			$(this).prop("disabled",true);
			jogId = setInterval(() => {
				
				$.ajax({
					url : "<%=request.getContextPath()%>/getServerTime.do",
					dataType : "json", // Accept, Content-Type
					success : function(resp) {
						timeArea.html(resp.now);
					},
					error : function(errResp) {
					}
				});
				}, 1000);
		}
	});
var timeArea = $("#timeArea");

});
// setTimeout(function () => {
//  location.reload();
// }, 1000);
</script>
<title>06/autoRequest.</title>
</head>
<body>

<h4>자동 요청을 발생시키는 방법</h4>
<input type="button" value="strat" class="timeControl">
<input type="button" value="stop" class="timeControl" disabled="disabled">
<pre>
	1) server side : Refresh 헤더 이용
	<%--
	response.setIntHeader("Refresh", 1);
	--%>
	<%=String.format("%tc", Calendar.getInstance()) %>
	<span id="timeArea"></span>
	2) client side : 
	HTML - meta 
	Javascript
</pre>
<textarea rows="5" cols="100"></textarea>
</body>
</html>