<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02/dditForm.jsp</title>
</head>
<body>
<h4>대덕인재개발원 학생 등록</h4>
<!-- 학생 : 이름, 나이 성별, 주소, 휴대폰, 이메일, 학력, 자격증, 경력사항... -->
<form action="/webStudy01/ddit/studentRegist.do" method="post">
	<table>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="ddit_name" />
			</td>
		</tr>
		<tr>
			<th>나이</th>
			<td>
				<input type="number" name="ddit_age" />
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" name="ddit_gen" value="F"/>여자
				<input type="radio" name="ddit_gen" value="M"/>남자
			</td>
		</tr>
		<tr>
			<th>취미</th>
			<td>
				<input type="checkbox" name="ddit_hobby" value="game"/>게임
				<input type="checkbox" name="ddit_hobby" value="read"/>독서
				<input type="checkbox" name="ddit_hobby" value="movie"/>영화감상
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="ddit_address" />
			</td>
		</tr>
		<tr>
			<th>휴대폰</th>
			<td>
				<input type="text" name="ddit_hp" />
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="email" name="ddit_mail" />
			</td>
		</tr>
		<tr>
			<th>학력</th>
			<td>
				<select name="ddit_grade">
<!-- 					prompt text -->
					<option value>학년</option>
					<option value="G001">고졸</option>
					<option value="G002">초대졸</option>
					<option value="G003">대졸</option>
					<option value="G004">대학원졸</option>
					<option value="G005">석사</option>
					<option value="G006">박자</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>자격증</th>
			<td>
				<select name="ddit_lic" multiple>
					<option value="L001">정보처리기사</option>
					<option value="L002">정보처리산업기사</option>
					<option value="L003">정보보안기사</option>
					<option value="L004">정보보안산업기사</option>
					<option value="L005">SQLD</option>
					<option value="L006">SQLP</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>경력사항</th>
			<td>
				<textarea rows="3" cols="100" name="ddit_career"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록" />
				<input type="reset" value="취소" />
			</td>
		</tr>
	</table>
</form>
</body>
</html>