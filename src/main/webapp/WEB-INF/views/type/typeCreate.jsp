<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
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
						<form action="/type/typecreate.do" method="post" enctype="multipart/form-data" name="fileForm">
							<table class="table">
								<thead>
									<tr>
										<th>처리방법</th>
										<th>공개여부</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<select name="process_no" id="kindSelect">
												<option value="0" selected>더미데이터</option>
												<option value="1">랜덤문자</option>
											</select>
											
										</td>
										<td>
											<select name="type_open" id="openSelect">
												<option value="0" selected>공개</option>
												<option value="1">비공개</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
							
							<div id="rm" name="rm"></div>
							
							<h4 class="margin5">제목</h4>
							<input type="text" class="margin15" name="title">
							
							<h4 class="margin5">설명</h4>
							<input type="text" class="margin15" name="reason">
							
							<h4>파일</h4>
							<input type="text" readonly="readonly" name="fileName" id="fileName">
							
							<label class="btn btn-secondary btn-file">
								파일 올리기
								<input type="file" style="display: none;" id="file" name="file">
							</label>
							
							<div>
								<hr>
							</div>
							<div class="createnav">
								<div class="btnArea">
									<button type="submit" class="navbtn btn btn-outline-success">저장</button>
									<button class="navbtn btn btn-outline-success"><a href="/index.do">메인화면</a></button>
									<button class="navbtn btn btn-outline-success"><a href="javascript:window.history.go(-1);">뒤로가기</a></button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div>
				<h1>설명칸</h1>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
<script type="text/javascript">
	$("#file").change(()=>{
		let fileobj = document.getElementById("file").value; 
		
		let slashfile = fileobj.split("\\").reverse()[0];
		let commafile = fileobj.split(".").reverse()[0];
		
		if(fileobj != null && fileobj !=""){
			if(commafile == "txt"){
				if(slashfile != null && commafile != ""){
					document.getElementById("fileName").value = slashfile;
				}else{
					alert("파일을 확인해주세요")
				}
			}else{
				alert("파일 형식이 잘못되었습니다.")
			}
		}else{
			alert("파일을 넣어주세요.");
		}
	})
	
	$('#kindSelect').change(()=>{
		let target = $('#kindSelect option:selected').val();
		if(target != 1){
			$('#rm').empty();
		}else{
			$('#rm').empty();
			let input = '<h4 class="margin5">형식 작성</h4>' 
				+ '<input type="text" id="random" name="random" class="margin15">';
			$('#rm').append(input);
		}
	})
	
	$('#openSelect').change(()=>{
		let target = $('#openSelect option:selected').val();
	})
</script>
</html>