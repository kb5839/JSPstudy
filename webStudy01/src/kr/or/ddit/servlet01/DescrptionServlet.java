package kr.or.ddit.servlet01;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 서블릿
 * 	: 자바 기반의 서버 사이드 웹 어플리케이션 모듈을 구현하기 위한 스펙(명세)
 * 
 * 	1. 개발 단계
 * 	1) HttpServlet의 구현체 작성
 * 	2) compile -> 현재 컨텍스트의 classpath에 배포
 * 	3) WAS 에 서블릿 등록 :
 * 			- web.xml : servlet -> servlet-name, servlet-class, init-param, load-on-startup
 * 			- @WebServlet
 * 	4) 매핑 : 해당 서블릿이 동작할 수 있는 command URI 결정
 * 			- web.xml : servlet-mapping -> servlet-name, url-patterns
 * 			- @WebServlet
 * 		매핑 설정 방법
 * 			- 경로 매핑 : ex) /text/sample
 * 			- 확장자 매핑 ex) /sample.do
 * 				ex) /test/sample.do (XX) 두가지 매핑 방식을 섞어서 사용할 수 없음.
 * 					test/sample(XX) 반드시 절대 경로 표기방식을 사용함
 * 	5) WAS 재구동
 * 
 * 	2. W.A.S의 역할
 * 		: Server, WAS(Web Application(Context) Server), 
 * 		  Container(Web Container, Servlet Container : 내부의 컴포넌ㅌ의 라이프사이클을 관리하는 관리자)
 * 		  lifecycle 내에서 각 시점 별로 호출할 수 있는 callback 메소드가 서블릿 스펙에 정의되어 있음.
 * 		  
 * 		lifecycle callback
 * 		초기화 : 아무런 설정(load-on-startup)이 없는 한, 해당 서블릿에 대한 최초의 요청이 발생하면 초기화 진행.
 * 		소멸 : 아무런 설정이 없는 한, 해당 서블릿을 싱글톤의 형태로 관리함.
 * 		request callback
 * 		service : 모든 request method 에 공통적으로 적용할 코드를 정의함
 * 		doXXX : 특정 request method 에 대해서만 적용할 코드를 정의함
 */
public class DescrptionServlet extends HttpServlet {

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
//		ServletConfig : 서블릿 등록과 매핑에 대한 정보를 가진 객체로, 서블릿과 1:1관계로 관리됨.
		System.out.printf("%s 생성 및 초기화\n", getClass().getSimpleName());
		String initName = config.getInitParameter("initName");
		String filepath =  getClass().getResource(initName).getFile();
		System.out.printf("자원의 파일시스템 경로 : %s\n", filepath);
		
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.service(req, resp);;
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//super.doGet(req, resp);
		resp.getWriter().println("Get Process!");
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
		System.out.printf("%s 소멸\n", getClass().getSimpleName());
	}
	
	

}
