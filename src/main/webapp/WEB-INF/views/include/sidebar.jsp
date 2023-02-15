<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <li class="menu-item-has-children dropdown">
                        <a href="/schema/createdummys.do" class="dropdown-toggle" > <i class="menu-icon fa fa-cogs"></i>Schemas</a>
                    </li>
					<li class="menu-item-has-children dropdown show">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"> <i class="menu-icon fa fa-table"></i>Schema</a>
                        <ul class="sub-menu children dropdown-menu show"><li class="subtitle"> <i class="menu-icon fa fa-table"></i>Schema</li>
                            <li><i class="fa fa-table"></i><a href="/schema/schemaList.do?type=all">전체 스키마 리스트</a></li>
                            <li><i class="fa fa-table"></i><a href="/schema/schemaList.do?type=mine">내 스키마 리스트</a></li>
                            <li><i class="fa fa-table"></i><a href="/schema/schemaCreate.do">스키마 만들기</a></li>
                        </ul>
                    </li>
                        
                    <li class="menu-item-has-children dropdown">
                        <a href="/type/typelist.do" class="dropdown-toggle" > <i class="menu-icon fa fa-table"></i>Datasets</a>
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
                        <a href="/board/boardList.do?board_kind=공지사항" class="dropdown-toggle" ></i>공지사항</a>
                    </li>
                  
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->
</body>
</html>