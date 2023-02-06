<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<div id="main_content" class="main_content_height">
			<div class="row">
				<div class="col">
					<div class="row">
						<h1>나의 타입 생성</h1>
					</div>
					<br>
					<div class="row">
						<div>
							<p>원하는 페이지를 만들어 보아요! 무조건 txt파일로 올리세요</p>
							<p>불편하면 자세를 고쳐앉아</p>
						</div>
					</div>
					<div class="row">
						<button class="btn btn-outline-secondary newbtn"><a href="/type/typecreate.do">새로운 타입!</a></button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-9">
					<table class="table table-hover table-striped">
						<thead class="table-light">
							<tr>
								<th id="check">체크박스</th>
								<th>이름</th>
								<th>설명</th>
								<th>공개여부</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="typelist" items="${typelist}" >
								<tr>
									<td><input type="checkbox" value="${typelist.type_no}" name="delete_check"/></td>
									<td>${typelist.type_name}</td>
									<td>${typelist.type_reason}</td>
									<td>
										<c:choose>
											<c:when test="${typelist.type_open eq 0}">O</c:when>
											<c:otherwise>X</c:otherwise>
										</c:choose>
									</td>
									<td><button class="btn btn-outline-secondary" style="padding-bottom: 2px; padding-top: 2px">수정</button></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button class="btn tablebtn btn-outline-secondary" id="delete">삭제</button></td>
							</tr>
						</tfoot>
					</table>
				</div>
				<div id="datasection" class="col-md-3">
					<section id="values">
						<h3>&nbsp;values</h3>
						<div id="scrolltext">
						
						</div>
					</section>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
<script type="text/javascript">

	document.getElementById("delete").onclick = function() {
		let checklist = [];
		$("input[name=delete_check]:checked").each((index, data)=>{
			let check = $(data).val();
			checklist.push(check);
		})

		$.ajax({
			type : "POST",
			url : "/type/delete.do",
			data : JSON.stringify({"list" : checklist}),
			"contentType":"application/json",
			success : function(checklist){

			},
			error : function(){
				alert("삭제 실패")
			}
		})
	}
	
</script>
</html>