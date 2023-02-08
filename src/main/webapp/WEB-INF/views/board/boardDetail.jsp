<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
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
                            <strong class="card-title" name='board_kind'><c:out value="${board.board_kind}"/></strong>
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
                        		
               
                        	<%-- 	<button data-oper='modify' class="btn btn-success" onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'">Modify</button>
                        		<button data-oper='list' class="btn btn-info" onclick="location.href='/board/list'">List</button> --%>
                        		
                        		<button data-oper='modify' class="btn btn-success" >수정</button>
                        		<button data-oper='list' class="btn btn-info">목록</button>
                        		<button data-oper='delete' class="btn btn-danger" >삭제</button>
                        		<%-- <a href="/board/boardList.do?board_kind=${board.board_kind}">목록</a> --%>

                        		<form id='operForm' action="" method="get">
                        			<input type='hidden' id="board_no" name='board_no' value='<c:out value="${board.board_no}" />'>
                        			<input type='hidden' id="board_kind" name='board_kind' value='<c:out value="${board.board_kind}" />'>
                        		</form>
                        	
                        </div>

               		</div>
               		
                <script type="text/javascript">
                $(document).ready(function(){
                	
                	var operForm = $("#operForm");
                	                     
                	$("button[data-oper='modify']").on("click", function(e){
                		operForm.find("#board_kind").remove();
                		operForm.attr("action", "/board/boardUpdate.do").submit();
                	});
                	
               	 $("button[data-oper='list']").on("click", function(e){
                		operForm.find("#board_no").remove();
                		operForm.attr("action", "/board/boardList.do");
                		operForm.submit();
                	});

                	$("button[data-oper='delete']").on("click", function(e){
                		operForm.attr("action", "/board/boardDelete.do").submit();
                	});
                	
                });
                </script>
        
        

</body>
</html>