<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<%-- <jsp:include page="/WEB-INF/views/include/head.jsp" /> --%>
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
	.content{
		position: relative;
	}
	div[data-type=type] input{
		cursor: pointer;
	}
	#typeChooseArea {
		position: absolute;
		background-color: rgba(0, 0, 0, 0.5); /* 검정색 배경색에 50% 투명도 적용 */
		width: 100%;
		height: 100%;
		z-index: 1;
		top: 0;
		left: 0;
		min-height: 1000px;
	}
	#typeChooseArea .child {
	    position: absolute;
	    width: 90%;
	    height: 90%;
	    top: 5%;
	    left: 5%;
	  	opacity: 1;
	}
	.type-content{
		height: calc(100% - 40px);
	}
	.type-bottom{
		height: 40px;
	}
	</style>
</head>
<body>
	<se:authentication property="name" var="login_user"/>
	<c:choose>
		<c:when test="${schema.userid eq  login_user}">
			<c:set var="usercheck" value="1"/>
		</c:when>
		<c:otherwise>
			<c:set var="usercheck" value="0"/>
		</c:otherwise>
	</c:choose>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />

	<div id="right-panel" class="right-panel">
		<section id="header"> <jsp:include
			page="/WEB-INF/views/include/header.jsp" /> </section>
		<div class="content">
			<div id="typeChooseArea">
				<div class="card child">
					<div class="card-header">
                        <strong class="card-title">
	                        <span class="float-left mt-2">
	                        	타입을 선택하세요
	                        </span>
							<div class="badge float-right mt-1">
								<button type="button" class="btn btn-outline-primary btn-sm" id="type_all_btn"><i class="fa fa-star"></i>&nbsp; 전체 타입</button>
								<button type="button" class="btn btn-outline-secondary btn-sm"id="type_admin_btn"><i class="fa fa-lightbulb-o"></i>&nbsp; 공식 타입</button>
								<button type="button" class="btn btn-outline-success btn-sm"id="type_mine_btn"><i class="fa fa-magic"></i>&nbsp; 내 타입</button>
								<button type="button" class="btn btn-outline-warning btn-sm"id="type_gaussian_btn"><i class="fa fa-map-marker"></i>&nbsp; 정규분포</button>
							</div>
						</strong>
                    </div>
					<div class="card-body">
						<div class="type-content">
							<!-- 타입 선택 공간 -->
						</div>
						<div class="type-bottom">
							<div class="badge float-right mt-1">
								<button type="button" class="btn btn-secondary btn-sm" id="typeCloseBtn">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="continer">
			<!-- 상단 설명 -->
				<div class="row">
					<div class="col">
						<div class="row">
							<h1>스키마 상세</h1>
						</div>
						<br>
						<div class="row">
							<div>
								<p>${schema.userid } 님의 스키마입니다.</p>
								<p>${schema.schema_content }</p>
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
									<th colspan="2" ><span class="col-md-4">#스키마 비밀번호</span><input type="text" id="schema_password" placeholder="있을 경우 비공개" class="col-md-8" 
										<c:if test="${usercheck == 1}">
											value="${schema.schema_password }"
										</c:if>
									></th>
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
										<tr class="schema">
											<td class="col-sm-2 col-md-2 col-lg-2"><div data-type="name" ><div class="datasection"><input type="text" value="${col.col_name}"></div></div></td>
											<td class="col-sm-2 col-md-2 col-lg-2"><div data-type="type"><div class="datasection"><input data-value="${col.type_no}" type="text" value="${col.type_name}" readonly/></div></div></td>
											<td class="col-sm-3 col-md-3 col-lg-3"><div data-type="options"  ><div class="datasection"><input type="text" value="${col.col_blank}"></div></div></td>
											<td class="col-sm-3 col-md-3 col-lg-3">
												<div data-type="selectoptions"  >
													<div class="datasection row">
														<input type="text" value="${col.col_options[0]}" class="col-sm-12 col-md-12 col-lg-12" placeholder="정규분포를 선택해주세요">
													</div>
												</div>
											</td>
											<td class="col-sm-1 col-md-1 col-lg-1"><div data-type="close"  ><div class="datasection"><div class="icon-container"><span class="ti-close delBtn"></span></div></div></div></td>
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
			<div class="navbtn btn btn-outline-success" id="previewBtn">미리보기</div>
			<div class="navbtn btn btn-outline-success" id="createBtn">생성하기</div>
			<c:choose>
				<c:when test="${usercheck == 1 }">
					<div class="navbtn btn btn-outline-success" id="updateBtn">수정하기</div>
				</c:when>
				<c:otherwise>
					<div class="navbtn btn btn-outline-success" id="saveBtn">저장하기</div>
				</c:otherwise>
			</c:choose>
			<div class="navbtn btn btn-outline-success" id="homeBtn">홈</div>
		</div>
	</div>
	</section>
	</div>

