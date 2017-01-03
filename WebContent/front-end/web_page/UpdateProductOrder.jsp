<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_order.model.*"%>
<%
	Product_orderVO product_orderVO = (Product_orderVO) request.getAttribute("product_orderVO"); //Product_orderServlet.java (Concroller), 存入req的product_orderVO物件 (包括幫忙取出的product_orderVO, 也包括輸入資料錯誤時的product_orderVO物件)
%>
<html>
<head>
<title>商品訂單資料修改 - update_product_order_input.jsp</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="/AA105G3/front-end/web_page/css/frontpageCSS.css">

<style type="text/css" media="screen">
	html, body{
		background : white;
		height : 100%;
	}

	#skin{
		/* border : solid red; */
		/* background : #f5f5dc; */
		width : 100%;
		margin : 0px auto;
				
		/* 填滿skin */
		min-height : 100%;
		position : relative;
	}
	#id_wrapper{
		min-height: 100%;
		position: relative;
	}
	#id_footer{
		position: absolute;
    	bottom: 0;
	}
	#theFooter{
		/* 對應skin */
		position : absolute;
		bottom : 0px;
		width : 100%;
	}
	.title-style{
		padding-top : 50px;
	}
	.list-style{
		padding-top : 75px;
		padding-left : 350px;
	}
	th{
		height: 50px;
	}
	td{
		height: 50px;
	}
</style>

</head>

<body>





<div id="skin">

<!--START SCROLL TOP BUTTON -->
<a class="scrollToTop" href="#">
	<i class="fa fa-angle-up"></i>
	<span>Top</span>
</a>
<!-- END SCROLL TOP BUTTON -->

<div class="navbar navbar-default navbar-fixed-top navbar-inverse mu-main-navbar" >
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
				<span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
			</button>
			<a href="#home" class="foodtime"><img alt="FoodTime" src="<%=request.getContextPath()%>/front-end/web_page/images/Logo.png">分享食光</a>
		</div>
		<div class="collapse navbar-collapse" id="navbar-ex-collapse">
			<ul class="nav navbar-nav navbar-right mu-main-nav">
				<li >
					<a href="#home">首頁</a>
	            </li>
	            <li>
					<a href="#mu-recipe">食譜</a>
	            </li>
	            <li>
					<a href="#mu-video">影音</a>
	            </li>
	            <li>
					<a href="#mu-chef">私廚</a>
	            </li>
	            <li>
					<a href="#mu-stream">實況</a>
	            </li>
	            <li>
					<a href="#mu-market">市集</a>
	            </li>
	            <li>
					<a href="#mu-contact">聯絡我們</a>
	            </li>
	            <li>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">UserID<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">編輯個人資訊</a></li>
						<li><a href="#">個人頁面</a></li>
						<li><a href="#">我的最愛</a></li>
						<li><a href="#">登出</a></li>
					</ul>
				</li>
				<li>
					<a href="#">註冊</a>
				</li>
			</ul>
		</div>
	</div>
</div>





<div class="container">
	<div class="row">
		<div class="list-style">





<h3>商品訂單資料修改:</h3>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product_order/product_order.do" name="form1">
<table border="0">
	<tr>
		<td>訂單編號：</td>
		<td><%=product_orderVO.getProd_ord_no()%></td>
	</tr>
	<tr>
		<td>會員編號：</td>
		<td><%=product_orderVO.getMem_no()%></td>
	</tr>
	<tr>
		<td>訂單成立時間：</td>
		<td><%=product_orderVO.getProd_ord_time()%></td>
	</tr>
	<tr>
		<td>信用卡卡號：</td>
		<td><%=product_orderVO.getCred_card_no().subSequence(0,4)%>********<%=product_orderVO.getCred_card_no().subSequence(12,16)%></td>
	</tr>
	<tr>
		<td>信用卡有效時期：</td>
		<td><%=product_orderVO.getValid_date()%></td>
	</tr>
	<tr>
		<td>信用卡卡別：<%=product_orderVO.getCred_card_type()%></td>
		<td>
			<c:if test="${product_orderVO.cred_card_type == '0'}" >
				VISA
			</c:if>
			<c:if test="${product_orderVO.cred_card_type == '1'}" >
				MASTER
			</c:if>
			<c:if test="${product_orderVO.cred_card_type == '2'}" >
				JCB
			</c:if>
		</td>
	</tr>
	<tr>
		<td>訂單總金額：</td>
		<td><%=product_orderVO.getTotal_money()%></td>
	</tr>
	<tr>
		<td>收件人姓名:</td>
		<td><input type="TEXT" name="ship_name" size="45"
			value="<%= (product_orderVO==null)? "地球人" : product_orderVO.getShip_name()%>" /></td>
	</tr>
	<tr>
		<td>郵遞區號:</td>
		<td><input type="TEXT" name="post_code" size="45"
			value="<%= (product_orderVO==null)? "32099" : product_orderVO.getPost_code()%>" /></td>
	</tr>
	<tr>
		<td>寄送地址:</td>
		<td><input type="TEXT" name="mem_adrs" size="45"
			value="<%= (product_orderVO==null)? "太陽系第三行星-地球" : product_orderVO.getMem_adrs()%>" /></td>
	</tr>
	<tr>
		<td>聯絡手機:</td>
		<td><input type="TEXT" name="cell_phone" size="45"
			value="<%= (product_orderVO==null)? "0987654321" : product_orderVO.getCell_phone()%>" /></td>
	</tr>
	<tr>
		<td>聯絡市話:</td>
		<td><input type="TEXT" name="tel_phone" size="45"
			value="<%= (product_orderVO==null)? "03-4567891" : product_orderVO.getTel_phone()%>" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="prod_ord_no" value="<%=product_orderVO.getProd_ord_no()%>">
<input type="hidden" name="mem_no" value="<%=product_orderVO.getMem_no()%>">
<input type="hidden" name="prod_ord_time" value="<%=product_orderVO.getProd_ord_time()%>">
<input type="hidden" name="cred_card_no" value="<%=product_orderVO.getCred_card_no()%>">
<input type="hidden" name="valid_date" value="<%=product_orderVO.getValid_date()%>">
<input type="hidden" name="valid_no" value="<%=product_orderVO.getValid_no()%>">
<input type="hidden" name="cred_card_type" value="<%=product_orderVO.getCred_card_type()%>">
<input type="hidden" name="total_money" value="<%=product_orderVO.getTotal_money()%>">
<input type="submit" value="送出修改"></FORM>





		</div>
	</div>
</div>

</div>

<footer id="theFooter">
	Copyright &copy; 2016 Java Team 3 
</footer>
		
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>





</body>
</html>