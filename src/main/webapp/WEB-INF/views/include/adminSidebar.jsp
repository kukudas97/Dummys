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
                
                    <li class="menu-title">관리자 MENU</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="/admin/admin.do" class="dropdown-toggle" > <i class="menu-icon fa fa-bar-chart-o"></i>차트보기</a>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="/admin/adminuser.do" class="dropdown-toggle" > <i class="menu-icon fa fa-cogs"></i>회원관리</a>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="/admin/adminwarning.do" class="dropdown-toggle" > <i class="menu-icon fa fa-bullhorn"></i>신고 확인</a>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="/admin/admintendinous.do" class="dropdown-toggle"> <i class="menu-icon fa fa-question-circle"></i>문의사항</a>
                    </li>	
                    <li class="menu-item-has-children dropdown">
                        <a href="/message/message.do" class="dropdown-toggle"> <i class="menu-icon fa fa-comment"></i>쪽지보내기</a>
                    </li>
                    <li class="menu-title">페이지 이동</li>
                  	<li class="menu-item-has-children dropdown">
                        <a href="/index.do" class="dropdown-toggle"> <i class="menu-icon fa fa-users"></i>회원페이지로 이동</a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->
</body>
</html>