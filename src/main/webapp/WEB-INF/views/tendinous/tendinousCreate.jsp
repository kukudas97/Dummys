<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<form action="" method="post" enctype="multipart/form-data" name="fileForm">
				<div class="card-body">
	
					<div class="form-group">
						<label>제목</label> <input class="form-control board_detail"
							name='title' value=''>
					</div>
	
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control board_detail" rows="15"
							name='content'></textarea>
					</div>
					
	
					<div class="form-group">
						<label>작성자</label> <input class="form-control board_detail"
							name='userid' value="${userid}" readonly="readonly">
					</div>
					<button>전송</button>
				</div>
			</form>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
</html>