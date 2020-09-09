<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="kr.or.ddit.vo.MenuVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#top{
		width: 100%;
		height: 70px;
		background-color: lightblue;
	}
	#top ul{
		list-style: none;
		padding-top: 30px;
	}
	#top li{
		float: left;
		margin-left: 30px;
	}
	#left{
		width: 20%;
		height: 600px;
		background-color: lime;
		float: left;
	}
	#content{
		width: 79%;
		height: 600px;
		background-color: white;
		float: right;
	}
	#footer{
		width: 100%;
		height: 70px;
		background-color: gold;
		float: left;
	}
</style>
<jsp:include page="/includee/preScript.jsp" />
</head>
<body>
<div id="top">
	<jsp:include page="/includee/topMenu.jsp" />
</div>
<div id="left">
<jsp:include page="/includee/leftMenu.jsp" />
</div>
<div id="content">
	<%
		String includePage = (String)request.getAttribute("includePage");
		if(StringUtils.isNotBlank(includePage)){
// 			request.getRequestDispatcher(includePage).include(request, response);
			pageContext.include(includePage);
		}else{
			%>
			그냥 기본 페이지
			<%	
		}
	%>
</div>
<div id="footer">
<jsp:include page="/includee/footer.jsp" />
</div>
</body>
</html>



