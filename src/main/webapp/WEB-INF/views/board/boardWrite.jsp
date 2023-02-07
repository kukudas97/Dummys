<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
		  <!-- /header -->
        <!-- Header-->
        
					<div class="card">
                          <div class="card-header">
                            <strong>${param.board_kind} 글쓰기</strong>
                        </div>
                        <div class="card-body card-block">
                            <form role="form" action="/board/boardWrite.do" method="post">
                        		<div class="form-group">
                        			<label>Title</label> 
                        			<input type="hidden" value="${param.board_kind}" name="board_kind">
                        			<input class="form-control" name='board_name'>   		
                        		</div>
                        		<div class="form-group">
                        			<label>Text area</label>
                        			<textarea class="form-control" rows="3" name='board_content'></textarea>
                        		</div>
                        	<!-- 	
                        		<div class="form-group">
                        			<label>Writer</label> 
                        			<input class="form-control" name="writer">
                        		</div> -->
                        		
                        		<input class="btn btn-success" type="submit" value="글쓰기">
                        		<input class="btn btn-warning" type="reset" value="Reset">
                        	</form>
                        </div>
                    </div>
</body>
</html>