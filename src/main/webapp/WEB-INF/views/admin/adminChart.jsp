<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/adminHead.jsp" />
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
</head>
<body>
	<div id="right-panel" class="right-panel">
		<jsp:include page="/WEB-INF/views/include/adminHeader.jsp" />
		<jsp:include page="/WEB-INF/views/include/adminSidebar.jsp" />
		<div id="main_content" class="main_content_height">
			<div class="content">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12 admin">
                        <div class="card">
                            <div class="card-header">
                                 <h5 class="m-0 font-weight-bold">타입 사용 조회</h5>
                            </div>
                            <div class="card-body">
                            <section class="adminTypeTable" >
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>타입</th>
                                            <th>타입생성자</th>
                                            <th>사용 횟수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${typeList}" var="typeList">
										<tr>
											<td><c:out value="${typeList.type_name}" /></td>
											<td><c:out value="${typeList.userid}" /></td>
											<td><c:out value="${typeList.type_count}" /></td>
											<%-- <td><a href="boardDetail.do?board_no=${boardList.board_no}">${boardList.board_name}</a></td> --%>
										</tr> 
										</c:forEach> 
                                    </tbody>
                                    
                                </table>
                                </section>
                                
                                <!-- 차트 -->
                                <section class="adminTypeChart">
                                	<div id="type_chart"></div>
                                </section>

                            </div>
                        </div>
                        
                    </div>


                </div>
                
            </div><!-- .animated -->
        </div><!-- .content -->
			
			
			
			
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>

</body>

<script>
let jsonTypeList =JSON.parse('${jsonTypeList}');
var options = {
        series: [],
        labels: [],
        chart: {
        type: 'donut'
      },
       responsive: [{
          breakpoint: 480,
          options: {
            chart: {
              width: 200
            },
            legend: {
              position: 'bottom'
            }
          }
        }] 
        };

$(jsonTypeList).each(function(index,data){
	options.series.push(data.type_count);
	options.labels.push(data.type_name);
})

var chart = new ApexCharts(document.querySelector("#type_chart"), options);
chart.render();
</script>

</html>