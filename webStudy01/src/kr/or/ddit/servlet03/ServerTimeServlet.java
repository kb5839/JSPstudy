package kr.or.ddit.servlet03;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.servlet01.CalculateServlet.MarshallingType;

@WebServlet("/getServerTime.do")
public class ServerTimeServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      Calendar cal  = Calendar.getInstance();
      
      Map<String, Object> targetMap = new LinkedHashMap<String, Object>();
      targetMap.put("now", String.format("%tc", cal));
      
      String jsonText = MarshallingType.JSON.marshalling(targetMap);
      
      response.setContentType(MarshallingType.JSON.getMime());
      try(
            PrintWriter out = response.getWriter();
      ){
            out.println(jsonText);
      }
   }
}