package kr.or.ddit.servlet01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.enumpkg.OperatorType;

@WebServlet("/01/calculate.do")
public class CalculateServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String name = req.getParameter("name");
		System.out.println(name);
		
		resp.setContentType("text/plain;charset=UTF-8");
		String param1 = req.getParameter("leftOp");
		String param2 = req.getParameter("rightOp");
		String param3 = req.getParameter("operator");
		
		boolean valid = true;
		if(param1 == null || !param1.matches("-?\\d+")) {
			valid = false;
		}
		if(param2 == null || !param2.matches("-?[0-9]{1,}")) {
			valid = false;
		}
		OperatorType type = null;
		if(param3 == null) {
			valid = false;
		}else {
			try {
				type = OperatorType.valueOf(param3);				
			}catch (IllegalArgumentException e) {
				valid = false;
			}
		}
		PrintWriter out = resp.getWriter();
		if(valid) {
			int leftOp = Integer.parseInt(param1);
			int rightOp = Integer.parseInt(param2);
			
			long result = type.operate(leftOp, rightOp);
			String expression = type.operateToExpression(leftOp, rightOp);
			
			out.println(expression);	
		}else {
			//요청 처리를 실패했음을 전송
			out.println("처리 실패");
		}
		out.close();
	}

}
