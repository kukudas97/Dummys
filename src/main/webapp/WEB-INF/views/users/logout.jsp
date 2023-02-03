<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
</head>
<body>
	<h1>logout</h1>
	
	<form action="/logout" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<button>logout</button>
	</form>
</body>
</html>