<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	private static enum Check{
			
		CHROME("Chrome", "<h2>Chrome을 사용하고 있음</h2>"),
		FIREFOX("Firefox", "<h2>Firefox를 사용하고 있음</h2>"), 
		EXPLORER("Explorer", "<h2>Explorer를 사용하고 있음</h2>");
		
		private String name;
		private String res;
		
		private Check(String name, String res){
			this.name = name;
			this.res = res;
		}
}
%>
<%
	String userAgent = request.getHeader("User-Agent");
	Check web = null;
	if(userAgent.contains("Chrome")){
		web = Check.CHROME;
	}else if(userAgent.contains("firefox")){
		web = Check.FIREFOX;
	}else if(userAgent.contains("Trident")){ 
		web = Check.EXPLORER;
	}else{
		out.println("Unknown");
	}
	out.println(web.res);
%>




