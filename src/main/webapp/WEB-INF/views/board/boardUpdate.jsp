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
                            <h5 class="m-0 font-weight-bold board_kind">Board Upate Page</h5>
                        </div>
                        <div class="card-body">
                        	<form role="form" action="" method="post">
                        		<div class="form-group">
                        			<label>#</label> 
                        			<input class="form-control board_detail" name='bno' value='<c:out value="${board.board_no}"/>' readonly="readonly">   		
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>제목 수정</label> 
                        			<input class="form-control" name='board_name' value='<c:out value="${board.board_name}"/>'>   		
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>게시글 수정</label> 
                        			<textarea class="form-control" rows="3" name='board_content' ><c:out value="${board.board_content}"/></textarea>  		
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>작성자</label> 
                        			<input class="form-control board_detail" name='nickname' value='<c:out value="${board.nickname}"/>' readonly="readonly">   		
                        		</div>
                        		
                        		<%-- <div class="form-group">
                        			<label>작성일</label> 
                        			<input class="form-control board_detail" name='board_date' value='<c:out value="${board.board_date}" />' readonly="readonly">   		
                        		</div> --%>
                        		
                        		<button data-oper='update' class="btn btn-success" >저장</button>
                        		<button data-oper='cancel' class="btn btn-secondary" >취소</button>
                        
                        	</form>
                        </div>

               		</div>
                <script type="text/javascript">
                $(document).ready(function(){
                	var formObj = $("form");
                	
                	$('button').on("click", function(e){
                		e.preventDefault();
                		
                		var operation = $(this).data("oper");
                		
                		console.log(operation);
                		
                		if(operation ==='cancel'){
                			 window.history.back();
                		}
                		
                		formObj.submit();
                		return;
                	});
                });
                </script>
        
        

</body>
</html>