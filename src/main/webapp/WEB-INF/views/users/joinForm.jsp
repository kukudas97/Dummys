<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
   <jsp:include page="/WEB-INF/views/include/head.jsp" />
</head>
<body class="bg-flat-color-7">

    <div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container">
            <div class="login-content">
                <div class="login-logo">
                     <a href="/index.do">
                        <img class="align-content" src="/resources/images/DummysLogo.png" alt="">
                    </a> 
                </div>
                <div class="login-form">
                    <form action="" method="post">
                        <div class="form-group">
                            <label>닉네임</label>
                            <input type="text" class="form-control" placeholder="닉네임" name="nickname" id="nickname" onkeyup="validate()">
                            <span id="confirmNicknameREMsg"></span>
                        </div>
                        <div class="form-group">
                            <label style="margin-right: 80%">이메일</label>
                            <input type="email"  class="form-control" placeholder="이메일" name="userid" id="email" onkeyup="validate()" style="display: inline; width: 80%;">
                            <button type="button" id="mail-check-btn" class="btn btn-success" style="width: 19%; height: 37px; padding: 0">인증하기</button>
                            <div>
                        		<span id="confirmEmailREMsg" ></span>
                        	</div>
                        </div>
                        <div id="mail" class="form-group">
                            <!-- <label style="margin-right: 80%">이메일 인증</label>
                            <input type="text" class="form-control" placeholder="인증번호 6자리를 입력해주세요" name="certification" id="certification" style="display: inline; width: 80%;">
                            <button type="button" id="mail-success-btn" class="btn btn-success" style="width: 19%; height: 37px; padding: 0">인증확인</button>
                            <div>
                        		<span id="mail-check"></span>
                        	</div> -->
                        </div>
                       <!-- 방법1 --> 
                       <div class="form-group">
                            <label>비밀번호</label>
                            <input type="password" id="password" class="form-control" placeholder="비밀번호" name="password" id="password" onkeyup="validate()">
                            <span id="confirmPasswordREMsg"></span>
                        </div>
                        <div class="form-group">
                            <label>비밀번호 확인</label>
                            <input type="password" name="confirm_Password" id="confirm_Password" class="form-control" placeholder="비밀번호 확인" onkeyup="confirmPassword()">
                            <span id="confirmMsg"></span>
                        </div> 
                        <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30" id="joinBtn" disabled>가입하기</button>
                        <div class="social-login-content">
                        </div>
                        <div class="register-link m-t-15 text-center">
                            <p>이미 계정이 있으십니까? <a href="${pageContext.request.contextPath}/users/login.do"> 로그인</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>  
    

</body>

<script>

let checkNickname = false;
let checkPassword = false;
let checkEmail = false;
let checkPasswordMatch = false;
let checkMailCheck = false;

let checknumber = 0;


/* 인증하기 버튼 구현(재홍) */
$("#mail-check-btn").click(()=>{
	let email = $("#email").val();
	alert(email)
	let certification = $("#certification");

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
  
/*비밀번호 확인 처리 (다영)*/
function confirmPassword(){
	var password = document.getElementById("password");
	var confirmPassword = document.getElementById("confirm_Password");
	var confirmMsg = document.getElementById("confirmMsg");
	var correctColor = "#4AB34A"; //비밀번호 맞았을 때 출력되는 색깔
	var wrongColor = "#ff0000"; //틀렸을 때 출력되는 색깔
	var joinBtn = document.getElementById("joinBtn");
	
	if(password.value == confirmPassword.value){ //password의 변수 값과 confirmPassword의 값니?
			//true
			confirmMsg.style.color = correctColor;
			confirmMsg.innerHTML = "비밀번호 일치";
			checkPasswordMatch = true;
			
	} else{
		//false
		confirmMsg.style.color = wrongColor;
		confirmMsg.innerHTML = "비밀번호 불일치";
		checkPasswordMatch = false;
	}
	activateBtn()
}


/* Regular Expression 다영 + 재홍(이메일 인증 여부 확인)*/
function validate(){
	var nicknameRE = /^[a-zA-Z0-9]{6,10}$/  //닉네임 6~10개의 영,숫자
	var emailRE= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
	var passwordRE = /^[a-zA-Z0-9]{8,20}$/ //비밀번호 8~20개의 영,숫자
	
	var nickname = $('#nickname').val() //document.getElementById("nickname");
	var password = $('#password').val() 
	var email = $('#email').val()
	
	
	var confirmNicknameMsg = document.getElementById("confirmNicknameREMsg")
	var confirmPasswordMsg = document.getElementById("confirmPasswordREMsg")
	var confirmEmailMsg = document.getElementById("confirmEmailREMsg")
	

	var correctColor = "#4AB34A"; //비밀번호 맞았을 때 출력되는 색깔
	var warningColor = "#FF9B00";
	
	
	
	//닉네임 정규표현식 함수
	if(nickname.match(nicknameRE)){
		confirmNicknameMsg.style.color = correctColor;
		confirmNicknameMsg.innerHTML = "사용가능한 닉네임";
		checkNickname = true;
		
	} else{
		confirmNicknameMsg.innerHTML = "닉네임 6~10개의 영,숫자";
		confirmNicknameMsg.style.color = warningColor;
		checkNickname = false;
	}
	
	//이메일 정규표현식 함수
	if(email.match(emailRE)){
		confirmEmailMsg.style.color = correctColor;
		confirmEmailMsg.innerHTML = "사용가능한 이메일 형식"
			checkEmail = true;
	} else{
		confirmEmailMsg.style.color = warningColor;
		confirmEmailMsg.innerHTML = "이메일 형식을 맞춰주세요";
		checkEmail = false;
	}
	
	
	//비밀번호 정규표현식 함수
	if(password.match(passwordRE)){
		confirmPasswordMsg.style.color = correctColor;
		confirmPasswordMsg.innerHTML = "사용가능한비밀번호"
			checkPassword = true;
	} else{
		confirmPasswordMsg.style.color = warningColor;
		confirmPasswordMsg.innerHTML = "비밀번호 8~20개의 영,숫자";
		checkPassword = false;
	}
	activateBtn()
}

/*
 
  let checkNickname = false;
  let checkPassword = false;
  let checkEmail = false;
  let checkPasswordMatch = false;
 */

function activateBtn(){
	if(checkNickname&&checkPassword&&checkEmail&&checkPasswordMatch&&checkMailCheck){
		document.getElementById("joinBtn").removeAttribute("disabled");
	} else{
		document.getElementById("joinBtn").setAttribute("disabled", "disabled");
	}
}




</script>


</html>
