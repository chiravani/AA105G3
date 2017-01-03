<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.recipe_type_info.model.*"%>
<%@ page import="com.recipe.model.*"%>

<% 		
	String searchInput =request.getParameter("searchInput");
%>
<jsp:useBean id="recipe_type_infoSvc" scope="page" class="com.recipe_type_info.model.Recipe_type_infoService" />
<jsp:useBean id="recipe_m_typeSvc" scope="page" class="com.recipe_m_type.model.Recipe_m_typeService" />
<jsp:useBean id="recipe_s_typeSvc" scope="page" class="com.recipe_s_type.model.Recipe_s_typeService" />
<jsp:useBean id="list" scope="request" type="java.util.List" />

<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>已分類食譜</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert2/6.2.9/sweetalert2.min.css">
		<script></script>

		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<style type="text/css">
			#top_header{
			 	background: #f5f5dc; 
			}
			#hyper_link{
				background: #f5f5dc;
			}
			#table_title{
				font-size: 25px;
				padding:5px 0px;
			}
			#menu_zone{
				background: #f5deb3;
			}
			#accordion2{
				margin-top: 15px;
			}
			#accordion2 div{
				background: #fee4cd;
			}
			#logo{
				width: 50px;
				height: 50px;
			}
			#head_icon{
				width: 25px;
				height: 25px;
				margin-top: 13px;
			}

			thead{
				;
			}

			#the_footer{
				clear:both;
				text-align:center;
				background: #2b1100;
				clear: both;
				position:fixed ;
				bottom: 0px;
				width: 100%;
			}
			.lightcolor{
				color: #fff;
			}
			.pagination{
				margin-left: 300px;
			}
			#search{
				width: 350px;
				text-align: center;
			}

			thead{
				background: #e2fede;
			}
			/*tabs panel*/
			.type-title{
				margin-bottom: 20px;
			}
			.head-wrapper{
				padding: 0px;
			}

			.aType-Wrapper{
				padding: 0px;
			}

			.search-recipe{
				margin:30px 3px 5px 0px;
				font-size: 15px; 
				padding: 5px 25px;
			}

			.recipe_no_head{
				width: 150px;
				font-size: 17px;
			}
			.recipe_name_head{
				width: 200px;
				font-size: 17px;
			}
			.category_head{
				/*width: 62%;*/
				font-size: 17px;
			}
			td.recipe_no,td.recipe_name,td.category,.edit_head{
				font-size: 17px;
				vertical-align: middle !important;
			}
			.edit_head,.edit{
				text-align: center;
				width: 250px;
				vertical-align: middle !important
			}
			.glyphicon-plus ,.glyphicon-ok{
				font-weight: bold;
			}
			.recipe_type{
				
			}
			.glyphicon-trash.btn{
				padding: 1px 4px;
				font-weight: bold red;
				border:1px solid;
				border-radius: 30px;
				color: red;
			}
			.glyphicon-trash.btn:hover{
				color: red;
			}


			#type-info-input{
				margin-top: 70px;
			}
			#type-info-input .modal-header{
				text-align: center;
			}
			#type-info-input label{
				font-size: 16px;
			}
			#type-info-input select,#type-info-input option{
				margin-right: 10px;
				font-size: 16px;
				height: 34px;
			}

			
			

		</style>
	</head>

	<body>
		<nav class="navbar navbar-default" id="top_header">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<span class="sr-only">選單切換</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<img src="images/New_Logo2.0.png" href="#" id="logo">				
			</div>
		
			<!-- 手機隱藏選單區 -->
			<div class="collapse navbar-collapse navbar-ex1-collapse" id="top_header">
				<!-- 左選單 -->
				<ul class="nav navbar-nav">
					<li class="active"><a href="#" id=hyper_link>FOOD TIME分享食光</a></li>				
				</ul>
				<!-- 右選單 -->

				<ul class="nav navbar-nav navbar-right">
					<li><img src="images/頭像icon1.png" href="#" id="head_icon"></li>
					<li><a href="#">傑利鼠您好</a></li>
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
			<div class="col-xs-12 col-sm-10 col-md-10"">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12">
						<div class="col-xs-12 col-sm-12 head-wrapper">
							<div class="col-xs-12 col-sm-6">
								<h2 class="type-title">已分類食譜搜尋結果</h2>
							</div>
							 <div class="col-xs-12 col-sm-6 text-right aType-Wrapper">
							 <a href="<%=request.getContextPath()%>/back-end/recipe_type_info/RecipeNotClassified.jsp" class="btn btn-default search-recipe" >食譜未分類</a>
	                    		<button class="btn btn-primary search-recipe" id="search-classified">搜尋已分類食譜</button>
	                    	</div>
						</div>
			                 
	                
	                	<table class="table table-striped table-bordered">
	                    	<thead class="thead-inverse">
	                    		<tr>
	                    			<th class="recipe_no_head">食譜編號</th>
	                    			<th class="recipe_name_head">食譜名稱</th>
	                    			<th class="category_head">食譜分類</th>
	                    			<th class="edit_head">編輯</th>
	                    		</tr>
	                    	</thead>
	                		<tbody>
	                			<%@ include file="pages/page1.file" %>
	                			<c:if test="${list.size() == 0 }">
	                			
	                				<td colspan="4" style="text-align:center;font-size:20px;color:red;">查無此資料</td>
	                			</c:if> 
	                		<c:if test="${list.size()>0}">
	                		<c:forEach var="recipeVO" items="${list}" varStatus="s"  begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	                			<tr>
	                				<td class="recipe_no" name="recipe_no">${recipeVO.recipe_no}</td>
	                				<td class="recipe_name">${recipeVO.recipe_name}</td>
	                				<td class="category" id="${recipeVO.recipe_no}">
										<c:forEach var="aType" items="${recipe_type_infoSvc.getRecipe_type_infoByRecipe_no(recipeVO.recipe_no)}" varStatus="s">
	                						<span class="recipe_type">
	                							${aType.type_range==1?recipe_m_typeSvc.getOneRecipe_m_type(aType.recipe_type_no).m_type_name : recipe_s_typeSvc.getOneRecipe_s_type(aType.recipe_type_no).s_type_name}
	                						<i class="glyphicon glyphicon-trash btn" name="${aType.recipe_type_no}"></i>
	                						<c:if test="${recipe_type_infoSvc.getRecipe_type_infoByRecipe_no(recipeVO.recipe_no).size()!= s.count}">
	                					 	、
	                					 	</c:if>
	                						</span>
	                					</c:forEach>
	                				</td>
	                				<td class="edit">
	                				<button class="btn btn-danger addType"><i class="glyphicon glyphicon-plus" ></i>增加分類</button>
	                				</td>
	                			</tr>
	                		</c:forEach>
	                		</c:if>
	                		<%@ include file="pages/page2.file" %>
	                			
	                		</tbody>
	                	</table>
	                </div>
			    </div>
		  </div>
	 </div>
      			
				

				
			
		
		 <div class="modal fade" id="type-info-input" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		      <form class="form-horizontal" action="/AA105G3/Recipe_l_type/Recipe_l_type.do" method="post" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h3 class="modal-title">新增分類</h3>
		        </div>
		        <div class="modal-body">

		          	
					<div class="form-group form-inline">
							<label  for="recipe_l_type_no" class="col-sm-3 control-label">請選擇 : </label>
							<div class="col-sm-9 text-left">
							<select name="recipe_l_type_no" id="recipe_l_type_no" class="">
								<option value="RL0001">家常菜</option>
								
							</select>
							<select name="recipe_m_type_no" id="recipe_m_type_no" class="">
								<option value="RM0001">沙拉</option>
								
								
							</select>
							<select name="recipe_s_type_no" id="recipe_s_type_no" class="">
								<option value="">請選擇</option>
								
								
							</select>
							</div>
						</div>
		          
		        </div>
		        <div class="modal-footer">
		          <input type="button" class="btn btn-default" name="submitButton" id="addRecipe_type" value="提交">
		          <input type="hidden" name="action" value="update">
		          <input type="hidden" name="recipe_no" id="recipe_no" value="">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		        </form>
		      </div>
		    </div>
		  </div>


		<footer id="the_footer">
			<p class="lightcolor">All Content Copyright &copy; 2016 TomCat Inc</p>
		</footer>
		
	

		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.2.9/sweetalert2.min.js"></script>
		<!-- <script src="/AA105G3/js/sweetalert2.min.js"></script> -->
		<script type="text/javascript">
		

			

			function selectCreateLType(oJson,targetId){
				$('#'+targetId).empty();
				var i=0;
				//$('#'+targetId).append("<option value=''>請選擇</option>");
				$.each(oJson,function(){
						$('#'+targetId).append($("<option></option>").attr("value", oJson[i].recipe_l_type_no).text(oJson[i].l_type_name));	
						
						// .append("<option value='"+oJson[i].recipe_m_type_no+"'>"+oJson[i].m_type_name+"</option>");
					i++;
				});
			}

			function selectCreateMType(oJson,targetId){
				$('#'+targetId).empty();

				var i=0;
				if(oJson[1]==null){
					$('#'+targetId).append('<option value="">無</option>');
					
				}
				//$('#'+targetId).append("<option value=''>請選擇</option>");
				$.each(oJson,function(){
					if(i>0){
						$('#'+targetId).append($("<option></option>").attr("value", oJson[i].recipe_m_type_no).text(oJson[i].m_type_name));	
					}
						// .append("<option value='"+oJson[i].recipe_m_type_no+"'>"+oJson[i].m_type_name+"</option>");
					i++;
				});

				//如果該大類別沒有中類別，強制讓小類別顯示請選擇。
				if(oJson[1].recipe_m_type_no==null){
					$('#recipe_s_type_no').append('<option value="">請選擇</option>');
				}

				//強制在只更換大類別時也一起更換小類別
				selectCreateSType(oJson[1],'recipe_s_type_no');


				//中類別change事件
				$('#'+targetId).change(function(){

					$.ajax({
						 type:"GET",
						 url:"/AA105G3/recipe_m_type/recipe_m_typeJsonRes.do",
						 data:{"action":"getStypesByMtype_no","recipe_m_type_no":$(this).val()},
						 dataType:"json",
						 success:function (data){
							 $('#recipe_s_type_no').empty();
							 
							 var j=0;
							
							 	$('#recipe_s_type_no').append('<option value="">請選擇</option>');	
							 
							 
							 $.each(data,function(){
								 $('#recipe_s_type_no').append("<option value='"+data[j].recipe_s_type_no+"'>"+data[j].s_type_name+"</option>");
								 j++;
							 })
					     },
			            error:function(){alert("error")}
			        })
				})
			}

			function selectCreateSType(oJson,targetId){
				$('#'+targetId).empty();

				

				$.ajax({
						 type:"GET",
						 url:"/AA105G3/recipe_m_type/recipe_m_typeJsonRes.do",
						 data:{"action":"getStypesByMtype_no","recipe_m_type_no":oJson.recipe_m_type_no},
						 dataType:"json",
						 success:function (data){
							 $('#recipe_s_type_no').empty();
							 var j=0;
							
							 	$('#recipe_s_type_no').append('<option value="">請選擇</option>');	
							 
							 
							 $.each(data,function(){
								 $('#recipe_s_type_no').append("<option value='"+data[j].recipe_s_type_no+"'>"+data[j].s_type_name+"</option>");
								 j++;
							 })
					     },
			            error:function(){alert("error")}
			        })

				
			} 


			//init
		$().ready(function(){

			//showRecipeInput and init select options
			var showRecipeInput = $('button.addType').click(function(){

				var recipe_no = $(this).parent().siblings("td[name='recipe_no']").text();
				$('#recipe_no').val(recipe_no);
				$.ajax({
						 type:"GET",
						 url:"/AA105G3/recipe_l_type/recipe_l_typeJsonRes.do",
						 data:{"action":"getAll"},
						 dataType:"json",
						 success:function (data){
							 selectCreateLType(data,'recipe_l_type_no');
							 $.ajax({
								 type:"GET",
								 url:"/AA105G3/recipe_l_type/recipe_l_typeJsonRes.do",
								 data:{"action":"getTypeInfo","recipe_l_type_no":data[0].recipe_l_type_no},
								 dataType:"json",
								 success:function (data){
									 selectCreateMType(data,'recipe_m_type_no');
									 selectCreateSType(data[1],'recipe_s_type_no');
							     },
					             error:function(){alert('not found')}
					         })

							$("#type-info-input").modal('show');
							
					     },
			             error:function(){alert('not found')}
			         })

			})

			//select Ltype change
			var lTypeChange = $('#recipe_l_type_no').change(function(){
				$.ajax({
						 type:"GET",
						 url:"/AA105G3/recipe_l_type/recipe_l_typeJsonRes.do",
						 data:{"action":"getTypeInfo","recipe_l_type_no":$(this).val()},
						 dataType:"json",
						 success:function (data){
							 selectCreateMType(data,'recipe_m_type_no');
					     },
			             error:function(){alert('not found')}
			         })
			})


			//delete RecipeType
			var deleteType = $('span i').click(function() {
  				var recipe_type_no =$(this).attr("name");
  				var obj = $(this);
  				var recipe_no = $(this).parent().parent().siblings("td[name='recipe_no']").text();
  				
				swal({
				  title: 'Are you sure?',
				  text: "You won't be able to revert this!",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!'
				}).then(function () {

						$.ajax({
						 type:"GET",
						 url:"/AA105G3//recipe_type_info/recipe_type_infoJsonRes.do",
						 data:{"action":"delete","recipe_no":recipe_no,"recipe_type_no":recipe_type_no},
						 dataType:"json",
						 success:function (data){
							 swal(

							    'Deleted!',
							    data.typeName+'已經被刪除',
							    'success'
							  )
							  obj.parent().empty().remove();
					     },
			             error:function(){
			             	swal({
								 title: 'Error!',
  									type: 'error'
								})
			       		  }
			         })
				 
					});
			});

			//addRecipeType
			var addRecipeType = $('#addRecipe_type').click(function(){
				var recipe_l_type_no = $('#recipe_l_type_no').val();
				var recipe_m_type_no = $('#recipe_m_type_no').val();
				var recipe_s_type_no = $('#recipe_s_type_no').val();
				var recipe_no = $('#recipe_no').val();

				$.ajax({
						 type:"GET",
						 url:"/AA105G3//recipe_type_info/recipe_type_infoJsonRes.do",
						 data:{"action":"insert","recipe_no":recipe_no,"recipe_l_type_no":recipe_l_type_no,"recipe_m_type_no":recipe_m_type_no,"recipe_s_type_no":recipe_s_type_no},
						 dataType:"json",
						 success:function (data){

						 	if(data.ErrorMsg==null){
						 		
						 		if (!$.trim($('#'+recipe_no).html())){
						 				$("#type-info-input").modal('hide');
						 				$('#'+recipe_no).append('<span class="recipe_type">'+data.typeName+'<i class="glyphicon glyphicon-trash btn" name="'+data.recipe_type_no+'"></i></span>');
						 			}else{
						 				$("#type-info-input").modal('hide');
							 			$('#'+recipe_no).append('<span class="recipe_type">、'+data.typeName+'<i class="glyphicon glyphicon-trash btn" name="'+data.recipe_type_no+'"></i></span>');
						 			}
						 		
						 			
							 swal(

						    	  'Good job!',
								  'You clicked the button!',
								  'success'
								
							  )
							 
						 	}else{
						 		$("#type-info-input").modal('hide');
						 		
						 		swal({

								  title : data.ErrorMsg,
								  type : 'warning'
								})
						 	}
						 
							  
					     },
			             error:function(){
			             	swal({
								 title: '新增失敗!',
  									type: 'error'
								})
			       		  }
			         })

			})

			//Search classified Recipe

			
			var Search = $('#search-classified').click(function(){

				swal({
					  title: '請輸入食譜名',
					  html:
					  	'<form class="form-horizontal" id="searchBar" action="/AA105G3/recipe/recipe.do" method="post" >'+
					    '<input id="searchInput" class="searchInput" name="searchInput" autofocus>' +
					    '<input type="hidden" name="searchCondition" value="recipe_name">' +
					    '<input type="hidden" name="action" value="searchClassified">' +
					    '</form>',
					  preConfirm: function () {
					  	$('#searchBar').submit();
					    return new Promise(function (resolve) {
					      resolve([
					        $('#searchInput').val(),
					        $('#searchCondition').val(),
					        $('#action').val()
					      ])
					    })
					  }
					})
			})


			$('body').on('click', 'span i', function() {

				var recipe_type_no =$(this).attr("name");
  				var obj = $(this);
  				var recipe_no = $(this).parent().parent().siblings("td[name='recipe_no']").text();
  				
				swal({
				  title: 'Are you sure?',
				  text: "You won't be able to revert this!",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!'
				}).then(function () {

						$.ajax({
						 type:"GET",
						 url:"/AA105G3//recipe_type_info/recipe_type_infoJsonRes.do",
						 data:{"action":"delete","recipe_no":recipe_no,"recipe_type_no":recipe_type_no},
						 dataType:"json",
						 success:function (data){
							 swal(

							    'Deleted!',
							    data.typeName+'已經被刪除',
							    'success'
							  )
							  obj.parent().empty().remove();
					     },
			             error:function(){
			             	swal({
								 title: 'Error!',
  									type: 'error'
								})
			       		  }
			         })
				 
					});


			});


		})
			

			

			
			
		</script>
	</body>
</html>