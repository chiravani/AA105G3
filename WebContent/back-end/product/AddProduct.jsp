<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%
ProductVO productVO = (ProductVO) request.getAttribute("productVO");
%>

<html>
<head>
<title>商品資料新增 - addProduct.jsp</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="/AA105G3/css/backpageCSS.css">

<style>

#mainTable{
	width : 800px;
	height : 600px;
	margin : 0px auto;
	/* background-color : #f5deb3; */
}
th, td {
	height : 50px;
	max-width : 200px;
	padding-left : 60px;
}
#center{
	padding-left : 0px;
	text-align : center;
}
#productTextarea{
	resize : none;
	width : 250px;
	height : 150px;
}
#img{
	height : 150px;
	width : auto;
}
.btn-style{
	padding-top : 50px;
}

</style>

</head>
<script language="JavaScript" src="<%=request.getContextPath()%>/back-end/product/js/product_picture.js"></script>
<div id="popupcalendar" class="text"></div>

<body>





<nav class="navbar navbar-default" id="top_header">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
			<span class="sr-only">選單切換</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<img src="<%=request.getContextPath()%>/images/Logo.png" href="#" id="logo">				
	</div>
		
	<!-- 手機隱藏選單區 -->
	<div class="collapse navbar-collapse navbar-ex1-collapse" id="top_header">
		<!-- 左選單 -->
		<ul class="nav navbar-nav">
			<li class="active"><a href="#" id=hyper_link>FOOD TIME分享食光</a></li>				
		</ul>
		
		<!-- 搜尋表單 -->
		<!-- <form class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="請輸入關鍵字">
			</div>
			<button type="submit" class="btn btn-default">搜尋</button>
		</form> -->
		
		<!-- 右選單 -->
		<ul class="nav navbar-nav navbar-right">
			<li><img src="images/頭像icon1.png" href="#" id="head_icon"></li>
			<li><a href="#">菜鳥會員您好</a></li>
			<li><a href="#">登出</a></li>
		</ul>
	</div>
	<!-- 手機隱藏選單區結束 -->
</nav>





<div class="col-xs-12 col-sm-2" id="menu_zone">
	<div class="panel-group" id="accordion2" role="tablist" aria-multiselectable="true">
	<!-- 區塊1 -->
		<div class="panel panel-default">
	    	<div class="panel-heading" role="tab" id="panel1">
	      		<h4 class="panel-title">
					<i class=" glyphicon glyphicon-user"></i>
					<a href="#aaa" data-parent="#accordion2" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="aaa">
						會員管理
					</a>
				</h4>
			</div>
			<div id="aaa" class="panel-collapse collapse" role="tabpanel" aria-labelledby="panel1">
				<div class="list-group">
					<a href="#" class="list-group-item">會員資料查詢</a>
					<a href="#" class="list-group-item">私廚資格審核</a>
					<a href="#" class="list-group-item">私廚資料管理</a>
				</div>
			</div>
		</div>
	<!-- 區塊2 -->
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="panel2">
				<h4 class="panel-title">
					<i class=" glyphicon glyphicon-pawn"></i>
					<a href="#bbb" data-parent="#accordion2" data-toggle="collapse" role="button" class="collapsed" aria-expanded="false" aria-controls="bbb">
						員工管理
					</a>
				</h4>
			</div>
			<div id="bbb" class="panel-collapse collapse" role="tabpanel" aria-labelledby="panel2">
				<div class="list-group">
					<a href="#" class="list-group-item">員工權限管理</a>
					<a href="#" class="list-group-item">員工資料管理</a>					     
				</div>
			</div>
		</div>
	<!-- 區塊3 -->
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="panel3">
				<h4 class="panel-title">
					<i class=" glyphicon glyphicon-exclamation-sign"></i>
					<a href="#ccc" data-parent="#accordion2" data-toggle="collapse" role="button" class="collapsed" aria-expanded="false" aria-controls="ccc">
						檢舉管理
					</a>
				</h4>
			</div>
			<div id="ccc" class="panel-collapse collapse" role="tabpanel" aria-labelledby="panel3">
				<div class="list-group">
					<a href="#" class="list-group-item">文章檢舉審核</a>
					<a href="#" class="list-group-item">食譜檢舉審核</a>
					<a href="#" class="list-group-item">實況檢舉審核</a>
					<a href="#" class="list-group-item">影片檢舉審核</a>
				</div>
			</div>
		</div>
	<!-- 區塊4 -->
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="panel4">
				<h4 class="panel-title">
					<i class=" glyphicon glyphicon-book"></i>
					<a href="#ddd" data-parent="#accordion2" data-toggle="collapse" role="button" class="collapsed" aria-expanded="false" aria-controls="ddd">
						食譜管理
					</a>
				</h4>
			</div>
			<div id="ddd" class="panel-collapse collapse" role="tabpanel" aria-labelledby="panel4">
				<div class="list-group">
					<a href="#" class="list-group-item">食譜類別管理</a>
					<a href="#" class="list-group-item">未分類食譜管理</a>
				</div>
			</div>
		</div>
	<!-- 區塊5 -->
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="panel5">
				<h4 class="panel-title">
					<i class=" glyphicon glyphicon-paste"></i>
					<a href="#eee" data-parent="#accordion2" data-toggle="collapse" role="button" class="collapsed" aria-expanded="false" aria-controls="eee">
						前端網頁管理
					</a>
				</h4>
			</div>
			<div id="eee" class="panel-collapse collapse" role="tabpanel" aria-labelledby="panel5">
				<div class="list-group">
					<a href="#" class="list-group-item">廣告管理</a>
					<a href="#" class="list-group-item">公告管理</a>
				</div>
			</div>
		</div>
	<!-- 區塊6 -->
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="panel6">
				<h4 class="panel-title">
					<i class=" glyphicon glyphicon-equalizer"></i>
					<a href="#fff" data-parent="#accordion2" data-toggle="collapse" role="button" class="collapsed" aria-expanded="false" aria-controls="fff">
						市集管理
					</a>
				</h4>
			</div>
			<div id="fff" class="panel-collapse collapse" role="tabpanel" aria-labelledby="panel6">
				<div class="list-group">
					<a href="#" class="list-group-item">商品上下架</a>
					<a href="#" class="list-group-item">商品資料管理</a>
				</div>
			</div>
		</div>
	<!-- 區塊7 -->
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="panel7">
				<h4 class="panel-title">
					<i class=" glyphicon glyphicon-list-alt"></i>
					<a href="#ggg" data-parent="#accordion2" data-toggle="collapse" role="button" class="collapsed" aria-expanded="false" aria-controls="ggg">
						商品訂單管理
					</a>
				</h4>
			</div>
			<div id="ggg" class="panel-collapse collapse" role="tabpanel" aria-labelledby="panel7">
				<div class="list-group">
					<a href="#" class="list-group-item">商品訂單查詢</a>				      	
				</div>
			</div>
		</div>
	<!-- 區塊8 -->
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="panel8">
				<h4 class="panel-title">
					<i class=" glyphicon glyphicon-cutlery"></i>
					<a href="#hhh" data-parent="#accordion2" data-toggle="collapse" role="button" class="collapsed" aria-expanded="false" aria-controls="hhh">
						私廚平台管理
					</a>
				</h4>
			</div>
			<div id="hhh" class="panel-collapse collapse" role="tabpanel" aria-labelledby="panel8">
				<div class="list-group">
					<a href="#" class="list-group-item">使用平台金流</a>
					<a href="#" class="list-group-item">私廚訂單查詢</a>
					<a href="#" class="list-group-item">仲介金流</a>
					<a href="#" class="list-group-item">退款審核</a>
				</div>
			</div>
		</div>
	</div>
