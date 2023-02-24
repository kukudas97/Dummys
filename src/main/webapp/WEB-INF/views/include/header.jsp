<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Dummy's</title>
 
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
    #weatherWidget .currentDesc {
        color: #ffffff!important;
font-family: 'Hahmlet', serif;
font-family: 'Lato', sans-serif;
    }
        .traffic-chart {
            min-height: 335px;
        }
        #flotPie1  {
            height: 150px;
        }
        #flotPie1 td {
            padding:3px;
        }
        #flotPie1 table {
            top: 20px!important;
            right: -10px!important;
        }
        .chart-container {
            display: table;
            min-width: 270px ;
            text-align: left;
            padding-top: 10px;
            padding-bottom: 10px;
            font-family: 'Hahmlet', serif;
			font-family: 'Lato', sans-serif;
        }
        #flotLine5  {
             height: 105px;
        }

        #flotBarChart {
            height: 150px;
        }
        #cellPaiChart{
            height: 160px;
        }
	.top-right img{
		max-height : 22px;
	}
	#countNumber{
	   border-radius: 50%;
	   color: #fff;
	   font-size: 10px;
	   height: 20px;
	   width: 20px;
	   line-height: 20px;
	   right: 0;
	   top: -5px;
	   position: absolute;
    }
    </style>


</head>
<body>

