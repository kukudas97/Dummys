<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                
                    <li class="menu-title">Dummy Data</li><!-- /.menu-title -->

                     <li class="menu-item-has-children dropdown open">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"> <i class="menu-icon fa fa-area-chart"></i>스키마</a>
                        <ul class="sub-menu children dropdown-menu">
                        <li class="subtitle"> <i class="menu-icon fa fa-area-chart"></i>스키마</li>
                            <li><i class="fa fa-table"></i><a href="/schema/schemaList.do?type=all">전체 스키마 리스트</a></li>
                            <li><i class="fa fa-table"></i><a href="/schema/schemaList.do?type=mine">내 스키마 리스트</a></li>
                            <li><i class="fa fa-table"></i><a href="/schema/schemaCreate.do">스키마 만들기</a></li>
                        </ul>
                    </li>

                    <li class="menu-item-has-children dropdown">
                        <a href="/type/typelist.do" class="dropdown-toggle" > <i class="menu-icon fa fa-table"></i>타입</a>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="/gaussian/gaussianList.do" class="dropdown-toggle"> <i class="menu-icon fa fa-th"></i>정규분포</a>
                    </li>	
                    
                    		
                    <li class="menu-title">커뮤니티</li><!-- /.menu-title -->

                    <li class="menu-item-has-children">
                       <a href="/board/boardList.do?board_kind=자유게시판" class="dropdown-toggle" > <i class="menu-icon fa fa-tasks"></i>자유게시판</a>
                    	<!-- <a href="boardList.user?boardname=트러블슈팅">트러블슈팅</a> -->
                    </li>
                    <li>
                        <a href="/board/boardList.do?board_kind=질문게시판" class="dropdown-toggle"> <i class="menu-icon ti-email"></i>질문게시판</a>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="/board/boardList.do?board_kind=공유게시판" class="dropdown-toggle"> <i class="menu-icon fa fa-bar-chart"></i>공유게시판</a>
                    </li>

                    <li class="menu-item-has-children dropdown">
                        <a href="/board/boardList.do?board_kind=공지사항" class="dropdown-toggle" ><i class="menu-icon fa fa-bullhorn"></i>공지사항</a>
                    </li>
                    
                    <li class="menu-item-has-children dropdown">
                        <a href="/tendinous/tendinous.do" class="dropdown-toggle" ><i class="menu-icon fa fa-question-circle"></i>문의사항</a>
                    </li>
                  	<se:authorize access="hasRole('ROLE_ADMIN')">
                  	<li class="menu-title">관리자 권한</li>
                  	<li class="menu-item-has-children dropdown">
                        <a href="/admin/admin.do" class="dropdown-toggle" ><i class="menu-icon fa fa-hospital-o"></i>관리자 페이지로 이동</a>
                    </li>
                  	</se:authorize>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->
</body>
</html>