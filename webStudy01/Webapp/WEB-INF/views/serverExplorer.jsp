<%@page import="kr.or.ddit.servlet04.FileWrapper"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.36.1/skin-win8/ui.fancytree.min.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.36.1/jquery.fancytree-all-deps.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.36.1/jquery.fancytree-all.min.js"></script>
<script type="text/javascript">
	$(function() {
		var tree1 = null;
		var commandProcess = function(param){
			console.log(param);
			let command = param.command;
			let srcFile = param.data.otherNode.key;
			let destFolder = null;
			if(param.node){
				 destFolder = param.node.key;
			}
			$.ajax({
				data : {
					command:command
					, srcFile:srcFile
					, destFolder:destFolder
				},
				method : "post",
				dataType : "json", // Accept, Content-Type
				success : function(resp) {
					if(!resp.success){
						
						return;
					}
					// 한번 MOVE 나 COPY로 이동한 이후 해당 파일을 다시 처리할때 에러 나지 않나요?????
				    // 그건 어떻게 해결할까?  자알~~~~			
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
		$("#tree1").fancytree({
			extensions: ["dnd", "edit"],
			selectMode : 1,
			lazyLoad : function(event, data) {
				data.result = {
					url : "<%=request.getContextPath() %>/serverExplorer.do?url="+data.node.key
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
		        dragEnter: function(node, data) {
					console.log("==============dragEnter=============");
					console.log(node.key);
					console.log(data.otherNode.key);
					console.log("===================================");
					let pass = false;
					pass = node.folder && node != data.otherNode.parent && node.parent != data.otherNode.parent;
		           return pass;
		        },
		        dragDrop: function(node, data) {
		           	// 서버사이드의 진짜 자원에 대한 커맨드 처리
		          console.log("==============dragDrop=============");
		          	console.log(node);
		          	console.log(data);
		          console.log("=====================================");
		          let param = {
		        		 node:node
		        		 , data:data
		        		 , command:data.originalEvent.ctrlKey?"COPY":"MOVE"
		          }
		          commandProcess(param);
		        }
		      }
		});
		$(window).on("keyup", function(event){
			if(event.keyCode!=46) return;
			let pass = confirm("정말 지울테요?");
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
	<h4>Model2 구조로 webStudy01 컨텍스트의 익스플로러 구현</h4>
	<div id="tree1">
	<ul>
		<li id="/" class="folder lazy"><%=request.getContextPath() %></li>
	</ul>
	</div>










