<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<!-- CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Bootstrap 5 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<se:authentication property="name" var="userid" />
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />

	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />

		<div class="content">
			<div class="animated fadeIn">
				<div class="row">

					<div class="col-md-12 board">
						<div class="card">
							<div class="card-header">
								<h5 class="m-0 font-weight-bold board_kind">
									<c:out value="${userid}" />
									님의 쪽지함
								</h5>
							</div>
							<div class="card-body">
								<div class="myBoard">
									<h3>받은 쪽지함</h3>
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>#</th>
												<th>보낸사람</th>
												<th>제목</th>
												<th>보낸시간</th>
											</tr>
										</thead>
								<%-- 		<tbody>
											<c:forEach items="" var="">
												<tr>
													<td><c:out value="" /></td>
													<td><c:out value="" /></td>
													<td><a
														href=""><c:out
																value="" /></a></td>
													<td><c:out value="" /></td>
												</tr>
											</c:forEach>
										</tbody> --%>
									</table>
								</div>

								<div class="myBoard">
									<h3>보낸 쪽지함</h3>
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>#</th>
												<th>받은사람</th>
												<th>제목</th>
												<th>보낸시간</th>
											</tr>
										</thead>
								<%-- 		<tbody>
											<c:forEach items="" var="">
												<tr>
													<td><c:out value="" /></td>
													<td><c:out value="" /></td>
													<td><a
														href=""><c:out
																value="" /></a></td>
													<td><c:out value="" /></td>
												</tr>
											</c:forEach>
										</tbody> --%>
									</table>
								</div>

							</div>
						</div>

					</div>


				</div>

			</div>
			<!-- .animated -->
			  
			  <!-- 모달창 -->
			<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">쪽지보내기</button>
			
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">새로운 쪽지 작성</h5>
			      </div>
			      <div class="modal-body">
			        <form action="" method="post" id="formdata">
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">보내는 사람:</label>
			            <input type="text" class="form-control" id="send-name" name="send_id" value="${userid}" readonly>
			          </div>
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">받는 사람:</label>
			            <input type="text" class="form-control" name="receive_id" id="recipient-name">
			          </div>
			          
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">쪽지 제목:</label>
			            <input type="text" class="form-control" id="recipient-name">
			          </div>
			          
			          <div class="mb-3">
			            <label for="message-text" class="col-form-label">쪽지 내용:</label>
			            <div class="form-floating">
			            <textarea class="form-control" id="floatingTextarea2" placeholder="Leave a comment here" style="height: 100px"></textarea>
			          	<label for="floatingTextarea2">Comments</label>
			          	</div>
			          </div>
			       
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary" id="messageSubmit">쪽지 보내기</button>
			      </div>
			       </form>
			    </div>
			  </div>
			</div>


		</div>
		<!-- .content -->

		<div class="clearfix"></div>

		<jsp:include page="/WEB-INF/views/include/footer.jsp" />

<!-- 받는사람 있는지 확인하는 ajax -->
<script type="text/javascript">
$("#messageSubmit").on({
	  click : () => {
		  const receive_id = $("#recipient-name").val();
		 
           	//비동기 함수 호출
              $.ajax({
           		url: "/message/idcheck.do", //컨트롤러로 보낼 uri
           		type: "POST", //보내는 방식
           		/* dataType : ,  *///컨트롤러에서 데이터 받을 때 형식 JSON
           		data: { //뷰에서 보내는 정보들
           		 'receive_id' : receive_id
              },
           		success: function(data){
           			 if(data >= 1){
           				 $("#formdata").submit();
           			 }else {
           				 alert("꺼져");
           			 }         			
           		},
           		error: function() { //에러 났을 경우 
                     alert("에러입니다.");
                }	
              });
        	}
	  		    
  });


</script>

	</div>
</body>
</html>