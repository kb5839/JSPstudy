package kr.or.ddit.servlet03;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

@WebServlet("/bloodType.do")
public class GetBloodType extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Map<String, String[]> bloodMap = (Map<String, String[]>) getServletContext().getAttribute("bloodMap");
		String blood = req.getParameter("blood");
		int statusCode = HttpServletResponse.SC_OK;
		
		String msg = null;
		if(StringUtils.isBlank(blood)) {
			statusCode = HttpServletResponse.SC_BAD_REQUEST;
			msg = "필수 파라미터 누락";
		}else {
			if(!bloodMap.containsKey(blood)) {
				statusCode = HttpServletResponse.SC_NOT_FOUND;
				msg = blood + "은 존재하지 않습니다.";
			}
		}
		if(statusCode!=200) {
			resp.sendError(statusCode, msg);
		}else {
			String[] bloodInfo = bloodMap.get(blood);
			String url = bloodInfo[1];
			req.getRequestDispatcher(url).forward(req, resp);
		}
	}
}
