<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script type="text/javascript"src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/sessionTimer.js">
	
	
			</script>
</head>
<body>
	<h4 id="timeArea">2:00</h4>

	<!-- 	<div class="modal fade" id="msgArea" tabindex="-1"> -->
	<!-- 		<div class="modal-dialog"> -->
	<!-- 			<div class="modal-content"> -->
	<!-- 				<div class="modal-header"> -->
	<!-- 					<h5 class="modal-title">세션 연장</h5> -->
	<!-- 				</div> -->
	<!-- 				<div class="modal-body"> -->
	<!-- 					<p>세션 연장하시겠습니까?</p> -->
	<!-- 				</div> -->
	<!-- 				<div class="modal-footer"> -->
	<!-- 					<button type="button" class="btn btn-primary" id="yesbtn">YES</button> -->
	<!-- 						data-dismiss="modal">Close</button> -->
	<!-- 					<button type="button" class="btn btn-primary">NO</button> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- 1.스케쥴링 함수를 이용하여, 1초마다 차감되는 타이머 구현. -->
	<!-- 2.1분남은 시점에 메시지를 출력,세션 연장 여부를 확인한 다음, -->
	<!-- 	연장을 선택하면, 타이머가 2분으로 리셋. -->
	<!-- 	연장하지 않겠다면, 타이머는 0:0 순간 멈춤 -->
	<script type="text/javascript">

$("#timeArea").sessionTimer(<%=session.getMaxInactiveInterval()%>);
	
</script>
</body>
</html>