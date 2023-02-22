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
						<div class="DataTypeToggle"  data-value="263">신용카드 식별번호</div>
						<div class="DataTypeToggle"  data-value="265">ISBN</div>
						<div class="DataTypeToggle"  data-value="266">핸드폰번호</div>
						<div class="DataTypeToggle"  data-value="270">차량번호</div>
						<div class="DataTypeToggle"  data-value="272">색깔</div>
						<div class="DataTypeToggle"  data-value="271">성별</div>
						<div class="DataTypeToggle"  data-value="282">철도역</div>
						<div class="DataTypeToggle"  data-value="283">공항</div>
						<div class="DataTypeToggle"  data-value="286">참/거짓</div>
						<div class="DataTypeToggle"  data-value="285">헥스색상코드</div>
					</section>
				</section>
				 
				<section class="DataFormatSelection col-sm-6 col-md-6 col-lg-6">
					<section class="SelectContent">
					<div class="QuickStartMsg"><span>생성할 데이터의 형식을 선택하세요</span></div>
					</section>
					<section class="DataFormat">
					<div class="DataTypeToggle DataTypeOn"  data-value="1">JSON</div>
					<div class="DataTypeToggle"  data-value="2">CSV</div>
					<div class="DataTypeToggle"  data-value="3">HTML</div>
					<div class="DataTypeToggle"  data-value="4">SQL</div>
					<!-- <div class="DataTypeToggle" >XML</div> -->
					<!-- <div class="DataTypeToggle" >JavaScript</div> -->
					<!-- <div class="DataTypeToggle" >EXCEL</div> -->
					</section>
				</section>
				
				<section class="QuickStartContent">
				<div class="QuickStartMsg"><span class="QuickStartBtn">데이터 생성하기</span></div>
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
 			if($(target[0].parentNode).hasClass("DataFormat") == true){
 		 		$(".DataFormat > div").removeClass("DataTypeOn");
 		 		$(target).toggleClass("DataTypeOn");
 		 	}
 			else{
 			$(target).toggleClass("DataTypeOn");
 			}
 		}
 	});
/* 	$('.QuickStartBtn').click(()=>{
		const typeList = $('.DataType').find('.DataTypeToggle.DataTypeOn');
		const typeFormat = $('.DataFormat').find('.DataTypeToggle.DataTypeOn').attr('data-value');
		let type_no_list =[];
		$(typeList).each((index,data)=>{type_no_list.push($(data).attr('data-value'))});

		const $form = $('<form>').attr('method','post').attr('action','/schema/schemaCreate.do');
		$(type_no_list).each((index,data)=>{
			$input = $('<input>').attr('type','text').attr('name','list['+index+']').val(data);
			$($form).append($input);
		})
		
		$($form).append($('<input>').attr('type','text').attr('name','type').val(typeFormat))
		
		$('body').append($form)
		$form.submit();
	}) */
	$('.QuickStartBtn').click(() => {
		  const typeList = $('.DataType').find('.DataTypeToggle.DataTypeOn');
		  const typeFormat = $('.DataFormat').find('.DataTypeToggle.DataTypeOn').attr('data-value');
		  const type_no_list = [];
		  const type_name_list = [];
		  $(typeList).each((index, data) => {
		    type_no_list.push($(data).attr('data-value'));
		    type_name_list.push($(data).text());
		  });

		  // 데이터를 로컬 스토리지에 저장
		  localStorage.setItem('colData', JSON.stringify({
		    type_no_list: type_no_list,
		    typeFormat: typeFormat,
		    type_name_list: type_name_list
		  }));
		  location.href = "/schema/schemaCreate.do";
		});
	</script>
</html>