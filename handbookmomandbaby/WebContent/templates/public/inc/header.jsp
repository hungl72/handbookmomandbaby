<%@page import="models.Account"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="utils.DBConnectionUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>HandBook (M&B)</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="CareMed demo project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/bootstrap4/bootstrap.min.css">
<link href="<%=request.getContextPath()%>/templates/public/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/plugins/OwlCarousel2-2.2.1/animate.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/styles/metro/notify-metro.css" />
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/templates/loginlogout/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/templates/loginlogout/vendor/bootstrap/js/popper.js"></script>
	<script src="<%=request.getContextPath()%>/templates/loginlogout/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/templates/loginlogout/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/templates/loginlogout/js/main.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
	<script src="demoValidation.js" type="text/javascript"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<style type="text/css">
	body{
		font-family: 'Roboto', sans-serif;
	}
		.page{float:left; width:100%;}
	
	.col-md-2, .col-md-10{
	padding:0;
	}
	.panel{
	margin-bottom: 0px;
	width:100%;
	}
	.chat-window{
	bottom:0;
	position:fixed;
	float:right;
	margin-left:10px;
	right:0;
	}
	.chat-window > div > .panel{
	border-radius: 5px 5px 0 0;
	}
	.icon_minim{
	padding: 0;
	}
	.msg_container_base{
	background: #e5e5e5;
	margin: 0;
	padding: 0;
	max-height:300px;
	overflow-x:hidden;
	}
	.top-bar {
	background: #666;
	color: white;
	padding: 10px;
	position: relative;
	overflow: hidden;
	}
	.msg_receive{
	padding-left:0;
	margin-left:0;
	}
	.msg_sent{
	padding-bottom:20px !important;
	margin-right:0;
	}
	.messages {
	background: white;
	padding: 10px;
	border-radius: 2px;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
	max-width:100%;
	}
	.messages > p {
	font-size: 13px;
	margin: 0 0 0.2rem 0;
	}
	.messages > time {
	font-size: 11px;
	color: #ccc;
	}
	.msg_container {
	padding: 10px;
	overflow: hidden;
	display: flex;
	}
	img {
	display: block;
	width: 100%;
	}
	.avatar {
	position: relative;
	}
	.base_receive > .avatar:after {
	content: "";
	position: absolute;
	top: 0;
	right: 0;
	width: 0;
	height: 0;
	border: 5px solid #FFF;
	border-left-color: rgba(0, 0, 0, 0);
	border-bottom-color: rgba(0, 0, 0, 0);
	}
	
	.base_sent {
	justify-content: flex-end;
	align-items: flex-end;
	}
	.base_sent > .avatar:after {
	content: "";
	position: absolute;
	bottom: 0;
	left: 0;
	width: 0;
	height: 0;
	border: 5px solid white;
	border-right-color: transparent;
	border-top-color: transparent;
	box-shadow: 1px 1px 2px rgba(black, 0.2); 
	
	.msg_sent > time{
	float: right;
	}
	
	
	.msg_container_base{padding:0px !important;}
	
	.msg_container_base::-webkit-scrollbar-track
	{
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	background-color: #F5F5F5;
	}
	
	.msg_container_base::-webkit-scrollbar
	{
	width: 12px;
	background-color: #F5F5F5;
	}
	
	.msg_container_base::-webkit-scrollbar-thumb
	{
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
	background-color: #555;
	}
	
	.btn-group.dropup{
	position:fixed;
	left:0px;
	bottom:0;
	}
	
	.panel-footer { padding:0px !important;}
	
	.chat_box{float:left !important; width:85% !important; border:none; border-radius:0px;}
	
	
	
	</style>
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<body>

<div class="super_container">
	
	<!-- Header -->

	<header class="header trans_200">
		
		<!-- Top Bar -->
		<div class="top_bar">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="top_bar_content d-flex flex-row align-items-center justify-content-start">
						<div class="col-sm-3 col-md-4">
						        <form method="get"  action="<%=request.getContextPath()%>/search" class="navbar-form" role="search">
						        <div class="input-group">
						            <input type="text" class="form-control" placeholder="Bạn tìm gì ..." name="search" id="srch-term" >
						            <div class="input-group-btn">
						                <button onclick="return checkValidate()" class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
						            </div>
						        </div>    
        				</div>
							<div>
							    <label class="radio-inline">
							      	<input type="radio" name="news" value="query" id="news" checked><span style="color: #FFFFFF"> Bài viết </span>
							    </label>
							    <label class="radio-inline">
							     	 <input type="radio" name="products" value="query" id="products" ><span style="color: #FFFFFF"> Sản phẩm </span>
							    </label>
							    </div>
						        </form>
							<div class="top_bar_item"></div>
							<%
								Account account = null;
								if(session.getAttribute("account") != null){
									account = (Account)session.getAttribute("account");
										if(account.getIDUserGroup() == 3 || account.getIDUserGroup() == 1){
							%>
								<div class="top_bar_item"><a href="<%=request.getContextPath()%>/profile?id=<%=account.getAccount_id()%>">Chào, <%=account.getAccount_name()%></a></div><div class="top_bar_item"><a href="<%=request.getContextPath()%>/logout">Đăng xuất</a></div>
							<%
										}else if(account.getIDUserGroup() == 2){
							%>
							<div class="top_bar_item"><a href="<%=request.getContextPath()%>/login">Chuyên gia, <%=account.getAccount_name()%></a></div><div class="top_bar_item"><a href="<%=request.getContextPath()%>/logout">Đăng xuất</a></div>
							<%	
										}else{}
							%>
							<%}else{
							%>
							<div class="top_bar_item"><a href="<%=request.getContextPath()%>/login">Đăng nhập</a>/<a href="<%=request.getContextPath()%>/signup">Đăng ký</a></div>
							<%
							}
							%>
							<div class="top_bar_item"><a href="<%=request.getContextPath()%>/faq">Câu hỏi thường gặp ?</a></div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<!-- Header Content -->
		<div class="header_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="header_content d-flex flex-row align-items-center justify-content-start">
		<%!
			public void  CreateChildMenu(int parentId, javax.servlet.jsp.JspWriter out){
			        try{
			            List<Integer> idChildMenu=new ArrayList<>();
			            List<String> nameChildMenu=new ArrayList<>();
			            
			            try{
			            	Connection con1 = DBConnectionUtil.getConnection();
				    		Statement st1 = con1.createStatement();
				    		ResultSet rs1 = st1.executeQuery("SELECT * FROM menu");
			                while(rs1.next())
			                {
			                    if(rs1.getInt("parent_id") == (parentId))
			                    {
			                        idChildMenu.add(rs1.getInt("menu_id"));
			                        nameChildMenu.add(rs1.getString("menu_name"));
			                    }
			                }
			                if(idChildMenu.size()>0)
			                {
			                    out.println("<div class="+"dropdown-menu"+" aria-labelledby="+"dropdownMenuButton"+">");
			                    for(int i=0;i<idChildMenu.size();i++)
			                    {
			                       out.println("<a class="+"dropdown-item"+" href='listnews?menu_id="+
			                       idChildMenu.get(i)+"'>"+nameChildMenu.get(i)+"");
			                       CreateChildMenu(idChildMenu.get(i),out);
			                    }
			                    out.println("</div>");
			                }
			                else{
			                    out.println("</a>");
			                }
			            }catch(IOException ex){}
			            }catch (SQLException e){}        	 }        
			
			        public void  CreateMenu(javax.servlet.jsp.JspWriter out){
			            try{
			            	Connection con = DBConnectionUtil.getConnection();
			    			Statement st = con.createStatement();
			    			ResultSet rs = st.executeQuery("SELECT * FROM menu"); 
			                try
			                {
			                    out.println("<nav class="+"main_nav>");
			                    out.println("<ul>");
			                    while(rs.next())
			                    {
			                        if(rs.getInt("parent_id") == 0) 
			                        {
			                            out.println("<li><div class="+"dropdown"+">");
			                            out.println("<a href="+"javascript:void(0)"+" class="+"dropdown-toggle"+" type="+"button"+" id="+"dropdownMenuButton"+" data-toggle="+"dropdown"+" aria-haspopup="+"true"+" aria-haspopup="+"true"+" >"+rs.getString("menu_name")+"</a>");
			                            CreateChildMenu(rs.getInt("menu_id"),out);
			                        }                  
			                    }
			                    //out.println("<li><a href="+"product"+">Sản phẩm</a></li>"+"<li><a href="+"cart"+">Giỏ hàng</a></li>"+"<li><a href="+"contact"+">Liên hệ</a></li></ul>");
			                    out.println("<li><a href="+"product"+">Sản phẩm</a></li>"+"<li><a href="+"contact"+">Liên hệ</a></li>"+"<li><a href="+"favourite"+">Bài viết đã lưu</a></li></ul>");
			                    out.println("</nav>");
			                } catch(IOException ex){}
			            }
			            catch (SQLException e)
			            {
			            }
			        }
			%>
			<%CreateMenu(out); %>
<style>
nav{
margin-left: auto!important;
}
</style>
							
							<div class="hamburger ml-auto"><i class="fa fa-bars" aria-hidden="true"></i></div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Logo -->
		<div class="logo_container_outer">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="logo_container">
							<a href="<%=request.getContextPath()%>/index" style="text-decoration: none;">
								<div class="logo_content d-flex flex-column align-items-start justify-content-center">
									<div class="logo_line"></div>
									<div class="logo d-flex flex-row align-items-center justify-content-center">
										<div class="logo_text">Hand<span>Book</span></div>
										<div class="logo_box">+</div>
									</div>
									<div class="logo_sub">Mẹ Và Bé</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>	
		</div>

	</header>

	<!-- Menu -->

	<div class="menu_container menu_mm">

		<!-- Menu Close Button -->
		<div class="menu_close_container">
			<div class="menu_close"></div>
		</div>

		<!-- Menu Items -->
		<div class="menu_inner menu_mm">
			<div class="menu menu_mm">
			
				<%!
			public void  CreateChildMenuu(int parentId, javax.servlet.jsp.JspWriter out){
			        try{
			            List<Integer> idChildMenuu=new ArrayList<>();
			            List<String> nameChildMenuu=new ArrayList<>();
			            
			            try{
			            	Connection con11 = DBConnectionUtil.getConnection();
				    		Statement st11 = con11.createStatement();
				    		ResultSet rs11 = st11.executeQuery("SELECT * FROM menu");
			                while(rs11.next())
			                {
			                    if(rs11.getInt("parent_id") == (parentId))
			                    {
			                        idChildMenuu.add(rs11.getInt("menu_id"));
			                        nameChildMenuu.add(rs11.getString("menu_name"));
			                    }
			                }
			                if(idChildMenuu.size()>0)
			                {
			                    out.println("<div class="+"dropdown-menu"+" aria-labelledby="+"dropdownMenuButton"+">");
			                    for(int i=0;i<idChildMenuu.size();i++)
			                    {
			                       out.println("<a class="+"dropdown-item"+" href='listnews?menu_id="+
			                       idChildMenuu.get(i)+"'>"+nameChildMenuu.get(i)+"");
			                       CreateChildMenuu(idChildMenuu.get(i),out);
			                    }
			                    out.println("</div>");
			                }
			                else{
			                    out.println("</a>");
			                }
			            }catch(IOException ex){}
			            }catch (SQLException e){}        	 }        
			
			        public void  CreateMenuu(javax.servlet.jsp.JspWriter out){
			            try{
			            	Connection conn = DBConnectionUtil.getConnection();
			    			Statement stt = conn.createStatement();
			    			ResultSet rss = stt.executeQuery("SELECT * FROM menu"); 
			                try
			                {

			                    out.println("<ul>");
			                    while(rss.next())
			                    {
			                        if(rss.getInt("parent_id") == 0) 
			                        {
			                            out.println("<li><div class="+"dropdown"+">");
			                            out.println("<a href="+"javascript:void(0)"+" class="+"dropdown-toggle"+" type="+"button"+" id="+"dropdownMenuButton"+" data-toggle="+"dropdown"+" aria-haspopup="+"true"+" aria-haspopup="+"true"+" >"+rss.getString("menu_name")+"</a>");
			                            CreateChildMenuu(rss.getInt("menu_id"),out);
			                        }                  
			                    }
			                    //out.println("<li><a href="+"product"+">Sản phẩm</a></li>"+"<li><a href="+"cart"+">Giỏ hàng</a></li>"+"<li><a href="+"contact"+">Liên hệ</a></li></ul>");
			                    out.println("<li><a href="+"product"+">Sản phẩm</a></li>"+"<li><a href="+"contact"+">Liên hệ</a></li>"+"<li><a href="+"favourite"+">Bài viết đã lưu</a></li></ul>");

			                } catch(IOException ex){}
			            }
			            catch (SQLException e)
			            {
			            }
			        }
			%>
			<%CreateMenuu(out); %>
			</div>
			<div class="menu_extra">
				<div class="menu_appointment"><a href="#">Request an Appointment</a></div>
				<div class="menu_emergencies">For Emergencies: +563 47558 623</div>
			</div>

		</div>

	</div>
<script>
	document.getElementById("news").onclick = function () {
	    document.getElementById("news").checked = true;
	    document.getElementById("products").checked = false;
	};
	document.getElementById("products").onclick = function () {
	    document.getElementById("products").checked = true;
	    document.getElementById("news").checked = false;
	};
	function checkValidate(){
		if(document.getElementById("srch-term").value == ""){
			alert("Nhập nội dung bạn muốn tìm !");
			return false;
		}else{
			return true;
		}
	}
</script>