<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<form method="POST" action="/user/ajax" enctype="application/x-www-form-urlencoded">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="uiName"></td>
			</tr>
			
			<tr>
				<th>아이디</th>
				<td><input type="text" name="uiId"></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="uiPwd"></td>
			</tr>

			<tr>
				<th colspan = "2"><button>회원가입</button></th>
			</tr>
		</table>
	</form>

</body>
</html>