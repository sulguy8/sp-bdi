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
		<div class="search">
			<label for="uiName">이름</label> <input type="checkbox" name="search"
				value="ui_name" id="uiName"> <label for="uiId">ID</label> <input
				type="checkbox" name="search" value="ui_id" id="uiId"> <label
				for="uiNum">번호</label> <input type="checkbox" name="search"
				value="ui_num" id="uiNum"> <input type="text" id="searchStr">
			<button>검색</button>
		</div>
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
					<th>삭제</th>
				</tr>
			</thead>
			<tbody id="tBody">
				<tr>
					<td colspan="4">내용없음</td>
				</tr>
			</tbody>
		</table>
		<div class="button">
			<a href="/views/user/insert"><button>회원가입</button></a>
		</div>
	</div>
	<script>
function dlt(num){
	var xhr = new XMLHttpRequest();
	xhr.open('DELETE', '/user/ajax');
	xhr.setRequestHeader('Content-Type','application/json');
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				alert("삭제완료!");
				location.href = '/views/user/ajax';
			}
		}
	}
	var param = {
			uiNum : num
	}
	xhr.send(JSON.stringify(param));
}
	
	
function getUserList(param){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/user/ajax?' + param);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			if(xhr.status==200){
				var list = JSON.parse(xhr.responseText);
				var html ='';
				console.log(list);
				for(var ub of list){
					html += '<tr>'
					html += '<td><a href = "/views/user/view?uiNum=' + ub.uiNum + '">' + ub.uiNum + '</a></td>';
					html += '<td>' + ub.uiId + '</td>';
					html += '<td>' + ub.uiName + '</td>';
					html += '<td>' + ub.uiPwd + '</td>';
					html += '<td>' + ub.credat + '</td>';
					html += '<td>' + ub.cretim + '</td>';
					html += '<td>' + ub.moddat + '</td>';
					html += '<td>' + ub.modtim + '</td>';
					html += '<td><button onclick="dlt('+ ub.uiNum +')">삭제</butoon></td>';
					html += '</tr>';
				}
				document.querySelector('#tBody').innerHTML = html;
			}
		}
	}
	xhr.send();
	
}


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
					html += '<td><button>삭제</butoon></td>';
					html += '</tr>';
				}
				document.querySelector('#tBody').innerHTML = html;
			}
		}
	}
	xhr.send();
}	

window.onload=function(){
	getUserList('');
	var btn = document.querySelector('button');
	btn.onclick = function(){
		var checks = document.querySelectorAll('[name=search]:checked');
		if(checks.length==0){
			alert('검색대상을 1개라도 선택해주세요~');
			return;
		}
		var searchStr = document.querySelector('#searchStr');
		if(searchStr.value.trim().length<1){
			alert('검색어를 입력해주세요.');
			return;
		}

		var search = '';
		for(var i=0;i<checks.length;i++){
			search += 'search=' + checks[i].value + '&';
		}
		search += 'searchStr=' + searchStr.value;
		getUserList(search);
	}
}

</script>

</body>
</html>