package kr.or.ddit.servlet02;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;

//CoC페러다임 - 톰캣, 스프링
@WebServlet(urlPatterns = "/image/image.do", 
			initParams = {@WebInitParam(name = "contentsPath", value = "e:/contents")})
public class ImageStreamingServlet extends HttpServlet{
	
	private File folder;
	private ServletContext application;
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.println(getServletContext().hashCode());
//		String contentsPath = config.getInitParameter("contentsPath");
		application = getServletContext();
		String contentsPath = application.getInitParameter("contentsPath");
		folder = new File(contentsPath);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		String imageName = req.getParameter("image");
		if(imageName == null || imageName.trim().length() == 0) {
			resp.sendError(400);
			return;
		}
		File imageFile = new File(folder, imageName);
		if(!imageFile.exists()) {
			resp.sendError(404);
			return;
		}
		String mime = getServletContext().getMimeType(imageName);
		if(mime == null) {
			mime = "application/octet-stream";
		}
		resp.setContentType(mime);
////		try with resource 구문 1.7이상부터
//		try(//Closable 가능 객체의 생성 및 할당 코드
//		FileInputStream fis = new FileInputStream(imageFile)
//				){
//			
//		}
//		
		
		FileInputStream fis = null;
		ServletOutputStream os = null;
		try {
		fis = new FileInputStream(imageFile);
		byte[] buffer = new byte[1024];
		int pointer = -1;
		 os = resp.getOutputStream();
		while((pointer = fis.read(buffer)) != -1) {
			os.write(buffer, 0, pointer);
		}
		os.flush();
		}finally {
		if(fis!=null)fis.close();
			os.close();
		}
	}
	
}