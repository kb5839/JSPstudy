<%@page import="kr.or.ddit.vo.MenuVO"%>
<%@page import="kr.or.ddit.servlet05.Model2PageModuleServlet.ServiceType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <form id="menuForm" action="">
    <input type="hidden" name="service" value="">
    </form>
<ul>
	<%
		ServiceType[] types = ServiceType.values();
		for(ServiceType tmp : types){
			MenuVO menu = tmp.getMenuVO();
			%>
			<li><a class="menuA" data-action="<%=menu.getMenuURI() %>" data-service="<%=menu.getMenuId() %>"><%=menu.getMenuText() %></a></li>
			<%
		}
	%>
</ul>
<script type="text/javascript">
var menuForm = $("#menuForm");
$(".menuA").on("click", function() {
// 	console.log(this)
// 	event.preventDefault();
	menuForm.attr("action", "<%=request.getContextPath() %>" + $(this).data("action"));
	menuForm.find("[name='service']").val($(this).data("service"));
	menuForm.submit();
	return false;
})
</script>














