<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		    <link rel="stylesheet" href="resources/css/cs-skin-elastic.css">
		    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    		<link rel="stylesheet" href="resources/css/style.css?after">

		<title>index</title>

	</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		
		
		
		<div id="main_content">
			<section class="HomepageTop">
				<div class="HomepageTopTitle">
				<h2>쉽고 빠르게 더미데이터를 생성하세요!</h2>
				</div>
			</section>
			
			<section class="QuickStart row">
				<section class="DataTypeSelection col-sm-6 col-md-6 col-lg-6">
					<div class="DataTypeToggle">이름</div>
					<div class="DataTypeToggle">연락처</div>
					<div class="DataTypeToggle">EMAIL</div>
					<div class="DataTypeToggle" >도로명주소</div>
					<div class="DataTypeToggle" >지역</div>
					<div class="DataTypeToggle" >우편번호/국가코드</div>
					<div class="DataTypeToggle" >단어</div>
					<div class="DataTypeToggle" >숫자열</div>
					<div class="DataTypeToggle" >환율</div>
					<div class="DataTypeToggle" >영문자+숫자열</div>
				</section>
				 
				<section class="DataFormatSelection col-sm-6 col-md-6 col-lg-6">
					<div class="DataTypeToggle">JSON</div>
					<div class="DataTypeToggle">CSV</div>
					<div class="DataTypeToggle">SQL</div>
					<div class="DataTypeToggle" >XML</div>
					<div class="DataTypeToggle" >HTML</div>
					<div class="DataTypeToggle" >JavaScript</div>
					<div class="DataTypeToggle" >EXCEL</div>
				</section>
			
			
			</section>
			
			
			
			
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</body>
	<script>


</script>
	<script> 	
 	$(".DataTypeToggle").on({
 		click : (event)=>{
 			let target = $(event.target);
 			console.log(target);
 			if($(target[0].parentNode).hasClass("DataFormatSelection") == true){
 		 		$(".DataFormatSelection > div").removeClass("DataTypeOn");
 		 		$(target).toggleClass("DataTypeOn");
 		 	}
 			else{
 			$(target).toggleClass("DataTypeOn");
 			}
 		}
 	});
 	
 	


	
	</script>
</html>