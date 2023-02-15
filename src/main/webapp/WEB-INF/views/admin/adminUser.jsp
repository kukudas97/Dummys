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
						<h1><b>회원관리</b></h1>
					</div>
					<div class="전체 회원관리">
						<p>회원 정보를 확인해보세요~</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-5 col-md-12">
					<h3 class="margin15">활성화된 회원</h3>
					<table id="siuser" class="table table-hover table-striped data-table">
						<thead class="table-light">
							<tr>
								<th id="check"></th>
								<th>닉네임</th>
								<th>ID</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="userlist" items="${userlist}">
								<tr in-data="${userlist.userid}">
									<td><input type="checkbox" value="${userlist.userid}" name="out_check"/></td>
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
					</table>
				</div>
				<div class="col-lg-1 col-md-12" style="margin:auto">
					<div style="width : 65px; height:70px; margin:auto">
						<button class="btn btn-outline-success" id="inuser"><b>&lt;이동</b></button>
					</div>
					<div style="width : 65px; height:80px; margin:auto">
						<button class="btn btn-outline-danger" id="outuser"><b>이동&gt;</b></button>
					</div>
				</div>
				<div class="col-lg-5 col-md-12">
					<h3 class="margin15">비활성화된 회원</h3>
					<table id="disuser" class="table table-hover table-striped data-table">
						<thead class="table-light">
							<tr>
								<th id="check"></th>
								<th>닉네임</th>
								<th>ID</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="outuserlist" items="${outuserlist}">
								<tr out-data="${outuserlist.userid }">
									<td><input type="checkbox" value="${outuserlist.userid}" name="in_check"/></td>
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
								<td><button class="btn tablebtn btn-outline-secondary" id="delete">삭제</button></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
<script type="text/javascript">
document.getElementById("inuser").onclick = ()=>{
	let users = [];
	$("input[name=in_check]:checked").each((index,data)=>{
		let user = $(data).
	})
}

function update(event){
	let userid = $(event).attr("value");
	location.href = "/admin/userupdate.do?userid="+ userid;
}
</script>
</html>