<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#check{
		width: 100px !important;
	}
	table {
		text-align: center;
	}
	#values{
		border: 3px solid;
		min-height: 525px;
		border-radius: 10px;
	}
</style>
</head>
<body>
	<div id="right-panel" class="right-panel">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		<div id="main_content">
			<div class="row">
				<div class="col">
					<div class="row">
						<h1>나만의 정규분포 규칙 생성</h1>
					</div>
					<br>
					<div class="row">
						<div>
							<p>원하는 페이지를 만들어 보아요! 무조건 txt파일로 올리세요</p>
							<p>불편하면 자세를 고쳐앉아</p>
						</div>
					</div>
					<div class="row">
						<button class="btn btn-outline-secondary newbtn" id="createBtn">정규분포 만들기</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table id="gaussianTable"class="table table-hover table-striped">
						<thead class="table-light">
							<tr>
								<th id="check">체크박스</th>
								<th>이름</th>
								<th>적용 컬럼</th>
							</tr>
						</thead>
						<tbody>
							
							<c:forEach items="${list }" var="data">
								<tr onclick="javascript:location.href='/gaussian/gaussianUpdate.do?gaussian_no=${data.gaussian_no}'">
									<td><input type="checkbox" value="${data.gaussian_no }"/></td>
									<td>${data.gaussian_name }</td>
									<td>${data.gaussian_col }</td>
								</tr>
							</c:forEach>

						</tbody>
						<tfoot>
							<tr>
								<td></td>
								<td></td>
								<td><button class="btn tablebtn btn-outline-secondary" id="delBtn">삭제</button></td>
							</tr>
						</tfoot>
					</table>
				</div>

			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
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
<script>
	$('#createBtn').on({
		click : ()=>{
			location.href = "/gaussian/gaussianCreate.do"
		}
	})
	$('#delBtn').on({
		click : deleteGaussian
	})
	function deleteGaussian(){
		let list =[]; 
		
		//list.push($('input[type=checkbox]:checked').map((index,data)=>$(data).val()));
		$('input[type=checkbox]:checked').each((index,data)=>{
			list.push($(data).val());
		})
		//let listdata = [...list[0]];
		
		$.ajax({
			"type" : "post",
			"url" : "deleteGaussian.do",
			"data" : JSON.stringify(list),
			"contentType":"application/json",
			"success" : (data)=>{
				if(data.result == 'success'){
					Swal.fire(
							  '성공!',
							  '정규분포 삭제를 성공했습니다. 페이지를 새로고침합니다.',
							  'success'
							).then(()=>{location.reload();})
				} else if(data.result == 'fail'){Swal.fire(
						  '실패...',
						  '정규분포 삭제를 실패했습니다.',
						  'error'
						)
				} else if(data.result == 'login-error'){
					Swal.fire(
							  '로그인에러',
							  '로그인이 필요한 서비스입니다. 로그인페이지로 이동합니다.',
							  'warning'
							).then(()=>{
								location.href = "/users/login.do";
							})
				}
			},
			"error" : (error)=>{
			}
		})// $ajax end
	}

 	$('#gaussianTable').DataTable({
 		"pageLength": 10,
 		"startSave" : true,
 		"lengthChange": false
 	});
</script>
</html>