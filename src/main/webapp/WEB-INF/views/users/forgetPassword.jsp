<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    </style>


</head>
<body class="bg-flat-color-8">

    <div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container">
            <div class="login-content">
                <div class="login-logo">
                   <div class="login-logo">
                   	<c:choose>
                   		<c:when test="${user != null}">
                   			<a href="${pageContext.request.contextPath}/logout">
                   				<img class="align-content" src="/resources/images/DummysLogo.png" alt="">
                   			</a>	
                   		</c:when>
                   		<c:otherwise>
                   			<a href="/index.do">
		                        <img class="align-content" src="/resources/images/DummysLogo.png" alt="">
		                     </a> 
                   		</c:otherwise>
                   	</c:choose> 
                   </div>
                </div>
                <div class="login-form">
                    <form method="post" action="/users/forgetPassword.do">
                        <div class="form-group">
                            <p>비밀번호 변경, 찾기, 휴면계정 해제 페이지입니다.</p> 
                            <p>인증 후 비밀번호 변경해주시기 바랍니다.</p>
                            <p>이메일 입력 시 로그인하였던 이메일로 확인 바랍니다.</p>
                            <label>Email address</label>
                            <c:choose>
                            	<c:when test="${user != null}">
                            		<input type="text" id="email" name="userid" class="form-control" placeholder="Email" value="${user.userid}" style="display: inline; width: 80%;" readonly="readonly">	
                            	</c:when>
                            	<c:otherwise>
                            		<input type="text" id="email" name="userid" class="form-control" placeholder="Email" style="display: inline; width: 80%;">
                            	</c:otherwise>
                            </c:choose>
                            <button type="button" id="check-btn" class="btn btn-success" style="width: 19%; height: 37px; padding: 0">인증하기</button>
                        </div>
                        <div id="mail" class="form-group"></div>
                        <div id="pwd" class="form-group"></div>
                        <div id="pwdck" class="form-group"></div>
                        <button type="submit" class="btn btn-primary btn-flat m-b-15" id="submit" disabled>비밀번호 변경하기</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
<script type="text/javascript">
let checkMailCheck = false;
let checkPassword = false;
let checkPasswordMatch = false;
let checknumber = 0;
let correctColor = "#4AB34A"; //비밀번호 맞았을 때 출력되는 색깔
let warningColor = "#ff0000"; //틀렸을 때 출력되는 색깔

$("#check-btn").click(()=>{
    let email = $("#email").val();
    if(email == ''){
    	Swal.fire({
		title:'이메일을 입력해주세요.',
		  imageUrl: '/resources/images/failMonster.png',
		  imageWidth: 220,
		  imageHeight: 250,
		  imageAlt: 'Custom image',
		  width:400
		})
        return false;
    }
    $.ajax({
        type : "post",
        url : "/users/mailcheck.do",
        data : JSON.stringify(email),
        "contentType" : "application/json",
        success : (result)=>{
            document.getElementById("email").setAttribute("readonly", "readonly");

            $("#mail").empty();
			
			let tag = 
			'<label style="margin-right: 80%">이메일 인증</label>' +
            '<input type="text" class="form-control" placeholder="인증번호 6자리를 입력해주세요" id="certification" onkeyup="mailcheck()">'+
            '<div><span id="mail-check"></span></div>';

			$("#mail").append(tag);

			checknumber = result.authnumber;

			Swal.fire({
				title:'인증번호 발송이 완료되었습니다.',
				  imageUrl: '/resources/images/successMonster.png',
				  imageWidth: 220,
				  imageHeight: 250,
				  imageAlt: 'Custom image',
				  width:400
				})
        },
        error : ()=>{
            document.getElementById("email").removeAttribute("disabled");
			Swal.fire({
				title:'인증번호 발송을 실패했습니다.',
				  imageUrl: '/resources/images/failMonster.png',
				  imageWidth: 220,
				  imageHeight: 250,
				  imageAlt: 'Custom image',
				  width:400
				})
        }
    })
})

function mailcheck(){
	//mailcheck
	let mailcheck = $('#certification').val();
	//mailcheck
	let confirmMailCheckMsg = document.getElementById("mail-check")

	//음... 메일 체크?
	if(mailcheck.match(checknumber)){
		confirmMailCheckMsg.style.color = correctColor;
		confirmMailCheckMsg.innerHTML = "인증번호가 일치"
		checkMailCheck = true;
	}else{
		confirmMailCheckMsg.style.color = warningColor;
		confirmMailCheckMsg.innerHTML = "인증번호 불일치"
		checkMailCheck = false;
	}
	pwdbutton()
}

function pwdbutton(){
    if(checkMailCheck){
        $("#pwd").empty();
        $("#pwdck").empty();

        let tag1 = '<label>비밀번호</label>'+
        '<input type="password" id="password" class="form-control" placeholder="비밀번호" name="password" id="password" onkeyup="validate()">'+
        '<span id="confirmPasswordREMsg"></span>';

        let tag2 = '<label>비밀번호 확인</label>'+
                    '<input type="password" id="confirm_Password" class="form-control" placeholder="비밀번호 확인" onkeyup="confirmPassword()">'+
                    '<span id="confirmMsg"></span>';
        
        $("#pwd").append(tag1);
        $("#pwdck").append(tag2);
    }else{
        $("#pwd").empty();
        $("#pwdck").empty();
    }
}


function validate(){
    let passwordRE = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,20}$/ //비밀번호 8~20개의 영,숫자,특수문자(#?!@$%^&*-)

    let password = $("#password").val();

    let confirmPasswordMsg = document.getElementById("confirmPasswordREMsg");

    if(password.match(passwordRE)){
        confirmPasswordMsg.style.color = correctColor;
        confirmPasswordMsg.innerHTML = "사용가능한비밀번호"
			checkPassword = true;
	} else{
		confirmPasswordMsg.style.color = warningColor;
		confirmPasswordMsg.innerHTML = "비밀번호 8~20개의 영,숫자,특수문자(#?!@$%^&*-)";
		checkPassword = false;
	}
    activateBtn();
}

function confirmPassword(){
	let password = document.getElementById("password");
	let confirmPassword = document.getElementById("confirm_Password");
	let confirmMsg = document.getElementById("confirmMsg");
	
	if(password.value == confirmPassword.value){ //password의 변수 값과 confirmPassword의 값니?
			//true
			confirmMsg.style.color = correctColor;
			confirmMsg.innerHTML = "비밀번호 일치";
			checkPasswordMatch = true;
			
	} else{
		//false
		confirmMsg.style.color = warningColor;
		confirmMsg.innerHTML = "비밀번호 불일치";
		checkPasswordMatch = false;
	}
	activateBtn();
}

function activateBtn(){
    if(checkPassword && checkPasswordMatch){
        document.getElementById("submit").removeAttribute("disabled");
    }else{
        document.getElementById("submit").setAttribute("disabled", "disabled");
    }
}
</script>
</html>