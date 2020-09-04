<%@page import="java.io.InputStream"%>
<%@page import="java.nio.file.StandardCopyOption"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07/applicationDesc.jsp</title>
</head>
<body>
<h4>application(ServletContext)</h4>
<pre>
<% 
System.out.println(getServletContext().hashCode());
System.out.println(application.hashCode());

%>
	: 서블릿의 운영 주체인 어플리케이션과 어플리케이션을 관리하는 서버에 대한 정보를 캡슐화한 객체.
	
	1. 어플리케이션에 대한 정보 확인. <%=application.getContextPath() %>
	2. 서버의 정보 확인. <%=application.getServerInfo() %>
				   <%=application.getMajorVersion() %>.<%=application.getMinorVersion() %>
	3. 로그 기록. <% application.log("커스텀 로그 메시지"); %>
	4. *** 웹리소스를 확보할때 사용됨.
		1) classpath resource : classpath 이후의 절대경로로 접근
		2) filesystem resource : 드라이브 루트부터 시작되는 절대 경로
		3) web resource : 프로토콜부터 시작되는 URL을 통해 접근
		
		realPath(file system path) getRealPath(virtual path - url)
		InputStream getResourceAsStream(virtual path - url)
	5. 파일의 MIME 확보
	6. 컨텍스트의 초기화 파라미터(web.xml -> context-param) 확보
		<%=application.getInitParameter("testParam") %>
		<%
// 		/images/cat1.jpg 파일을/07/cat1.jpg의 형태로 복사(stream copy)
// 		파일시스템의 경로는 서버의 위치에 따라 달라짐.
		String filePath = application.getRealPath("/images/cat1.jpg");
		InputStream fis = application.getResourceAsStream("/images/cat1.jpg");
		String folderPath = application.getRealPath("/07");
		out.println(filePath);
		Path imagePath = Paths.get(filePath);
// 		File imageFile = new File(filePath);
		Path target = Paths.get(folderPath, imagePath.getFileName().toString());
// 		File foler07 = new File(folderPath);
// 		File target = new File(foler07,imageFile.getName());
		
		Files.copy(fis, target, StandardCopyOption.REPLACE_EXISTING);
		
		%>
</pre>
<img alt="" src="<%=request.getContextPath() %>/07/cat1.jpg">
</body>
</html>