<%@page import="kr.or.ddit.servlet04.FileWrapper"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
   String uri = request.getParameter("uri");
   
   FileWrapper[] listFiles =(FileWrapper[]) request.getAttribute("listFiles");
   
   
   if(uri != null){
      out.println("<ul>");
      for(FileWrapper file : listFiles){
         //int Integer
         //Map<String, new Integer(4)>
         // JSP 쪽의 자바 코드 부담을 줄이려면? Adapter(Wrapper) 패턴을 사용해 보시오!! 
         
         out.println(String.format("<li class='%s' id='%s'>%s</li>", file.getClz(), file.getFileURI(), file.getName()));
      }   
      out.println("</ul>");
   }else{
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
   href="https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.36.1/skin-win8/ui.fancytree.min.css">
<script type="text/javascript"src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" 
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.36.1/jquery.fancytree-all-deps.min.js"></script>
<script type="text/javascript" 
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.36.1/jquery.fancytree-all.min.js"></script>
<script type="text/javascript">
   $(function(){
      var tree1 = null;
      var commandProcess = function(param){
         let command = param.command;
         let srcFile = param.data.otherNode.key;
         let destFolder = null;
         if(param.node){
            destFolder = param.node.key;
         }
         $.ajax({
            data : {
               command : command,  
               srcFile : srcFile, 
               destFolder : destFolder
            },
            method : "post",
            dataType : "json", //Accept, Content-Type
            success : function(resp) {
               if(!resp.success){
                  
                  return;
               }
               if(command=="COPY"){
                  param.data.otherNode.copyTo(param.node);
               }else if(command=="MOVE"){
                  param.data.otherNode.moveTo(param.node, param.data.hitMode);
               }else{
                  param.data.otherNode.remove();
               }
            },
            error : function(errResp) {

            }
         });
      }
      
      $("#tree1,#tree2").fancytree({
         extensions: ["dnd", "edit"],
         selectMode: 1,
         <%-- source : {
            url : "<%=request.getContextPath() %>/serverExplorer.do"
         }, --%>
         lazyLoad: function(event, data){
            data.result = {
               url : "<%=request.getContextPath() %>/serverExplorer.do?url=" + data.node.key
            };
         }, 
         init:function(event, data){
         tree1 = data.tree;            
         },
         dnd: {
            autoExpandMS: 400,
            focusOnClick: true,
            preventVoidMoves: true, // Prevent dropping nodes 'before self', etc.
            preventRecursiveMoves: true, // Prevent dropping nodes on own descendants
            
            dragStart: function(node, data) {
               
               return true;
            },
            
            dragEnter: function(node, data) { // 파일 안으로 들어가는 것을 막음
                   console.log("=================dragEnter=================");
               console.log(node.key);
               console.log(data.otherNode.key);
               console.log("===========================================");
               let pass = false;
               pass = node.folder && node != data.otherNode.parent && node.parent != data.otherNode.parent;
               return pass;
//                if(node, data.otherNode.parent)
               return node.folder;
            },
            
            dragDrop: function(node, data) {
               
//                서버사이드의 진짜 자원에 대한 커맨드 처리
               
               console.log("=================dragDrop=================");
               console.log(node);
               console.log(data);
               console.log("==========================================");
               
               let param = {
                     node : node, 
                     data : data, 
                     command : data.originalEvent.ctrlKey ? "COPY" : "MOVE"
               }
               commandProcess(param);
            }
         }
      });
      $(window).on("keyup", function(event){
      if(event.keyCode!=46)return;
      let pass = confirm("정말 지울테냐?");
      if(pass){
         let srcFile = tree1.getActiveNode();
         commandProcess({
            command:"DELETE"
            , data:{
               otherNode:srcFile
            }
         });
      }
      });
   });
</script>
</head>
<body>
<h4>Model2 구조로 webStudy01 컨텍스트의 익스플로러 구현</h4>
<div id="tree1">
   <ul>
      <li id="/" class="folder lazy"><%=request.getContextPath() %></li>
   </ul>
</div>
<div id="tree2">
   <ul>
      <li id="/" class="folder lazy"><%=request.getContextPath() %></li>
   </ul>
</div>
</body>
</html>
<%
}
%>