<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
</head>
	<body>
    <!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
    <!-- /#left-panel -->
    <!-- Left Panel -->

    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
    
	  <!-- Header-->
	  <jsp:include page="/WEB-INF/views/include/header.jsp" />
	  <!-- /header -->
	  <!-- Header-->
		
		
		<div class="content">
			<section class="HomepageTop">
				<div class="HomepageTopTitle">
				<h1>쉽고 빠르게 더미데이터를 생성하세요!</h1>
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
		
		</div>
	</body>




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