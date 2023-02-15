<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<!--         <div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>Dashboard</h1>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
 -->
        <div class="content">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12 board">
                        <div class="card">
                            <div class="card-header">
                                 <h5 class="m-0 font-weight-bold board_kind"><c:out value="${board_kind}"/></h5>
                            </div>
                            <div class="card-body">
                                <table id="boardListTable" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>글 번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${boardList}" var="boardList">
										<tr>
											<td><c:out value="${boardList.board_no}" /></td>
											<td><a href="boardDetail.do?board_no=${boardList.board_no}">${boardList.board_name}</a></td>
											<td><c:out value="${boardList.nickname}" /></td>
											<td><c:out value="${boardList.board_date}" /></td>
										</tr>
									</c:forEach> 
									
									
                                    </tbody>
                                    
                                </table>
                                
                                

                                <c:choose>
	                                <c:when test = "${board_kind eq '공지사항'}" >
		                                <se:authorize access="hasRole('ROLE_ADMIN')">
						                    <div class="boardWriteButton">
						                    <a href="${pageContext.request.contextPath}/board/boardWrite.do?board_kind=${board_kind}"><input class="btn btn-outline-success" type="button" value="글쓰기"></a>
						                    </div>
									   </se:authorize>
	                            	</c:when>
	                            	<c:otherwise>
		                                <se:authorize access="isAuthenticated()">
						                    <div class="boardWriteButton">
						                    <a href="${pageContext.request.contextPath}/board/boardWrite.do?board_kind=${board_kind}"><input class="btn btn-outline-success" type="button" value="글쓰기"></a>
						                    </div>
									   </se:authorize>
	                            	</c:otherwise>
                            	</c:choose>
                            	
                            	
                            	
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
        $(document).ready(function() {
          $('#boardListTable').DataTable({
        	  order:[[0, "desc"]]
          });
      } );
  </script>


</body>
</html>