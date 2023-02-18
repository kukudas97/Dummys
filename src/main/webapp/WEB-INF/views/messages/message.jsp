<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<se:authentication property="name" var="userid" />
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />

	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />

		<div class="content">
			<div class="animated fadeIn">
				<div class="row">

					<div class="col-md-12 board">
						<div class="card">
							<div class="card-header">
								<h5 class="m-0 font-weight-bold board_kind">
									<c:out value="${userid}" />
									님의 쪽지함
								</h5>
							</div>
							<div class="card-body">
								<div class="myBoard">
									<h3>받은 쪽지함</h3>
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>#</th>
												<th>보낸사람</th>
												<th>제목</th>
												<th>보낸시간</th>
											</tr>
										</thead>
								<%-- 		<tbody>
											<c:forEach items="" var="">
												<tr>
													<td><c:out value="" /></td>
													<td><c:out value="" /></td>
													<td><a
														href=""><c:out
																value="" /></a></td>
													<td><c:out value="" /></td>
												</tr>
											</c:forEach>
										</tbody> --%>
									</table>
								</div>


							</div>
						</div>

					</div>


				</div>

			</div>
			<!-- .animated -->
			
			  <div class="messageWriteButton">
				<a href="/"><input class="btn btn-outline-success" type="button" value="쪽지보내기"></a>
			  </div>
		</div>
		<!-- .content -->

		<div class="clearfix"></div>

		<jsp:include page="/WEB-INF/views/include/footer.jsp" />


	</div>
</body>
</html>