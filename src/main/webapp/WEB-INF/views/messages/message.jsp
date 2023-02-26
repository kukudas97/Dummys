<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/resources/images/DummysFavicon.png" type="image/x-icon" sizes="16x16">
<!-- CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Bootstrap 5 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 .sendTr, .receiveTr{
 	cursor : pointer;
 }
 #receivecheck1{
 	opacity : 0.3;
 }
</style>
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
								<div class="sendmessagestorage">
									<h3>보낸 쪽지함</h3>
									<table class="table table-striped table-bordered" id="sendmessagestorage">
										<thead>
											<tr>
												<th>#</th>
												<th>받은사람</th>
												<th>제목</th>
												<th>보낸시간</th>
												<th>삭제</th>
											</tr>
										</thead>
								 		<tbody>
											<c:forEach items="${myMessagesendList}" var="myMessagesendList">
												<tr>
													<td><c:out value="${myMessagesendList.message_no}" /></td>
													<td><c:out value="${myMessagesendList.receive_id}" /></td>
													<td  class="sendTr" data-bs-toggle="modal" data-bs-target="#exampleModal1" data-bs-whatever="@getbootstrap"><c:out value="${myMessagesendList.message_name}" /><input class="message_content" type="hidden" value="${myMessagesendList.message_content }"></td>
													<td><c:out value="${myMessagesendList.message_date}" /></td>
													<td><button class="send_delBtn" data-value="${myMessagesendList.message_no}">삭제</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

								<div class="receivemessagestorage">
									<h3>받은 쪽지함</h3>
									<table class="table table-striped table-bordered" id="receivemessagestorage">
										<thead>
											<tr>
												<th>#</th>
												<th>보낸사람</th>
												<th>제목</th>
												<th>받은시간</th>
												<th>삭제</th>
											</tr>
										</thead>
								 		<tbody>
											<c:forEach items="${myMessagereceiveList}" var="myMessagereceiveList">
												<c:choose>
													<c:when test="${myMessagereceiveList.message_check eq 1}">
														<tr id="receivecheck1" >
															<td><c:out value="${myMessagereceiveList.message_no}" /></td>
															<td><c:out value="${myMessagereceiveList.send_id}" /></td>
															<td class="receiveTr"  data-bs-toggle="modal" data-bs-target="#exampleModal2" data-bs-whatever="@getbootstrap"><c:out value="${myMessagereceiveList.message_name}" /><input class="message_content" type="hidden" value="${myMessagereceiveList.message_content }"></td>
															<td><c:out value="${myMessagereceiveList.message_date}" /></td>
															<td><button class="receive_delBtn" data-value="${myMessagereceiveList.message_no}">삭제</button></td>
														</tr>
													</c:when>
													<c:otherwise>
														<tr id="receivecheck">
														<td><c:out value="${myMessagereceiveList.message_no}" /></td>
														<td><c:out value="${myMessagereceiveList.send_id}" /></td>
														<td class="receiveTr"  data-bs-toggle="modal" data-bs-target="#exampleModal2" data-bs-whatever="@getbootstrap"><c:out value="${myMessagereceiveList.message_name}" /><input class="message_content" type="hidden" value="${myMessagereceiveList.message_content }"></td>
														<td><c:out value="${myMessagereceiveList.message_date}" /></td>
														<td><button class="receive_delBtn" data-value="${myMessagereceiveList.message_no}">삭제</button></td>
													</tr>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</tbody> 
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
			            <input type="text" class="form-control" name="message_name" id="recipient-name">
			          </div>
			          
			          <div class="mb-3">
			            <label for="message-text" class="col-form-label">쪽지 내용:</label>
			            <div class="form-floating">
			            <textarea class="form-control" id="floatingTextarea2" name="message_content" placeholder="Leave a comment here" style="height: 100px"></textarea>
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
		<!-- 보낸 쪽지함 모달 -->
			<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel"></h5>
			      </div>
			      <div class="modal-body">

			        <form action="" method="post" id="send_modal">
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">보낸 사람:</label>
			            <input type="text" class="form-control" id="send-name" name="send_id" value="${userid}" readonly>
			          </div>
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">받는 사람:</label>
			            <input type="text" class="form-control" name="receive_id" value="" readonly id="recipient-name">
			          </div>
			          
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">쪽지 제목:</label>
			            <input type="text" class="form-control" name="message_name" value="" readonly id="recipient-name">
			          </div>
			          
			          <div class="mb-3">
			            <label for="message-text" class="col-form-label" >쪽지 내용:</label>
			            <div class="form-floating">
			            <textarea class="form-control" id="floatingTextarea2" name="message_content" value="" readonly placeholder="Leave a comment here" style="height: 100px"></textarea>
			          	<label for="floatingTextarea2">Comments</label>
			          	</div>
			          </div>

			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			      </div>
			       </form>
			    </div>
			  </div>
			</div>
		
		<!-- 받은 쪽지함 모달 -->
			<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel"></h5>
			      </div>
			      <div class="modal-body">
			        <form action="" method="post" id="receive_modal">
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">보낸 사람:</label>
			            <input type="text" class="form-control" id="send-name" name="send_id"value="<c:out value=""/>" readonly>
			          </div>
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">받는 사람:</label>
			            <input type="text" class="form-control" name="receive_id" value="${userid}" readonly id="recipient-name">
			          </div>
			          
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">쪽지 제목:</label>
			            <input type="text" class="form-control" name="message_name" value="<c:out value=""/>" readonly id="recipient-name">
			          </div>
			          
			          <div class="mb-3">
			            <label for="message-text" class="col-form-label" >쪽지 내용:</label>
			            <div class="form-floating">
			            <textarea class="form-control" id="message_content" name="message_content" value="" readonly placeholder="Leave a comment here" style="height: 100px"></textarea>
			          	<label for="floatingTextarea2">Comments</label>
			          	</div>
			          </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" data-value="report">신고하기</button>
			        <button type="button" id="resendmessage" class="btn btn-primary" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">답장 보내기</button>
			      </div>
			       </form>
			    </div>
			  </div>
			</div>
		
