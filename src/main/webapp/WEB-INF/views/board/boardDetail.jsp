<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
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

#addReReplyForm {
	display: block;
}

.afterRegisterReReply{
	display: none !important;
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
	                                <textarea class="form-control" placeholder="댓글을 작성하세요"
	                                    id="reply_content" style="height: 110px; margin-bottom: 5px; "></textarea>
	                                 <hidden id="reply_userid">
	                                 <button class="btn" id="register_reply">등록</button>
	                                 <button class="btn" id="reply_reset">취소</button>
	                            </div>

    		                    </div>
    		                    
    		                    
    		                    
	                        </div>
                    	</div>
               		</div>
               		
                <script type="text/javascript">
                $(document).ready(function(){
                	
                	var operForm = $("#operForm");
                	
                	replyList();
                	
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
                	
                	  //대댓글 뷰 추가 230212
					$(document).on("click", ".add_reply", function(){
                    		let test1 = $(this).parents(); //멀쓸지 구분
                    		console.log("test2 : "+  test1);

                    		//var test = $(this).parents().eq(1); //쓸꺼
                    		
                    		let test = $(this).parents().children().eq(7);
                    		
                    		console.log(test);
                    		//$("#addReReplyForm").addClass(".writeReReplyForm");
                    		let area = $(this).parents().siblings('.reReplyForm');
                    		$(area).empty();
                    		$(area).append(
                    		//$(this).().append(
                    			'<div id="addReReplyForm" class="form-floating " style="width: 90%; float: right; padding-right: 10px;">'+
	                                '<textarea class="form-control" placeholder="댓글의 댓글을 작성하세요" ' +
	                                   ' id="reReply_content" style="height: 75px; margin-bottom: 5px; "></textarea> '+
	                                 '<hidden id="reply_userid"/>' +
	                                 '<button class="btn" id="register_reReply" onclick="register_reReply(this);" parent-value="15" style="float: right; margin-bottom: 5px;">등록</button>' +
	                                 /* '<button class="btn" id="reply_reset" style="float: right;">취소</button>' + */
	                            '</div>'
	                            
                    		);
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
          	                     	 'reply_content' : $('#reply_content').val()//댓글 내용 값
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
                
                	  
             });  //onreadyfunction 짝꿍
				
             
             	//대댓글 등록 함수
				function register_reReply(event){
            	 
              			const content = $('#reReply_content').val();
              			  
              			let parent_no = $(event).parent().parent().parent().attr("value"); //멀쓸지 구분
                		console.log("parent_no : " + parent_no );
              			  
              			  if (content == "") {
             	               alert("내용을 입력하세요");
             	            } else if (confirm("댓글의 댓글을 등록하시겠습니까?") == true) { //확인
             	               
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
                    		console.log('${userid}'); 
                    		
                    		let listReply = 
                                '<li>'+
                            		'<div style="padding-left:'+ dept +'% !important">'+
    		                        	'<div class="card" id="reply-card" value="'+replyList.reply_no+'">'+
    		                            '<div class="card-header">'+
    		                                '<strong class="card-title">'+replyList.nickname+'</strong> ';
											if(replyList.userid == '${userid}'){
												listReply +=
												'<span class="delete_reply badge float-right mt-1" data-value="'+replyList.reply_no +'">삭제</span>'+
	    		                                '<span class="badge float-right mt-1">수정</span>';
											}
    		                                
    		                   listReply += '<span class="add_reply badge float-right mt-1" data-value="'+replyList.reply_no +'">대댓글</span>'+
    		                                '<span class="badge mt-1">'+'&nbsp'+'&nbsp'+'&nbsp'+ replyList.reply_date+'</span>'+
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
                			console.log(request);
                		}
                	})
                }

                
                //댓글 삭제 함수
                function deleteReply(){
                //"data" : JSON.stringify({"reply_no": $(event.target).attr("data-value")}),
                //"data" : $(event.target).attr("data-value"),
                $(".delete_reply").on({
            		  click : (event) => {
            			  //let reply_no = $(event.target).attr("data-value");
            			 
            			   $.ajax({
                      		"url" : "/reply/reply.do",
                    		"type" : "delete",
                    		"data" : JSON.stringify($(event.target).attr("data-value")),
                    		"contentType":'application/json',
                    		"success" : (result)=>{
                    			console.log(result);
                    			replyList();
                    		},
                    		"error" : (request, status, error)=>{
                    			console.log(request.status);
         	                    console.log(request.responseText);
         	                    console.log(error);
                    		}  
            			  }) 
            		  }  
                }); 
                }
                
              

                
                

                </script>
        
        

</body>
</html>