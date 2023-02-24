<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- Bootstrap 5 -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
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
				<div style="width: 100%">
					<table id="tendinousListTable"
						class="table table-hover table-striped data-table">
						<thead class="table-light">
							<tr>
								<th id="check"></th>
								<th>아이디</th>
								<th>이름</th>
								<th>설명</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="listTendinous" items="${listTendinous}">
								<tr id="detail" data-value="${listTendinous.tendinous_no}">
									<td><input type="checkbox"
										value="${listTendinous.tendinous_no}" name="delete_check" /></td>
									<td>${listTendinous.userid}</td>
									<c:choose>
										<c:when test="${listTendinous.tendinous_process eq 1}">
											<td><strong>${listTendinous.tendinous_name}</strong></td>
											<td>${listTendinous.tendinous_content}</td>
											<td>
												<button class="btn btn-outline-secondary clear"
													style="padding-bottom: 2px; padding-top: 2px"
													value="${listTendinous.tendinous_no}"
													data-bs-toggle="modal" data-bs-target="#exampleModal"
													data-bs-whatever="@getbootstrap">처리</button>
											</td>
										</c:when>
										<c:otherwise>
											<td>${listTendinous.tendinous_name}</td>
											<td>${listTendinous.tendinous_content}</td>
											<td>
												완료
											</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button class="btn tablebtn btn-outline-secondary"
										id="delete">삭제</button></td>
							</tr>
						</tfoot>
					</table>
					<jsp:include page="/WEB-INF/views/include/footer.jsp" />
				</div>
			</div>

			<!-- 모델창 -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">새로운 쪽지 작성</h5>
						</div>
						<div class="modal-body">
							<form action="/message/message.do" method="post" id="formdata">
								<div class="mb-3">
									<label for="recipient-name" class="col-form-label">보내는
										사람:</label> <input type="text" class="form-control" id="send-name"
										name="send_id" value="admin@admin.com" readonly>
								</div>
								<div class="mb-3">
									<label for="recipient-name" class="col-form-label">받는
										사람:</label> <input type="text" class="form-control" name="receive_id"
										id="recipient-name" readonly>
								</div>

								<div class="mb-3">
									<label for="recipient-name" class="col-form-label">쪽지
										제목:</label> <input type="text" class="form-control"
										name="message_name" id="recipient-name">
								</div>

								<div class="mb-3">
									<label for="message-text" class="col-form-label">쪽지 내용:</label>
									<div class="form-floating">
										<textarea class="form-control" id="floatingTextarea2"
											name="message_content" placeholder="Leave a comment here"
											style="height: 100px"></textarea>
										<label for="floatingTextarea2">Comments</label>
									</div>
								</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="messageSubmit">쪽지
								보내기</button>
						</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 모델창 끝 -->

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
			Swal.fire(
			  '문의사항 삭제처리가 완료되었습니다.',
			  '',
			  'success'
			)
			location.reload(); 
		},
		error : function(){
			Swal.fire(
			  '삭제에 실패했습니다..',
			  '',
			  'error'
			)
		}
	})
}

let tendinous_no = 0;

$(".clear").click((event)=>{
	let tr = $(event.target).closest('tr');
	const td = $(tr).children('td');
	const modal = $('#formdata');
	$(modal).find('[name=send_id]').val("admin@admin.com");
	$(modal).find('[name=receive_id]').val($(td[1]).text());
	tendinous_no = tr.attr("data-value");
})

//메세지 보내기
$("#messageSubmit").on({
	  click : () => {
		  const receive_id = $("#recipient-name").val();
		 
           	//비동기 함수 호출
              $.ajax({
           		url: "/message/idcheck.do", //컨트롤러로 보낼 uri
           		type: "POST", //보내는 방식
           		/* dataType : ,  *///컨트롤러에서 데이터 받을 때 형식 JSON
           		data: { //뷰에서 보내는 정보들
           		 'receive_id' : receive_id},
           		success: function(data){
           			 if(data >= 1){
						 lead();
           			 }else {
         				Swal.fire(
     					  '메세지 전송에 실패했습니다.',
     					  '',
     					  'error'
     					)

           			 }         			
           		},
           		error: function() { //에러 났을 경우 
           			Swal.fire(
   					  '메세지 전송에 실패했습니다.',
   					  '',
   					  'error'
   					)
                }	
              });
        	} 
  });
  
  //처리여부 변경
 function lead(){
	 $.ajax({
		"url" : "/admin/lead.do",
		"type" : "POST",
		"data" : {"tendinous_no" : tendinous_no},
		"success" : (result)=>{
			swal("메세지 전송에 성공하였습니다.", "", "success").then(()=>{
				$("#formdata").submit();			
			})
			
		},
		"error" : ()=>{
			Swal.fire(
			  '메세지 전송에 실패했습니다.',
			  '',
			  'error'
			)
		}
	 })
 }
</script>
</html>