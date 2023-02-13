<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/adminHead.jsp" />
</head>
<body>
	<div id="right-panel" class="right-panel">
		<jsp:include page="/WEB-INF/views/include/adminHeader.jsp" />
		<jsp:include page="/WEB-INF/views/include/adminSidebar.jsp" />
		<div id="main_content" class="main_content_height">
			<div class="row">
				<div class="col">
					<div class="row margin15">
						<h1>회원관리</h1>
					</div>
					<div class="전체 회원관리">
						<p>회원 정보를 확인해보세요~</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-5 col-md-12">
					<table id="" class="table table-hover table-striped data-table">
						<thead class="table-light">
							<tr>
								<th id="check">체크박스</th>
								<th>닉네임</th>
								<th>ID</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="userlist" items="${userlist}">
								<tr id="" in-data="${userlist.userid}">
									<td><input type="checkbox" value="${userlist.userid}" name="delete_check"/></td>
									<td>${userlist.nickname }</td>
									<td>${userlist.userid }</td>
									<td>
									<button class="btn btn-outline-primary" style="padding-bottom: 2px; padding-top: 2px" value="${userlist.userid}" onclick="update(this)" name="update">
									수정
									</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tfoot>
					</table>
				</div>
				<div class="col-lg-1 col-md-12">
					<div class="margin15" style="">
						<button class="btn btn-outline-success margin15"><b>&lt;이동</b></button>
					</div>
					<div class="margin15">
						<button class="btn btn-outline-danger margin15"><b>&gt;이동</b></button>
					</div>
				</div>
				<div class="col-lg-5 col-md-12">
					<table id="" class="table table-hover table-striped data-table">
						<thead class="table-light">
							<tr>
								<th id="check">체크박스</th>
								<th>닉네임</th>
								<th>ID</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="outuserlist" items="${outuserlist}">
								<tr id="" out-data="${outuserlist.userid }">
									<td><input type="checkbox" value="${outuserlist.userid}" name="delete_check"/></td>
									<td>${outuserlist.nickname }</td>
									<td>${outuserlist.userid }</td>
									<td>
									<button class="btn btn-outline-primary" style="padding-bottom: 2px; padding-top: 2px"  value="${outuserlist.userid}" onclick="update(this)" name="update">
									수정
									</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>

</body>
</html>