<header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                  <a class="navbar-brand" href="/index.do"><img src="/resources/images/DummysLogo.png" alt="Logo"></a>
                   <!--  <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a> -->
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="header-left">
                    
                    <div class="session-form">
                    
                    <se:authentication property="name" var="userid" />
	                    <se:authorize access="!isAuthenticated()">
		                    <a href="${pageContext.request.contextPath}/users/login.do">로그인</a>
						    <a href="${pageContext.request.contextPath}/join/join.do">회원가입</a>
						    
					    </se:authorize>
					    <se:authorize access="isAuthenticated()">
					    	<span>반갑습니다 &nbsp;&nbsp; ${userid} 님 :) </span>
					    	<i id="message" class="menu-icon fa fa-envelope-o" style="padding-right:25px; cursor:pointer" onclick="location.href='${pageContext.request.contextPath}/message/message.do'"></i>
					    	<div class="dropdown for-notification" style="margin-right: 25px">
	                            <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <i id="alarm" class="menu-icon fa fa-bell-o"></i>
	                                <span id="countNumber" class="bg-danger" style="padding : 0px"></span>
	                            </button>
	                            <div class="dropdown-menu" aria-labelledby="notification">
		                            <div>
		                            	<button id="allDelete" class="btn btn-outline-secondary float-right" style="font-size: 10px; padding: 5px; margin-right: 5px">읽은 알림 삭제</button>
		                                <p>알림창</p>
		                            </div>
		                            <div class="scroll" id="scroll"></div>	                                
	                            </div>
	                        </div>
						    
					    	<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
					    	<a href="${pageContext.request.contextPath}/users/mypage.do">마이페이지</a>
					    	<se:authorize access="hasRole('ROLE_SLEEP')"><jsp:forward page="${pageContext.request.contextPath}/users/forgetPassword.do"/></se:authorize>

					    	<se:authorize access="hasRole('ROLE_BLOCK')"><jsp:forward page="${pageContext.request.contextPath}/users/blockUser.do"/></se:authorize>

					    	<script type="text/javascript">
					    	var stompClient = null;
					        var socket = null;
                            let userid = '${userid}';

					        function connect() {
								socket = new WebSocket("ws://" + window.location.host + "/websocket-connect.do");
								stompClient = Stomp.over(socket);
								stompClient.connect({},
								function(frame) {// 웹소켓 연결에 성공할 경우 실행되는 함수
										//웹소켓 연결에 성공할 경우 구독기능을 실행한다.
										stompClient.subscribe('/topic/${userid}',function(message) { //구독기능 안에 있는
											// 메세지가 왔을 때 실행될 함수
											//추가해야할 사항
											/*
												1. 알림창 띄우기
												2. 알림 리스트 업데이트하기
												2.1 알림 리스트 업데이트 하면서 확인안한 알림 있는지 확인하고 이모티콘 바꿔주기
											*/
											let json = JSON.parse(message.body)
											
											let snackbar = $('<div class="snackbar" onclick="go(\''+json.url+'\')">'+ json.message +'</div>')
											
						            	    $('body').append(snackbar);
						            	    $(snackbar).toggleClass("show");
											setTimeout(function(){ $(snackbar).remove()}, 3000);
											alarmList(userid);
					              });
					           });
					        }
					        function disconnect() {
								if (socket != null) {
									socket.close();
						        }
								console.log("Disconnected");
					        }
					    	connect();
                            alarmList(userid);
                            //비동기 처리
                            // $(document).ready(()=>{
                            //     alarmList(userid);
                            // })

                            function alarmList(userid){
                                console.log(userid);
                                $.ajax({
                                    "type" : "POST",
                                    "url" : "/alarm/listAlarm.do",
                                    "data" : {"userid":userid},
                                    "success" : (result)=>{

                                        let icon = '';
                                        let text = '';
                                        let url = '';

                                        $("#scroll").empty();

                                        
                                        for(let index in result.alarmList){

                                            if(result.alarmList[index].alarm_type == '쪽지'){
                                            	if(result.alarmList[index].alarm_check != 1){
                                            		icon = '<i class="fa fa-envelope-o"></i>';
                                            	}else{
													icon = '<i class="fa fa-envelope"></i>';	
                                            	}
                                                url = '/message/message.do';
                                            }else if(result.alarmList[index].alarm_type == '게시판'){
                                            	if(result.alarmList[index].alarm_check != 1){
                                            		icon = '<i class="fa fa-file-o"></i>';
                                            	}else{
                                            		icon = '<i class="fa fa-file"></i>';	
                                            	}
                                                url = '/board/boardDetail.do?board_no=';
                                            }else{
                                            	if(result.alarmList[index].alarm_check != 1){
                                            		icon = '<i class="fa fa-arrow-circle-o-down"></i>';
                                            	}else{
                                            		icon = '<i class="fa fa-arrow-circle-down"></i>';	
                                            	}
                                                url = '/board/boardDetail.do?board_no=';
                                            }

                                            let board_no = result.alarmList[index].alarm_type_no;

                                            let con = result.alarmList[index].alarm_content;
                                            let content ='';
                                            
                                            if(con.lenght >=10){
                                                content = con.substr(0,10) + '...';
                                            }else{
                                                content = con;
                                            }

                                            if(result.alarmList[index].alarm_check != 1){
                                            	if(result.alarmList[index].alarm_type == '쪽지'){
                                            		text += 
                                                        '<a class="dropdown-item media" href="'+url+'">'+
                                                        icon+ '<p>'+content+'</p></a>';
                                            	}else{
                                            		text += 
                                                        '<a class="dropdown-item media" href="'+url+
                                                        +board_no+'">'+
                                                        icon+ '<p>'+content+'</p></a>';
                                            	}
                                            }else{
                                            	if(result.alarmList[index].alarm_type == '쪽지'){
                                            		text += 
                                                        '<a al_no="'+result.alarmList[index].alarm_no+'" class="dropdown-item media nlook" href="'+url+'">'+
                                                        icon+ '<strong>'+content+'</strong></a>';
                                            	}else{
                                            		text += 
                                                        '<a al_no="'+result.alarmList[index].alarm_no+'" class="dropdown-item media nlook" href="'+url+
                                                        +board_no+'">'+
                                                        icon+ '<strong>'+content+'</strong></a>';	
                                            	}
                                            }
                                        }
                                        $("#scroll").append(text);
                                        $('#scroll .nlook').on({
                                        	mouseover : readAlarm 
                                        })

                                        count(userid);
                                    },
                                    "error" : ()=>{
                                        alert("현재 연결이 불안정합니다.")
                                    }
                                })
                            }
                            
                            function readAlarm(event){
                            	let alarm_no = $(event.target).attr("al_no");
                            	if(typeof alarm_no != "undefined"){
                                    //이벤트 비활성화 시켜놓고
                                    $(event.target).off("mouseover");
                                    //ajax
                                    $.ajax({
                                        "type":"POST",
                                        "url" : "/alarm/update.do",
                                        "data" : {"alarm_no" : alarm_no},
                                        "success" : (result) => {
                                            if(result.msg <= 0){
                                                $(event.target).on("mouseover");
                                            }else{
                                                alarmList(userid);
                                                count(userid);
                                            }
                                        },
                                        "error" : ()=>{
                                            $(event.target).on("mouseover");
                                        }
                                    })
                                }
                            }

                            function count(userid){
                            	$("#countNumber").empty();
                                $.ajax({
                                    "type" : "POST",
                                    "url" : "/alarm/count.do",
                                    "data" : {"userid":userid},
                                    "success" : (result)=>{
                                    	
                                        $("#countNumber").text(result.msg);
                                        console.log(result.msg)
                                    },
                                    "error" : ()=>{
                                        $("#countNumber").text("NaN");
                                    }
                                })
                            }
                            
                            $("#allDelete").click(()=>{
                                $.ajax({
                                    "type":"POST",
                                    "url" : "/alarm/deleteAll.do",
                                    "data" : {"userid" : userid},
                                    "success" : (result)=>{
                                        if(result.msg >= 1){
                                            alarmList(userid)
                                        }
                                    },
                                    "error" : ()=>{

                                    }
                                })
                            })
					    	</script>
					    </se:authorize>
				    </div>
				</div>
            </div>
            </div>
        </header>
</body>
<script type="text/javascript">
    //hover시 아이콘 변경
	$("#message").mouseover(()=>{
        $("#message").removeClass("fa-envelope-o");
        $("#message").addClass("fa-envelope");
    });
	$("#alarm").mouseover(()=>{
        $("#alarm").removeClass("fa-bell-o");
        $("#alarm").addClass("fa-bell");
    });
	//out시 아이콘 변경
	$("#message").mouseout(()=>{
        $("#message").removeClass("fa-envelope");
        $("#message").addClass("fa-envelope-o");
    });
	$("#alarm").mouseout(()=>{
        $("#alarm").removeClass("fa-bell");
        $("#alarm").addClass("fa-bell-o");
    });
	function go(url){
		console.log(url);
		location.href = url;
	}
	
</script>
</html>