<!-- 받는사람 있는지 확인하는 ajax -->
<script type="text/javascript">
let chooseMessageNo = 0; //변수선언 receivetr 클릭하면 message_no 가져온다. 거기서 저장된 chooseMessageNO를 button[data-value='report'] 여기서 receive_id 가져올때 쓴다...
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
           				Swal.fire({
           					title: '메세지 전송에 성공!',
           					text: '',
           				  	imageUrl: '/resources/images/successMonster.png',
           					imageWidth: 220,
           					imageHeight: 250,
           					width:400,
           					imageAlt: '성공',
           				}).then(()=>{
           					$("#formdata").submit();	
           				})
           			 }else {
           				Swal.fire({
           					title: '메세지 전송에 실패...',
           					text: '',
           					imageUrl: '/resources/images/failMonster.png',
           					imageWidth: 220,
           					imageHeight: 250,
           					width:400,
           					imageAlt: '실패',
           				})
           			 }         			
           		},
           		error: function() { //에러 났을 경우 
           			Swal.fire({
       					title: '메세지 전송에 실패...',
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
	  		    
  });

$('.receiveTr').on({
	click :(event) =>{
		let tr = $(event.target).closest('tr');
		const td = $(tr).children('td');
		const modal = $('#receive_modal');
		//send_id receive_id message_name message_content
		$(modal).find('[name=send_id]').val($(td[1]).text());
		$(modal).find('[name=message_name]').val($(td[2]).text());
		$(modal).find('[name=message_content]').val($(td[2]).find('input').val());
		chooseMessageNo = $(td[0]).text();
		const message_no = $(td[0]).text()
		console.log(message_no)
		$.ajax({
			url : "/message/readcheck.do",
			type : "POST",
			data : {
				'message_no' : message_no
			},
			success :function(){
				$(event.target).closest('tr').css("opacity","0.3");
			}
		})
	}
})

$('.sendTr').on({
	click :(event) =>{
		let tr = $(event.target).closest('tr');
		const td = $(tr).children('td');
		const modal = $('#send_modal');
		//send_id receive_id message_name message_content
		$(modal).find('[name=receive_id]').val($(td[1]).text());
		$(modal).find('[name=message_name]').val($(td[2]).text());
		$(modal).find('[name=message_content]').val($(td[2]).find('input').val());
	}
})

$('#resendmessage').on({
	click :(event) =>{
		let id = $('#receive_modal input[name=send_id]').val();
		$('#formdata input[name=receive_id]').val(id);
	}
})

$(".send_delBtn").on({
	click : (event)=>{
		let message_no = $(event.target).attr('data-value');
		let tr = $(event.target).closest('tr');
	 	 $.ajax({
			url : "/message/sendmessagedelete.do" ,
			type : "POST" ,
			data: {
				"message_no" : message_no
			}, 
			success : function(data){
				if(data>0){
					tr.remove();
					Swal.fire({
						title: '삭제 성공!',
						text: '',
					  	imageUrl: '/resources/images/successMonster.png',
						imageWidth: 220,
						imageHeight: 250,
						width:400,
						imageAlt: '성공',
					})
				}else{
					Swal.fire({
						title: '삭제 실패...',
						text: '',
						imageUrl: '/resources/images/failMonster.png',
						imageWidth: 220,
						imageHeight: 250,
						width:400,
						imageAlt: '실패',
					})
				}
			}, //success
			error: function() { //에러 났을 경우 
				Swal.fire({
					title: '삭제 실패...',
					text: '',
					imageUrl: '/resources/images/failMonster.png',
					imageWidth: 220,
					imageHeight: 250,
					width:400,
					imageAlt: '실패',
				})
			} //error
	 	 }); //ajax  
	}//click event
}) //on

$('.receive_delBtn').on({
	click : (event)=>{
		let message_no = $(event.target).attr('data-value');
		let tr = $(event.target).closest('tr');
		  $.ajax({
			url : "/message/receivemessagedelete.do" ,
			type : "POST" ,
			data: {
				"message_no" : message_no
			}, 
			success : function(data){
				if(data>0){
					tr.remove();
					Swal.fire({
						title: '삭제 성공!',
						text: '',
					  	imageUrl: '/resources/images/successMonster.png',
						imageWidth: 220,
						imageHeight: 250,
						width:400,
						imageAlt: '성공',
					})
				} else{
					Swal.fire({
						title: '삭제 실패...',
						text: '',
						imageUrl: '/resources/images/failMonster.png',
						imageWidth: 220,
						imageHeight: 250,
						width:400,
						imageAlt: '실패',
					})
				}
			},
			error: function() { //에러 났을 경우 
				Swal.fire({
					title: '삭제 실패...',
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

$("button[data-value='report']").on("click", async function(e){
                		const { value: text } = await Swal.fire({
                			  input: 'textarea',
                			  inputLabel: '본 쪽지를 신고하시겠습니까?',
                			  inputPlaceholder: '신고 사유를 입력해 주세요',
                			  showCancelButton: true
                			})
                			let datas = {
		                			receive_id:$("#receive_modal").find('[name=send_id]').val(),
		                			warning_type:"쪽지",
		                			warning_type_no: chooseMessageNo,
		                			warning_reason: text
		                		}

                		if (text) {
            				$.ajax({
         	            		url: "/warning/reportWarning.do", //컨트롤러로 보낼 uri
         	            		type: "POST", //보내는 방식
         	            		data: datas,
         	            		success: function(result){
         	            			if(result=="success"){
         	            				Swal.fire({
         	            					title: '신고 성공!',
         	            					text: '',
         	            				  	imageUrl: '/resources/images/successMonster.png',
         	            					imageWidth: 220,
         	            					imageHeight: 250,
         	            					width:400,
         	            					imageAlt: '성공',
         	            				})
           	            			} else if(result=="already"){
           	            				Swal.fire(
           	            					'이미 신고된 쪽지입니다!',
           	            				  	'',
           	            				 	 'question'
           	            				)
									}
         	            			
         	            		},
         	            		error: function(request, status, error) { //에러 났을 경우 
         	            			Swal.fire({
	        	           				title: '신고 실패...',
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
        	});



</script>
    <script type="text/javascript">
    $('#sendmessagestorage').DataTable();
    $('#receivemessagestorage').DataTable();

  </script>

	</div>
</body>
</html>