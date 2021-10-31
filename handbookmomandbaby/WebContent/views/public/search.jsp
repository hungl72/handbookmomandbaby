<%@page import="models.ListNews"%>
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
							<div class="home_title"><span>HandBook</span> Kết quả tìm kiếm với từ '<%=request.getAttribute("query")%>'</div>
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
						<div class="tab-content col-md-12 col-xs-12" style="overflow-x: auto;padding-bottom: 15px;">
                        <div id="home" class="tab-pane in active">
                            <div  style="display: flex;justify-content: end;flex-wrap: wrap;">
						<%
							if(request.getAttribute("findListProduct") != null){
								ArrayList<Product> findListProduct = (ArrayList)request.getAttribute("findListProduct");
								if(findListProduct.size() > 0){
									for(Product p : findListProduct){
						%>
						          <div id="product" style="width: 250px;overflow: hidden;border: 3px solid #EDEDED;margin-top: 10px;transition-duration: .2s;margin-right: 42px;">
                                    <a href="<%=request.getContextPath()%>/detailproduct?product_id=<%=p.getProduct_id()%>"><img  src="<%=request.getContextPath()%>/uploads/images/<%=p.getProduct_image()%>" style="width: 250px;height: 230px;margin-bottom: 10px;"/></a>
                                    <a href="<%=request.getContextPath()%>/detailproduct?product_id=<%=p.getProduct_id()%>"><h4 style="margin-left: 14px;"><%=p.getProduct_name()%></h4></a>
									<div class="col-xs-12" style="display: flex;justify-content: space-between;">
										<h5><span style="color: #283290;font-weight: bold;"><%=p.getProduct_price()%> VNĐ</span></h5>
										<h5>Đã bán<span style="color: #283290;font-weight: bold;"> 69</span></h5>
									</div>
									<div class="col-xs-12" id="rating" style="margin-left: 5px;">
										<input type="radio" id="star5" name="rating" value="" onclick=""/>
										<label class = "full" for="star5" title="Awesome - 5 stars"></label>
										
										<input type="radio" id="star4half" name="rating" value="" onclick=""/>
										<label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
										
										<input type="radio" id="star4" name="rating" value="" onclick=""/>
										<label class = "full" for="star4" title="Pretty good - 4 stars"></label>
										
										<input type="radio" id="star3half" name="rating" value="" onclick=""/>
										<label class="half" for="star3half" title="Meh - 3.5 stars"></label>
										
										<input type="radio" id="star3" name="rating" value="" onclick=""/>
										<label class = "full" for="star3" title="Meh - 3 stars"></label>
										
										<input type="radio" id="star2half" name="rating" value="" onclick=""/>
										<label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
										
										<input type="radio" id="star2" name="rating" value="" onclick=""/>
										<label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
										
										<input type="radio" id="star1half" name="rating" value="" onclick=""/>
										<label class="half" for="star1half" title="Meh - 1.5 stars"></label>
										
										<input type="radio" id="star1" name="rating" value="" onclick=""/>
										<label class = "full" for="star1" title="Sucks big time - 1 star"></label>
										
										<input type="radio" id="starhalf" name="rating" value="" onclick=""/>
										<label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
									</div>
                                </div>
						<%
										}
									}else{
								%>		
									<h3>Không có kết quả nào !</h3>
								<%		
									}
								}else{
									%>
									<%
									if(request.getAttribute("findListNews") != null){
										ArrayList<ListNews> findListNews = (ArrayList)request.getAttribute("findListNews");
										if(findListNews.size() > 0){
											for(ListNews list : findListNews){
						%>
									                        <div class="news_post" style="width: 45%;height: 100%;margin-right: 5.5rem;">
							<div class="news_image">
								<img src="<%=request.getContextPath()%>/uploads/images/<%=list.getListnews_image()%>" alt="" style="height: 35rem;">
							</div>
							<div class="news_body">
								<div class="news_title"><a href="news?menu_id=<%=list.getMenu_id()%>&listnews_id=<%=list.getListnews_id()%>"><%=list.getListnews_name()%></a></div>
								<div class="news_info">
									<ul>
										<li class="news_author"><span>Đăng bởi </span><a href="#"><%=list.getListnews_uploader()%></a></li>
										<li class="news_author"><span>Ngày đăng </span><a href="#"> <%=list.getListnews_date()%></a></li>
									</ul>
								</div>
								<div class="news_text">
									<p><%=list.getListnews_content()%> […]</p>
								</div>
							</div>
						</div>
						<%} %>
									</div>
						<%
								}else{
						%>		
							<h3>Không có kết quả nào !</h3>
						<%	
								}}
								}
						%>
						</div>
						</div>
						</div>
							</div>
						</div>
					</div>
<%@ include file="/templates/public/inc/footer.jsp" %>