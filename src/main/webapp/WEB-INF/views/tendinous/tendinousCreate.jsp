<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="right-panel" class="right-panel">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<strong class="card-title board_kind">문의사항</strong>
				<p>불편을 드려서 죄송합니다. 문의사항을 입력하시면 성심성의것 대답해드리겠습니다.</p>
				<p>관련 내용은 문의사항 관리팀에서 확인 후 쪽지로 답변드리겠습니다.</p>
			</div>
			<form action="" method="post">
				<div class="card-body">
	
					<div class="form-group">
						<label>제목</label>
						<input class="form-control board_detail"
							id="title"name='title' placeholder="제목을 입력해주세요." onkeyup="validate()">
					</div>
	
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control board_detail" rows="15"
							id="content"name='content' placeholder="내용을 입력해주세요" onkeyup="validate()"></textarea>
					</div>
					
					<se:authentication property="name" var="userid" />
					<div class="form-group">
						<label>작성자</label> <input class="form-control board_detail"
							name='userid' value="${userid }" readonly="readonly">
					</div>
					<button id="submit" class="btn btn-primary" disabled>전송</button>
				</div>
			</form>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
<script type="text/javascript">
let checktitle = false;
let checkcontent = false;

function validate(){
	let title = $("#title").val();
	let content = $("#content").val();
	
	if(title!=null && title != ""){
		checktitle = true;
		
	}else{
		checktitle = false;
	}
	
	if(content != null && content != ""){
		checkcontent = true;
	}else{
		
		checkcontent = false;
	}
	activateBtn();
}

function activateBtn(){
	if(checktitle && checkcontent){
		document.getElementById("submit").removeAttribute("disabled");
	}else{
		document.getElementById("submit").setAttribute("disabled", "disabled");
	}
}

$("#submit").click(()=>{
	alert("문의 감사합니다. 답변은 3~7일 정도 걸리나 문의사항이 많을 경우 최대한 빠른 시일에 답변드리겠습니다.")
})
</script>
</html>