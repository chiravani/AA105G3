<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>

<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>員工資料新增</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css">
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<style type="text/css">
			#emp_name,#emp_address,#emp_account,#emp_id,#emp_email,#emp_phone{
				width:500px;
			}
		</style>
	</head>
	<body>
		<c:import url="/back-end/TopNavBar.jsp" ></c:import>
		<div class="container">
			<div class="row">
				<div class="emp-form-wrapper text-center">
					<div class="emp-form-title-wrapper col-sm-9 col-sm-pull-3 col-sm-offset-3">
						<h2>員工資料新增頁面</h2>
					</div>
					
					<form class="form-horizontal" METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do">
					
						<div class="form-group form-inline">
							<label  for="emp_name" class="col-sm-2 control-label">姓名 : </label>
							<div class="col-sm-9 text-left">
							<input type="text" name="emp_name" id="emp_name" class="form-control" placeholder="請輸入姓名">
							</div>
						</div>
						
						<div class="form-group form-inline">
							<label  for="emp_account" class="col-sm-2 control-label">帳號 : </label>
							<div class="col-sm-9 text-left">
							<input type="text" name="emp_account" id="emp_account" class="form-control" placeholder="請輸入帳號">
							</div>
						</div>
						
						<div class="form-group form-inline">
							<label  for="emp_id" class="col-sm-2 control-label">身分證 : </label>
							<div class="col-sm-9 text-left">
							<input type="text" name="emp_id" id="emp_id" class="form-control" placeholder="請輸入身分證字號">
							</div>
						</div>
					
						<div class="form-group form-inline">
							<label  for="emp_email" class="col-sm-2 control-label">E-mail : </label>
							<div class="col-sm-9 text-left">
							<input type="text" name="emp_email" id="emp_email" class="form-control" placeholder="請輸入E-mail">
							</div>
						</div>
					
						<div class="form-group form-inline">
							<label  for="emp_address" class="col-sm-2 control-label">住址 : </label>
							<div class="col-sm-9 text-left">
							<input type="text" name="emp_address" id="emp_address" class="form-control" placeholder="請輸入住址">
							</div>
						</div>
								
						<div class="form-group form-inline">
							<label  for="emp_phone" class="col-sm-2 control-label">連絡電話 : </label>
							<div class="col-sm-9 text-left">
							<input type="text" name="emp_phone" id="emp_phone" class="form-control" placeholder="請輸入連絡電話">
							</div>
						</div>
					
						<div class="form-group form-inline">
							<label  for="emp_hiredate" class="col-sm-2 control-label"  >到職日 : </label>
							<div class="col-sm-9 text-left">
							<input type="text" name="emp_hiredate" id="emp_hiredate" class="form-control" placeholder="請輸入到職日" readonly>
							</div>
						</div>
						<div class="form-group form-inline">
							<label  for="emp_job" class="col-sm-2 control-label">職稱 : </label>
							<div class="col-sm-9 text-left">
							<input type="text" name="emp_job" id="emp_job" class="form-control" placeholder="請輸入職稱">
							</div>
						</div>
						<div class="submit-wrapper col-sm-9 col-sm-pull-3 col-sm-offset-3">
							<input type="submit" class="btn btn-primary" value="提交"/>
							<input type="hidden"  name="action" value="insert">	
						</div>
						<div class="col-sm-offset-3"></div>
						
					</form>
				</div>
			</div>
		</div>
		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/locales/bootstrap-datepicker.zh-TW.min.js"></script>
		<script type="text/javascript">

			$('#emp_hiredate').datepicker({
			    todayBtn: "linked",
			    clearBtn: true,
			    
			    orientation: "bottom right"
			    
			});

		</script>

	</body>
</html>