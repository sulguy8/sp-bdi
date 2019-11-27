<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
		<h4>회원 리스트</h4>
		<table class="table  table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>비밀번호</th>
					<th>생성일자</th>
					<th>생성시간</th>
					<th>수정일자</th>
					<th>수정시간</th>
				</tr>
			</thead>
			<tbody id="tBody">
				<tr>
					<td colspan="4">내용없음</td>
				</tr>
			</tbody>
		</table>
		<div class="button">
			<button onclick="goPage('/board/insert')">회원가입</button>
		</div>
	</div>
<script>
window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/user/ajax');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			if(xhr.status==200){
				var list = JSON.parse(xhr.responseText);
				var html ='';
				console.log(list);
				for(var ub of list){
					html += '<tr>'
					html += '<td><a href = "/views/board/view?uiNum=' + ub.uiNum + '">' + ub.uiNum + '</a></td>';
					html += '<td>' + ub.uiId + '</td>';
					html += '<td>' + ub.uiName + '</td>';
					html += '<td>' + ub.uiPwd + '</td>';
					html += '<td>' + ub.credat + '</td>';
					html += '<td>' + ub.cretim + '</td>';
					html += '<td>' + ub.moddat + '</td>';
					html += '<td>' + ub.modtim + '</td>';
					html += '</tr>';
				}
				document.querySelector('#tBody').innerHTML = html;
			}
		}
	}
	xhr.send();
}
</script>

</body>
</html>