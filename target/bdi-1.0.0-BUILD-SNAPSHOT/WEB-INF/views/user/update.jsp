<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
<jsp:include page="/WEB-INF/views/head/head.jsp"></jsp:include>
</head>
<body>
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="uiId" id="uiId"></td>
		</tr>

		<tr>
			<th>비밀번호</th>
			<td><input type="text" name="uiPwd" id="uiPwd"></td>
		</tr>

		<tr>
			<th>이름</th>
			<td><input type="text" name="uiName" id="uiName"></td>
		</tr>

		<tr>
			<th colspan="2"><button onclick="send()">수정하기</button></th>
		</tr>
	</table>
	
	<script>
		function send() {
			var xhr = new XMLHttpRequest();
			xhr.open('PUT', '/user/ajax');
			xhr.setRequestHeader('Content-Type','application/json');
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						alert("수정완료!");
					}
				}
			}
			var udt = {
				uiNum : ${param.uiNum},
				uiName : document.querySelector('#uiName').value,
				uiId : document.querySelector('#uiId').value,
				uiPwd : document.querySelector('#uiPwd').value		
			}
			xhr.send(JSON.stringify(udt));
		}
	</script>
</body>
</html>