package kr.or.ddit.servlet03;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/model2/outter.do")
public class Model2SampleServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * 1.요청 분석(request parameter header)
		 * 2.contents 생성
		 * 3.UI 생성을 위한 이동
		 * 
		 */
		req.getRequestDispatcher("/WEB-INF/inner.jsp").forward(req, resp);
//		resp.sendRedirect(req.getContextPath()+"/WEB-INF/inner.jsp");
		/**
		 * 1)body없는 응답, 302/location
		 * 2)브라우저가 location의 방향으로 새로운 요청
		 */
	}
}
