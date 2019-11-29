<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/head/head.jsp"></jsp:include>

<style>
div.container {
	height: 300px;
	width: 500px;   
	border: 1px solid #ab1100;
}
</style>

</head>
<body>
	<div class="container" id="LoginForm"></div>
	<script>
		window.onload = function() {
			
			var jsonStr = '{"uiName":"ysCho","active":null,"uiId":"sulguy8","uiNum":121,"moddat":"20191129","modtim":"102140","credat":"20191129","cretim":"102140","uiPwd":"123123","search":null,"searchStr":null}';
			console.log(JSON.parse(jsonStr));
			var dhWin = new dhx.Window({width : 500, height : 300, title : 'Login'});
			/* 	dhWin.show(); */
			var form = new dhx.Form("LoginForm", {
				cellCss : "dhx_widget--bordered",
				rows : [ {
					type : "input",
					label : "아이디",
					icon : "dxi dxi-magnify",
					placeholder : "아이디를 넣어주세요",
					id : "uiId"
					
				},  {
					type : "input",
					inputType : "password",
					label : "비밀번호",
					placeholder : "비밀번호를 적어주세요",
					id : "uiPwd"
				},  {
					type : "button",
					value : "Send",
					size : "medium",
					view : "flat",
					submit : true,
					color : "primary",
					id : "loginBtn"
				}, ]
			});
			
			form.events.on('ButtonClick',function(id,e){
				if(id==='loginBtn'){
					doLogin();
				}
			});

		}
		function doLogin() {
			var param = {
				uiId : document.querySelector("#uiId").value,
				uiPwd : document.querySelector("#uiPwd").value,
			}
			param = JSON.stringify(param);
			var xhr = new XMLHttpRequest();
			xhr.open('POST', '/user/login');
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						if(xhr.responseText){
							var user = JSON.parse(xhr.responseText);
							alert(user.uiName + '님 반갑습니다.');
							location.href='/views/userinfo/list'
						}
			
					}
				}
			}
			xhr.send(param);
		}
	</script>
</body>
</html>