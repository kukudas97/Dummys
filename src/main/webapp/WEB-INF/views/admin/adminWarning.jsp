<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/adminHead.jsp" />
</head>
<style>
.adminReportBtn, .blockReleaseBtn {
	font-family: 'IBM Plex Sans KR', sans-serif;
	background-color: transparent;
	color: #5D6DBE;
	border: 2px solid #5D6DBE;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	border-radius: 4px;
}

.adminReportBtn:hover, .blockReleaseBtn:hover {
	background-color: #5D6DBE;
	color: white;
}
</style>


<body>
	<!-- left panel -->
	<jsp:include page="/WEB-INF/views/include/adminSidebar.jsp" />
	<!-- left panel -->


	<div id="right-panel" class="right-panel">
		<jsp:include page="/WEB-INF/views/include/adminHeader.jsp" />
		<div id="main_content" class="main_content_height">
			<!-- 			<h1>신고 확인</h1> -->


			<div class="content">
				<div class="animated fadeIn">
					<div class="row">
						<div class="col-md-12 admin">

							<!-- 사용자별 누적 신고 -->
							<div class="warning-table" style="padding-bottom: 30px;">
								<div class="card">
									<div class="card-header">
										<h5 class="m-0 font-weight-bold">사용자별 신고 관리</h5>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-lg-5" style="margin: auto; display: inline">
												<h3 class="margin15">누적 신고</h3>
												<table id="reportWarningUsers"
													class="table table-striped table-bordered"
													style="text-align: center; align-items: center; justify-content: center;">
													<thead>
														<tr>
															<th scope="col">USERID</th>
															<th scope="col">누적 신고 수</th>
															<th scope="col">처리</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${reportWarningCnt}"
															var="reportWarningCnt">
															<tr>
																<td><c:out value="${reportWarningCnt.receive_id}" /></td>
																<td><c:out value="${reportWarningCnt.warning_cnt}" /></td>
																<td><button type="button" class="adminReportBtn"
																		value="${reportWarningCnt.receive_id}">정지</button></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>


											<div class="col-lg-5" style="margin: auto; display: inline">
												<h3 class="margin15">정지 해제</h3>
												<table id="blockedUsers"
													class="table table-striped table-bordered"
													style="text-align: center; align-items: center; justify-content: center;">
													<thead>
														<tr>
															<th scope="col">USERID</th>
															<th scope="col">처리</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${getBlockUsers}" var="getBlockUsers">
															<tr>
																<td><c:out value="${getBlockUsers}" /></td>
																<td><button type="button" class="blockReleaseBtn"
																		value="${getBlockUsers}">해제</button></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>

									</div>
								</div>
							</div>

							<!-- 게시글 신고 -->
							<div class="warning-table" style="padding-bottom: 30px">
								<div class="card">
									<div class="card-header">
										<h5 class="m-0 font-weight-bold">게시글 신고</h5>
									</div>
									<div class="card-body">
										<table id="reportWarningBoard"
											class="table table-striped table-bordered">
											<thead>
												<tr>
													<th scope="col">#</th>
													<th scope="col">신고자</th>
													<th scope="col">게시글 작성자</th>
													<th scope="col">게시글번호</th>
													<th scope="col">신고 사유</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${warningBoardList}"
													var="warningBoardList">
													<tr>
														<td><c:out value="${warningBoardList.warning_no}" /></td>
														<td><c:out value="${warningBoardList.send_id}" /></td>
														<td><c:out value="${warningBoardList.receive_id}" /></td>
														<td><c:out
																value="${warningBoardList.warning_type_no}" /></td>
														<td><c:out value="${warningBoardList.warning_reason}" /></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>

							<!-- 댓글 신고 -->
							<div class="warning-table" style="padding-bottom: 30px">
								<div class="card">
									<div class="card-header">

										<h5 class="m-0 font-weight-bold">댓글 신고</h5>
									</div>
									<div class="card-body">
										<table id="reportWarningReply"
											class="table table-striped table-bordered">
											<thead>
												<tr>
													<th scope="col">#</th>
													<th scope="col">신고자</th>
													<th scope="col">댓글 작성자</th>
													<th scope="col">게시글번호</th>
													<th scope="col">신고 사유</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${warningReplyList}"
													var="warningReplyList">
													<tr>
														<td><c:out value="${warningReplyList.warning_no}" /></td>
														<td><c:out value="${warningReplyList.send_id}" /></td>
														<td><c:out value="${warningReplyList.receive_id}" /></td>
														<td><c:out
																value="${warningReplyList.warning_type_no}" /></td>
														<td><c:out value="${warningReplyList.warning_reason}" /></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>

							<!-- 쪽지 신고 -->
							<div class="warning-table" style="padding-bottom: 30px">
								<div class="card">
									<div class="card-header">

										<h5 class="m-0 font-weight-bold">쪽지 신고</h5>
									</div>
									<div class="card-body">
										<table id="reportWarningMessage"
											class="table table-striped table-bordered">
											<thead>
												<tr>
													<th scope="col">#</th>
													<th scope="col">신고자</th>
													<th scope="col">쪽지 작성자</th>
													<th scope="col">쪽지번호</th>
													<th scope="col">신고 사유</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${warningMessageList}"
													var="warningMessageList">
													<tr>
														<td><c:out value="${warningMessageList.warning_no}" /></td>
														<td><c:out value="${warningMessageList.send_id}" /></td>
														<td><c:out value="${warningMessageList.receive_id}" /></td>
														<td><c:out
																value="${warningMessageList.warning_type_no}" /></td>
														<td><c:out
																value="${warningMessageList.warning_reason}" /></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>



						</div>

					</div>

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

