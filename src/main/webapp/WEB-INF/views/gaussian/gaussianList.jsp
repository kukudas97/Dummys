<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타입 생성 페이지</title>
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
						<button class="btn btn-outline-secondary newbtn">정규분포 만들기</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover table-striped">
						<thead class="table-light">
							<tr>
								<th id="check">체크박스</th>
								<th>이름</th>
								<th>파일이름</th>
								<th>설명</th>
								<th>공개여부</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox"/></td>
								<td>멀봐</td>
								<td>멀봐.txt</td>
								<td>남들이 보는게 부끄러워요</td>
								<td>O</td>
								<td><button class="btn btn-outline-secondary" style="padding-bottom: 2px; padding-top: 2px">수정</button></td>
							</tr>
							<tr>
								<td><input type="checkbox"/></td>
								<td>안녕</td>
								<td>안녕.txt</td>
								<td>싫어!!!</td>
								<td>X</td>
								<td><button class="btn tablebtn btn-outline-secondary ">수정</button></td>
							</tr>
							<tr>
								<td><input type="checkbox"/></td>
								<td>불편?</td>
								<td>불편해?.txt</td>
								<td>그러면 자세를 고쳐앉아</td>
								<td>O</td>
								<td><button class="btn tablebtn btn-outline-secondary">수정</button></td>
							</tr>
							<tr>
								<td><input type="checkbox"/></td>
								<td>김재홍</td>
								<td>날리지큐브.txt</td>
								<td>서류탈락자</td>
								<td>X</td>
								<td><button class="btn tablebtn btn-outline-secondary">수정</button></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button class="btn tablebtn btn-outline-secondary">삭제</button></td>
							</tr>
						</tfoot>
					</table>
				</div>

			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
</html>