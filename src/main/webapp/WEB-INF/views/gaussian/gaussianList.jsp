<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/resources/images/DummysFavicon.png" type="image/x-icon" sizes="16x16">
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
	
.collapsible {
    display: inherit;
  background: none;
  border: none;
  outline: none;
  cursor:pointer;
  margin-bottom:16px;
}
.collapsible:after {
  color: white;
  font-weight: bold;
  float: right;
  margin-left: 5px;
}

.collapsiblecontent {
  padding: 0 18px;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
}
#gaussianTable > tbody > tr{
	cursor : pointer;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
	<div id="right-panel" class="right-panel">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<div class="content">
			<div class="row">
				<div class="col">
					<div class="row">
						<h1 class="col-12">나만의 정규분포 규칙 생성</h1>
					</div>
					<br>
					<div class="row">
						<div class="col-12">
							<p>정규분포 규칙을 사용하면 스키마의 다른 열을 기반으로 숫자 분포를 형성할 수 있습니다.</p>
							<p>이를 통해 모든 데이터의 평균값이 같은 문제를 해결할 수 있습니다.</p>
							<div class="row">
								<button class="collapsible col-1"><h3 style="margin: 0 auto;"><i class="fa fa-question-circle"></i></h3></button>
								<div class="collapsiblecontent col-11">
								  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
								</div>
							</div>
							<script>
							var coll = document.getElementsByClassName("collapsible");
							var i;
							
							for (i = 0; i < coll.length; i++) {
							  coll[i].addEventListener("click", function() {
							    this.classList.toggle("active");
							    var content = this.nextElementSibling;
							    if (content.style.maxHeight){
							      content.style.maxHeight = null;
							    } else {
							      content.style.maxHeight = content.scrollHeight + "px";
							    } 
							  });
							}
							</script>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<button class="btn btn-outline-secondary newbtn" id="createBtn">정규분포 만들기</button>
						</div>
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
								<tr data-value="${data.gaussian_no}">
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
							location.reload()	
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
 	
 	$('#gaussianTable > tbody > tr').on({
 		click : gaussianDetail
 	})
 	
 	function gaussianDetail(e){
 		if(e.target.tagName == 'INPUT'){
 			return;
 		}
 		let gaussian_no = $(e.target).closest('tr').attr('data-value');
 		location.href = '/gaussian/gaussianUpdate.do?gaussian_no=' + gaussian_no;
 		//onclick="javascript:location.href='/gaussian/gaussianUpdate.do?gaussian_no=${data.gaussian_no}'"
 	}
</script>
</html>