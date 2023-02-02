<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Index</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="/resources/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

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