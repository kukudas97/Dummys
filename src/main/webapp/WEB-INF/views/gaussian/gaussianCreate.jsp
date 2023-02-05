<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
<style>
	input {
	      display: inline-block;
	      height: 40px;
	      padding: 0 10px;
	      vertical-align: middle;
	      border: 1px solid #dddddd;
	      color: #999999;
	      border-radius: 5px;
      }
	.t2{
		width: 20%;
	}
	.delBtn {
		cursor : pointer;
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
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-striped">
						<thead class="table-light">
							<tr>
								<th class="t2">정규분포이름</th>
								<th colspan="3"><input type="text" id="gaussianName" placeholder="정규분포이름"></th>
							</tr>
							<tr>
								<th>컬럼명</th>
								<th colspan="3"><input type="text" id="gaussianColumnName" placeholder="적용시킬컬럼명"></th>
							</tr>
							<tr>
								<th>데이터</th>
								<th>평균</th>
								<th>표준편차</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody class="gaussianDatas">
							<tr>
								<td><input data-type="name" type="text" style="width:100%" placeholder="데이터값"></td>
								<td><input data-type="average" type="number" style="width:100%" placeholder="평균"></td>
								<td><input data-type="deviation" type="number" style="width:100%" placeholder="표준편차"></td>
								<td><div class="icon-container"><span class="ti-close delBtn"></span></div></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td><button class="btn tablebtn btn-outline-secondary" id="rowAddBtn">ROW추가</button></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tfoot>
					</table>
				</div>

			</div>
		</div>
		
		<section>
			<div class="createnav">
				<div class="btnArea">
					<div class="navbtn btn btn-outline-success" id="saveBtn">저장하기</div>
					<div class="navbtn btn btn-outline-success" id="listBtn">목록으로</div>
					<div class="navbtn btn btn-outline-success" id="homeBtn">홈으로</div>
				</div>
			</div>
		</section>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
<script>
	delBtnAddEvent();

	$('#rowAddBtn').on({
		click : addRow
	})
	$('#listBtn').on({
		click : ()=>{
			location.href="/gaussian/gaussianList.do";
		}
	})
	$('#homeBtn').on({
		click: ()=>{
			location.href = "/index.do"
		}
	})
	$('#saveBtn').on({
		click : saveGaussian
	})
	
	
	
	function addRow(){
			let txt = '<tr>' +
			'<td><input data-type="name" type="text" style="width:100%" placeholder="데이터값"></td>' +
			'<td><input data-type="average" type="number" style="width:100%" placeholder="평균"></td>' +
			'<td><input data-type="deviation" type="number" style="width:100%" placeholder="표준편차"></td>' +
			'<td><div class="icon-container"><span class="ti-close delBtn"></span></div></td>'+
		'</tr>';
		$(".gaussianDatas").append(txt);
		delBtnAddEvent();
	}
	function delBtnAddEvent(){
		$('.delBtn').on({
			click : deleteRow
		})
	} 
	function deleteRow(event){
		$(event.target).closest('tr').remove();
	}
	function saveGaussian(){
		const gaussianNameVal = $('#gaussianName').val();
		const gaussianColumnVal = $('#gaussianColumnName').val();
		const list = $('.gaussianDatas > tr');
		let listdata = [];

		listdata.push($(list).map((index,data)=>{			
			let result = {
				"gaussian_result_no" : "",
				"gaussian_no" : "",
				"gaussian_result" : $(data).find('input[data-type=name]').val(),
				"gaussian_result_avg" : $(data).find('input[data-type=average]').val(),
				"standard_deviation" : $(data).find('input[data-type=deviation]').val()
			}
			return result;
		})) //listdata.push end

		let datas = {
			"gaussian" : {	
				"gaussian_no" : 0,
				"userid" : "",
				"gaussian_col" : gaussianColumnVal,
				"gaussian_name" : gaussianNameVal
			},
			"list" : [...listdata[0]]
		}
		console.log(datas);
		$.ajax({
			"type":"post",
			"url" : "saveGaussian.do",
			"data" : JSON.stringify(datas),
			"contentType":"application/json",
			success : (result)=>{
				console.log(result)
			},
			error : (error)=>{
				console.log(error);
			}
		})//ajax end
	}//saveGaussian() end
</script>
</html>