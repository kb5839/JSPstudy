<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/sessionTimer.js"></script>
<h4 id="timeArea"> 2:00 </h4>




<!-- <div class="modal fade" id="msgArea" tabindex="-1"> -->
<!--   <div class="modal-dialog"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title">세션 연장</h5> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
<!--         <p>세션 연장할래?</p> -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-primary controlBtn" id="yesBtn">YES</button> -->
<!--         <button type="button" class="btn btn-primary controlBtn" id="noBtn">NO</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<!-- 1.스케쥴링 함수를 이용하여, 1초마다 차감되는 타이머 구현. -->
<!-- 2. 1분 남은 시점에 메시지를 출력, 세션 연장 여부를 확인한 다음, -->
<!-- 	연장을 선택하면, 타이머가 2분으로 리셋. -->
<!-- 	연장하지 않겠다면, 타이머는 0:0 순간 멈춤. -->
<script type="text/javascript">
$("#timeArea").sessionTimer(<%=session.getMaxInactiveInterval() %>);
	
</script>


















