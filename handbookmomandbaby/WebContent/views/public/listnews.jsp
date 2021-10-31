<%@page import="daos.ListNewsDAO"%>
<%@page import="models.ListNews"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/news.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/news_responsive.css">
</head>
	<!-- Home -->
<style>
</style>
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="<%=request.getContextPath()%>/templates/public/images/news.jpg" data-speed="0.8"></div>
		<div class="home_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="home_content">
							<%
								if(request.getAttribute("menuName") != null){
									String name = (String)request.getAttribute("menuName");
							%>
							<div class="home_title"><span>HandBook</span> <%=name%></div>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<!-- News -->

	<div class="news">
		<div class="container">
			<div class="row">
				
				<!-- News Posts -->
				<div class="col-lg-9 col-xs-12">
					<div class="news_posts">
					<%
					ArrayList<ListNews> listNewsMin = null;
						if(request.getAttribute("listNewsMin") !=  null){
							listNewsMin = (ArrayList)request.getAttribute("listNewsMin");
							if(listNewsMin.size() > 0){
							for(ListNews list : listNewsMin){
					%>
                        <div class="news_post">
							<div class="news_image">
								<img src="<%=request.getContextPath()%>/uploads/images/<%=list.getListnews_image()%>" alt="" width="850px" height="500px">
							</div>
							<div class="news_body">
								<div class="news_title" style="display: flex;justify-content: space-between;">
									<a href="<%=request.getContextPath()%>/news?menu_id=<%=list.getMenu_id()%>&listnews_id=<%=list.getListnews_id()%>"><%=list.getListnews_name()%></a>
									<div id="change<%=list.getListnews_id()%>">
									<%
										if(account != null){
											if(new ListNewsDAO().checkLike(account.getAccount_id(),list.getListnews_id()) != null){
												int status = new ListNewsDAO().checkLike(account.getAccount_id(),list.getListnews_id()).getListnews_id();
												if(status == 1){
									%>
									<div id="change<%=list.getListnews_id()%>">
									<a href="javascript:void(0)" id="like" onclick="favourite('<%=list.getListnews_name()%>','<%=list.getListnews_image()%>',<%=1%>,<%=list.getMenu_id()%>,<%=list.getListnews_id()%>,<%=account.getAccount_id()%>)"><img  src="<%=request.getContextPath()%>/templates/public/images/heartred.png" style="width: auto;height: auto;"></a>
									</div>
									<%}else{
									%>
									<div id="change<%=list.getListnews_id()%>">
									<a href="javascript:void(0)" id="like" onclick="favourite('<%=list.getListnews_name()%>','<%=list.getListnews_image()%>',<%=0%>,<%=list.getMenu_id()%>,<%=list.getListnews_id()%>,<%=account.getAccount_id()%>)"><img  src="<%=request.getContextPath()%>/templates/public/images/heartwhite.png" style="width: auto;height: auto;"></a>
									</div>
									<%	
									}
									%>
									
								</div>
								
								</div>
								<div class="news_info">
									<ul>
										<li class="news_author">Đăng bởi <%=list.getListnews_uploader()%></li>
										<li class="news_author">Ngày đăng <%=list.getListnews_date()%></li>
										<li class="news_author">Lượt xem <%=list.getListnews_views()%></li>
									</ul>
								</div>
								<div class="news_text">
								<%
									if(list.getListnews_content().length() >= 200){
								%>
								<p><%=list.getListnews_content().substring(0,200)%> […]</p>
								<%}else{%>
								<p><%=list.getListnews_content()%> […]</p>
								<%
									}
								%>
								</div>
							</div>
						</div>
					<%
										}else{
					%>
					<a href="javascript:void(0)" id="like" onclick="favourite('<%=list.getListnews_name()%>','<%=list.getListnews_image()%>',<%=0%>,<%=list.getMenu_id()%>,<%=list.getListnews_id()%>,<%=account.getAccount_id()%>)"><img  src="<%=request.getContextPath()%>/templates/public/images/heartwhite.png" style="width: auto;height: auto;"></a>
					</div>
								</div>
								<div class="news_info">
									<ul>
										<li class="news_author">Đăng bởi <%=list.getListnews_uploader()%></li>
										<li class="news_author">Ngày đăng <%=list.getListnews_date()%></li>
										<li class="news_author">Lượt xem <%=list.getListnews_views()%></li>
									</ul>
								</div>
								<div class="news_text">
									<%
									if(list.getListnews_content().length() >= 200){
								%>
								<p><%=list.getListnews_content().substring(0,200)%> […]</p>
								<%}else{%>
								<p><%=list.getListnews_content()%> […]</p>
								<%
									}
								%>
								</div>
							</div>
						</div>
					<%
										}
										}else{
										%>
									<a href="javascript:void(0)" id="like" onclick="alert('Bạn cần đăng nhập để lưu bài viết này !')"><img  src="<%=request.getContextPath()%>/templates/public/images/heartwhite.png" style="width: auto;height: auto;"></a>
									
									</div>
									
								</div>
								<div class="news_info">
									<ul>
										<li class="news_author">Đăng bởi <%=list.getListnews_uploader()%></li>
										<li class="news_author">Ngày đăng <%=list.getListnews_date()%></li>
										<li class="news_author">Lượt xem <%=list.getListnews_views()%></li>
									</ul>
								</div>
								<div class="news_text">
																		<%
									if(list.getListnews_content().length() >= 200){
								%>
								<p><%=list.getListnews_content().substring(0,200)%> […]</p>
								<%}else{%>
								<p><%=list.getListnews_content()%> […]</p>
								<%
									}
								%>
								</div>
							</div>
						</div>
										<%
										}
							}}else{
					%>
					<h3>Mục này chưa có bài viết nào !</h3>
					<%
							}
						}
					%>
					</div>
					  <div class="container">
                   	<%
                          int numberOfPages=(Integer)request.getAttribute("numberOfPage");
                          int currentPage=(Integer)request.getAttribute("currentPage");
                           	if(listNewsMin != null && listNewsMin.size() > 0 && numberOfPages > 1){	
                    %>
                    <div class="row">
                    <%
    					if (currentPage > 1) {
     						int back = currentPage - 1;
    				%>
                        <a href="<%=request.getContextPath()%>/listnews?menu_id=3&&page=<%=back%>">Trang trước </a>
                    <%
                          }
                    %>
                    <%
                        for(int i=1;i<=numberOfPages;i++){
                            if(currentPage==i){
                    %>
                        <a class="active" href="<%=request.getContextPath()%>/listnews?menu_id=3&&page=<%=i%>"> <%=i%> </a>
                    <%
                            }else{
                    %>
                        <a href="<%=request.getContextPath()%>/listnews?menu_id=3&&page=<%=i%>"> <%=i%> </a>
                    <%
                             }
                        }
                        if (currentPage < numberOfPages) {
                            int next = currentPage + 1;
					%>		
                        <a href="<%=request.getContextPath()%>/listnews?menu_id=3&&page=<%=next%>"> Trang sau</a>
                    <%
    						}
                        }
   					%>
                    </div>
                </div>
					<!--
					<div class="news_page_nav">
						<ul>
							<li><a href="#">Trang trước</a></li>
							<li><a href="#">Trang 1</a></li>
                            <li class="active"><a href="#">Trang 2</a></li>
							<li><a href="#">Trang cuối</a></li>
						</ul>
					</div>
				</div>
  -->
				<!-- Sidebar -->
				<%--@ include file="/templates/public/inc/rightbar.jsp" --%>
			</div>
		</div>
	</div>
	</div>
<script>
	function favourite(favourite_name,favourite_image,favourite_status,menu_id,listnews_id,IDAccount){
		if(favourite_status == 1){
        $.ajax({            
            url: '<%=request.getContextPath()%>/like',
            method: 'get',
            data:{favourite_name : favourite_name,  favourite_image : favourite_image, favourite_status : favourite_status, menu_id : menu_id, listnews_id : listnews_id, IDAccount : IDAccount},
            success:function(data){
				$('#change'+listnews_id).html(data);
				alert('Đã xóa khỏi lưu bài viết !');
            }
        });
		}else{
		$.ajax({            
            url: '<%=request.getContextPath()%>/like',
            method: 'get',
            data:{favourite_name : favourite_name,  favourite_image : favourite_image, favourite_status : favourite_status, menu_id : menu_id, listnews_id : listnews_id, IDAccount : IDAccount},
            success:function(data){
				$('#change'+listnews_id).html(data);
				alert('Lưu bài viết thành công !');
            }
        });
	}
	}
</script>
<style>
.active{
	color: red;
}
</style>
	<!-- Footer -->
<%@ include file="/templates/public/inc/footer.jsp" %>