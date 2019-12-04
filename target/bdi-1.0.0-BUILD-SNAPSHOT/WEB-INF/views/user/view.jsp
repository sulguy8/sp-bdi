<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/head/head.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<table class="table table-bordered">
			<tr>
				<th>번호</th>
				<td data-id="uiNum"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td data-id="uiName"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td data-id="uiId"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td data-id="uiPwd"></td>
			</tr>
			<tr>
				<th>가입날짜</th>
				<td data-id="credat"></td>
			</tr>
			<tr>
				<th>가입시간</th>
				<td data-id="cretim"></td>
			</tr>
			<tr>
				<th>수정날짜</th>
				<td data-id="moddat"></td>
			</tr>
			<tr>
				<th>수정시간</th>
				<td data-id="modtim"></td>
			</tr>
			<tr>
				<th colspan="2">
					<button onclick="goPage('/user/update?uiNum=${param.uiNum}')">수정</button>
					<button onclick="goPage('/user/ajax')">리스트가기</button>
				</th>
			</tr>
		</table>
	</div>
<script>
window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/user/ajax/view?uiNum=${param.uiNum}');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			if(xhr.status==200){
				
				brd = JSON.parse(xhr.responseText);
				console.log(brd);
				var tds = document.querySelectorAll('td[data-id]');
				for(var idx=0;idx<tds.length;idx++){
					var td = tds[idx];
					var key = td.getAttribute('data-id');
					td.innerHTML = brd[0][key];
				}
			}
		}
	}
	xhr.send();
}

</script>
</body>
</html>