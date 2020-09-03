<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
   private static enum BrowserType{
      
      TRIDENT("익스플로러"), EDG("엣지"), CHROME("크롬"), OTHER("기타등등");
      
      private String browserName;
      
      BrowserType(String browserName){
         this.browserName = browserName;
      }
      
      public static String browserIdentify(String userAgent){
         BrowserType type = OTHER;
         userAgent = userAgent.toUpperCase();
         for(BrowserType tmp : values()){
            if(userAgent.contains(tmp.name())){
               type = tmp;
               break;
            }
         }
         return type.browserName;
      }
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>브라우저 식별!</h4>
<%
   String agent = request.getHeader("user-agent");
   String name = BrowserType.browserIdentify(agent);
   out.println(name);
%>
<pre>
<%
   String pattern = "%s:%s\n";
   String characterEncoding = request.getCharacterEncoding();
   int length = request.getContentLength();
   String mime = request.getContentType();
   String remoteAddr = request.getRemoteAddr();
   String localAddr = request.getLocalAddr();
   int localPort = request.getLocalPort();
   String queryString = request.getQueryString();
   String uri = request.getRequestURI();
   StringBuffer url = request.getRequestURL();
   
   out.println(String.format(pattern, "characterEncoding", characterEncoding));
   out.println(String.format(pattern, "contentLength", length));
   out.println(String.format(pattern, "contentType", mime));
   out.println(String.format(pattern, "remoteAddr", remoteAddr));
   out.println(String.format(pattern, "localAddr", localAddr));
   out.println(String.format(pattern, "localPort", localPort));
   out.println(String.format(pattern, "queryString", queryString));
   out.println(String.format(pattern, "requestURI", uri));
   out.println(String.format(pattern, "requestURL", url));
   
%>
</pre>
<table>
   <thead>
      <tr>
         <th>헤더명</th>
         <th>헤더값</th>
      </tr>
   </thead>
   <tbody>
      <%
         Enumeration<String> headerNames = request.getHeaderNames();
         while(headerNames.hasMoreElements()){
            String headerName = headerNames.nextElement();
            String headerValue = request .getHeader(headerName);
            %>
            <tr>
               <th><%=headerName %></th>
               <th><%=headerValue %></th>
            </tr>
            <%
         }
      %>
   </tbody>
</table>
</body>
</html>