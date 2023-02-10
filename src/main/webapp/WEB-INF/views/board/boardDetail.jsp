<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
<style>
#write-reply{
	display:none;
}
.writeReplyForm{
	display: block !important;
}
</style>

</head>
<body>
    <!-- Left Panel -->
<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
    <!-- /#left-panel -->
    <!-- Left Panel -->

    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">

        <!-- Header-->
		  <jsp:include page="/WEB-INF/views/include/header.jsp" />
        <!-- /Header-->
                   <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <strong class="card-title board_kind" name='board_kind'><c:out value="${board.board_kind}"/></strong>
                        </div>
                        
                        <div class="card-body">
                        	
                        		<div class="form-group">
                        			<label>#</label> 
                        			<input class="form-control board_detail" name='board_no' value='<c:out value="${board.board_no}"/>' readonly="readonly">   		
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>제목</label> 
                        			<input class="form-control board_detail" name='board_name' value='<c:out value="${board.board_name}"/>' readonly="readonly">   		
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>내용</label> 
                        			<textarea class="form-control board_detail" rows="3" name='board_content' readonly="readonly" ><c:out value="${board.board_content}"/></textarea>  		
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>작성자</label> 
                        			<input class="form-control board_detail" name='nickname' value='<c:out value="${board.nickname}"/>' readonly="readonly">   		
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>작성일</label> 
                        			<input class="form-control board_detail" name='board_date' value='<c:out value="${board.board_date}" />' readonly="readonly">   		
                        		</div>
                        		
                        		<button data-oper='modify' class="btn btn-success" >수정</button>
                        		<button data-oper='list' class="btn btn-info">목록</button>
                        		<button data-oper='delete' class="btn btn-danger" >삭제</button>
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
	                        		<button type="button" class="btn btn-outline-success btn-sm" id="addReplyBtn">댓글작성</button>
	                            </div>
	                            
	                            <div id="write-reply" class="form-floating ">
	                                <textarea class="form-control" placeholder="Leave a comment here"
	                                    id="reply_content" style="height: 150px;"></textarea>
	                                 <hidden id="reply_userid">
	                                 <button class="btn" id="register_reply">등록</button>
	                                 <button class="btn" id="reply_reset">취소</button>
	                            </div>
	                        </div>
                    	</div>
               		</div>
               		
                <script type="text/javascript">
                $(document).ready(function(){
                	
                	var operForm = $("#operForm");
                	
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
                		operForm.attr("action", "/board/boardDelete.do").submit();
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
                	
                	//댓글 비동기로 삽입후 나열        
                	$("#register_reply").on({
              		  click : () => {
              			  const content = $('#reply_content').val();
              			  
              			  if (content == "") {
             	               alert("내용을 입력하세요");
             	            } else if (confirm("댓글을 등록하시겠습니까?") == true) { //확인
             	               
             	            	//비동기 함수 호출
             	               $.ajax({
             	            		url: "/reply/reply.do", //컨트롤러로 보낼 uri
             	            		type: "POST", //보내는 방식
             	            		dataType : "JSON", //컨트롤러에서 데이터 받을 때 형식 JSON
             	            		data: { //뷰에서 보내는 정보들
             	            		 'board_no' : '${board.board_no}',
          	                     	 'reply_content' : $('#reply_content').val(),//댓글 내용 값
          	                  },
             	            		success: function(data){
             	            			replyList();
             	            			$('#reply_content').val('');
             	            			$("#write-reply").removeClass("writeReplyForm");
             	            			
             	            		},
             	            		error: function(request, status, error) { //에러 났을 경우 
             	                      alert("code:" + request.status + "\n"
            	                           + "message:" + request.responseText
            	                           + "\n" + "error:" + error);
                                  }	
             	               });
                          	}
             	           	else { //취소
            	               alert("취소하였습니다.");
            	               return false;
              		  		}
              	  	}     
              	  });
                });
                
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
                			let listReply = 
                                '<li>'+
                            		'<div class="col-md-12">'+
    		                        	'<div class="card">'+
    		                            '<div class="card-header">'+
    		                                '<strong class="card-title">'+replyList.nickname+'</strong> <small><span class="badge float-right mt-1">'+ replyList.reply_date+'</span></small>'+
    		                            '</div>'+
    		                            '<div class="card-body">'+
    		                                '<p class="card-text">'+replyList.reply_content+'</p>'+
    		                            '</div>'+
    		                        '</div>'+
    		                    '</div>'+
                        	'</li>';
                        	$('#reply').append(listReply);
                    	})
                		},
                		"error" : (request, status, error)=>{
                		}
                	})
                }
                replyList();

                </script>
        
        

</body>
</html>