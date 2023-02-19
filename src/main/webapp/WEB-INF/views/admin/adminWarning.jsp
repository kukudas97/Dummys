<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/adminHead.jsp" />
</head>
<body>
	<!-- left panel -->
	<jsp:include page="/WEB-INF/views/include/adminSidebar.jsp" />
	<!-- left panel -->
	
	
	<div id="right-panel" class="right-panel">
		<jsp:include page="/WEB-INF/views/include/adminHeader.jsp" />
		<div id="main_content" class="main_content_height">
			<h1>Admin</h1>
		

	 <div class="content">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-md-12 board">
				
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Stripped Table</strong>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">First</th>
                                        <th scope="col">Last</th>
                                        <th scope="col">Handle</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Larry</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
			
			</div>
		
		</div>
	
	</div>
	</div>
	
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
	

</body>
</html>