<script type="text/javascript">
    $('#reportWarningBoard').DataTable();
    $('#reportWarningReply').DataTable();
    $('#reportWarningUsers').DataTable();
    $('#reportWarningMessage').DataTable();
    $('#blockedUsers').DataTable();
    
    $(document).on("click", ".adminReportBtn", async function(e){
    Swal.fire({
    	  title: '본 회원을 정지 하시겠습니까?',
    	  text: "회원에게  ROlE_BLOCK 권한이 부여됩니다.",
    	  icon: 'warning',
    	  showCancelButton: true,
    	  confirmButtonColor: '#5D6DBE',
    	  cancelButtonColor: '#d33',
    	  confirmButtonText: '정지'
    	}).then((result) => {
    	  if (result.isConfirmed) {
    		  const userid = $(e.target).attr("value");
    		  
    		  $.ajax({
           		url: "/admin/blockUser.do", //컨트롤러로 보낼 uri
           		type: "POST", //보내는 방식
           		data: {'userid':userid},
           		success: function(data){
           			Swal.fire({
        				title: '정지 성공!',
        			  	text: '회원에게  ROlE_BLOCK 권한이 부여하였습니다.',
        			  	imageUrl: '/resources/images/successMonster.png',
        			  	imageWidth: 220,
        			  	imageHeight: 250,
        			  	width:400,
        			  	imageAlt: '성공',
        			})
            	    	    
            	    $(e.target).closest('tr').remove();
            	   	$('.dataTables_empty').remove(); //선택자 클래스라서 있으면 없애고 없애면 그냥 다음 코드 실행
            	    
            	    let waitingRelease ='<tr>'+
						'<td>'+ userid + '</td>' +
						'<td><button type="button" class="blockReleaseBtn" value="'+ userid + '">해제</button></td>'+
					'</tr>';
					
					$("#blockedUsers").find('tbody').append(waitingRelease);
           		},
           		error: function(request, status, error) { //에러 났을 경우 
           			Swal.fire({
        				title: '정지 실패...',
        				text: '',
        				imageUrl: '/resources/images/failMonster.png',
        				imageWidth: 220,
        				imageHeight: 250,
        				width:400,
        				imageAlt: '실패',
        			})
                }	
              });
    	  }
    	})
    });
    
    $(document).on("click", ".blockReleaseBtn", async function(e){
        Swal.fire({
        	  title: '본 회원의 정지를 해지 하시겠습니까?',
        	  text: "회원에게  ROlE_BLOCK 권한이 삭제됩니다.",
        	  icon: 'warning',
        	  showCancelButton: true,
        	  confirmButtonColor: '#5D6DBE',
        	  cancelButtonColor: '#d33',
        	  confirmButtonText: '정지'
        	}).then((result) => {
        	  if (result.isConfirmed) {
        		  const userid = $(e.target).attr("value");
        		  
        		  $.ajax({
               		url: "/admin/releaseUser.do", //컨트롤러로 보낼 uri
               		type: "POST", //보내는 방식
               		data: {'userid':userid},
               		success: function(data){
               			Swal.fire({
            				title: '해지 성공!',
            			  	text: 'ROLE_BLOCK 권한이 삭제 되었습니다',
            			  	imageUrl: '/resources/images/successMonster.png',
            			  	imageWidth: 220,
            			  	imageHeight: 250,
            			  	width:400,
            			  	imageAlt: '성공',
            			})
                	    $(e.target).closest('tr').remove();
               		},
               		error: function(request, status, error) { //에러 났을 경우 
               			Swal.fire({
            				title: '정지 실패...',
            				text: '',
            				imageUrl: '/resources/images/failMonster.png',
            				imageWidth: 220,
            				imageHeight: 250,
            				width:400,
            				imageAlt: '실패',
            			})
                    }	
                  });
        	  }
        	})
        });
    
    

    </script>


</html>