<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/adminHead.jsp" />
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
</head>
<body>
	<div id="right-panel" class="right-panel">
		<jsp:include page="/WEB-INF/views/include/adminHeader.jsp" />
		<jsp:include page="/WEB-INF/views/include/adminSidebar.jsp" />
		<div id="main_content" class="main_content_height">
			<h1>Admin 차트 관리</h1>
			
			<div class="content">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                 <h5 class="m-0 font-weight-bold board_kind">타입 사용 조회</h5>
                            </div>
                            <div class="card-body">
                                <table id="boardListTable" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>타입</th>
                                            <th>제목</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%-- <c:forEach items="${boardList}" var="boardList">
										<tr>
											<td><c:out value="${boardList.board_no}" /></td>
											<td><a href="boardDetail.do?board_no=${boardList.board_no}">${boardList.board_name}</a></td>
										</tr> 
									</c:forEach> --%>
									
									
                                    </tbody>
                                    
                                </table>

                            	
                            	
                            	
                            </div>
                        </div>
                        
                    </div>


                </div>
                
            </div><!-- .animated -->
        </div><!-- .content -->
			
			
			
			
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>

</body>
</html>