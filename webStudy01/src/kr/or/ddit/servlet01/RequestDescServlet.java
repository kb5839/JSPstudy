package kr.or.ddit.servlet01;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Http 의 request 명세
 * 1) request Line : Protocal/version, URL(수신자), Method(요청의 목적, 방법)
 * 		- POST(C) : 생성, 서버측으로 전달한 컨텐츠를 갖고있는 요청으로 Body 영역이 형성됨.
 * 		- Get (R) :조회, 일반적으로 클라이언트의 기본 요청 메소드, Body 영역이 형성되지 않음
 * 		- PUT (U) : 수정, method-"post", _method-"put" 파라미터 추가함
 * 		- DELETE(D) : 삭제, method-"post", _method-"delete" 파라미터 추가함
 * 		- HEADER : 응답데이터를 헤더만 받겠다.
 * 		- OPTION : preflight 요청에 사용, 서버에 메소드 지원여부를 확인할 용도.
 * 		- TREACE : 서버를 디버깅할 용도 
 * 2) request Header : 클라이언트와 해당 클라이언트의 사용 시스템에 대한 부가정보(meta data)
 * 3) request Body : Contents Body, Message Body (only POST)
 * => 요청에 대한 모든 정보를 캡슐화한 객체 : HttpServletRequest
 *
 * ***요청 파라미터를 확보한느 방법
 * 		*** 요청 파라미터는 문자열의 형태로 서버에 전송됨.
 * 		*** 요청 파라미터에 특수문자가 포함된 경우.
 * 			GET(서버의 설정)/POST(setCharacterEncoding)
 * 1) String getParameter(String name)
 * 2) getParameterValues
 * 3) getParameterMap
 * 4) getParameterNames
 * 
 * *** 요청 헤더를 확보하는 방법
 * 1) getHeader(String name)
 * 2) Enumeration getHeaderNames()
 */
@WebServlet("/requestDesc")
public class RequestDescServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//요청 파라미터가 어떻게 전달되길래??
		//파라미터는 특수문자를 '%E3'과 같은 형태로 인코딩이 되어 전달됨. - RFC-2396규약에 따라 정의됨.
		//percent encoding, URL encoding 방식으로 인코딩되도록 정의되어있음.
		
		//LINE의 정보
		String requestURI = request.getRequestURI();
		String method = request.getMethod();
		System.out.printf("request URI : %s\n", requestURI);
		System.out.printf("method : %s\n", method);
		
		//해더의 정보
		Enumeration<String> names = request.getHeaderNames();
		while (names.hasMoreElements()) {
			String headerName = (String) names.nextElement();
			String headerValue = request.getHeader(headerName);
			
			System.out.printf("%s : %s\n", headerName, headerValue);
		}
		//CollectionView : iterator, enumeration
		
		String test1 = request.getParameter("test1");
		String test2 = request.getParameter("test2");
		System.out.printf("test1 : %s, test2 : %s \n", test1, test2);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String test1 = req.getParameter("test1");
		String test2 = req.getParameter("test2");
		System.out.printf("test1 : %s, test2 : %s \n", test1, test2);
	}
}
