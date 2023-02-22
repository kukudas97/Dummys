<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Dummy's</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    
    
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
 
<style>
  @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
</style>

<style>
.align-content.monsterMessage{
width: 30%;
height: 80%;
}

.align-content.logo{
	margin: auto;
    width: 100%;
    height: 100%;
    display: inline;
}

.align-content.monsterCaptain{
margin: auto; 
width: 70%; 
height: 95%; 
display: inline;
position: relative;
bottom: 10%;
}

.align-content.monsterFriends{
margin: auto; 
width: 90%; 
height: 90%;
position: relative;
bottom: 75%;
}

</style>
</head>



<body class="bg-flat-color-7">
	<div class="blockUser-page" style="align-items: center; justify-content: center; display: grid; padding-top: 35px;">
		
		<img class="align-content logo" src="/resources/images/DummysLogo.png"><br>
		
		<img class="align-content monsterCaptain" src="/resources/images/blockedMonsterCaptain.png" ><br>

		<a href="/users/blockUserReportList.do" style="position: relative; left: 75%; bottom: 95%"><img class="align-content monsterMessage" src="/resources/images/blockedMessage.png" ></a>
		
		<img class="align-content monsterFriends" src="/resources/images/blockedMonsters.png"> <br>	
			
	</div>
</body>


</html>