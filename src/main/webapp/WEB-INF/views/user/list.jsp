<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" session="false"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<c:forEach var="str" items="${requestScope.list}"> <!-- 모델이 jsp의 request영역에 담겨져서 나옴. 그렇다고 model은 request가 아니다. -->

<li>${str}</li>

</c:forEach>

</body>
</html>

