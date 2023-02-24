<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
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
		  <!-- /header -->
        <!-- Header-->
        <div class="content">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12 board">
                         <div class="card">
                            <div class="card-header">
                                 <h5 class="m-0 font-weight-bold board_kind"><c:out value="${userid}"/>님의 페이지</h5>
                            </div>
                           <div class="card-body">
                           	<div class="myBoard">
                           		<h3 style="padding-bottom: 12px; padding-left: 10px; font-weight: bold">내가 쓴 게시글</h3>
                                <table id="myBoard" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>카테고리</th>
                                            <th>제목</th>
                                            <th>작성일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${myBoardList}" var="myBoardList">
										<tr>
											<td><c:out value="${myBoardList.board_no}" /></td>
											<td><c:out value="${myBoardList.board_kind}" /></td>
											<td><a href="/board/boardDetail.do?board_no=${myBoardList.board_no}"><c:out value="${myBoardList.board_name}" /></a></td>
											<td><c:out value="${myBoardList.board_date}" /></td>
										</tr>
									</c:forEach> 
                                    </tbody>
                                </table>
                                </div>
                                
                                <div class="myReplyBoard" style="padding-top: 75px;">
                                <h3 style="padding-bottom: 12px;  padding-left: 10px; font-weight: bold">댓글 단 게시글</h3>
                                <table id="myReply" class="table table-striped table-bordered">
                                	<thead>
                                		<tr>
                                			<th>#</th>
                                            <th>카테고리</th>
                                            <th>제목</th>
                                            <th>작성일</th>
                                		</tr>
                                	</thead>
                                		<tbody>
                                        <c:forEach items="${myReplyBoardList}" var="myReplyBoardList">
										<tr>
											<td><c:out value="${myReplyBoardList.board_no}" /></td>
											<td><c:out value="${myReplyBoardList.board_kind}" /></td>
											<td><a href="/board/boardDetail.do?board_no=${myReplyBoardList.board_no}"><c:out value="${myReplyBoardList.board_name}" /></a></td>
											<td><c:out value="${myReplyBoardList.board_date}" /></td>
										</tr>
									</c:forEach> 
                                    </tbody>
                                	
                                
                                
                                </table>
								</div>

                            </div>  
                        </div>
                        
                    </div>


                </div>
                
            </div><!-- .animated -->
        </div><!-- .content -->


        <div class="clearfix"></div>

		<jsp:include page="/WEB-INF/views/include/footer.jsp" />

    </div><!-- /#right-panel -->

    <!-- Right Panel -->




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
    $('#myBoard').DataTable();
    $('#myReply').DataTable();

  </script>


</body>
</html>