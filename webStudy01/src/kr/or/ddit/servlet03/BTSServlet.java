package kr.or.ddit.servlet03;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/bts/list.do",loadOnStartup = 1)
public class BTSServlet extends HttpServlet {

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.printf("%s 초기화\n", getClass().getSimpleName());
		Map<String, String[]> btsMap = new LinkedHashMap<>();
		btsMap.put("B001", new String[] { "RM", "/bts/rm.jsp" });
		btsMap.put("B002", new String[] { "JIN", "/bts/jin.jsp" });
		btsMap.put("B003", new String[] { "SUGA", "/bts/suga.jsp" });
		btsMap.put("B004", new String[] { "jhope", "/bts/jhope.jsp" });
		btsMap.put("B005", new String[] { "JIMIN", "/bts/jimin.jsp" });
		btsMap.put("B006", new String[] { "V", "/bts/v.jsp" });
		getServletContext().setAttribute("btsMap", btsMap);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/bts/btsList.jsp").forward(req, resp);
	}

}
