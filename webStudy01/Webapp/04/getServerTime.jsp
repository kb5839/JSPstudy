<%@page import="java.util.Locale"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%
String language = request.getParameter("language");
String accept = request.getHeader("Accept");
String acceptLanguage = request.getHeader("Accept-Language");
Locale locale = request.getLocale();
if(language!=null){
	locale = Locale.forLanguageTag(language);
	
}
Date today = new Date();
DateFormatSymbols dfs = new DateFormatSymbols(locale);
SimpleDateFormat format = new SimpleDateFormat("E", dfs);

String text = format.format(today);

if(accept.contains("json")){
	response.setContentType("application/json;charset=UTF-8");
	out.println("{\"today\":\"" + text+"\"}");
}else if(accept.contains("xml")){
	response.setContentType("application/xml;charset=UTF-8");
	out.println("<today>"+text+"</today>");
}else{
	response.setContentType("text/html;charset=UTF-8");
	out.println("<h4>" + text + "</h4>");
}
%>