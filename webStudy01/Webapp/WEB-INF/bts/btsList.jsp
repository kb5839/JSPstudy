<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<select name="member">
	<%
	Map<String,String[]>btsMap = (Map)getServletContext().getAttribute("btsMap");
	Set<String> keySet = btsMap.keySet();
	Iterator<String> it = keySet.iterator();
	String pattern = "<option value='%s'>%s</option>";
	while(it.hasNext()){
		String mapKey = it.next();
		String[] value = btsMap.get(mapKey);
		out.println(String.format(pattern, mapKey, value[0]));
	}
	%>
	</select>
	<div id="resultArea">
	
	</div>
	<script type="text/javascript"src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("select:first").on("change", (event)=>{
		let value =event.target.value;
		let select = event.target;
<%-- 		location.href="<%=request.getContextPath() %>/bts/getMemberPage.do?member="+value; --%>
		$.ajax({
			url : "<%=request.getContextPath() %>/bts/getMemberPage.do",
			data : {member:value},
			dataType : "html",
			success : function(resp) {
				$(select).after(resp);
			},
			error : function(errResp) {
			}
		});
	});
});

</script>
	<!-- 하나의 멤버를 선택하면, change이벤트 핸들러내에서
	"/bts/getMemberPage.do?member=B001" 요청발생
	해당 요청의 결과로 멤버의 개인 페이지 랜더링
	단, bts 폴더 아래에 있는 개인 페이지의 주소를 클라이언트가 모르도록 -->
<!-- 	이동하는 과정에서 요청에 대한 모든 정보를 리셋하고, 서버를 가볍게 이동 -->
</body>
</html>