<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/adminHead.jsp" />
</head>
<body>
	<div id="right-panel" class="right-panel">
		<jsp:include page="/WEB-INF/views/include/adminHeader.jsp" />
		<jsp:include page="/WEB-INF/views/include/adminSidebar.jsp" />
		<div id="main_content" class="main_content_height">
			<div class="row">
				<div class="col">
					<div class="row">
						<h1>문의사항 관리</h1>
					</div>
					<br>
					<div class="row">
						<div>
							<p>유저들의 문의사항입니다.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div>
					<table id="tendinousListTable" class="table table-hover table-striped data-table">
						<thead class="table-light">
							<tr>
								<th id="check"></th>
								<th>이름</th>
								<th>설명</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="listTendinous" items="${listTendinous}" >
								<tr id="detail" data-value="${listTendinous.tendinous_no}">
									<td><input type="checkbox" value="${listTendinous.tendinous_no}" name="delete_check"/></td>
									<c:choose>
										<c:when test="${listTendinous.tendinous_process eq 1}">
											<td><strong>${listTendinous.tendinous_name}</strong></td>		
										</c:when>
										<c:otherwise>
											<td>${listTendinous.tendinous_name}</td>
										</c:otherwise>
									</c:choose>
									
									<td>${listTendinous.tendinous_content}</td>
									<td>
									<button class="btn btn-outline-secondary" style="padding-bottom: 2px; padding-top: 2px" value="${listTendinous.tendinous_no}" onclick="update(this)" name="update">
									처리
									</button></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td><button class="btn tablebtn btn-outline-secondary" id="delete">삭제</button></td>
							</tr>
						</tfoot>
					</table>
					<jsp:include page="/WEB-INF/views/include/footer.jsp" />
				</div>
			</div>
		</div>
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
<script type="text/javascript">
$(document).ready(function() {
    $('#tendinousListTable').DataTable({
  	  order:[[0, "desc"]]
    });
} );

document.getElementById("delete").onclick = function() {
	let checklist = [];
	$("input[name=delete_check]:checked").each((index, data)=>{
		let check = $(data).val();
		checklist.push(check);
	})

	$.ajax({
		type : "POST",
		url : "/admin/deleteTendinous.do",
		data : JSON.stringify(checklist),
		"contentType":"application/json",
		success : function(result){
			alert("총 " + result.msg + "개가 삭제되었습니다.")
			location.reload(); 
		},
		error : function(){
			alert("삭제 실패")
		}
	})
}
</script>
</html>