</body>
<script>
	// variable setting
	const list = $('#schemaarea');
	/** 현재 선택한 타입 input 태그 */
	let pickedType = null;
	/** 현재 선택한 타입 목록의 종류 전체, 공공, 내 타입*/
	let typeType = "all";
	/** 검색어 */
	let searchKeyword = "";
	/** Drag and Drop 이벤트용 변수 */
	let picked = null; 
	let pickedIndex = null;
	// ===== event/attr setting =====
	$('.schema').attr('draggable','true');
	$('div[data-type="close"] > .datasection').on({
		click : delColumn
	})
	$("#previewBtn").on({
		click: createDummy
	})
	$("#createBtn").on({
		click: createDummy
	})
	$('#saveBtn').on({
		click: saveSchema
	})
	$('#updateBtn').on({
		click: updateSchema
	})
	$('#homeBtn').on({
		click : ()=>{location.href = "/index.do"}
	})
	$("#addbtn").on({
		click : addColumn
	})
	$('#typeCloseBtn').on({
		click : ()=>{$('#typeChooseArea').toggle();}
	})
	$('#typeChooseArea').toggle();
	$('div[data-type=type] input').on({
		click : typeClickEventFunction
	})
	$('#type_all_btn').on({
		click : ()=>{
			typeType = "all"
			readType();
		}
	})
	$('#type_admin_btn').on({
		click : ()=>{
			typeType = "admin"
			readType();
		}
	})
	$('#type_mine_btn').on({
		click : ()=>{
			typeType = "mine"
			readType();
		}
	})
	$('#type_gaussian_btn').on({
		click : ()=>{
			
		}
	})
	// ===== drag and drop set =====
	list.on({
		'dragstart':(e)=>{
			if($(e.target).attr('data-type') != 'click'){
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

			},
			error : (error)=>{

			}
		}) // ajax end
	}// createDummy function end
	
	// saveSchema function start
	function saveSchema(){
		let paramData =readColumn();
		$.ajax({
			type:"post",
			url : "saveSchema.do",
			data : JSON.stringify(paramData),
			contentType:'application/json',
			success : (data)=>{
				if(data.result == 'success'){
					alert("저장 성공!");
					location.href="/schema/schemaList.do?type=mine";
				} else {
					alert("저장 실패...");
				}
			},
			error : (error)=>{
				alert("저장 실패...");
			}
		}) // ajax end
	}// createDummy function end
	/** 수정 함수 */
	function updateSchema(){
		let paramData =readColumn();
		paramData.schema_no = '${schema.schema_no}';
		$.ajax({
			type:"put",
			url : "updateSchema.do",
			data : JSON.stringify(paramData),
			contentType:'application/json',
			success : (data)=>{
				if(data.result == 'success'){
					alert("저장 성공!");
					location.href="/schema/schemaList.do?type=mine";
				} else {
					alert("저장 실패...");
				}
			},
			error : (error)=>{
				alert("저장 실패...");
			}
		}) // ajax end
	}// createDummy function end
	
	/** 컬럼 추가 함수 */
	function addColumn(){
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
		$('div[data-type=type] input').on({
			click : typeClickEventFunction
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
		
		$(read).each((index,data)=>{
			//const col_no = $(data).attr('data-index');
			const schema_no = 1;
			const type_no = $(data).find('div[data-type="type"] > .datasection > input').attr('data-value');
			const col_name = $(data).find('div[data-type="name"] > .datasection > input').val();
			const col_blank = $(data).find('div[data-type="options"] > .datasection > input').val();
			const col_function = '';
			const col_order = index;
			let col_options = [];
			$(data).find('div[data-type="selectoptions"] > .datasection > input').each((index,data)=>{
				col_options.push($(data).val());
			})
			
			const result = {
				"col_no" : 0,
				"schema_no" : schema_no,
				"type_no" : type_no,
				"col_name" : col_name,
				"col_blank" : col_blank,
				"col_function" : col_function,
				"col_order" : col_order,
				"col_options" : col_options
			}
			colList.push(result) //colList.push() end
		})
		let returndata = {
				"row" : $('#rowNum').val(), // 생성할 데이터의 숫자
				"type" : $('#printType option:selected').val(), // 데이터 생성 타입 (Excel , JSON 등등...)
				"schema_name" : $('#schemaName').val(),
				"schema_no" : 0,
				"schema_content" : $('#schemaContent').val(),
				"schema_password" : $('#schema_password').val(),
				"list" : colList
		}
		return returndata;
	}//readColumn function end
	
	function typeClickEventFunction(event){
		pickedType = event.target;
		$('#typeChooseArea').toggle();
		readType();
	}
	
	/** 타입 클릭시 타입 목록 읽어오기 */
	function readType(){
		$(".type-content").empty();
		$.ajax({
			"url" : "getTypeList.do",
			"type" : "get",
			"data" : {
				"type" : typeType,
				"searchKeyword" : ""
			},
			"success" : (data)=>{
				let appendText = '<table id="typeTable" class="table table-hover">'+
										'<thead>'+
										'<tr>'+
											'<th>타입번호</th>'+
											'<th>작성자</th>'+
											'<th>이름</th>'+
											'<th>설명</th>'+
										'</tr>'+
										'</thead>'+
										'<tbody>';
				$(data.list).each((index,type)=>{
					appendText += 
								  '<tr  type-value="' +type.type_no +'" process-no="'+type.process_no+'">'+
									'<td>'+type.type_no+'</td>'+
									'<td>'+type.userid+'</td>'+
									'<td class="type_name">'+type.type_name+'</td>'+
									'<td>'+type.type_reason+'</td>'+
								  '</tr>';
				})
                appendText += '</tbody>'+
									'</table>';
									
				$('.type-content').append(appendText);
				
				$('#typeTable > tbody > tr').on({
					click : (event)=>{
						let value = $(event.target).closest('tr').attr('type-value');
						let name = $(event.target).closest('tr').find('.type_name').text();
						let process_no = $(event.target).closest('tr').attr('process-no');
						
						$(pickedType).attr("data-value",value);
						$(pickedType).val(name);
						
						let col_target = {
							selectoption : $(pickedType).closest('tr').find('div[data-type=selectoptions] > .datasection').closest('td'),
							option : $(pickedType).closest('tr').find('div[data-type=options] > .datasection').closest('td') ,
							close : $(pickedType).closest('tr').find('div[data-type=close] > .datasection').closest('td'),
							datasection : $(pickedType).closest('tr').find('div[data-type=selectoptions] > .datasection')
						}
						
						$(col_target.selectoption).find('.datasection').empty();
						
						if(process_no == 0 || process_no == 1){
							col_target.close[0].after(col_target.selectoption[0]);
						} else if (process_no == 2){
							const txt = '<input type="text" value="1" class="col-sm-6 col-md-6 col-lg-6" placeholder="min"><input type="text" value="100" class="col-sm-6 col-md-6 col-lg-6" placeholder="max">';
							$(col_target.datasection).append(txt);
							col_target.option[0].after(col_target.selectoption[0]);
						} else if (process_no == 3){
							const txt = '<input type="text" class="col-sm-12 col-md-12 col-lg-12" placeholder="정규분포를 선택해주세요" readonly>';
							$(col_target.datasection).append(txt);
							col_target.option[0].after(col_target.selectoption[0]);
						}
						$('#typeChooseArea').toggle();
					}
				}) // click event end
				$('#typeTable').DataTable();
			}, //success end
			"error" : (error)=>{
			}
		})
	}
	</script>
	<script src="/resources/js/lib/data-table/datatables.min.js"></script>
    <script src="/resources/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="/resources/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="/resources/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="/resources/js/lib/data-table/jszip.min.js"></script>
    <script src="/resources/js/lib/data-table/vfs_fonts.js"></script>
    <script src="/resources/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="/resources/js/lib/data-table/buttons.print.min.js"></script>
    <script src="/resources/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="/resources/js/init/datatables-init.js"></script>
    <script>
    	$('#typeTable').DataTable();
    </script>
</html>