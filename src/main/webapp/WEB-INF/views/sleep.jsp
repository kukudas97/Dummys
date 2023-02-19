<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body class="bg-flat-color-7">

    <div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container">
            <div class="login-content">
                <div class="login-logo">
                	<a href="${pageContext.request.contextPath}/logout">
                        <img class="align-content" src="/resources/images/DummysLogo.png" alt="">
                    </a>
                </div>
                <div class="login-form">
                    <form action="" method="post">
                    	<p>휴면계정 혹은 비밀번호 변경 페이지입니다.</p>
                    	<p>해제하기 위해서 메일인증이 필요합니다.</p>
                        <div class="form-group">
                            <label>닉네임</label>
                            <input type="text" class="form-control" placeholder="닉네임" name="nickname" id="nickname" value="${users.nickname }" disabled>
                            <span id="confirmNicknameREMsg"></span>
                        </div>
                        <div class="form-group">
                            <label style="margin-right: 80%">이메일</label>
                            <input type="text"  class="form-control" placeholder="이메일" name="userid" id="email" style="display: inline; width: 80%;" value="${users.userid }" disabled>
                            <button type="button" id="mail-check-btn" class="btn btn-success" style="width: 19%; height: 37px; padding: 0">인증하기</button>
                            <div>
                        		<span id="confirmEmailREMsg" ></span>
                        	</div>
                        </div>
                        <div id="mail" class="form-group"></div>
                        <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30" id="joinBtn" disabled>비밀번호 변경하러 가기</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
let checkMailCheck = false;
let checkEmail = false;
let checknumber = 0;

/* 인증하기 버튼 구현(재홍) */
$("#mail-check-btn").click(()=>{
	let email = $("#email").val();
	alert(email)
	let certification = $("#certification");
	
	if(email == ''){
		alert("이메일을 입력해주세요")
		return false;
	}
	$.ajax({
		type : "post",
		url : "/join/mailcheck.do",
		data : JSON.stringify(email),
		"contentType":"application/json",
		success : function(result){
			
			$("#mail").empty();
			
			let tag = 
			'<label style="margin-right: 80%">이메일 인증</label>' +
            '<input type="text" class="form-control" placeholder="인증번호 6자리를 입력해주세요" name="certification" id="certification" onkeyup="mailcheck()">'+
            '<div><span id="mail-check"></span></div>';

			$("#mail").append(tag);

			checknumber = result.authnumber;

			alert("인증번호 발송이 완료되었습니다.")
		},
		error : function(){
			document.getElementById("email").readOnly = false;
			alert("실패")
		}
	})
})

function mailcheck(){
	var correctColor = "#4AB34A"; //비밀번호 맞았을 때 출력되는 색깔
	var warningColor = "#ff0000"; //틀렸을 때 출력되는 색깔
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
	activateBtn()
}

function activateBtn(){
	if(checkEmail&&checkMailCheck){
		document.getElementById("joinBtn").removeAttribute("disabled");
	} else{
		document.getElementById("joinBtn").setAttribute("disabled", "disabled");
	}
}
</script>
</html>