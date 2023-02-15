<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
<style>
	input {
	      display: inline-block;
	      height: 40px;
	      padding: 0 10px;
	      vertical-align: middle;
	      border: 1px solid #dddddd;
	      color: #999999;
	      border-radius: 5px;
	      width:100%;
      }
	.t2{
		width: 20%;
	}
	.delBtn {
		cursor : pointer;
	}
	</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />

	<div id="right-panel" class="right-panel">
		<section id="header"> <jsp:include
			page="/WEB-INF/views/include/header.jsp" /> </section>
		<div class="content">
			<div class="continer">
			<!-- 상단 설명 -->
				<div class="row">
					<div class="col">
						<div class="row">
							<h1>나만의 스키마 생성</h1>
						</div>
						<br>
						<div class="row">
							<div>
								<p>원하는 페이지를 만들어 보아요!</p>
								<p>불편하면 자세를 고쳐앉아</p>
							</div>
						</div>
					</div>
				</div>
				<!-- schema -->
				<div class="row">
					<div class="col-md-12">
						<table class="table table-striped">
							<thead class="table-light">
								<tr>
									<th colspan="2" ><span class="col-md-4">#스키마 이름</span><input type="text" id="schemaName" placeholder="스키마 이름" class="col-md-8" value="${schema.schema_name }"></th>
									<th colspan="2" ><span class="col-md-4">#스키마 비밀번호</span><input type="text" id="schema_password" placeholder="있을 경우 비공개" class="col-md-8" value="${schema.schema_password }"></th>
									<th></th>
								</tr>
								<tr>
									<th colspan="4" ><span class="col-md-4">#스키마 설명</span><input type="text" id="schemaContent" placeholder="스키마 설명" class="col-md-8" value="${schema.schema_content }"></th>
									<th></th>
								</tr>
								<tr>
									<th>이름</th>
									<th>타입</th>
									<th>옵션</th>
									<th colspan="2">선택옵션</th>
								</tr>
							</thead>
							<tbody id="schemaarea">
							<c:forEach items="${col_list }" var="col">
								<c:choose>
									<c:when test="${col.process_no == 0 || col.process_no == 1}">
										<tr class="schema">
											<td class="col-sm-2 col-md-2 col-lg-2"><div data-type="name" ><div class="datasection"><input type="text" value="${col.col_name}"></div></div></td>
											<td class="col-sm-2 col-md-2 col-lg-2"><div data-type="type"><div class="datasection"><input data-value="${col.type_no}" type="text" value="${col.type_name}" readonly/></div></div></td>
											<td class="col-sm-3 col-md-3 col-lg-3"><div data-type="options"  ><div class="datasection"><input type="text" value="${col.col_blank}"></div></div></td>
											<td class="col-sm-1 col-md-1 col-lg-1"><div data-type="close"  ><div class="datasection"><div class="icon-container"><span class="ti-close delBtn"></span></div></div></div></td>
											<td class="col-sm-3 col-md-3 col-lg-3"><div data-type="selectoptions"  ><div class="datasection row"></div></div></td>
										</tr>
									</c:when>
									<c:when test="${col.process_no == 2 }">
										<tr class="schema">
											<td class="col-sm-2 col-md-2 col-lg-2"><div data-type="name" ><div class="datasection"><input type="text" value="${col.col_name}"></div></div></td>
											<td class="col-sm-2 col-md-2 col-lg-2"><div data-type="type"><div class="datasection"><input data-value="${col.type_no}" type="text" value="${col.type_name}" readonly/></div></div></td>
											<td class="col-sm-3 col-md-3 col-lg-3"><div data-type="options"  ><div class="datasection"><input type="text" value="${col.col_blank}"></div></div></td>
											<td class="col-sm-3 col-md-3 col-lg-3">
												<div data-type="selectoptions"  >
													<div class="datasection row">
														<input type="text" value="${col.col_options[0]}" class="col-sm-6 col-md-6 col-lg-6" placeholder="min">
														<input type="text" value="${col.col_options[1]}" class="col-sm-6 col-md-6 col-lg-6" placeholder="max">
													</div>
												</div>
											</td>
											<td class="col-sm-1 col-md-1 col-lg-1"><div data-type="close"  ><div class="datasection"><div class="icon-container"><span class="ti-close delBtn"></span></div></div></div></td>
										</tr>
									</c:when>
									<c:when test="${col.process_no == 3}">
										<tr>
											<td colspan="5">
												<h1>시나리오는 준비 중</h1>
											</td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td><button class="btn tablebtn btn-outline-secondary" id="addbtn">ROW추가</button></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="2" ><span class="col-md-4">#데이터 수</span><input type="text" id="rowNum" placeholder="데이터 개수" class="col-md-8" value="100"></td>
									<td colspan="2" ><span class="col-md-4">#데이터 타입</span>
										<div class="col-md-8"  style="display: inline-block;">
											<select name="select" id="printType" class="form-control">
	                                             <option value="0">Excel</option>
	                                             <option value="1">JSON</option>
	                                             <option value="2">CSV</option>
	                                         </select>
                                         </div>
									</td>
									<td></td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
				<!-- footer -->
				<!-- <div class="row"> -->
					<jsp:include page="/WEB-INF/views/include/footer.jsp" /> </section>
				<!-- </div> -->
			</div>
		</div>
	</div>
	<!-- .content -->
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
	// variable setting
	const list = $('#schemaarea');

	let picked = null; 
	let pickedIndex = null;

	// ===== setting =====
	$('.schema').attr('draggable','true');
	$('div[data-type="close"] > .datasection').on({
		click : delColumn
	})
	// ===== event setting =====
	$("#btn1").on({
		click: createDummy
	})
	$("#btn2").on({
		click: createDummy
	})
	$("#addbtn").on({
		click : addColumn
	})
	$('#btn3').on({
		click: saveSchema
	})

	// ===== drag and drop set =====
	list.on({
		'dragstart':(e)=>{
			if($(e.target).attr('data-type') != 'click'){
				console.log('클릭 아님!')
			}
			const obj = $(e.target).closest('tr');
			pickedIndex = [...obj[0].parentNode.children].indexOf(obj[0]);
			picked = obj[0];
		}, 
		'dragover':(e)=>{
			e.preventDefault()
		},
		'drop':(e)=>{
			const obj = $(e.target).closest('tr');
			const index = [...obj[0].parentNode.children].indexOf(obj[0]);
			index > pickedIndex ? obj[0].after(picked) : obj[0].before(picked)
		}
	});// list on end
	// ===== drag and drop end =====

	// createDummy() function start
	function createDummy(){
		let paramData = {
				"row" : $('#rowNum').val(), // 생성할 데이터의 숫자
				"type" : $('#printType option:selected').val(), // 데이터 생성 타입 (Excel , JSON 등등...)
				"schema_name" : $('#schemaName').val(),
				"schema_no" : 0,
				"schema_content" : $('#schemaContent').val(),
				"schema_password" : $('#schema_password').val(),
				"list" : readColumn()
		}
		$.ajax({
			type:"post",
			url : "createData.do",
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
	
	// saveSchema function start
	function saveSchema(){
		let paramData = {
				"row" : $('#rowNum').val(), // 생성할 데이터의 숫자
				"type" : $('#printType option:selected').val(), // 데이터 생성 타입 (Excel , JSON 등등...)
				"schema_name" : $('#schemaName').val(),
				"schema_no" : 0,
				"schema_content" : $('#schemaContent').val(),
				"schema_password" : $('#schema_password').val(),
				"list" : readColumn()
		}
		$.ajax({
			type:"post",
			url : "saveSchema.do",
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
	function addColumn(){
		console.log('aa');
		let txt ='<tr class="schema" draggable="true">'+
						'<td class="col-sm-2 col-md-2 col-lg-2"><div  data-type="name" ><div class="datasection"><input type="text" value="1"></div></div></td>'+
						'<td class="col-sm-2 col-md-2 col-lg-2"><div data-type="type" data-value="1" ><div class="datasection"><input data-value="161" type="text" value="타입1" readonly/></div></div></td>'+
						'<td class="col-sm-3 col-md-3 col-lg-3"><div data-type="options"  ><div class="datasection"><input type="text" value="1"></div></div></td>'+
						'<td class="col-sm-3 col-md-3 col-lg-3">'+
							'<div data-type="selectoptions"  >'+
								'<div class="datasection row">'+
									'<input type="text" value="1" class="col-sm-6 col-md-6 col-lg-6">'+
									'<input type="text" value="100" class="col-sm-6 col-md-6 col-lg-6">'+
								'</div>'+
							'</div>'+
						'</td>'+
						'<td class="col-sm-1 col-md-1 col-lg-1"><div data-type="close"  ><div class="datasection"><div class="icon-container"><span class="ti-close delBtn"></span></div></div></div></td>'+
					'</tr>';
		$("#schemaarea").append(txt);
		$('div[data-type="close"] > .datasection').on({
			click : delColumn
		})
	}// adColumn Function end

	// tr 삭제 함수
	function delColumn(event){
		$(event.target).closest('tr').remove();
	}

	// Column 목록 읽어오기 
	function readColumn(){
		const read = $('.schema');
		/* console.log(read); */
		let colList = [];
		colList.push($(read).map((index,data)=>{
			//const col_no = $(data).attr('data-index');
			const schema_no = 1;
			const type_no = $(data).find('div[data-type="type"] > .datasection > input').attr('data-value');
			const col_name = $(data).find('div[data-type="name"] > .datasection > input').val();
			const col_blank = $(data).find('div[data-type="options"] > .datasection > input').val();
			const col_function = '';
			const col_order = index;
			let col_options = [];
			col_options.push($(data).find('div[data-type="selectoptions"] > .datasection > input').map((index,data)=>{
				return $(data).val();
			}));
			const result = {
				"col_no" : 0,
				"schema_no" : schema_no,
				"type_no" : type_no,
				"col_name" : col_name,
				"col_blank" : col_blank,
				"col_function" : col_function,
				"col_order" : col_order,
				"col_options" : [...col_options[0]]
			}
			return result; //colList.push >> $(read).map(()=>{...}) end
		})) //colList.push() end
		return [...colList[0]];
	}//readColumn function end
	</script>
</html>