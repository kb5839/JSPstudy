package kr.or.ddit.servlet02;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.utils.TemplateUtils;

public class ImageListServlet extends HttpServlet {

	private File folder;
	private String pattern = "<option class='%s'>%s</option>\n";
	private ServletContext application;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
//		String contentsPath = config.getInitParameter("contentsPath");
		String contentsPath = getServletContext().getInitParameter("contentsPath");
		System.out.println(getServletContext().hashCode());
		folder = new File(contentsPath);
		
		application = getServletContext();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] listFiles = folder.list((dir, name)->{
			boolean accept = false;
			String mime = application.getMimeType(name);
			accept = mime != null && (mime.startsWith("image/") || mime.startsWith("video/"));
			return accept;
		});
		StringBuffer options = new StringBuffer();
		for(String file : listFiles) {
			String fileMime = application.getMimeType(file);
			options.append(String.format(pattern, fileMime, file));
		}
		Map<String, Object> attributeMap = new LinkedHashMap<>();
		attributeMap.put("options", options);
		attributeMap.put("context", req.getContextPath());
		attributeMap.put("path", req.getContextPath());
		attributeMap.put("path2", req.getContextPath());
		String tmplPath = "/kr/or/ddit/servlet02/fileList.tmpl";
		String html = TemplateUtils.readAndReplace(tmplPath, attributeMap);
		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(html);
		out.close();
		
		
	}
}
