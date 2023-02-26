<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/resources/images/DummysFavicon.png" type="image/x-icon" sizes="16x16">
<style>
#write-reply {
	display: none;
}

.writeReplyForm {
	display: block !important;
}

#addReReplyForm {
	display: block;
}

.afterRegisterReReply {
	display: none !important;
}
#shareBtn{
	cursor:pointer;
}
</style>

</head>
<body>
	<se:authentication property="name" var="userid" />
	<!-- Left Panel -->
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
	<!-- /#left-panel -->
	<!-- Left Panel -->

	<!-- Right Panel -->
	<div id="right-panel" class="right-panel">

		<!-- Header-->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<!-- /Header-->
		<div class="content">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<strong class="card-title board_kind" name='board_kind'><c:out
							value="${board.board_kind}" /></strong>
				</div>
	
				<div class="card-body">
	
					<div class="form-group">
						<label>#</label> <input class="form-control board_detail"
							name='board_no' value='<c:out value="${board.board_no}"/>'
							readonly="readonly">
					</div>
	
					<div class="form-group">
						<label>제목</label> <input class="form-control board_detail"
							name='board_name' value='<c:out value="${board.board_name}"/>'
							readonly="readonly">
					</div>
	
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control board_detail" rows="3"
							name='board_content' readonly="readonly"><c:out
								value="${board.board_content}" /></textarea>
					</div>
	
					<div class="form-group">
						<label>작성자</label> <input class="form-control board_detail"
							name='nickname' value='<c:out value="${board.nickname}"/>'
							readonly="readonly">
					</div>
	
					<div class="form-group">
						<label>작성일</label> <input class="form-control board_detail"
							name='board_date' value='<c:out value="${board.board_date}" />'
							readonly="readonly">
					</div>
					<c:if test="${board.board_kind eq '공유게시판' }">
						<c:if test="${!empty shareSchema}">
							<div class="form-group">
								<label>공유 스키마</label><input id="shareBtn" class="form-control board_detail" value="&#35;${shareSchema.schema_no } &#39;${shareSchema.schema_name}&#39; 공유받기" readonly="readonly">
							</div>
						</c:if>
					</c:if>
	        
					<c:if test="${userid eq board.userid }">
					<button data-oper='modify' class="btn btn-success">수정</button>
					</c:if>
					<button data-oper='list' class="btn btn-info">목록</button>
					<c:if test="${userid eq board.userid }">
					<button data-oper='delete' class="btn btn-danger">삭제</button>
					</c:if>
					<c:if test="${userid ne board.userid }">
					<button data-oper='report' class="btn btn-warning">신고</button>
					</c:if>
					
					<%-- <a href="/board/boardList.do?board_kind=${board.board_kind}">목록</a> --%>
	
					<form id='operForm' action="" method="get">
						<input type='hidden' id="board_no" name='board_no' value='<c:out value="${board.board_no}" />'> 
						<input type='hidden' id="board_kind" name='board_kind' value='<c:out value="${board.board_kind}" />'>
					</form>
	
	
				</div>
	
				<div class="col-md-12">
					<div class="reply-card">
						<strong class="reply-title">댓글 </strong>
	
						<div class="reply-view row">
							<ul class="chat" id="reply" style="width: 100%"></ul>
						</div>
	
						<div class="add-reply">
							<button type="button" class="btn btn-outline-success btn-sm"
								id="addReplyBtn">댓글작성</button>
						</div>
	
						<div id="write-reply" class="form-floating ">
							<textarea class="form-control" placeholder="댓글을 작성하세요"
								id="reply_content" style="height: 110px; margin-bottom: 5px;"></textarea>
							<hidden id="reply_userid">
							<button class="btn" id="register_reply">등록</button>
							<button class="btn" id="reply_reset">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
                $(document).ready(function(){
                	
                	var operForm = $("#operForm");
                	
                	replyList();
                	
                	$('#shareBtn').on({
                		click : ()=>{
                			location.href= '${pageContext.request.contextPath}/schema/schemaDetail.do?schema_no=${shareSchema.schema_no}';
                		}
                	})
                	
                	//해당 게시물 수정 버튼
                	$("button[data-oper='modify']").on("click", function(e){
                		operForm.find("#board_kind").remove();
                		operForm.attr("action", "/board/boardUpdate.do").submit();
                	});
                	
                	//게시글 조회로 돌아가는 버튼
               	   $("button[data-oper='list']").on("click", function(e){
                		operForm.find("#board_no").remove();
                		operForm.attr("action", "/board/boardList.do");
                		operForm.submit();
                	});
					
                	//해당 게시물 삭제 버튼
                	$("button[data-oper='delete']").on("click", function(e){
                		Swal.fire({
                			  title: '해당 게시물을 삭제하시겠습니까?',
                			  text: "",
                			  icon: 'question',
                			  showCancelButton: true,
                			  confirmButtonColor: '#3085d6',
                			  cancelButtonColor: '#d33',
                			  confirmButtonText: '삭제 합니다'
                			}).then((result) => {
                			  if (result.isConfirmed) {
                				  Swal.fire({
	            				      title: '게시글 삭제',
									  imageUrl: '/resources/images/successMonster.png',
									  imageWidth: 220,
									  imageHeight: 250,
									  imageAlt: 'Custom image',
									  width:400
									}).then(()=>{
                  				  operForm.attr("action", "/board/boardDelete.do").submit();
                			    })
                			  }
                			})
                	});
                	
                	//해당 게시물 신고 버튼 //20230218
                	$("button[data-oper='report']").on("click", async function(e){
                		const { value: text } = await Swal.fire({
                			  input: 'textarea',
                			  inputLabel: '본 게시글을 신고하시겠습니까?',
                			  inputPlaceholder: '신고 사유를 입력해 주세요',
                			  showCancelButton: true
                			})
                			let datas = {
		                			receive_id:'${board.userid}',
		                			warning_type:"게시글",
		                			warning_type_no: '${board.board_no}',
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
		            				      title: '게시글 신고',
										  imageUrl: '/resources/images/successMonster.png',
										  imageWidth: 220,
										  imageHeight: 250,
										  imageAlt: 'Custom image',
										  width:400
										})
           	            			} else if(result=="already"){
           	            				Swal.fire("이미 신고한 게시글 입니다")
									}
         	            			
         	            		},
         	            		error: function(request, status, error) { //에러 났을 경우 
         	            			Swal.fire({
		            				      title: '게시글 신고 에러',
										  imageUrl: '/resources/images/failMonster.png',
										  imageWidth: 220,
										  imageHeight: 250,
										  imageAlt: 'Custom image',
										  width:400
										})
                              }	
         	               });
            			}
        	});

                	//댓글 달기 폼 호출 버튼
                	$("#addReplyBtn").on({
                		click : ()=>{
                			$("#write-reply").addClass("writeReplyForm");
                		}
                	});
                	
                	//댓글 달기 취소 버튼
                	$("#reply_reset").on({
                		click : ()=>{
                			$("#write-reply").removeClass("writeReplyForm");
                		} 
                	});
                	
                	  //대댓글 뷰 추가 230212
					$(document).on("click", ".add_reply", function(){

                    		let area = $(this).parents().siblings('.reReplyForm');
                    		$(area).empty();
                    		$(area).append(
                    			'<div id="addReReplyForm" class="form-floating " style="width: 90%; float: right; padding-right: 10px;">'+
	                                '<textarea class="form-control" placeholder="댓글의 댓글을 작성하세요" ' +
	                                   ' id="reReply_content" style="height: 75px; margin-bottom: 5px; "></textarea> '+
	                                 '<hidden id="reply_userid"/>' +
	                                 '<button class="btn" id="register_reReply" onclick="register_reReply(this);" parent-value="15" style="float: right; margin-bottom: 5px;">등록</button>' +
	                            '</div>'
	                            
                    		);
                    });
                    		
                    //댓글 신고 230218
					$(document).on("click", ".report", async function(e){
                		const { value: text } = await Swal.fire({
              			  input: 'textarea',
              			  inputLabel: '본 댓글을 신고하시겠습니까?',
              			  inputPlaceholder: '신고 사유를 입력해 주세요',
              			  showCancelButton: true
              			});

              			let datas = {
		                			"receive_id":$(e.target).attr("reply-writer"),
		                			"warning_type":"댓글",
		                			"warning_type_no": $(e.target).attr("data-value"),
		                			"warning_reason": text
		                		}
                		

                		if (text) {
            				$.ajax({
         	            		url: "/warning/reportWarning.do", //컨트롤러로 보낼 uri
         	            		type: "POST", //보내는 방식
         	            		data: datas,
         	            		success: function(result){
         	            			if(result=="success"){
           	            				Swal.fire({
                      				      title: '신고가 완료되었습니다',
          								  imageUrl: '/resources/images/successMonster.png',
          								  imageWidth: 220,
          								  imageHeight: 250,
          								  imageAlt: 'Custom image',
          								  width:400
          								})
           	            			} else if(result=="already"){
           	            				Swal.fire("이미 신고한 게시글 입니다")
									}
         	            			
         	            		},
         	            		error: function(request, status, error) { //에러 났을 경우 
         	            			Swal.fire({
                  				      title: '신고 실패',
      								  imageUrl: '/resources/images/failMonster.png',
      								  imageWidth: 220,
      								  imageHeight: 250,
      								  imageAlt: 'Custom image',
      								  width:400
      								})
                              }	
         	               });
            			}
        	});
                	  
                	
                	//댓글 비동기로 삽입후 나열        
                	$("#register_reply").on({
              		  click : () => {
              			  const content = $('#reply_content').val();
              			  
              			  if (content == "") {
              				Swal.fire(
                				      '내용을 입력하세요',
                				      '',
                				      'warning'
                				    )
             	            } else { 
             	            	//확인
             	            	Swal.fire({
								  title: '댓글을 등록하시겠습니까?',
								  text: "",
								  icon: 'question',
								  showCancelButton: true,
								  confirmButtonColor: '#3085d6',
								  cancelButtonColor: '#d33',
								  confirmButtonText: '등록 확인'
								}).then((result) => {
								  if (result.isConfirmed) {
									//비동기 함수 호출
		             	               $.ajax({
		             	            		url: "/reply/reply.do", //컨트롤러로 보낼 uri
		             	            		type: "POST", //보내는 방식
		             	            		dataType : "JSON", //컨트롤러에서 데이터 받을 때 형식 JSON
		             	            		data: { //뷰에서 보내는 정보들
		             	            		 'board_no' : '${board.board_no}',
		          	                     	 'reply_content' : $('#reply_content').val()//댓글 내용 값
		          	                  },
		             	            		success: function(data){
		             	            			replyList();
		             	            			$('#reply_content').val('');
		             	            			$("#write-reply").removeClass("writeReplyForm");
		             	            			
		             	            		},
		             	            		error: function(request, status, error) { //에러 났을 경우 
		             	            			Swal.fire({
		                        				      title: '댓글 삽입 에러',
		            								  imageUrl: '/resources/images/failMonster.png',
		            								  imageWidth: 220,
		            								  imageHeight: 250,
		            								  imageAlt: 'Custom image',
		            								  width:400
		            								})
		                                  }	
		             	               });
		             	           
								  }
								  
								  
								})
             	            
                          	}
              	  	}     
              	  });
  
             });  //onreadyfunction 짝꿍
				
             
             	//대댓글 등록 함수
				function register_reReply(event){
              			const content = $('#reReply_content').val();  
              			let parent_no = $(event).parent().parent().parent().attr("value"); //멀쓸지 구분

              			  if (content == "") {
              				Swal.fire(
              				      '내용을 입력하세요',
              				      '',
              				      'warning'
              				    )
             	            } /// if (content == "") 끝
              			  else { //확인
             	               //스윗얼랏으로 입력하시겠습니까 띄우고
             	               Swal.fire({
								  title: '댓글의 댓글을 입력하시겠습니까?',
								  text: "",
								  icon: 'question',
								  showCancelButton: true,
								  confirmButtonColor: '#3085d6',
								  cancelButtonColor: '#d33',
								  confirmButtonText: '등록'
								}).then((result) => {
								  if (result.isConfirmed) {
									//비동기 함수 호출
		             	               $.ajax({
		             	            		url: "/reply/reReply.do", //컨트롤러로 보낼 uri
		             	            		type: "POST", //보내는 방식
		             	            		dataType : "JSON", //컨트롤러에서 데이터 받을 때 형식 JSON
		             	            		data: { //뷰에서 보내는 정보들	
		             	            		 'parent_reply_no' : parent_no, //부모 댓글의 번호 가져가야함
		          	                     	 'reReply_content' : content//댓글 내용 값
		          	                  },
		             	            		success: function(data){
		             	            			
		             	            			$("#addReReplyForm").addClass("afterRegisterReReply"); //등록 성공하면 대댓글 입력란 사라짐
		             	            			replyList();
		             	            			
		             	            		},
		             	            		error: function(request, status, error) { //에러 났을 경우 
		             	            			Swal.fire({
		  		            				      title: '댓글의 댓글 삽입 에러',
		  										  imageUrl: '/resources/images/failMonster.png',
		  										  imageWidth: 220,
		  										  imageHeight: 250,
		  										  imageAlt: 'Custom image',
		  										  width:400
		  										})
		             	            			
		                                  }	
		             	               }); // $ajax 끝
									  
		             	              
								  }
								})
                          	} // else if 끝
             	           	
              	  	}
                
                //비동기로 댓글 나열
                function replyList(){
                	$.ajax({
                		"url" : "/reply/reply.do",
                		"type" : "get",
                		"dataType" : "json", //return type
                		"data" : {"board_no": '${board.board_no}'},
                		"success" : (result)=>{

                		$('#reply').empty();
                			
                    	$(result).each(function(index, replyList){
                    		
                    		 let dept= 6*(replyList.dept);
                    		
                    		let listReply = 
                                '<li>'+
                            		'<div style="padding-left:'+ dept +'% !important">'+
    		                        	'<div class="card" id="reply-card" value="'+replyList.reply_no+'">'+
    		                            '<div class="card-header">'+
    		                                '<strong class="card-title">'+replyList.nickname+'</strong> ';
											if(replyList.userid == '${userid}'){
												listReply +=
												'<span class="delete_reply badge float-right mt-1" data-value="'+replyList.reply_no+'">삭제</span>' ;
											}else if(replyList.userid !='${userid}'){
												listReply += 
													'<span class="report badge float-right mt-1" data-value="'+replyList.reply_no+'" reply-writer="'+replyList.userid+'">신고</span>' ;
											}
											
    		                                
    		                   listReply += '<span class="add_reply badge float-right mt-1" data-value="'+replyList.reply_no+'">대댓글</span>'+
    		                   				
    		                                '<span class="badge mt-1">'+'&nbsp'+'&nbsp'+'&nbsp'+replyList.reply_date+'</span>'+
    		                            '</div>'+
    		                            '<div class="card-body">'+
    		                                '<p class="card-text">'+replyList.reply_content+'</p>'+
    		                            '</div>'+
    		                            '<div class="reReplyForm"></div>'+
    		                        '</div>'+
    		                    '</div>'+
                        	'</li>';
                        	
                        	let deletedReply=
                        		'<div class="card">'+
	                				'<div class="deleted-reply" id="deletedCard">'+
		                           		'<div class="deleted-reply">' + '삭제된 댓글 입니다' + '</div>'+
		                       		 '</div>'+
	                       		 '</div>';
                    		
                    		
                    		//230211//////////////////////////////////
                    		if(result[index].reply_activate ==1){
                        		$('#reply').append(listReply);                       	
                    		} else if(result[index].reply_activate ==0){
                    			$('#reply').append(deletedReply);
                    		}	
                    	////////////////////////////////////
                    	
                    	})
                    	deleteReply();
                		},
                		
                		"error" : (request, status, error)=>{
                			Swal.fire({
            				      title: '댓글의 나열 에러',
								  imageUrl: '/resources/images/failMonster.png',
								  imageWidth: 220,
								  imageHeight: 250,
								  imageAlt: 'Custom image',
								  width:400
								})
                		}
                	})
                }

                
                //댓글 삭제 함수
                function deleteReply(){

                $(".delete_reply").on({
            		  click : (event) => {
            			  Swal.fire({
            				  title: '해당 댓글을 삭제하시겠습니까?',
            				  text: "",
            				  icon: 'warning',
            				  showCancelButton: true,
            				  confirmButtonColor: '#3085d6',
            				  cancelButtonColor: '#d33',
            				  confirmButtonText: '삭제 합니다'
            				}).then((result) => {
            				  if (result.isConfirmed) {
            					  $.ajax({
                                		"url" : "/reply/reply.do",
                              		"type" : "delete",
                              		"data" : JSON.stringify($(event.target).attr("data-value")),
                              		"contentType":'application/json',
                              		"success" : (result)=>{
                              			replyList();
                              		},
                              		"error" : (request, status, error)=>{
                              			Swal.fire({
	  		            				      title: '댓글 삭제 에러',
	  										  imageUrl: '/resources/images/failMonster.png',
	  										  imageWidth: 220,
	  										  imageHeight: 250,
	  										  imageAlt: 'Custom image',
	  										  width:400
	  										})

                              		}  
                      			  }) 
            				  }
            				})
            			 
            			   
            		  }  
                }); 
                }
                </script>
</body>
</html>