</div>





<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-sm-push-1 table-style">
		
		
		
		
		
		<%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
				<font color='red'>請修正以下錯誤:
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li>${message}</li>
					</c:forEach>
				</ul>
				</font>
			</c:if>





			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" name="form1" enctype="multipart/form-data">

			<table border='1' bordercolor='#CCCCFF' id="mainTable" cellspacing="0" >
			
				<tr>
					<td colspan="2" id="center" align="center" valign="center"><h2>新增商品資料</h2></td>
				</tr>
				
				<tr>
					<td>商品編號：${productVO.prod_no}</td>
					<td>商品名稱：<input type="TEXT" name="prod_name" value="<%= (productVO==null)? "新的商品" : productVO.getProd_name()%>" /></td>
				</tr>
				
				<tr>
					<td>上架日期：<input type="date" name="shelf_date"></td>
					
					<td>下架日期：<input type="date" name="remove_date"></td>
				</tr>
				
				<tr>
					<td>銷售數量：<input type="TEXT" name="sales_volume" value="<%= (productVO==null)? "10" : productVO.getSales_volume()%>" /></td>
					<td>庫存數量：<input type="TEXT" name="stor_capacity" value="<%= (productVO==null)? "100" : productVO.getStor_capacity()%>" /></td>
				</tr>
										
				<tr>
					<td>商品單價：<input type="TEXT" name="unit_price" value="<%= (productVO==null)? "50" : productVO.getUnit_price()%>" /></td>
					<td>優惠價格：<input type="TEXT" name="disc_price" value="<%= (productVO==null)? "25" : productVO.getDisc_price()%>" /></td>
				</tr>
										
				<tr>
					<td>
						商品類別：
						<select size="1" name="prod_type">
							<option value="SPACE BAG" >太空包
							<option value="TABLEWARE" >餐具
							<option value="KITCHENWARE" >廚具
						</select>
					</td>
					<td id="searchTd">
						銷售狀態：
						<select size="1" name="sell_status">
							<option value="0" >缺貨中
							<option value="1" >販售中
						</select>
					</td>
				</tr>
											
				<tr>
					<td id="searchTd">
						商品狀態：
						<select size="1" name="prod_status">
							<option value="0" >下架
							<option value="1" >上架
							<option value="2" >不再販售
						</select>
					</td>
					<td id="searchTd">
						優惠狀態：
						<select size="1" name="disc_status">
							<option value="0" >非特價
							<option value="1" >特價中
						</select>
					</td>
				</tr>
								
				<tr>
					<td>優惠起始日期：<input type="date" name="disc_start_date"></td>
					<td>優惠結束日期：<input type="date" name="disc_end_date"></td>
				</tr>
											
				<tr>
					<td>商品照片：
						<input accept="image/*" type="FILE" name="prod_picture" id="prod_picture" />
						<div id="center"><img id="img" src="<%=request.getContextPath()%>/back-end/product/images/No-image-found.png"></div></td>
					<td>商品描述：<br>
						<textarea id="productTextarea" name="prod_description" cols="50" rows="5">
							<%= (productVO==null)? "最新的太空包上市！" : productVO.getProd_description()%>
						</textarea>
					</td>
				</tr>
				
			</table>

				<br>

				<div class="text-center btn-style">
					<a class="btn btn-default" href="/AA105G3/back-end/product/MarketManagement.jsp">取消新增</a>
					
					
					<input type="hidden" name="action" value="insert">
					<input class="btn btn-primary" type="submit" value="確認新增">
				</div>

			</FORM>





		</div>
	</div>
</div>






<footer id="the_footer">
	<p class="lightcolor">Copyright &copy; 2016 Java Team 3</p>
</footer>
		
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>





</body>
</html>