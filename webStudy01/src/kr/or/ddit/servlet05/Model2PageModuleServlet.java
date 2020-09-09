package kr.or.ddit.servlet05;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.vo.MenuVO;
@WebServlet("/model2/layoutPage.do")
public class Model2PageModuleServlet extends HttpServlet{
	public static enum ServiceType{
		CALULATE(new MenuVO("CALULATE", "사칙연산기", "/model2/layoutPage.do", "/01/calForm.html")),
		SESSIONTIMER(new MenuVO("SESSIONTIMER", "세션타이머", "/model2/layoutPage.do", "/07/sessionTimer.jsp")),
		CALENDAR(new MenuVO("CALENDAR", "달력", "/model2/layoutPage.do", "/08/calendar.jsp")),
		EXPLORER(new MenuVO("EXPLORER", "서버탐색기", "/serverExplorer.do", "/WEB-INF/views/serverExplorer.jsp")),
		IMAGE(new MenuVO("IMAGE","이미지리스트","/image/imageList.do",null));
		
		private MenuVO menuVO;

		private ServiceType(MenuVO menuVO) {
			this.menuVO = menuVO;
		}
		
		public MenuVO getMenuVO() {
			return menuVO;
		}
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String serviceParam = req.getParameter("service");
		int sc = 200;
		if(StringUtils.isNotBlank(serviceParam)) {
			try {
				ServiceType serviceType = ServiceType.valueOf(serviceParam);
				
				MenuVO menu = serviceType.getMenuVO();
				
				req.setAttribute("includePage", menu.getJspPath());
			}catch (IllegalArgumentException e) {
				sc = 404;
			}
		}
		if(sc==200) {
			req.getRequestDispatcher("/WEB-INF/views/layout.jsp").forward(req, resp);
		}else {
			resp.sendError(404, "제공하지 않는 서비스");
		
		}
		
	}
}

















