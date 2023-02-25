<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/resources/images/DummysFavicon.png" type="image/x-icon" sizes="16x16">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
<script type="text/javascript">
alert("${msg}");
location.href = '<c:out value="${pageContext.request.contextPath}"/>${url}';
</script>
</html>