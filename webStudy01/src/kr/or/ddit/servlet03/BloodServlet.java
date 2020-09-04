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

@WebServlet(urlPatterns = "/getCharacter.do", loadOnStartup = 1)
public class BloodServlet extends HttpServlet{
	

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		Map<String, String[]> bloodMap = new LinkedHashMap<>();
		bloodMap.put("B01", new String[] {"A", "/WEB-INF/blood/a.jsp"});
		bloodMap.put("B02", new String[] {"B", "/WEB-INF/blood/b.jsp"});
		bloodMap.put("B03", new String[] {"AB", "/WEB-INF/blood/ab.jsp"});
		bloodMap.put("B04", new String[] {"O", "/WEB-INF/blood/o.jsp"});
		getServletContext().setAttribute("bloodMap", bloodMap);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/06/bloodType.jsp").forward(req, resp);
	}
}
