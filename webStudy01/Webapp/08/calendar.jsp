<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.time.Month"%>
<%@page import="java.time.MonthDay"%>
<%@page import="java.time.format.TextStyle"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.temporal.WeekFields"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.text.DateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.Locale"%>
<%@page import="org.apache.tomcat.jni.Local"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String languageType = request.getParameter("languageType");
	String timeOutType = request.getParameter("timeOutType");
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("monthType");
	
	
	Locale loc = Locale.KOREA;
	if(StringUtils.isNotBlank(languageType)){
		loc = Locale.forLanguageTag(languageType);
	}
	if(StringUtils.isBlank(timeOutType)){
		timeOutType = "Asia/Seoul";
	}
	
	Calendar cal = Calendar.getInstance(TimeZone.getTimeZone(timeOutType));
	
	int year = 0;
	
	if(StringUtils.isNotBlank(yearStr) && StringUtils.isNumeric(yearStr)){	//공백이 아니고 숫자이면
		year = Integer.parseInt(yearStr);
	}else{
		year = cal.getWeekYear();
	}
	
	DateFormatSymbols dfs = new DateFormatSymbols(loc);
	String[] months = dfs.getMonths();
	int month = 0;
	if(StringUtils.isNotBlank(monthStr) && StringUtils.isNumeric(monthStr)){
		month = Integer.parseInt(monthStr);
	}else{
		month = cal.get(Calendar.MONTH);
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	int intToday = Integer.parseInt(sdf.format(cal.getTime()));
	
	cal.set(year, month, 1);
	cal.add(Calendar.MONTH, -1);
	
	int beforeMonth = cal.get(Calendar.MONTH);
	int beforeYear = cal.get(Calendar.YEAR);
	cal.add(Calendar.MONTH, 2);
	int nextMonth = cal.get(Calendar.MONTH);
	int nextYear = cal.get(Calendar.YEAR);
	
	cal.add(Calendar.MONTH, -1);
	
	int startDay = cal.getMinimum(Calendar.DATE);
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	int start = cal.get(Calendar.DAY_OF_WEEK);
	int newLine = 0;
// 	Calendar todayCal = Calendar.getInstance(TimeZone.getTimeZone(timeOutType));
	String pattern = null;
	
%>
<script type="text/javascript">
	$(function(){
		var form = $('#calendarForm');
		$("#preBtn,#nextBtn").on("click", function(){
			let year = $(this).data("year");
			let month = $(this).data("month");
			
			form.find("[name='year']").val(year);
			form.find("[name='monthType']").val(month);
			form.submit();
		});
	});
</script>
<style type="text/css">
	table{
		width:100%; 
		cellspacing:"1"; 
		cellpadding:"1";
		border:1px solid black;
	}
	
	#calendarForm, #calendarDiv{
		width: 100%;
		text-align:center;
	}
</style>
<%=String.format(loc, "%tc", cal) %>
<div id="calendarDiv">
	<a id="preBtn" data-year="<%=beforeYear%>" data-month="<%=beforeMonth %>"><b>&lt;</b></a>
	<%=year %>, <%=months[month] %>
	<a id="nextBtn"  data-year="<%=nextYear%>" data-month="<%=nextMonth %>"><b>&gt;</b></a>
	<br>
</div>
<form id="calendarForm" method="post">
	<input type="hidden" name="service" value="CALENDAR" />
	year : <input id="year" name="year" type="number" value="<%=year %>" />
	month : 
	<select name="monthType" onchange="this.form.submit()">
	<%
		pattern = "<option value=\"%d\">%s</option>\n";
		for(int i=0; i<months.length-1; i++){
			if(month == i){
				out.println(String.format("<option value=\"%d\" selected>%s</option>\n", i, months[i]));
			}else{
				out.println(String.format(pattern, i, months[i]));
			}
		}
	%>
	</select>
	<select name="languageType" onchange="this.form.submit()">
	<%
		pattern = "<option value=\"%s\">%s(%s)</option>\n";
		for(Locale locale : Locale.getAvailableLocales()){
			String display = locale.getDisplayLanguage(locale);
			if(StringUtils.isNotBlank(locale.getCountry())){
				if(loc == locale){
					out.println(String.format("<option value=\"%s\" selected>%s(%s)</option>\n", locale.toLanguageTag(), display, locale.getDisplayCountry()));
				}else{
					out.println(String.format(pattern, locale.toLanguageTag(), display, locale.getDisplayCountry()));	
				}
			}
		}
	%>
	</select>
	<select name="timeOutType" onchange="this.form.submit()">
	<%
		pattern = "<option value=\"%s\">%s</option>\n";
		String[] ids = TimeZone.getAvailableIDs();
		for (String id : ids) {
			if(timeOutType.equals(id)){
				out.println(String.format("<option value=\"%s\" selected>%s</option>\n", TimeZone.getTimeZone(id).getID(), TimeZone.getTimeZone(id).getID()));
			}else{
				out.println(String.format(pattern, TimeZone.getTimeZone(id).getID(), TimeZone.getTimeZone(id).getID()));				
			}
		}
	%>
	</select>
</form>
<br><br>
<table border="1">
	<tr>
		<%
			pattern = "<th>%s</th>\n";
			WeekFields wf = WeekFields.of(loc);
			DayOfWeek day = wf.getFirstDayOfWeek();
			for (int i = 0; i < DayOfWeek.values().length; i++) {
				out.println(String.format(pattern, day.getDisplayName(TextStyle.SHORT, loc)));
	        	day = day.plus(1);
			}
		%>
	</tr>
	<tr>
		<%
			for (int i = 1; i < start; i++) {
				out.println("<td></td>");
				newLine++;
			}
			
			pattern = "<th bgcolor='%s'><font color='%s'>%d</font></th>\n";
			for(int i = 1; i <= endDay; i++){
				String color = "";
				
				if(newLine==0)color="RED";
				else if(newLine == 6)color="#529dbc";
				else{color="BLACK";}
				
				String backColor = "white";
				StringBuffer UseDate = new StringBuffer();
				UseDate.append(year);
				UseDate.append((month+1) < 10?"0"+(month+1):(month+1));
				UseDate.append(i < 10?"0"+i:i);
				
				int iUseDate = Integer.parseInt(UseDate.toString());
				
				if(iUseDate == intToday){
					backColor = "orange";
				}
				
				out.println(String.format(pattern, backColor, color, i));
				newLine++;
				
				if(newLine == 7){
					out.println("</tr>");
					if(i <= endDay){
						out.println("<tr>");
					}
					newLine = 0;
				}
			}
			while(newLine > 0 && newLine < 7){
				out.println("<td></td>");
				newLine++;
			}
		%>
	</tr>
</table>
