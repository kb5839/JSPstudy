package kr.or.ddit.servlet04;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.RespectBinding;
import javax.xml.ws.Response;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/serverExplorer2.do")
public class ServerExplorerServlet2 extends HttpServlet {
   
   private ServletContext application;
   
   @Override
   public void init(ServletConfig config) throws ServletException {
      super.init(config);
      application = getServletContext();
   }
   
   public static interface FileCommandProcessor {
      public boolean process(File srcFile, File destFolder); //이 하나의 인터페이스를 써 copy, delete, move 다 할거임 
   }
   public static enum CommandType {
      COPY((srcFile, destFolder)->{
         try {
         FileUtils.copyFileToDirectory(srcFile, destFolder);
         return true;
      } catch (IOException e) {
         return false;
      }
      }), 
      DELETE((srcFile, destFolder)->{
         return FileUtils.deleteQuietly(srcFile);
      }),
      MOVE((srcFile, destFolder)->{
         boolean result = false;
         if(COPY.process(srcFile, destFolder)) {
            result = DELETE.process(srcFile, null);
         }
         return result;
      });
	   
	   
     
      
      private FileCommandProcessor processor ;

   private CommandType(FileCommandProcessor processor) {
      this.processor = processor;
   }
   public boolean process(File srcFile , File destFolder) {
      return processor.process(srcFile, destFolder);
   }
    //필수 객체인지 optinoal 인지에 따라 setter를 쓰던가 아니면 생성자를 만들던지 슈밤.    
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      //cmdParam 커맨드 3개중 하나인지(enum 쓰기)
      //src 실제파일 존재하는지, 넘어왔는지
      //dest (delete의 경우 필수가 아님) 실제폴더 존재하는지
      
      Map<String, Object> errors = new LinkedHashMap<>();
      boolean valid = validate(req, errors);  //call by ref 사용이유: 리턴값이아니라 다른 구조로 결과데이터 받아오기 위해서 
      if(valid) { //command 처리
         //얘네 전역변수로 빼면 모든 클라이언트가 동일하게 접근하게 됨 
         CommandType commandType = (CommandType) req.getAttribute("commandType");
         File srcFile = (File) req.getAttribute("srcFile");
         File destFolder = (File) req.getAttribute("destFolder");
         boolean result = commandType.process(srcFile, destFolder);
         Map<String, Object>resultMap = Collections.singletonMap("success",result);
         resp.setContentType("application/json;charset=UTF-8");
         try(
              PrintWriter out = resp.getWriter();
           ){
                //marshalling + serialize
            ObjectMapper mapper = new ObjectMapper();
            mapper.writeValue(out, resultMap);
         }
         
      }else { //문제 시 상태코드, sendError
         int sc = (Integer) errors.get("statusCode"); 
         String message = (String) errors.get("message");
         
         resp.sendError(sc, message);
         return;
      }
   }
   private boolean validate(HttpServletRequest req, Map<String, Object> errors) {
      String cmdParam = req.getParameter("command");
      String srcParam = req.getParameter("srcFile");
      String destParam = req.getParameter("destFolder");
      
      boolean valid = true;
      
      int sc = 200;
      StringBuffer message = new StringBuffer();
      CommandType commandType = null;
      //cmdParam 커맨드 3개중 하나인지(enum 쓰기)
      if(StringUtils.isBlank(cmdParam)) {
         sc = 400;
         valid = false;
         message.append("명령이 전달되지 않았음");
      } else {
         try {
            commandType = CommandType.valueOf(cmdParam);
         } catch (IllegalArgumentException e) {
            sc = 400;
            valid = false;
            message.append("처리할 수 없음");
         }
      }
      req.setAttribute("commandType", commandType);
      
      //src 실제파일 존재하는지, 넘어왔는지
      File srcFile = null;
      if(StringUtils.isBlank(srcParam)) {
         valid = false;
         sc = 400;
         message.append("source 파일 파라미터 없음");
      }else {
         srcFile = new File(application.getRealPath(srcParam));
         if(!srcFile.exists()) {
            valid = false;
            sc = 400;
            message.append("source 파일이 존재하지 않음");
         }
      }
      req.setAttribute("srcFile", srcFile);
      
      File destFolder = null;
      if(!CommandType.DELETE.equals(commandType) && StringUtils.isBlank(destParam)) {
         valid = false;
         sc = 400;
         message.append("복사나 이동을 할 대상 폴더 파라미터가 없음");
      }else if(!CommandType.DELETE.equals(commandType)) {
         destFolder = new File(application.getRealPath(destParam));
         if(!destFolder.exists() || destFolder.isFile()) {
            valid = false;
            sc = 400;   
            message.append("대상 폴더가 존재하지 않거나 폴더가 아닌 파일이 대상으로 지정됨 ");
         }
      }
      req.setAttribute("destFolder", destFolder);
      
      errors.put("statusCode", sc);
      errors.put("message", message.toString());
      
      
      return valid;
   }
   

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String currentUrl = req.getParameter("url");
      String accept = req.getHeader("Accept");
      String currentPath = "/";       
      if(StringUtils.isNotBlank(currentUrl)) {
         currentPath = currentUrl;
      } //상황에 따라 다른 폴더의 자식들을 가져갈 수 있게 함
      
      
      String realPath = application.getRealPath(currentPath); //루트 아래의 모든 정보 받아오기
      File folder = new File(realPath);
      int sc = 200; //status code 만들기 
      if(!folder.exists()) {
         sc = 404;
      } else if(folder.isFile()) {
         sc = 400;
      }
      
      if(sc!= 200) {
         resp.sendError(sc);
         return; 
      }//error 띄우고 return
      
      File[] listFiles = folder.listFiles();
      FileWrapper[] wrappers = new FileWrapper[listFiles.length];
      for(int i = 0; i <wrappers.length; i++) {
         wrappers[i] = new FileWrapper(listFiles[i], application);
      }
      
      
      if(accept.contains("json")) { 
         //marshalling, mime
         //marshalling 대상: MVC에서 model인 
         resp.setContentType("application/json;charse=UTF-8");
         ObjectMapper mapper = new ObjectMapper();
         // writer계열: marshalling
         String json = mapper.writeValueAsString(wrappers); 
         
         try(
            PrintWriter out = resp.getWriter();
         ){   //serializing. 클라->서버 : 마샬링 + serializing 
            out.print(json);
         }
         //js -> java 사이에서 json같은 공용언어가 필요햇다 
         // js 편지내용을 json으로 마샬링/ 0.1의 집합으로 바꾸는게[ serializing
         // 받으면 deserializng 하면 json나오니까 unmarshalling해서 java 코드로 바꿈
         //자바가 자바 객체 형태로 편지쓰고 마샬링 . 시리얼라이징 
         //js로 다시 오면 deserial.... 언마샬링 해서 자바스크립트 객체로ㅜ ,,, 
      } else {
         req.setAttribute("listFiles", wrappers); //자식들을 request scope에 담는다. 
         req.getRequestDispatcher("/WEB-INF/views/serverExplorer2.jsp").forward(req, resp);
         
      }
      
      
   } //요청을 담당중
   
}