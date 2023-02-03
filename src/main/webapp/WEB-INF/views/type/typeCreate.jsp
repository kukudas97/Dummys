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
		<div id="main_content" class="main_content_height">
			<div class="row">
				<div class="col">
					<div class="row">
						<h1>새로운 타입 생성</h1>
					</div>
					<br>
					<div class="row">
						<div>
							<p>자신이 원하는 새로운 타입을 만들어 보세요!</p>
							<p>.txt파일이 아닐경우 생성이 안되니 유의해주세요!</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="typecreate">
						<form action="#" method="post" enctype="multipart/form-data" name="fileForm">
							<h4 class="margin5">제목</h4>
							<input type="text" class="margin15">
							
							<h4>파일</h4>
							<input type="text" readonly="readonly" name="src">
							
							<label class="btn btn-secondary btn-file">
								파일 올리기
								<input type="file" style="display: none;">
							</label>
							
							<div>
								<hr>
							</div>
							<div class="createnav">
								<div class="btnArea">
									<button type="submit" class="navbtn btn btn-outline-success">저장</button>
									<button class="navbtn btn btn-outline-success"><a href="index.do">메인화면</a></button>
									<button class="navbtn btn btn-outline-success"><a href="javascript:window.history.go(-1);">뒤로가기</a></button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
</html>