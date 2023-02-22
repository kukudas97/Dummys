<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Dummy's</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    
    
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 

     <link rel="icon" href="/resources/images/DummysFavicon.png" type="image/x-icon" sizes="16x16">

     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    
    <script src="/resources/js/main.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css" rel="stylesheet" />
 
<style>
  @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
  
  .board h3 {
  padding-left: 20px;
  padding-top: 10px;
  padding-bottom: 10px;
  font-weight: bold;
  color: #40ba59;
  text-shadow: 1px 1px 1px gray;
  }
  
  .log-out, .forward-page{
  font-weight: bold;
  padding-left: 20px;
  padding-top: 20px;
  font-size: 17px;
  
  } 
</style>
</head>
<body class="bg-flat-color-7">
<se:authentication property="name" var="userid" />
        <div class="content">
            <div class="animated fadeIn">
                <div class="row">
                <img class="align-content logo" src="/resources/images/DummysLogo.png"><br>
                    <div class="col-md-12 board">
                    <h3>${userid} 님의 신고 내역 입니다.</h3>
                    <a href="${pageContext.request.contextPath}/logout" class="log-out">로그아웃</a>
                        <div class="card">
                            <div class="card-header">
                                 <h5 class="m-0 font-weight-bold board_kind">신고된 게시글</h5>
                            </div>
                            <div class="card-body">
                                <table id="ReportBoardListTable" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>게시판</th>
                                            <th>제목</th>
                                            <th>#</th>
                                            <th>신고 수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                      <c:forEach items="${myReportBoard}" var="myReportBoard">
										<tr>
											<td><c:out value="${myReportBoard.board_kind}" /></td>
											<td><c:out value="${myReportBoard.board_name}" /></td>
											<td><c:out value="${myReportBoard.board_no}" /></td>
											<td><c:out value="${myReportBoard.warning_count}" /></td> 
										</tr>
									 </c:forEach>  
									
									
                                    </tbody>
                                    
                                </table>
	
                            </div>
                        </div>
                        
                    </div>
                    
                    <div class="col-md-12 board">
                        <div class="card">
                            <div class="card-header">
                                 <h5 class="m-0 font-weight-bold board_kind">신고된 댓글</h5>
                            </div>
                            <div class="card-body">
                                <table id="ReportReplyListTable" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>게시판</th>
                                            <th>제목</th>
                                            <th>댓글 내용</th>
                                            <th>신고 수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <c:forEach items="${myReportReply}" var="myReportReply">
										<tr>
											<td><c:out value="${myReportReply.board_kind}" /></td>
											<td><c:out value="${myReportReply.board_name}"  /></td>
											<td><c:out value="${myReportReply.reply_content}" /></td>
											<td><c:out value="${myReportReply.warning_count}" /></td> 
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


</body>
</html>