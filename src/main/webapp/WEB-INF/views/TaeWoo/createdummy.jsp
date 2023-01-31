<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		    <link rel="stylesheet" href="resources/css/cs-skin-elastic.css">
    		<link rel="stylesheet" href="resources/css/style.css">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>index</title>
		<style>
			ul li {
				list-style-type : none;
				cursor : pointer;
			}
			#schemaarea {
				width :80%;
				margin : 0 auto;
			}
			.schema div[data-type]{
				border: 0.5px solid black;
				padding: 2px 2px 2px 2px;
				-ms-user-select: none; 
				-moz-user-select: -moz-none;
				-khtml-user-select: none;
				-webkit-user-select: none;
				user-select: none;
			}
		</style>
	</head>
	<body>
		<section id="header">
			<jsp:include page="/WEB-INF/views/include/header.jsp" />
		</section>
		<section id="main">
			<div class="continer">
					<div class="row">
						<ul id="schemaarea">
							<!-- 줄 하나 -->
							<li data-index="31" class="schema">
								<div class="col">
									<div class="row">
										<div data-type="click" class="col-sm-1 col-md-1 col-lg-1">클릭1</div>
										<div data-type="name"  class="col-sm-3 col-md-3 col-lg-3">이름1</div>
										<div data-type="type"  class="col-sm-3 col-md-3 col-lg-3">타입1</div>
										<div data-type="selectoptions"  class="col-sm-3 col-md-3 col-lg-3">선택옵션1</div>
										<div data-type="options"  class="col-sm-2 col-md-2 col-lg-2">옵션1</div>
									</div>
								</div>
							</li>
							<!-- 줄 하나 -->
							<li data-index="32" class="schema">
								<div class="col">
									<div class="row">
										<div data-type="click" class="col-sm-1 col-md-1 col-lg-1">클릭2</div>
										<div data-type="name"  class="col-sm-3 col-md-3 col-lg-3">이름2</div>
										<div data-type="type"  class="col-sm-3 col-md-3 col-lg-3">타입2</div>
										<div data-type="selectoptions"  class="col-sm-3 col-md-3 col-lg-3">선택옵션2</div>
										<div data-type="options"  class="col-sm-2 col-md-2 col-lg-2">옵션2</div>
									</div>
								</div>
							</li>
							<!-- 줄 하나 -->
							<li data-index="33" class="schema">
								<div class="col">
									<div class="row">
										<div data-type="click" class="col-sm-1 col-md-1 col-lg-1">클릭3</div>
										<div data-type="name"  class="col-sm-3 col-md-3 col-lg-3">이름3</div>
										<div data-type="type"  class="col-sm-3 col-md-3 col-lg-3">타입3</div>
										<div data-type="selectoptions"  class="col-sm-3 col-md-3 col-lg-3">선택옵션3</div>
										<div data-type="options"  class="col-sm-2 col-md-2 col-lg-2">옵션3</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="row">
	
					</div>
					<div class="row">
	
					</div>
			</div>
		</section>
		<section id="footer">
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</section>
	</body>
	<script>
		$('.schema').attr('draggable','true');

		const list = $('#schemaarea');
		
		let picked = null; 
		let pickedIndex = null;
		list.on({
		    'dragstart':(e)=>{
		    	console.log(e);
		    	console.log(e.target);
		    	if($(e.target).attr('data-type') != 'click'){
		    		console.log('클릭 아님!')
		    	}
		        const obj = $(e.target).closest('li');
		        pickedIndex = [...obj[0].parentNode.children].indexOf(obj[0]);
		        picked = obj[0];
		    },
		    'dragover':(e)=>{
		        e.preventDefault()
		    },
		    'drop':(e)=>{
		        const obj = $(e.target).closest('li');
		        const index = [...obj[0].parentNode.children].indexOf(obj[0]);
		        index > pickedIndex ? obj[0].after(picked) : obj[0].before(picked)
		    }
		})
	</script>
</html>