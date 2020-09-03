<%@ page language="java" 
    pageEncoding="UTF-8"
    import="java.util.Date"%>
    <%
    response.setContentType("text/html;charset=UTF-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06/responseDesc.jsp</title>
</head>
<body>
<h4> HttpServletResponse (Http 프로토콜의 응답 패키징 방식)</h4>
<pre>
   1. Response Line : Protocol/Version, Status Code
         Status code : 응답 상태 코드, 요청이 정상 처리가 되었는지 여부를 클라이언트에게 전송함.
         -100 : ing...(Websocket, HTTP 1.1 부터...)
         -200 : OK, 정상 처리 
         -300 : 클라이언트의 추가 액션이 필요함 
         	<%=HttpServletResponse.SC_NOT_MODIFIED %> : 정적자원이 사용된적이 없으니 캐시 데이터를 사용하도록 유도
         	<%=HttpServletResponse.SC_MOVED_TEMPORARILY %> : 자원의 위치가 변경되었음을 알리며, 변경된 위치를 같이 전송
         -400 : (Fail) : 클라이언트 사이드 문제로 실패
            <%= HttpServletResponse.SC_NOT_FOUND %> : not found (404)
            <%= HttpServletResponse.SC_BAD_REQUEST %> : bad request (400)
            <%= HttpServletResponse.SC_FORBIDDEN %> : 금지 자원에 대한 접근 (403)
            <%= HttpServletResponse.SC_UNAUTHORIZED %> : 권한이 없는 요청(401)
            <%= HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE %> : 요구 자원의 MIME을 처리할수없을때 
            <%= HttpServletResponse.SC_METHOD_NOT_ALLOWED %> : request method를 지원하지 않음 
         -500 : (Fail) : 서버 사이드 문제로 실패. 500 <%= HttpServletResponse.SC_INTERNAL_SERVER_ERROR %>(500)
   2. Response Header : meta data, ex) Content-Type, Content-Length, Cache-Control, Pragma, Expires, Refresh, Location...
   		1)응답 mime 결정 : Content-Type
   			-response.setContentType, page 지시자의contentType="", response.setHeader
   		2)캐시 제어 : Cache-Control(Http/1.1), Pragma(Http/1.0), Expires(공통)
   			-브라우저가 정적 자원을 캐시하는 구조를 제어할 수 있음.
   		3)자동 요청 : Refresh
   		4)page 이동 : Location
   		<%
   		response.setHeader("Cache-Control", "no-cache"); //firefox 용 "no-store"
   		response.setHeader("Cache-Control", "no-cache");
   		response.setHeader("Pragma", "no-cache");
   		Date date = new Date();
   		response.setDateHeader("Expires", date.getTime());
   		%>
   3. Response Body : Contents Body, Message Body
   
</pre>
</body>
</html>