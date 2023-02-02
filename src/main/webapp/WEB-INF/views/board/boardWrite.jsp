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
                            <strong>자유게시판 글쓰기</strong>
                        </div>
                        <div class="card-body card-block">
                            <form action="" method="post">
                                <div class="form-group"><label class=" form-control-label">작성자</label><input type="text" placeholder="Enter Email.." class="form-control"></div>
                                <div class="form-group"><label class=" form-control-label">제목</label><input type="text" placeholder="제목을 입력하세요" class="form-control"><span class="help-block">제목</span></div>
                            </form>
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary btn-sm">
                                <i class="fa fa-dot-circle-o"></i> Submit
                            </button>
                            <button type="reset" class="btn btn-danger btn-sm">
                                <i class="fa fa-ban"></i> Reset
                            </button>
                        </div>
                    </div>
</body>
</html>