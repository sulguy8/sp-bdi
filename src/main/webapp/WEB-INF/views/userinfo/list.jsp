<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나는 유저인포 리스트</title>
<jsp:include page="/WEB-INF/views/head/head.jsp"></jsp:include>
<style>
div#userGrid {
	width: 400px;
	height: 300px;
}
</style>
</head>
<body>
	<div id="userGrid"></div>
<script>
function getUserList(param){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/user/ajax?' + param);
	xhr.setRequestHeader('Content-Type','application/json');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			if(xhr.status==200){
				var list = JSON.parse(xhr.responseText);
				console.log(list);
				var grid = new dhx.Grid('userGrid',{
					columns : [
						{width:100,id:'uiNum',header:[{text:'번호'}]},
						{width:100,id:'uiId',header:[{text:'아이디'}]},
						{width:100,id:'uiName',header:[{text:'이름'}]},
						{width:100,id:'credat',header:[{text:'가입일'}]}
					],
					headerRowHeight:20
				})
			} else{
				console.log(xhr.responseText);
			}
		}
	}
	xhr.send();
	
}

window.onload = function(){
	getUserList();
}
</script>

</body>
</html>