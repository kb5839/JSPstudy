<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#timeArea{
border: 2px solid black;
text-align: center;
}
</style>

</head>
<body>
<input type ="button" value="한글" class="languageType" id="<%=Locale.KOREAN %>"/>
<input type ="button" value="영문" class="languageType" id="<%=Locale.ENGLISH %>"/>
<select name="languageType">
	<option value>언어 선택</option>
	<%
	String pattern = "<option value='%s'>%s(%s)</option>\n";
	Locale[] locales = Locale.getAvailableLocales();
	  for(Locale locale : locales){
		  String display = locale.getDisplayLanguage(locale);
		  if(StringUtils.isBlank(display)) continue;
		  out.println(String.format(pattern,locale.toLanguageTag(),locale.getDisplayLanguage(),locale.getDisplayCountry(locale))
		);  
	  }
	%>
</select>
<div id="timeArea">

</div>
<script type="text/javascript"src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	var timeArea = $("#timeArea");
	$("[name='languageType']").on("change", function() {
		let data = {};
		let tagId = $(this).val();
		data.language= tagId;
		$.ajax({
			url : "getServerTime.jsp",
			data : data,
			dataType : "json", // html, text, json, xml
			success : function(resp) {
//		 		timeArea.html(resp);
//		 		timeArea.html($(resp).find("today").text());
				timeArea.html(resp.today);
			},
			error : function(errResp) {
			}
		});
		
	});

</script>
</body>
</html>