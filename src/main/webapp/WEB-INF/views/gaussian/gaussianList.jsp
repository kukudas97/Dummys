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
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
	<div id="right-panel" class="right-panel">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<div class="content">
		<div class="row">
			<div class="card col">
                  <div class="card-header">
                      <strong class="card-title">Card with switch</strong>
                  </div>
                  <div class="card-body">
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  </div>
                  <div class="card-footer">
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  </div>
              </div>
        </div>
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
					Swal.fire({
						title:'정규분포 삭제를 성공했습니다.',
						  imageUrl: '/resources/images/successMonster.png',
						  imageWidth: 220,
						  imageHeight: 250,
						  imageAlt: 'Custom image',
						  width:400
						}).then(()=>{
							location.relaod()			
						}) 
				} else if(data.result == 'fail'){
						Swal.fire({
							title:'정규분포 삭제를 실패했습니다.',
							  imageUrl: '/resources/images/failMonster.png',
							  imageWidth: 220,
							  imageHeight: 250,
							  imageAlt: 'Custom image',
							  width:400
							})
				} else if(data.result == 'login-error'){
					Swal.fire({
						title:'로그인이 필요한 서비스입니다.',
						  imageUrl: '/resources/images/failMonster.png',
						  imageWidth: 220,
						  imageHeight: 250,
						  imageAlt: 'Custom image',
						  width:400
						})
				}
			},
			"error" : (error)=>{
				Swal.fire({
					title:'정규분포 삭제를 실패했습니다.',
					  imageUrl: '/resources/images/failMonster.png',
					  imageWidth: 220,
					  imageHeight: 250,
					  imageAlt: 'Custom image',
					  width:400
					})
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