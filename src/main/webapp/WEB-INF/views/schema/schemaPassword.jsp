<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<style>
	input {
	      display: inline-block;
	      height: 40px;
	      padding: 0 10px;
	      vertical-align: middle;
	      border: 1px solid #dddddd;
	      color: #999999;
	      border-radius: 5px;
	      width:100%;
      }
	.content{
		position: relative;
	}
	.passwordArea{
		position: absolute;
	    width: 40%;
	    min-width: 400px;
	    left: calc(50% - 15%);
	    padding-top: 30%;
	}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />

	<div id="right-panel" class="right-panel">
		<section id="header"> <jsp:include page="/WEB-INF/views/include/header.jsp" /> </section>
		<div class="content">
			<div class="continer">
			 <div class="passwordArea">
				<div class="card">
					<div class="card-header bg-success">
					  <strong class="card-title text-light">비공개 스키마입니다. 비밀번호를 입력해주세요.</strong>
				  </div>
				  <div class="card-body card-block">
					 <form role="form" action="/schema/schemaDetail.do" method="get">
                        		<div class="form-group">
									<input type="hidden" name="schema_no"value="${param.schema_no }">
                        			<input type="text" name="password" placeholder="비밀번호">
                        		</div>
                        		<input class="btn btn-success" type="submit" value="확인">
                        	</form>
				  </div>
			  </div>
			 </div>
			</div>
		</div>
	</div>
</body>
</html>