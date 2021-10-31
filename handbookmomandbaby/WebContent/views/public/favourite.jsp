<%@page import="models.Favourite"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/contact.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/contact_responsive.css">
</head>
	
	<!-- Home -->

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="<%=request.getContextPath()%>/templates/public/images/contact.jpg" data-speed="0.8"></div>
		<div class="home_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="home_content">
							<div class="home_title"><span>HandBook</span> Bài viết đã lưu</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Contact -->

	<div class="contact">
		<div class="container">

			<div class="row" style="margin-bottom: 2rem;padding-bottom:2rem;">
					<div class="col-md-12 col-xs-12">
													<%
							if(request.getAttribute("listFavourite") != null){
								ArrayList<Favourite> listFavourite = (ArrayList)request.getAttribute("listFavourite");
									if(listFavourite.size() > 0){
										for(Favourite f : listFavourite){
						%>
						<div class="col-md-4">
							<img src="<%=request.getContextPath()%>/uploads/images/<%=f.getFavourite_image()%>" class="img-responsive" style="height: 250px;"/>
							<h4><a href="<%=request.getContextPath()%>/news?menu_id=<%=f.getMenu_id()%>&listnews_id=<%=f.getListnews_id()%>"><%=f.getFavourite_name()%></a></h4>
						</div>
															<%
										}
									}else{
						%>
								<h3>Chưa có bài viết nào được lưu !</h3>
						<%
									}
							}else{
						%>
							<h3>Chưa có bài viết nào được lưu !</h3>
						<%	
							}
						%>
			</div>

			</div>
			</div>
			</div>
<%@ include file="/templates/public/inc/footer.jsp" %>