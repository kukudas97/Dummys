<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
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
							<p>원하는 페이지를 만들어 보아요! 무조건 txt파일로 올리세요</p>
							<p>불편하면 자세를 고쳐앉아</p>
						</div>
					</div>
					<div class="row">
						<button class="btn btn-outline-secondary newbtn" id="createBtn">스키마 만들기</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover table-striped">
						<thead class="table-light">
							<tr>
								<th id="check">체크박스</th>
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
									<td colspan="6"><h1>데이터가 없어요</h1></td>
								</tr>
							</c:if>
							<c:forEach items="${list }" var="data">
								<tr onclick="schemaDetail('/schema/schemaDetail.do?schema_no=${data.schema_no}')">
									<td><input type="checkbox" value="${data.schema_no }"/></td>
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
								<td><button class="btn tablebtn btn-outline-secondary" id="delBtn">삭제</button></td>
							</tr>
						</tfoot>
					</table>
				</div>

			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
<script>
	$('#createBtn').on({
		click : ()=>{
			location.href = "/schema/schemaCreate.do"
		}
	})
	function schemaDetail(url){
		location.href=url;
	}
/* 	$('#delBtn').on({
		click : deleteGaussian
	}) */
/* 	function deleteGaussian(){
		let list =[]; 
		list.push($('input[type=checkbox]:checked').map((index,data)=>$(data).val()));
		let listdata = [...list[0]];
		// console.log(listdata);
		
		// let datas = [];
		// datas.push($(listdata).map((index,data)=>{
		// 	return {"list" : data}
		// }));
		// console.log(datas);
		// console.log(datas[0]);
		
		$.ajax({
			"type" : "post",
			"url" : "deleteGaussian.do",
			"data" : JSON.stringify([...list[0]]),
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
	} */
</script>
</html>