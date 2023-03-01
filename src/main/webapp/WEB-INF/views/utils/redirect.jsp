<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/resources/images/DummysFavicon.png" type="image/x-icon" sizes="16x16">
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- WebSocket -->
 	<!-- <script src="/webjars/sockjs-client/sockjs.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>    
    <!-- <script src="/webjars/stomp-websocket/stomp.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>   
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 

     <link rel="icon" href="/resources/images/DummysFavicon.png" type="image/x-icon" sizes="16x16">

     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    
    <script src="/resources/js/main.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css" rel="stylesheet" />
 
	<script src="/resources/js/lib/data-table/datatables.min.js"></script>
	<script src="/resources/js/lib/data-table/dataTables.bootstrap.min.js"></script>
	<script src="/resources/js/lib/data-table/dataTables.buttons.min.js"></script>
	<script src="/resources/js/lib/data-table/buttons.bootstrap.min.js"></script>
	<script src="/resources/js/lib/data-table/jszip.min.js"></script>
	<script src="/resources/js/lib/data-table/vfs_fonts.js"></script>
	<script src="/resources/js/lib/data-table/buttons.html5.min.js"></script>
	<script src="/resources/js/lib/data-table/buttons.print.min.js"></script>
	<script src="/resources/js/lib/data-table/buttons.colVis.min.js"></script>
	<script src="/resources/js/init/datatables-init.js"></script>
	<style>
		html{
			margin : 0px;
			background: #BEF5BE;
		}
	</style>
</head>
<body>
</body>
<script type="text/javascript">

Swal.fire({
	title:'비밀번호 변경을 완료했습니다.',
	  imageUrl: '/resources/images/successMonster.png',
	  imageWidth: 220,
	  imageHeight: 250,
	  imageAlt: 'Custom image',
	  width:400
	}).then(()=>{
		location.href = '<c:out value="${pageContext.request.contextPath}"/>${url}';
	}) 

/* alert("${msg}");
location.href = '<c:out value="${pageContext.request.contextPath}"/>${url}'; */
</script>
</html>