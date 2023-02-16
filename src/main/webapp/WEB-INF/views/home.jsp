<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
     <link rel="icon" href="/resources/images/DummysFavicon.png" type="image/x-icon" sizes="16x16">
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
		
		
		<div>
			<section class="HomepageTop">
				<div class="HomepageTopTitle">
				<h1>쉽고 빠르게 더미데이터를 생성하세요</h1>
				</div>
			</section>
			
			<section class="QuickStartContent">
				<div class="QuickStartMsg"><p>빠른 시작!</p></div>
			</section>
			
			<section class="QuickStart row">
			
				<section class="DataTypeSelection col-sm-6 col-md-6 col-lg-6">
					<section class="SelectContent">
					<div class="QuickStartMsg"><span>데이터의 타입을 선택하세요</span></div>
					</section>
					<section class="DataType">
					<div class="DataTypeToggle">이름</div>
					<div class="DataTypeToggle">연락처</div>
					<div class="DataTypeToggle">EMAIL</div>
					<div class="DataTypeToggle" >도로명주소</div>
					<div class="DataTypeToggle" >지역</div>
					<div class="DataTypeToggle" >우편번호 /<br>국가코드</div>
					<div class="DataTypeToggle" >단어</div>
					<div class="DataTypeToggle" >숫자열</div>
					<div class="DataTypeToggle" >환율</div>
					<div class="DataTypeToggle" >영문자 /<br>숫자열</div>
					</section>
				</section>
				 
				<section class="DataFormatSelection col-sm-6 col-md-6 col-lg-6">
					<section class="SelectContent">
					<div class="QuickStartMsg"><span>생성할 데이터의 형식을 선택하세요</span></div>
					</section>
					<section class="DataFormat">
					<div class="DataTypeToggle">JSON</div>
					<div class="DataTypeToggle">CSV</div>
					<div class="DataTypeToggle">SQL</div>
					<div class="DataTypeToggle" >XML</div>
					<div class="DataTypeToggle" >HTML</div>
					<div class="DataTypeToggle" >JavaScript</div>
					<div class="DataTypeToggle" >EXCEL</div>
					</section>
				</section>
				
				<section class="QuickStartContent">
				<div class="QuickStartMsg"><a href=#>데이터 생성하기</a></div>
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
 			if($(target[0].parentNode).hasClass("DataFormat") == true){
 		 		$(".DataFormat > div").removeClass("DataTypeOn");
 		 		$(target).toggleClass("DataTypeOn");
 		 	}
 			else{
 			$(target).toggleClass("DataTypeOn");
 			}
 		}
 	});
 	
 	


	
	</script>
</html>