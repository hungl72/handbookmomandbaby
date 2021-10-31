<%@page import="daos.StarDAO"%>
<%@page import="models.Star"%>
<%@page import="models.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/news.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/news_responsive.css">
</head>
<style>
	/*@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);*/
  /*reset css*/
  div,label{margin:0;padding:0;}
  h1{font-size:1.5em;margin:10px;}
  /****** Style Star Rating Widget *****/
  #rating{border:none;float:left;}
  #rating>input{display:none;}/*ẩn input radio - vì chúng ta đã có label là GUI*/
  #rating>label:before{margin:5px;font-size:1.25em;font-family:FontAwesome;display:inline-block;content:"\f005";}/*1 ngôi sao*/
  #rating>.half:before{content:"\f089";position:absolute;}/*0.5 ngôi sao*/
  #rating>label{color:#ddd;float:right;}/*float:right để lật ngược các ngôi sao lại đúng theo thứ tự trong thực tế*/
  /*thêm màu cho sao đã chọn và các ngôi sao phía trước*/
  #rating>input:checked~label,
  #rating:not(:checked)>label:hover, 
  #rating:not(:checked)>label:hover~label{color:#FFD700;}
  /* Hover vào các sao phía trước ngôi sao đã chọn*/
  #rating>input:checked+label:hover,
  #rating>input:checked~label:hover,
  #rating>label:hover~input:checked~label,
  #rating>input:checked~label:hover~label{color:#FFED85;}

  #product:hover {-ms-transform: scale(1.03); /* IE 9 */-webkit-transform: scale(1.03); /* Safari 3-8 */transform: scale(1.03);}
  </style>
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="<%=request.getContextPath()%>/templates/public/images/news.jpg" data-speed="0.8"></div>
		
		<div class="home_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="home_content">
							<div class="home_title"><span>HandBook</span> Sản phẩm</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="services" style="margin: 20px 0px;">
		<div class="container">
			<div class="row services_row">
                <div class="col-md-12 col-xs-12">
                    
                    <ul class="nav nav-tabs col-xs-12" style="border-bottom: 1px solid #ddd;">
                      <li id="tab-0" onclick="change0()" style="border-bottom: 2px solid #DC3545;margin: 0px"><a class="color" data-toggle="tab" href="#home" style="padding: 10px;">Tất cả</a></li>
                      <li id="tab-1" onclick="change1()" style="margin: 0px"><a class="color" data-toggle="tab" href="#menu1" style="padding: 10px;">Chưa mang thai</a></li>
                      <li id="tab-2" onclick="change2()" style="margin: 0px"><a class="color" data-toggle="tab" href="#menu2" style="padding: 10px;">Đang mang thai</a></li>
                      <li id="tab-3" onclick="change3()" style="margin: 0px"><a class="color" data-toggle="tab" href="#menu3" style="padding: 10px;">Sau mang thai</a></li>
                    </ul>
                    <div class="tab-content col-md-12 col-xs-12" style="overflow-x: auto;padding-bottom: 15px;">
                        <div id="home" class="tab-pane in active">
                            <div  class="row">
                            <%
                            	if(request.getAttribute("listAllProduct") != null){
                            		ArrayList<Product> listAllProduct = (ArrayList)request.getAttribute("listAllProduct");
                            		for(Product p : listAllProduct){
                            %>
                                <div id="product" class="col-sm-6 col-md-4 col-lg-3" style="margin-top: 10px;transition-duration: .2s;">
                                <div  style="border: 3px solid #EDEDED; padding: 5px; min-height: 100%;">
                                	 <a style="position: relative;    padding-bottom: 90%;
    overflow: hidden; display: block" href="<%=request.getContextPath()%>/detailproduct?product_id=<%=p.getProduct_id()%>"><img style="    position: absolute;
    max-width: 100%;
    height: 100%;
    -o-object-fit: contain;
    object-fit: contain;
    -o-object-position: center;
    object-position: center;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);" src="<%=request.getContextPath()%>/uploads/images/<%=p.getProduct_image()%>"/></a>
                                    <a href="<%=request.getContextPath()%>/detailproduct?product_id=<%=p.getProduct_id()%>"><h4 style="margin-left: 14px;"><%=p.getProduct_name()%></h4></a>
									<div class="col-xs-12" style="display: flex;justify-content: space-between;">
										<h5><span style="color: #283290;font-weight: bold;"><%=p.getProduct_price()%> VNĐ</span></h5>
									</div>
                           
                                   
									<%
										StarDAO starDAO  = new StarDAO();
    		float value = starDAO.selectValueFinal(p.getProduct_id());
    		if(value == 0){
    %>
     <div class="col-xs-12" id="rating" style="margin-left: 5px;">
     	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    		}else if(value > 0 && value < 0.5){
    %>
     <div class="col-xs-12" id="rating" style="margin-left: 5px;">
     	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" checked disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    		}else if(value >= 0.5 && value <= 1){
   	%>
   	<div class="col-xs-12" id="rating" style="margin-left: 5px;">
   		
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" checked disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
   	<%
    		}else if(value >= 1 && value <= 1.5){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" checked disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 1.5 && value <= 2){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" checked disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 2 && value <= 2.5){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" checked disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 2.5 && value <= 3){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" checked disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value > 3 && value <= 3.5){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" checked disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio"  value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 3.5 && value <= 4.0){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" checked disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 4.0 && value <= 4.5){
	%>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" checked disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
	<%
    	}else{
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" checked disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}
    %>
                                 </div> </div>
                            <%                            		
											}
	                            	}
                            %>
                               
                          </div>
                          </div>
                      <div id="menu1" class="tab-pane fade">
                        <div class="row">
                        <%
                        	if(request.getAttribute("listProductByCategoryId1") != null){
                        		ArrayList<Product> listProductByCategoryId1 = (ArrayList)request.getAttribute("listProductByCategoryId1");
                        			for(Product p : listProductByCategoryId1){
                        %>
                                <div id="product" class="col-sm-6 col-md-4 col-lg-3" style="margin-top: 10px;transition-duration: .2s;">
                                <div  style="border: 3px solid #EDEDED; padding: 5px; min-height: 100%;">
                                	 <a style="position: relative;    padding-bottom: 90%;
    overflow: hidden; display: block" href="<%=request.getContextPath()%>/detailproduct?product_id=<%=p.getProduct_id()%>"><img style="    position: absolute;
    max-width: 100%;
    height: 100%;
    -o-object-fit: contain;
    object-fit: contain;
    -o-object-position: center;
    object-position: center;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);" src="<%=request.getContextPath()%>/uploads/images/<%=p.getProduct_image()%>"/></a>
                                    <a href="<%=request.getContextPath()%>/detailproduct?product_id=<%=p.getProduct_id()%>"><h4 style="margin-left: 14px;"><%=p.getProduct_name()%></h4></a>
									<div class="col-xs-12" style="display: flex;justify-content: space-between;">
										<h5><span style="color: #283290;font-weight: bold;"><%=p.getProduct_price()%> VNĐ</span></h5>
									</div>
									
										<%
										StarDAO starDAO  = new StarDAO();
    		float value = starDAO.selectValueFinal(p.getProduct_id());
    		if(value == 0){
    %>
     <div class="col-xs-12" id="rating" style="margin-left: 5px;">
     	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    		}else if(value > 0 && value < 0.5){
    %>
     <div class="col-xs-12" id="rating" style="margin-left: 5px;">
     	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" checked disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    		}else if(value >= 0.5 && value <= 1){
   	%>
   	<div class="col-xs-12" id="rating" style="margin-left: 5px;">
   		
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" checked disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
   	<%
    		}else if(value >= 1 && value <= 1.5){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" checked disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 1.5 && value <= 2){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" checked disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 2 && value <= 2.5){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" checked disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 2.5 && value <= 3){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" checked disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value > 3 && value <= 3.5){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" checked disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio"  value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 3.5 && value <= 4.0){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" checked disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 4.0 && value <= 4.5){
	%>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" checked disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
	<%
    	}else{
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" checked disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}
    %>
								</div>	
                                </div>
                            <%}}else{}%>
                        </div>
                      </div>
                      <div id="menu2" class="tab-pane fade">
                        <div class="row">
                        <%
                        	if(request.getAttribute("listProductByCategoryId2") != null){
                        		ArrayList<Product> listProductByCategoryId2 = (ArrayList)request.getAttribute("listProductByCategoryId2");
                        			for(Product p : listProductByCategoryId2){
                        %>
                                <div id="product" class="col-sm-6 col-md-4 col-lg-3" style="margin-top: 10px;transition-duration: .2s;">
                                <div  style="border: 3px solid #EDEDED; padding: 5px; min-height: 100%;">
                                	 <a style="position: relative;    padding-bottom: 90%;
    overflow: hidden; display: block" href="<%=request.getContextPath()%>/detailproduct?product_id=<%=p.getProduct_id()%>"><img style="    position: absolute;
    max-width: 100%;
    height: 100%;
    -o-object-fit: contain;
    object-fit: contain;
    -o-object-position: center;
    object-position: center;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);" src="<%=request.getContextPath()%>/uploads/images/<%=p.getProduct_image()%>"/></a>
                                    <a href="<%=request.getContextPath()%>/detailproduct?product_id=<%=p.getProduct_id()%>"><h4 style="margin-left: 14px;"><%=p.getProduct_name()%></h4></a>
									<div class="col-xs-12" style="display: flex;justify-content: space-between;">
										<h5><span style="color: #283290;font-weight: bold;"><%=p.getProduct_price()%> VNĐ</span></h5>
									</div>
									
										<%
										StarDAO starDAO  = new StarDAO();
    		float value = starDAO.selectValueFinal(p.getProduct_id());
    		if(value == 0){
    %>
     <div class="col-xs-12" id="rating" style="margin-left: 5px;">
     	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    		}else if(value > 0 && value < 0.5){
    %>
     <div class="col-xs-12" id="rating" style="margin-left: 5px;">
     	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" checked disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    		}else if(value >= 0.5 && value <= 1){
   	%>
   	<div class="col-xs-12" id="rating" style="margin-left: 5px;">
   		
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" checked disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
   	<%
    		}else if(value >= 1 && value <= 1.5){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" checked disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 1.5 && value <= 2){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" checked disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 2 && value <= 2.5){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" checked disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 2.5 && value <= 3){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" checked disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value > 3 && value <= 3.5){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" checked disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio"  value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 3.5 && value <= 4.0){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" checked disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 4.0 && value <= 4.5){
	%>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" checked disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
	<%
    	}else{
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" checked disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}
    %>
								</div>	
                                </div>
                            <%}}else{}%>
                        </div>
                      </div>
                      <div id="menu3" class="tab-pane fade">
                        <div class="row">
                        <%
                        	if(request.getAttribute("listProductByCategoryId3") != null){
                        		ArrayList<Product> listProductByCategoryId3 = (ArrayList)request.getAttribute("listProductByCategoryId3");
                        			for(Product p : listProductByCategoryId3){
                        %>
                                <div id="product" class="col-sm-6 col-md-4 col-lg-3" style="margin-top: 10px;transition-duration: .2s;">
                                <div  style="border: 3px solid #EDEDED; padding: 5px; min-height: 100%;">
                                	 <a style="position: relative;    padding-bottom: 90%;
    overflow: hidden; display: block" href="<%=request.getContextPath()%>/detailproduct?product_id=<%=p.getProduct_id()%>"><img style="    position: absolute;
    max-width: 100%;
    height: 100%;
    -o-object-fit: contain;
    object-fit: contain;
    -o-object-position: center;
    object-position: center;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);" src="<%=request.getContextPath()%>/uploads/images/<%=p.getProduct_image()%>"/></a>
                                    <a href="<%=request.getContextPath()%>/detailproduct?product_id=<%=p.getProduct_id()%>"><h4 style="margin-left: 14px;"><%=p.getProduct_name()%></h4></a>
									<div class="col-xs-12" style="display: flex;justify-content: space-between;">
										<h5><span style="color: #283290;font-weight: bold;"><%=p.getProduct_price()%> VNĐ</span></h5>
									</div>
									
										<%
										StarDAO starDAO  = new StarDAO();
    		float value = starDAO.selectValueFinal(p.getProduct_id());
    		if(value == 0){
    %>
     <div class="col-xs-12" id="rating" style="margin-left: 5px;">
     	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    		}else if(value > 0 && value < 0.5){
    %>
     <div class="col-xs-12" id="rating" style="margin-left: 5px;">
     	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" checked disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    		}else if(value >= 0.5 && value <= 1){
   	%>
   	<div class="col-xs-12" id="rating" style="margin-left: 5px;">
   		
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" checked disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
   	<%
    		}else if(value >= 1 && value <= 1.5){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" checked disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 1.5 && value <= 2){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" checked disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 2 && value <= 2.5){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" checked disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 2.5 && value <= 3){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" checked disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value > 3 && value <= 3.5){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" checked disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio"  value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 3.5 && value <= 4.0){
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" checked disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 4.0 && value <= 4.5){
	%>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" checked disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
	<%
    	}else{
    %>
    <div class="col-xs-12" id="rating" style="margin-left: 5px;">
    	
        <input type="radio" value="5" checked disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}
    %>
								</div>	
                                </div>
                            <%}}else{}%>
                        </div>
                      </div>
                    </div>
                  </div>
			</div>
		</div>
	</div>

<%@ include file="/templates/public/inc/footer.jsp" %>