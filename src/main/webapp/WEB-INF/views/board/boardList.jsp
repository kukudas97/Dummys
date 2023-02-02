<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ela Admin - HTML5 Admin Template</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="/resources/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

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

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">Data Table</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
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
											<%-- <td><a href='/board/get?board=<c:out value="${boardList.board_name}"/>'><c:out value="${board.title}" /> </a></td> --%>
											<td><c:out value="${boardList.board_name}" /></td>
											<td><c:out value="${boardList.nickname}" /></td>
											<td><c:out value="${boardList.board_date}" /></td>
										</tr>
									</c:forEach>
                                    </tbody>
                                </table>
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
          $('#bootstrap-data-table-export').DataTable();
      } );
  </script>


</body>
</html>