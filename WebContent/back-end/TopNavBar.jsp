<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>

<% 	
	EmpService empSvc = new EmpService();
	/* String emp_no = (String)session.getAttribute("emp_no"); */
	String emp_no = "1001";
	String emp_name = (empSvc.getOneEmp(emp_no)).getEmp_name(); 	
	session.setAttribute("emp_name",emp_name);
	
%>

<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>backEndTopNav</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<style type="text/css">
			#menu_zone{
				background: #f5deb3;
			}
			#logo{
				width: 50px;
				height: 50px;
			}
			#topnavBar{
			 	background: #f5f5dc; 
			}
			.empPic{
				padding:15px 0px;
				font-size: 20px;

			}
			#navHome{
				color:#000;
				font-size: 20px;
			}
			#navHome:hover{
				text-decoration: none;
			}
			.login-emp-wrapper{
				padding:15px 0px;
				font-size:18px;
			}
			.login-emp{
				
			}
			.logout-wrapper{
				margin:0 10px;
			}
			li>a.logout{
				font-size:18px;
				margin-top:14px;
				
				padding:2px;
				border:1px solid;
			}
			.glyphicon-log-out{
			 	font-size:18px;
			 	margin-top:;
			}
		</style>
	</head>
	<body>
	${sessionScope.emp_no}	
		<nav class="navbar navbar-default" id="topnavBar">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<span class="sr-only">選單切換</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="#" id="navHome">
					<img src="/AA105G3/images/Logo.png" href="#" id="logo">
					FOOD TIME分享食光
				</a>				
			</div>
		
			<!-- 手機隱藏選單區 -->
			<div class="collapse navbar-collapse navbar-ex1-collapse" id="top_header">
				<!-- 左選單 -->
				<ul class="nav navbar-nav">
					<li class="active"></li>				
				</ul>
				<!-- 右選單 -->

				<ul class="nav navbar-nav navbar-right">
					<li><i class="glyphicon glyphicon-user empPic"></i></li>
					<li class="login-emp-wrapper"><span class="login-emp">${emp_name}</span>&nbsp;&nbsp;您好</li>
					<li class="logout-wrapper"><a href="#" class="logout">登出&nbsp;<i class="glyphicon glyphicon-log-out"></i></a></li>
				</ul>
			</div>
			<!-- 手機隱藏選單區結束 -->
		</nav>
		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	</body>
</html>