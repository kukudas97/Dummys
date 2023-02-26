<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/resources/images/DummysFavicon.png" type="image/x-icon" sizes="16x16">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
	<div id="right-panel" class="right-panel">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<div id="main_content" class="main_content_height content">
			<div class="row">
				<div class="col">
					<div class="row">
						<h1>새로운 타입 생성</h1>
					</div>
					<br>
					<div class="row">
						<div class="col-12">
							<p>자신이 원하는 새로운 타입을 만들어 보세요!</p>
							<p>.txt파일이 아닐경우 생성이 안되니 유의해주세요!</p>
							<div class="row">
								<button class="collapsible col-1"><h3 style="margin: 0 auto;"><i class="fa fa-question-circle"></i></h3></button>
								<div class="collapsiblecontent col-11">
								  <p>제목, 설명 작성은 필수로 해주시고, 파일을 무조건 .txt라는 확장자로 해주셔야하며, 한 줄을 기준으로 데이터를 받습니다.</p>
								  <p>랜덤문자일 시 "!"는 0~9사이에 랜덤한 숫자, "*"은 파일에 들어있던 문자 중 랜덤하게 하나이며, 그 외에 문자는 그대로 출력됩니다.</p>
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
							<input type="text" class="margin15" name="title" onkeyup="check()" id="title">
							
							<h4 class="margin5">설명</h4>
							<input type="text" class="margin15" name="reason" onkeyup="check()" id="reason">
							
							<h4>파일</h4>
							<input type="text" readonly="readonly" name="fileName" id="fileName">
							
							<label class="btn btn-secondary btn-file">
								파일 올리기
								<input type="file" style="display: none;" id="file" name="file">
							</label>
							
							<div>
								<hr>
							</div>
							<jsp:include page="/WEB-INF/views/include/footer.jsp" />
							<div class="createnav">
								<div class="btnArea">
									<button type="submit" class="navbtn btn btn-outline-success" id="sBtn" disabled>저장</button>
									<button class="navbtn btn btn-outline-success"><a href="/index.do">메인화면</a></button>
									<button class="navbtn btn btn-outline-success"><a href="javascript:window.history.go(-1);">뒤로가기</a></button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	
	let checkTitle = false;
	let checkReason =false;
	let checkFile = false;
	
	//submit Btn 활성화
	function activeBtn(){
		if(checkTitle && checkReason && checkFile){
			document.getElementById("sBtn").removeAttribute("disabled");
		}else{
			document.getElementById("sBtn").setAttribute("disabled", "disabled");
		}
	}
	
	//제목과 설명이 써져있는지 확인하는 곳
	function check(){
		let title = $("#title").val();
		let reason = $("#reason").val();
		if(title != null && title != "" && title.trim() != ""){
			checkTitle = true;
		}else{
			checkTitle = false;
		}
		
		if(reason != null && reason != "" && reason.trim() != ""){
			checkReason = true;
		}else{
			checkReason = false;
		}
		activeBtn()
	}
	
	//파일 형식 확인
	$("#file").change(()=>{
		let fileobj = document.getElementById("file").value; 
		
		let slashfile = fileobj.split("\\").reverse()[0];
		let commafile = fileobj.split(".").reverse()[0];
		
		
		if(fileobj != null && fileobj !=""){
			if(commafile == "txt"){
				if(slashfile != null && commafile != ""){
					document.getElementById("fileName").value = slashfile;
					checkFile = true;
				}else{
					checkFile = false;
					Swal.fire(
           					'파일을 확인해주세요!',
           				  	'',
           				 	 'question'
           				)
				}
			}else{
				checkFile = false;
				Swal.fire({
       				title: '파일 형식이 잘못되었습니다.',
       				text: '',
       				imageUrl: '/resources/images/failMonster.png',
       				imageWidth: 220,
       				imageHeight: 250,
       				width:400,
       				imageAlt: '실패',
       			})
			}
		}else{
			checkFile = false;
			Swal.fire({
   				title: '파일을 넣어주세요',
   				text: '',
   				imageUrl: '/resources/images/failMonster.png',
   				imageWidth: 220,
   				imageHeight: 250,
   				width:400,
   				imageAlt: '실패',
   			})
		}
		activeBtn();
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