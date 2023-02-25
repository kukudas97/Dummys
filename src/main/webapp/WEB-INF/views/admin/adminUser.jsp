<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/resources/images/DummysFavicon.png" type="image/x-icon" sizes="16x16">
<%-- <jsp:include page="/WEB-INF/views/include/adminHead.jsp" /> --%>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/adminSidebar.jsp" />
	<div id="right-panel" class="right-panel">
		<jsp:include page="/WEB-INF/views/include/adminHeader.jsp" />
		<div id="main_content" class="main_content_height content">
			<div class="row">
				<div class="col">
					<div class="row margin15">
						<h1 class="col-12"><b>회원관리</b></h1>
					</div>
					<div class="row">
						<p class="col-12">회원 정보를 확인해보세요~</p>
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
							</tr>
						</thead>
						<tbody>
							<c:forEach var="userlist" items="${userlist}">
								<tr in-data="${userlist.userid}">
									<td><input type="checkbox" value="${userlist.userid}" name="out_check"/></td>
									<td>${userlist.nickname }</td>
									<td>${userlist.userid }</td>
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
							</tr>
						</thead>
						<tbody>
							<c:forEach var="outuserlist" items="${outuserlist}">
								<tr out-data="${outuserlist.userid }">
									<td><input type="checkbox" value="${outuserlist.userid}" name="in_check"/></td>
									<td>${outuserlist.nickname }</td>
									<td>${outuserlist.userid }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<jsp:include page="/WEB-INF/views/include/footer.jsp" />
				</div>
			</div>
		</div>
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

<script type="text/javascript">
$(document).ready(function() {
    $('#siuser').DataTable({
  	  order:[[0, "desc"]]
    });
    
    $('#disuser').DataTable({
    	  order:[[0, "desc"]]
      });
} );

document.getElementById("inuser").onclick = ()=>{
	let inusers = [];
	$("input[name=in_check]:checked").each((index,data)=>{
		let check = $(data).val();
		inusers.push(check);
	})

	$.ajax({
		type:"post",
		url:"/admin/in_user.do",
		data : JSON.stringify(inusers),
		"contentType":"application/json",
		success : (result)=>{
			Swal.fire({
				title: '활성화 성공!',
			  	text: '총'+ result.msg +'명의 회원이 활성화 되었습니다.',
			  	imageUrl: '/resources/images/successMonster.png',
			  	imageWidth: 220,
			  	imageHeight: 250,
			  	width:400,
			  	imageAlt: '성공',
			}).then(()=>{
				location.reload();	
			})
			
		},
		error : ()=>{
			Swal.fire({
				title: '활성화 실패...',
				text: '',
				imageUrl: '/resources/images/failMonster.png',
				imageWidth: 220,
				imageHeight: 250,
				width:400,
				imageAlt: '실패',
			})
		}
	})
}

document.getElementById("outuser").onclick= ()=>{
	let outusers = [];
	$("input[name=out_check]:checked").each((index,data)=>{
		let check = $(data).val();
		outusers.push(check);
	})

	$.ajax({
		type:"post",
		url:"/admin/out_user.do",
		data : JSON.stringify(outusers),
		"contentType":"application/json",
		success : (result)=>{
			Swal.fire({
				title: '비활성화 성공!',
			  	text: '총'+ result.msg +'명의 회원이 비활성화 되었습니다.',
			  	imageUrl: '/resources/images/successMonster.png',
			  	imageWidth: 220,
			  	imageHeight: 250,
			  	width:400,
			  	imageAlt: '성공',
			}).then(()=>{
				location.reload();	
			})
		},
		error : ()=>{
			Swal.fire({
				title: '비활성화 실패...',
				text: '',
				imageUrl: '/resources/images/failMonster.png',
				imageWidth: 220,
				imageHeight: 250,
				width:400,
				imageAlt: '실패',
			})
		}
	})
}

</script>
</html>