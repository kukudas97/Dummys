<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/adminHead.jsp" />
</head>
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
				
				<!-- 게시글 신고 -->
				<div class="warning-table" style="padding-bottom: 30px">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="m-0 font-weight-bold">게시글 신고</h5>
                        </div>
                        <div class="card-body">
                            <table id="reportWarningBoard" class="table table-striped table-bordered">
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
                                  <c:forEach items="${warningBoardList}" var="warningBoardList">
										<tr>
											<td><c:out value="${warningBoardList.warning_no}" /></td>
											<td><c:out value="${warningBoardList.send_id}" /></td>
											<td><c:out value="${warningBoardList.receive_id}" /></td>
											<td><c:out value="${warningBoardList.warning_type_no}" /></td>
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
                            <table id="reportWarningReply" class="table table-striped table-bordered">
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
                                  <c:forEach items="${warningReplyList}" var="warningReplyList">
										<tr>
											<td><c:out value="${warningReplyList.warning_no}" /></td>
											<td><c:out value="${warningReplyList.send_id}" /></td>
											<td><c:out value="${warningReplyList.receive_id}" /></td>
											<td><c:out value="${warningReplyList.warning_type_no}" /></td>
											<td><c:out value="${warningReplyList.warning_reason}" /></td>
										</tr>
									</c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                   </div>
                    
                    <!-- 사용자별 누적 신고 -->  
                   <div class="warning-table" style="padding-bottom: 30px"> 
                  	<div class="card">
                        <div class="card-header">
                            <h5 class="m-0 font-weight-bold">사용자별 누적 신고</h5>
                        </div>
                        <div class="card-body">
                            <table id="reportWarningUsers" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">USERID</th>
                                        <th scope="col">누적 신고 수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  <c:forEach items="${warningCnt}" var="warningCnt">
										<tr>
											<td><c:out value="${warningCnt.receive_id}" /></td>
											<td><c:out value="${warningCnt.warning_cnt}" /></td>
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
    <script>
    $('#reportWarningBoard').DataTable();
    $('#reportWarningReply').DataTable();
    $('#reportWarningUsers').DataTable();
    </script>
</html>