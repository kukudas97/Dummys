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
			.row > * {
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
			.dataSet >div , .createnav .navbtn, .inlineSet{
				display: inline-block;
			}
			.createnav{
				position: fixed;
				background-color: green;
				left: 0;
				right: 0;
				bottom: 0;
				height: 4rem;
				padding : 1rem;
			}
			.createnav > .btnArea {
			    display: flex;
			    justify-content: center;
			}
			.createnav .navbtn {
				border: 1px solid white;
				color:white;
				border-radius: 5px;
				padding : 5px;
				margin-left : 1rem;
				margin-right : 1rem;
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
						<div class="col-sm-1 col-md-1 col-lg-1">클릭</div>
						<div class="col-sm-3 col-md-3 col-lg-3">이름</div>
						<div class="col-sm-3 col-md-3 col-lg-3">타입</div>
						<div class="col-sm-3 col-md-3 col-lg-3">선택옵션</div>
						<div class="col-sm-2 col-md-2 col-lg-2">옵션</div>
					</div>
					<div class="row">
						<ul id="schemaarea">
							<!-- 줄 하나 -->
							<li data-index="31" class="schema">
								<div class="col">
									<div class="row">
										<div data-type="click" class="col-sm-1 col-md-1 col-lg-1">클릭1</div>
										<div data-type="name" class="col-sm-3 col-md-3 col-lg-3"><input type="text" value="1"></div>
										<div data-type="type" data-value="1" class="col-sm-3 col-md-3 col-lg-3">타입1</div>
										<div data-type="selectoptions"  class="col-sm-3 col-md-3 col-lg-3"><input type="text" value="1"></div>
										<div data-type="options"  class="col-sm-2 col-md-2 col-lg-2"><input type="text" value="1"></div>
									</div>
								</div>
							</li>
							<!-- 줄 하나 -->
							<li data-index="32" class="schema">
								<div class="col">
									<div class="row">
										<div data-type="click" class="col-sm-1 col-md-1 col-lg-1">클릭2</div>
										<div data-type="name"  class="col-sm-3 col-md-3 col-lg-3"><input type="text" value="2"></div>
										<div data-type="type"  class="col-sm-3 col-md-3 col-lg-3">타입2</div>
										<div data-type="selectoptions"  class="col-sm-3 col-md-3 col-lg-3"><input type="text" value="2"></div>
										<div data-type="options"  class="col-sm-2 col-md-2 col-lg-2"><input type="text" value="2"></div>
									</div>
								</div>
							</li>
							<!-- 줄 하나 -->
							<li data-index="33" class="schema">
								<div class="col">
									<div class="row">
										<div data-type="click" class="col-sm-1 col-md-1 col-lg-1">클릭3</div>
										<div data-type="name"  class="col-sm-3 col-md-3 col-lg-3"><input type="text" value="3"></div>
										<div data-type="type"  class="col-sm-3 col-md-3 col-lg-3">타입3</div>
										<div data-type="selectoptions"  class="col-sm-3 col-md-3 col-lg-3"><input type="text" value="3"></div>
										<div data-type="options"  class="col-sm-2 col-md-2 col-lg-2"><input type="text" value="3"></div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="row">
						<div class="inlineset">
							<button id="adbtn">추가하기</button>
						</div>
					</div>
					<!--  -->
					<div class="row">
						<div class="dataSet">
							<div class="col-sm-auto col-md-auto col-lg-auto">
								<span>#데이터수:</span><input type="text" name="row" id="row" value="1000">
							</div>
							<div class="col-sm-auto col-md-auto col-lg-auto">
								<span>형식:</span>
								<select name="" id="format">
									<option value="1">옵션1</option>
									<option value="2">옵션2</option>
									<option value="3">옵션3</option>
								</select>
							</div>
						</div>
					</div>
			</div>
		</section>
		<section id="footer">
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</section>
		<section>
			<div class="createnav">
				<div class="btnArea">
					<div class="navbtn" id="btn1">버튼1</div>
					<div class="navbtn" id="btn2">버튼2</div>
					<div class="navbtn" id="btn3">버튼3</div>
				</div>
			</div>
		</section>
	</body>
	<script>
	// ===== event setting =====
		$("#btn1").on({
			click: createDummy
		})
	// ===== drag and drop set =====
		$('.schema').attr('draggable','true');

		const list = $('#schemaarea');
		
		let picked = null; 
		let pickedIndex = null;
		list.on({
			'dragstart':(e)=>{
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
		});// list on end
/*
	private int col_no;
	private int schema_no;
	private int type_no;
	private String col_name;
	private int col_blank;
	private String col_function;
	private int col_order;
	private List<Integer> options;
*/
	function createDummy(){
		// {
		// 	col_no : 2,
		// 	schema_no : 2,
		// 	col_name : '테스트이름2',
		// 	col_blank : 0,
		// 	col_function : '테스트함수2',
		// 	col_order : 2,
		// 	col_options : [2,200]
		// }
		let colData = [
			{
				"col_no" : 1,
				"schema_no" : 1,
				"col_name" : "테스트이름",
				"col_blank" : 0,
				"col_function" : "테스트함수",
				"col_order" : 1,
				"col_options" : [1,100]
			},{
				"col_no" : 2,
				"schema_no" : 2,
				"col_name" : "테스트이름2",
				"col_blank" : 0,
				"col_function" : "테스트함수2",
				"col_order" : 2,
				"col_options" : [2,200]
			}
		];
		console.log(colData);
		$.ajax({
			type:"post",
			url : "dummydata.do",
			data : JSON.stringify(colData),
			contentType:'application/json',
			success : (data)=>{
				console.log(data);
			},
			error : (error)=>{
				console.log(error);
			}
		})
	}// createDummy function end
	</script>
</html>