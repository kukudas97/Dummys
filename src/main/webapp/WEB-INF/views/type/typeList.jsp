<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/resources/images/DummysFavicon.png" type="image/x-icon" sizes="16x16">
<style type="text/css">
	#check{
		width: 100px
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
		<div id="main_content" class="main_content_height">
			<div class="row">
				<div class="col">
					<div class="row">
						<h1 class="col-12">나의 타입 생성</h1>
					</div>
					<br>
					<div class="row">
						<div class="col-12">
							<p>타입을 통해 직접 더미데이터 리스트를 생성해보세요!</p>
							<p>텍스트 파일을 통해 형태와 목록을 원하는대로 생성할 수 있습니다!</p>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<button class="btn btn-outline-secondary newbtn"><a href="/type/typecreate.do">새로운 타입!</a></button>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-9">
					<table id="typeListTable" class="table table-hover table-striped data-table">
						<thead class="table-light">
							<tr>
								<th id="check">체크박스</th>
								<th>이름</th>
								<th>설명</th>
								<th>공개여부</th>
								<th>처리방법</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="typelist" items="${typelist}" >
								<tr id="detail" data-value="${typelist.type_no}">
									<td><input type="checkbox" value="${typelist.type_no}" name="delete_check"/></td>
									<td>${typelist.type_name}</td>
									<td>${typelist.type_reason}</td>
									<td>
										<c:choose>
											<c:when test="${typelist.type_open eq 0}">O</c:when>
											<c:otherwise>X</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${typelist.process_no eq 0}">더미데이터</c:when>
											<c:otherwise>랜덤문자</c:otherwise>
										</c:choose>
									</td>
									<td>
									<button class="btn btn-outline-secondary" style="padding-bottom: 2px; padding-top: 2px" value="${typelist.type_no}" onclick="update(this)" name="update">
									수정
									</button></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
								<div style="margin:auto; width: 53px">
								<button class="btn tablebtn btn-outline-secondary" id="delete">삭제</button>
								</div>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<div id="datasection" class="col-md-3 col-sm-6">
					<section id="values">
						<h3 class="margin15">&nbsp;values</h3>
						<div id="scrolltext" style="overflow:auto; margin-left: 5px; width: 95%; height: 450px;">
							
						</div>
					</section>
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

<script type="text/javascript">

	document.getElementById("delete").onclick = function() {
		let checklist = [];
		$("input[name=delete_check]:checked").each((index, data)=>{
			let check = $(data).val();
			checklist.push(check);
		})

		$.ajax({
			type : "POST",
			url : "/type/delete.do",
			data : JSON.stringify(checklist),
			"contentType":"application/json",
			success : function(result){
				alert("총 " + result.msg + "개가 삭제되었습니다.")
				location.reload(); 
			},
			error : function(){
				alert("삭제 실패")
			}
		})
	}
	
	$(document).ready(function() {
        $('#typeListTable').DataTable({
      	  order:[[0, "desc"]]
        });
    } );
	
	$("#typeListTable tbody tr").click(function(event){
		let type_no = $(event.target).closest("tr").attr("data-value");
		
		$.ajax({
			type : "POST",
			url : "/type/listDetail.do",
			data : JSON.stringify(type_no),
			"contentType":"application/json",
			success : function(result){
				$("#scrolltext").empty();
				$("#scrolltext").append("<h5><b>이름</b> :&nbsp;&nbsp;"+result.type.type_name + " </h5><hr>");
				if(result.type.process_no == 1){
					$("#scrolltext").append("<h5><b>처리방법</b> :&nbsp;&nbsp;"+result.random_form.random_word_form + "</h5><hr>");
				};
				$("#scrolltext").append("<b>문자<b>");
				for(let index in result.list){
					$("#scrolltext").append("<h6>"+result.list[index].dummy_data_word + "</h6><br>");
				}
				// $("#scrolltext").append(result.list[0].dummy_data_word);
				
			},
			error : function(){
				alert("불러오는데 실패했습니다.");
			}
		})
	})
	
	function update(event){
		let type_no = $(event).attr("value");
		location.href = "/type/typeupdate.do?type_no="+type_no;
	}
</script>
</html>