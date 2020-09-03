package kr.or.ddit.servlet01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.enumpkg.OperatorType;

@WebServlet("/01/calculate.do")
public class CalculateServlet extends HttpServlet {

	private HttpServletRequest req;
	private HttpServletResponse resp;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String accept = req.getHeader("Accept");
	      String mime = "text/html;charset=UTF-8";
	      MarshallingType marchallingType = null;
	      if(accept.contains("json")) {
	         marchallingType = MarshallingType.JSON;
	      }else if(accept.contains("xml")) {
	         marchallingType = MarshallingType.XML;
	      }
	      resp.setContentType(marchallingType==null? mime : marchallingType.getMime());
	      
		req.setCharacterEncoding("UTF-8");
		String name = req.getParameter("name");
		System.out.println(name);

		String param1 = req.getParameter("leftOp");
		String param2 = req.getParameter("rightOp");
		String param3 = req.getParameter("operator");

		boolean valid = true;
		if (param1 == null || !param1.matches("-?\\d+")) {
			valid = false;
		}
		if (param2 == null || !param2.matches("-?[0-9]{1,}")) {
			valid = false;
		}
		OperatorType type = null;
		if (param3 == null) {
			valid = false;
		} else {
			try {
				type = OperatorType.valueOf(param3);
			} catch (IllegalArgumentException e) {
				valid = false;
			}
		}

		Map<String, Object> targetMap = new LinkedHashMap<>();
		if (valid) {
			int leftOp = Integer.parseInt(param1);
			int rightOp = Integer.parseInt(param2);

			long result = type.operate(leftOp, rightOp);
			String expression = type.operateToExpression(leftOp, rightOp);
			targetMap.put("result", result);
			targetMap.put("expression", expression);

		} else {
			// 요청 처리를 실패했음을 전송
			targetMap.put("message", "처리 실패");
		}
		
		PrintWriter out = resp.getWriter();

		String respText = marchallingType.marshalling(targetMap);
		out.println(respText);
		out.close();
	}

	

	private interface Marshaller{
		public String marshalling(Map<String, Object> targetMap);
	}
	public static enum MarshallingType {
		JSON("application/json;charset=UTF-8",new Marshaller() {
			@Override
			public String marshalling(Map<String, Object> targetMap) {
				
				StringBuffer jsonText = new StringBuffer("{");
				String pattern = "\"%s\":\"%s\",";
				for (Entry<String, Object> entry : targetMap.entrySet()) {
					jsonText.append(String.format(pattern, entry.getKey(), entry.getValue().toString()));
				}
				int idx = jsonText.lastIndexOf(",");
				jsonText.deleteCharAt(idx);
				jsonText.append("}");
				// marshlling native -> json/xml 3*2=6
//				"[\"2*2=4\",4]"
//				"{\"result\":4, \"expression\":\"2*2=4\"}"
				return jsonText.toString();
			}
			
		}), XML("application/xml;charset=UTF-8",(targetMap)->{
			String pattern = "<%1$s>%2$s</%1$s>";
			StringBuffer xmlText = new StringBuffer("<root>");
			for(Entry<String, Object> entry :targetMap.entrySet()) {
			xmlText.append(String.format(pattern, entry.getKey(), entry.getValue().toString()));	
			}
			xmlText.append("</root>");
			return xmlText.toString();
		});
		private Marshaller marshaller;
		private String mime;
		
		private MarshallingType(String mime, Marshaller marshaller) {
			this.marshaller = marshaller;
			this.mime = mime;
		}
		
		public String getMime() {
			return mime;
		}
		public String marshalling(Map<String, Object> targetMap) {
			return marshaller.marshalling(targetMap);
		}
		
	};
}
