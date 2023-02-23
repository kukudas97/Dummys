<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<%-- <jsp:include page="/WEB-INF/views/include/head.jsp" /> --%>
<style type="text/css">
	#check{
		width: 100px
	}
	table {
		text-align: center;
	}
	#values{
		border: 3px solid;
		min-height: 525px;
		border-radius: 10px;
	}
	table > tbody >tr {
		cursor : pointer;
	}
</style>
</head>
<body>
	<div id="right-panel" class="right-panel">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		<div id="main_content">
			<div class="row">
				<div class="col">
					<div class="row">
						<c:choose>
							<c:when test="${param.type eq 'mine'}">
								<h1>나의 스키마</h1>
							</c:when>
							<c:otherwise>
								<h1>전체 스키마</h1>
							</c:otherwise>
						</c:choose>
					</div>
					<br>
					<div class="row">
						<div>
							<p>원하는 더미데이터 그룹을 선택하고 생성하세요!</p>
							<p>저장 및 수정도 자유롭게 가능합니다.</p>
						</div>
					</div>
					<div class="row">
						<button class="btn btn-outline-secondary newbtn" id="createBtn">스키마 만들기</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table id="schemaTable"class="table table-hover table-striped">
						<thead class="table-light">
							<tr>
								<c:if test="${param.type eq 'mine' }"><th id="check">체크박스</th></c:if>
								<th>번호</th>
								<th>아이디</th>
								<th>이름</th>
								<th>설명</th>
								<th>작성/수정일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${fn:length(list) == 0 }">
								<tr>
									<td
										<c:if test="${param.type eq 'all' }">
											colspan="5"
										</c:if>
										<c:if test="${param.type eq 'mine' }">
											colspan="6"
										</c:if>
									><h1>데이터가 없어요</h1></td>
								</tr>
							</c:if>
							<c:forEach items="${list }" var="data">
								<tr data-value="${data.schema_no }">
									<c:if test="${param.type eq 'mine' }"><td><input type="checkbox" value="${data.schema_no }"/></td></c:if>
									<td>${data.schema_no}</td>
									<td>${data.userid}</td>
									<td>${data.schema_name}</td>
									<td>${data.schema_content}</td>
									<td>${data.schema_date}</td>
								</tr>
							</c:forEach>

						</tbody>
						<tfoot>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<c:if test="${param.type eq 'mine' }"><td><button class="btn tablebtn btn-outline-secondary" id="delBtn">삭제</button></td></c:if>
							</tr>
						</tfoot>
					</table>
				</div>

			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
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
	$('#createBtn').on({
		click : ()=>{
			location.href = "/schema/schemaCreate.do"
		}
	})
	function schemaDetail(url){
		location.href=url;
	}
 	$('#delBtn').on({
		click : deleteSchema
	})
	$('table > tbody >tr[data-value]').on({
		click : (event)=>{
			if($(event.target).attr('type') != 'checkbox'){
				let no = $(event.target).closest('tr').attr('data-value');
				location.href = '/schema/schemaDetail.do?schema_no=' + no;
			}
		}
	})


 	function deleteSchema(){
		let list =[]; 
		$('input[type=checkbox]:checked').each((index,data)=>{
			list.push($(data).val());	
		})
		
		$.ajax({
			"type" : "delete",
			"url" : "deleteSchema.do",
			"data" : JSON.stringify(list),
			"contentType":"application/json",
			"success" : (data)=>{
				if(data.result == 'success'){
					alert('성공!');
					location.reload();
				} else if(data.result == 'fail'){
					alert('실패...');
				} else if(data.result == 'login-error'){
					alert('로그인 필요...');
					location.href = "/users/login.do";
				}
			},
			"error" : (error)=>{
				console.log(error)
			}
		})// $ajax end
	} 
 	$('#schemaTable').DataTable({
 		"pageLength": 10,
 		"startSave" : true,
 		"lengthChange": false
 	});
</script>
</html>