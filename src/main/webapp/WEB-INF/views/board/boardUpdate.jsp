<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.content{
		position: relative;
	}
	#schemaChooseArea{
		position: absolute;
		background-color: rgba(0, 0, 0, 0.5); /* 검정색 배경색에 50% 투명도 적용 */
		width: 100%;
		height: 100%;
		z-index: 1;
		top: 0;
		left: 0;
		min-height: 1000px;
	}
	#schemaChooseArea .child{
	    position: absolute;
	    width: 90%;
	    height: 90%;
	    top: 5%;
	    left: 5%;
	  	opacity: 1;
	}
	.schema-content{
		height: calc(100% - 60px);
	}
	.schema-bottom{
		height: 40px;
	}
	.selectSchemaArea{
	    margin-right: 0px !important;
    	margin-left: 0px !important;
	}
</style>
</head>
<body>
    <!-- Left Panel -->
<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
    <!-- /#left-panel -->
    <!-- Left Panel -->

    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
	
        <!-- Header-->
		  <jsp:include page="/WEB-INF/views/include/header.jsp" />
        <div class="content">
        <c:if test="${board.board_kind eq '공유게시판'}">
        <!-- 공유 스키마 선택 창 -->
	    	<div id="schemaChooseArea">
					<div class="card child">
						<div class="card-header">
	                        <strong class="card-title">
		                        <span class="float-left mt-2">
		                        	스키마를 선택하세요
		                        </span>
							</strong>
	                    </div>
						<div class="card-body">
							<div class="schema-content">
								<!-- 스키마 테이블 영역 -->
							</div>
							<div class="schema-bottom">
								<div class="badge float-right mt-1">
									<input type="button" class="btn btn-secondary btn-sm" id="schemaCloseBtn" value="닫기">
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 공유스키마 선택 창 끝 -->
			</c:if>
        <!-- /Header-->
                  <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h5 class="m-0 font-weight-bold board_kind">Board Upate Page</h5>
                        </div>
                        <div class="card-body">
                        	<form role="form" action="" method="post">
                        		<div class="form-group">
                        			<label>#</label> 
                        			<input class="form-control board_detail" name='bno' value='<c:out value="${board.board_no}"/>' readonly="readonly">   		
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>제목 수정</label> 
                        			<input class="form-control" name='board_name' value='<c:out value="${board.board_name}"/>'>   		
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>게시글 수정</label> 
                        			<textarea class="form-control" rows="3" name='board_content' ><c:out value="${board.board_content}"/></textarea>  		
                        		</div>
                        		
                        		<div class="form-group">
                        			<label>작성자</label> 
                        			<input class="form-control board_detail" name='nickname' value='<c:out value="${board.nickname}"/>' readonly="readonly">   		
                        		</div>
                        		<c:if test="${board.board_kind eq '공유게시판'}">
	                        		<div class="form-group">
	                        			<label>Share</label> 
	                        			<input class="form-control" name="schema_no" type="hidden" id="schema_no">
											<div class="row selectSchemaArea">
												<input class="form-control schema_name col-2" type="button" value="취소" id="cancleBtn">
		    									<input id="schema_name" class="form-control schema_name col-10" placeholder="공유할 스키마를 선택하세요" readonly="">
		    								</div>
	                        		</div>
                        		</c:if>
                        		
                        		<button data-oper='update' class="btn btn-success" >저장</button>
                        		<button type="button" data-oper='cancel' class="btn btn-secondary" >취소</button>
                        
                        	</form>
                        </div>

               		</div>
                <script type="text/javascript">
                $(document).ready(function(){
                	var formObj = $("form");
                	
                	$('button').on("click", function(e){
                		e.preventDefault();
                		
                		var operation = $(e.target).attr("data-oper");

                		if(operation =='cancel'){
                			 window.history.back();
                		}
                		else{
                			Swal.fire({
                  			  title: '수정하시겠습니까?',
                  			  text: "",
                  			  icon: 'question',
                  			  showCancelButton: true,
                  			  confirmButtonColor: '#3085d6',
                  			  cancelButtonColor: '#d33'
                  			}).then((result) => {
                			  if (result.isConfirmed) {
                				  Swal.fire({
	            				      title: '게시글 수정',
									  imageUrl: '/resources/images/successMonster.png',
									  imageWidth: 220,
									  imageHeight: 250,
									  imageAlt: 'Custom image',
									  width:400
									}).then(()=>{
										formObj.submit();
                			    })
                			  }
                			})
                		}
                		return;
                	})
                });
                </script>
        </div>
<c:if test="${board.board_kind eq '공유게시판'}">
	<script>
		$('#schema_name').on({
			click : readSchema
		})
		$('#schemaChooseArea').toggle();
	
		$('#cancleBtn').on({
			click : ()=>{
				$('#schema_no').val("");
				$('#schema_name').val("");
			}
		})
		$('#schemaCloseBtn').on({
			click : ()=>{
				$('#schemaChooseArea').toggle();
			}
		})
		function readSchema(){
			$.ajax({
				"url" : "/schema/getSchemaList.do",
				"type" : "get",
				"success" : (data)=>{
					let result = data.result;
					if(result == 'login-error'){
						Swal.fire('로그인이 필요한 서비스 입니다.')
						location.href = "/users/login.do"
					} else if(result == 'fail'){
						Swal.fire({
        				      title: '데이터 불러오기를 실패했습니다.\n다시 시도해주세요',
							  imageUrl: '/resources/images/failMonster.png',
							  imageWidth: 220,
							  imageHeight: 250,
							  imageAlt: 'Custom image',
							  width:400
							})
					} else if(result == 'success'){
						$('#schemaChooseArea').toggle();			
						const list = data.list;
						$('.schema-content').empty()
						let tableText =  "<table class='table table-hover table-striped'>" + 
												"<thead class='table-light'>" + 
													"<tr>" + 
														"<th>번호</th>" + 
														"<th>이름</th>" + 
														"<th>설명</th>" + 
													"</tr>" + 
												"</thead>" + 
												"<tbody>" +
											 	"</tbody>" + 
										"</table>";
						let $table = $(tableText);
						$(list).each((index,schema)=>{
									let trText =  "<tr data-value='" + schema.schema_no + "'>" + 
														"<td>"+schema.schema_no+"</td>" + 
														"<td>"+schema.schema_name+"</td>" + 
														"<td>"+schema.schema_content+"</td>" + 
													"</tr>"
									let $tr = $(trText).css("cursor","pointer");
									$($tr).click(selectSchema)
									$($table).find('tbody').append($tr)
						})//list.each end
						$('.schema-content').append($table)
					}// if success end
				}, //ajax success end
				"error" : (error)=>{
					Swal.fire({
  				      title: '에러',
						  imageUrl: '/resources/images/failMonster.png',
						  imageWidth: 220,
						  imageHeight: 250,
						  imageAlt: 'Custom image',
						  width:400
						})
				}
			})
		}
		function selectSchema(event){
			const targetTr = $(event.target).closest('tr')
			const schema_no = $(targetTr).attr('data-value');
			const schema_name = $(targetTr).find("td:eq(1)").text();
			$('#schema_no').val(schema_no);
			$('#schema_name').val("#" +schema_no +" " +schema_name);
			$('#schemaChooseArea').toggle();
		}
	</script>
</c:if>

</body>
</html>