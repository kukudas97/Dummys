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
		</style>
	</head>
	<body>
	
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
	
    <div id="right-panel" class="right-panel">
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
					<hr>
					<div class="row">
						<ul id="schemaarea">
							<!-- 줄 하나 -->
							<li data-index="31" class="schema">
								<div class="col">
									<div class="row">
										<div data-type="click" class="col-sm-1 col-md-1 col-lg-1"><div class="datasection">::</div></div>
										<div data-type="name" class="col-sm-2 col-md-2 col-lg-2"><div class="datasection"><input type="text" value="1"></div></div>
										<div data-type="type" data-value="1" class="col-sm-2 col-md-2 col-lg-2"><div class="datasection">타입1</div></div>
										<div data-type="selectoptions"  class="col-sm-3 col-md-3 col-lg-3"><div class="datasection"><input type="text" value="1"><input type="text" value="100"></div></div>
										<div data-type="options"  class="col-sm-3 col-md-3 col-lg-3"><div class="datasection"><input type="text" value="1"></div></div>
										<div data-type="close"  class="col-sm-1 col-md-1 col-lg-1"><div class="datasection">닫기</div></div>
									</div>
								</div>
							</li>
							<!-- 줄 하나 -->
							<li data-index="32" class="schema">
								<div class="col">
									<div class="row">
										<div data-type="click" class="col-sm-1 col-md-1 col-lg-1"><div class="datasection">::</div></div>
										<div data-type="name" class="col-sm-2 col-md-2 col-lg-2"><div class="datasection"><input type="text" value="2"></div></div>
										<div data-type="type" data-value="2" class="col-sm-2 col-md-2 col-lg-2"><div class="datasection">타입2</div></div>
										<div data-type="options"  class="col-sm-3 col-md-3 col-lg-3"><div class="datasection"><input type="text" value="2"></div></div>
										<div data-type="close"  class="col-sm-1 col-md-1 col-lg-1"><div class="datasection">닫기</div></div>
										<div data-type="selectoptions"  class="col-sm-3 col-md-3 col-lg-3"></div>
									</div>
								</div>
							</li>
							<!-- 줄 하나 -->
							<li data-index="33" class="schema">
								<div class="col">
									<div class="row">
										<div data-type="click" class="col-sm-1 col-md-1 col-lg-1"><div class="datasection">::</div></div>
										<div data-type="name" class="col-sm-2 col-md-2 col-lg-2"><div class="datasection"><input type="text" value="3"></div></div>
										<div data-type="type" data-value="3" class="col-sm-2 col-md-2 col-lg-2"><div class="datasection">타입3</div></div>
										<div data-type="selectoptions"  class="col-sm-3 col-md-3 col-lg-3"><div class="datasection"><input type="text" value="3"></div></div>
										<div data-type="options"  class="col-sm-3 col-md-3 col-lg-3"><div class="datasection"><input type="text" value="3"></div></div>
										<div data-type="close"  class="col-sm-1 col-md-1 col-lg-1"><div class="datasection">닫기</div></div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<hr>
					<div class="row">
						<div class="inlineset">
							<button id="adbtn">추가하기</button>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="dataSet">
							<div class="col-sm-auto col-md-auto col-lg-auto">
								<span>#데이터수:</span><input type="text" name="row" id="row" value="1000">
							</div>
							<div class="col-sm-auto col-md-auto col-lg-auto">
								<span>형식:</span>
								<select name="" id="format">
									<option value="1">Excel</option>
									<option value="2">JSON</option>
									<option value="3">CSV</option>
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
					<div class="navbtn btn btn-outline-success" id="btn1">미리보기</div>
					<div class="navbtn btn btn-outline-success" id="btn2">생성하기</div>
					<div class="navbtn btn btn-outline-success" id="btn3">저장하기</div>
					<div class="navbtn btn btn-outline-success" id="btn4">홈</div>
				</div>
			</div>
		</section>
	</div>
	
	</body>
	<script>
	// ===== setting =====
	$('.schema').attr('draggable','true');
	$('div[data-type="close"] > .datasection').on({
		click : delColumn
	})
	const list = $('#schemaarea');

	let picked = null; 
	let pickedIndex = null;
	// ===== event setting =====
		$("#btn1").on({
			click: createDummy
		})
		$("#btn2").on({
			click: createDummy
		})
		$("#adbtn").on({
			click : adColumn
		})
	// ===== drag and drop set =====
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
	function createDummy(){
		// colData : 컬럼의 정보들
		let colData = [
			{
				"col_no" : 1,
				"schema_no" : 1,
				"type_no" : 1,
				"col_name" : "테스트이름",
				"col_blank" : 0,
				"col_function" : "테스트함수",
				"col_order" : 1,
				"col_options" : [1,100]
			},{
				"col_no" : 2,
				"schema_no" : 2,
				"type_no" : 1,
				"col_name" : "테스트이름2",
				"col_blank" : 0,
				"col_function" : "테스트함수2",
				"col_order" : 2,
				"col_options" : [2,200]
			}
		];
		let paramData = {
				"row" : 1000, // 생성할 데이터의 숫자
				"type" : 1, // 데이터 생성 타입 (Excel , JSON 등등...)
				"list" : colData
		}
		console.log(paramData);
		$.ajax({
			type:"post",
			url : "dummydata.do",
			data : JSON.stringify(paramData),
			contentType:'application/json',
			success : (data)=>{
				console.log(data);
			},
			error : (error)=>{
				console.log(error);
			}
		}) // ajax end
	}// createDummy function end
	
	//컬럼 추가 함수
	function adColumn(){
		let txt = '<li data-index="0" class="schema" draggable="true">'+
						'<div class="col">'+
						'<div class="row">'+
										'<div data-type="click" class="col-sm-1 col-md-1 col-lg-1"><div class="datasection">::</div></div>'+
										'<div data-type="name" class="col-sm-2 col-md-2 col-lg-2"><div class="datasection"><input type="text" value="새이름"></div></div>'+
										'<div data-type="type" data-value="1" class="col-sm-2 col-md-2 col-lg-2"><div class="datasection">새타입</div></div>'+
										'<div data-type="options"  class="col-sm-3 col-md-3 col-lg-3"><div class="datasection"><input type="text" value="0"></div></div>'+
										'<div data-type="close"  class="col-sm-1 col-md-1 col-lg-1"><div class="datasection" onclick="delColumn()">닫기</div></div>'+
										'<div data-type="selectoptions"  class="col-sm-3 col-md-3 col-lg-3"></div>'+
						'</div>'+
						'</div>'+
						'</li>';
		$("#schemaarea").append(txt);
	}// adColumn Function end
	function delColumn(event){
		$(event.target).closest('li').remove();
	}

	//==================test===============
	/* "col_blank" : 0,
	"col_function" : "테스트함수",
	"col_order" : 1,
	"col_options" : [1,100] */
	$('#btn3').on({
		click: readColumn
	})
	
	function readColumn(){
		const read = $('.schema');
		/* console.log(read); */
		let colList = [];
		colList.push($(read).map((index,data)=>{
			const col_no = $(data).attr('data-index');
			const schema_no = 1;
			const type_no = $(data).find('div[data-type="type"]').attr('data-value');
			const col_name = $(data).find('div[data-type="name"] > .datasection > input').val();
			const col_blank = $(data).find('div[data-type="options"] > .datasection > input').val();
			const col_function = '';
			const col_order = index;
			let col_options = [];
			col_options.push($(data).find('div[data-type="selectoptions"] > .datasection > input').map((index,data)=>{
				return $(data).val();
			}));
			const result = {
				"col_no" : col_no,
				"schema_no" : schema_no,
				"type_no" : type_no,
				"col_name" : col_name,
				"col_blank" : col_blank,
				"col_function" : col_function,
				"col_order" : col_order,
				"col_options" : [...col_options[0]]
			}
			return result;
		}))
		return colList;
	}
	</script>
</html>