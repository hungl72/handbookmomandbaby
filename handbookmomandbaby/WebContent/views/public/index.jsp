<%@page import="models.ListNews"%>
<%@page import="models.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/responsive.css">
</head>
	<div class="home">
		<div class="home_slider_container">
			<!-- Home Slider -->
			<div class="owl-carousel owl-theme home_slider">
				
				<!-- Slider Item -->
				<div class="owl-item">
					<div class="home_slider_background" style="background-image:url(<%=request.getContextPath()%>/templates/public/images/home_background_1.jpg)"></div>
					<div class="home_content">
						<div class="container">
							<div class="row">
								<div class="col">
									<div class="home_content_inner">
										<div class="home_title"><h2>Thế giới của mẹ</h2></div>
										<div class="home_text">
											<p>Thời kỳ quan trọng nhất của cuộc đời không phải là ở tuổi học đại học, mà là thời kỳ đầu tiên, giai đoạn từ khi sinh ra cho tới khi sáu tuổi..</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Slider Item -->
				<div class="owl-item">
					<div class="home_slider_background" style="background-image:url(<%=request.getContextPath()%>/templates/public/images/home_background_1.jpg)"></div>
					<div class="home_content">
						<div class="container">
							<div class="row">
								<div class="col">
									<div class="home_content_inner">
										<div class="home_title"><h1>Medicine made with care</h1></div>
										<div class="home_text">
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tempus vestibulum mauris quis aliquam. Integer accumsan sodales odio, id tempus velit ullamcorper id. Quisque at erat eu.</p>
										</div>
										<div class="button home_button">
											<a href="#">read more</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Slider Item -->
				<div class="owl-item">
					<div class="home_slider_background" style="background-image:url(<%=request.getContextPath()%>/templates/public/images/home_background_1.jpg)"></div>
					<div class="home_content">
						<div class="container">
							<div class="row">
								<div class="col">
									<div class="home_content_inner">
										<div class="home_title"><h1>Medicine made with care</h1></div>
										<div class="home_text">
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tempus vestibulum mauris quis aliquam. Integer accumsan sodales odio, id tempus velit ullamcorper id. Quisque at erat eu.</p>
										</div>
										<div class="button home_button">
											<a href="#">read more</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<!-- Slider Progress -->
			<div class="home_slider_progress"></div>
		</div>
	</div>

	<!-- 3 Boxes -->

	

	<!-- About -->

	<div class="services">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title"><h2>Bài viết nhiều lượt xem nhất</h2></div>
				</div>
			</div>
			<div class="row services_row">
				<!-- Service -->
				<%
					if(request.getAttribute("listNewsViews") != null){
						ArrayList<ListNews> listNewsViews = (ArrayList)request.getAttribute("listNewsViews");
						for(ListNews l : listNewsViews){
				%>
				<div class="col-lg-4 col-md-6 service_col">
					<a href="<%=request.getContextPath()%>/news?menu_id=<%=l.getMenu_id()%>&listnews_id=<%=l.getListnews_id()%>">
						<div class="service text-center trans_200">
							<div class="service_icon"><img class="svg" src="<%=request.getContextPath()%>/uploads/images/<%=l.getListnews_image()%>" alt=""></div>
							<div class="service_title trans_200"><%=l.getListnews_name()%></div>
							<div class="service_text">
							<%
								if(l.getListnews_content().length() >= 250){
							%>
								<p><%=l.getListnews_content().substring(0, 250)%></p>
							<%}else{
							%>
							<p><%=l.getListnews_content()%></p>
							<%
							}%>
							</div>
						</div>
					</a>
				</div>
			<%}} %>
			</div>
		</div>
	</div>
	
		<div class="services">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title"><h2>Sản phẩm nhiều lượt xem nhất</h2></div>
				</div>
			</div>
			<div class="row services_row">
				<!-- Service -->
				<%
					if(request.getAttribute("listProductViews") != null){
						ArrayList<Product> listProductViews = (ArrayList)request.getAttribute("listProductViews");
						for(Product p : listProductViews){
				%>
				<div class="col-lg-4 col-md-6 service_col">
					<a href="<%=request.getContextPath()%>/detailproduct?product_id=<%=p.getProduct_id()%>">
						<div class="service text-center trans_200">
							<div class="service_icon"><img class="svg" src="<%=request.getContextPath()%>/uploads/images/<%=p.getProduct_image()%>" alt=""></div>
							<div class="service_title trans_200"><%=p.getProduct_name()%></div>
							<div class="service_text">
							<%
								if(p.getProduct_description().length() >= 250){
							%>
							<p><%=p.getProduct_description().substring(0, 250)%></p>
							<%}else{
							%>
							<p><%=p.getProduct_description()%></p>
							<%
							}%>
							</div>
						</div>
					</a>
				</div>
				<%}}%>
			</div>
		</div>
	</div>
	<div class="boxes" style="margin-top: 8rem;">
		<div class="container">
			<div class="row">
				
				<!-- Box -->
				<div class="col-lg-4 box_col">
					<div class="box working_hours">
						<div class="box_icon d-flex flex-column align-items-start justify-content-center"><div style="width:29px; height:29px;"><img src="<%=request.getContextPath()%>/templates/public/images/alarm-clock.svg" alt=""></div></div>
						<div class="box_title">Thời gian làm việc</div>
						<div class="working_hours_list">
							<ul>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div>Thứ 2 – Thứ 6</div>
									<div class="ml-auto">8.00 – 19.00</div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div>Thứ 7</div>
									<div class="ml-auto">9.30 – 17.00</div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div>Chủ nhật</div>
									<div class="ml-auto">9.30 – 15.00</div>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<!-- Box -->
				<div class="col-lg-4 box_col">
					<div class="box box_appointments">
						<div class="box_icon d-flex flex-column align-items-start justify-content-center"><div style="width: 29px; height:29px;"><img src="<%=request.getContextPath()%>/templates/public/images/phone-call.svg" alt=""></div></div>
						<div class="box_title">Hot line</div>
						<div class="box_text">03434.04477</div>
						<div class="box_text">0971124.870</div>
						<div class="box_text">0385054017</div>
					</div>
				</div>

				<!-- Box -->
				<div class="col-lg-4 box_col">
					<div class="box box_emergency">
						<div class="box_icon d-flex flex-column align-items-start justify-content-center"><div style="width: 37px; height:37px; margin-left:-4px;"><img src="<%=request.getContextPath()%>/templates/public/images/bell.svg" alt=""></div></div>
						<div class="box_title">Fax</div>
						<div class="box_phone">+56 273 45678 235</div>
						<div class="box_emergency_text">Mọi câu hỏi về dịch vụ của chúng tôi, vui lòng liên hệ Trung Tâm Hỗ Trợ Khách Hàng</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	
	<div class="about">
		<div class="container">
			<div class="row row-lg-eq-height">
				
				<!-- About Content -->
				<div class="col-lg-7">
					<div class="about_content">
						<div class="section_title"><h2>Bộ Y tế khuyến cáo "5K" chung sống an toàn với dịch bệnh</h2></div>
						<div class="about_text">
							<p>Thực hiện "5K: Khẩu trang – Khử khuẩn – Khoảng cách – Không tập trung – Khai báo y tế" để giữ an toàn cho Bạn và Chúng ta trước đại dịch COVID-19! KHẨU TRANG: Đeo khẩu trang vải thường xuyên tại nơi công cộng, nơi tập trung đông người; đeo khẩu trang y tế tại các cơ sở y tế, khu cách ly.

KHỬ KHUẨN: Rửa tay thường xuyên bằng xà phòng hoặc dung dịch sát khuẩn tay. Vệ sinh các bề mặt/vật dụng thường xuyên tiếp xúc (tay nắm cửa, điện thoại, máy tính bảng, mặt bàn, ghế…). Giữ vệ sinh, lau rửa và để nhà cửa thông thoáng.

KHOẢNG CÁCH: Giữ khoảng cách khi tiếp xúc với người khác.

KHÔNG TỤ TẬP đông người.

KHAI BÁO Y TẾ: thực hiện khai báo y tế trên App NCOVI; cài đặt ứng dụng BlueZone tại địa chỉ https://bluezone.gov.vn/ để được cảnh báo nguy cơ lây nhiễm Covid-19.</p>
						</div>
					</div>
				</div>

				<!-- About Image -->
				<div class="col-lg-5">
					<div class="about_image"><img src="<%=request.getContextPath()%>/templates/public/images/about.png" alt=""></div>
				</div>
			</div>
		</div>
	</div>

	<!-- Departments -->

	<div class="departments">
		<div class="departments_background parallax-window" data-parallax="scroll" data-image-src="<%=request.getContextPath()%>/templates/public/images/departments.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title section_title_light"><h2>Các nghiên cứu gần đây</h2></div>
				</div>
			</div>
			<div class="row departments_row row-md-eq-height">
				
				<!-- Department -->
				<div class="col-lg-3 col-md-6 dept_col">
					<div class="dept">
						<div class="dept_image"><img src="<%=request.getContextPath()%>/templates/public/images/dept_1.jpg" alt=""></div>
						<div class="dept_content text-center">
							<div class="dept_title">plastic surgery</div>
							<div class="dept_subtitle">Dr. James Smith</div>
						</div>
					</div>
				</div>

				<!-- Department -->
				<div class="col-lg-3 col-md-6 dept_col">
					<div class="dept">
						<div class="dept_image"><img src="<%=request.getContextPath()%>/templates/public/images/dept_2.jpg" alt=""></div>
						<div class="dept_content text-center">
							<div class="dept_title">gastroenterology</div>
							<div class="dept_subtitle">Dr. Gunter Roscoe</div>
						</div>
					</div>
				</div>

				<!-- Department -->
				<div class="col-lg-3 col-md-6 dept_col">
					<div class="dept">
						<div class="dept_image"><img src="<%=request.getContextPath()%>/templates/public/images/dept_3.jpg" alt=""></div>
						<div class="dept_content text-center">
							<div class="dept_title">dentistry</div>
							<div class="dept_subtitle">Dr. Maria Williams</div>
						</div>
					</div>
				</div>

				<!-- Department -->
				<div class="col-lg-3 col-md-6 dept_col">
					<div class="dept">
						<div class="dept_text">
							<p>Cập nhật các thông tin nghiên cứu mới nhất từ các viện nghiên cứu hàng đầu thế giới</p>
						</div>
						<div class="button dept_button"><a href="#">Xem thêm</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		if(account !=null){
	%>
	<%@ include file="/templates/public/inc/messages.jsp" %>
	<%}else{
	%>
					<div class="row chat-window col-xs-12 col-md-3" id="chat_window_1" style="margin-left:10px;z-index: 100;">
					<div class="col-xs-12 col-md-12">
						        	<div class="panel panel-default">
                <div class="panel-heading top-bar">
                    <div class="col-md-8 col-xs-8">

                         <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span>&nbsp;Bạn cần tư vấn gì ?</h3>

                    </div>
                    <div class="col-md-4 col-xs-4" style="text-align: right;">
                        <a href="javascript:void(0)"><span id="minim_chat_window" class="glyphicon glyphicon-minus icon_minim"></span></a>
                        <a href="#"><span class="glyphicon glyphicon-remove icon_close" data-id="chat_window_1"></span></a>
                    </div>
                </div>

               <form id="chat">
                 <div class="panel-footer">
                    <div class="input-group">
                        <input id="message" name="message" type="text" class="form-control input-sm chat_input" placeholder="Bạn có điều gì thắc mắc ?" />
                        <input id="id" type="hidden" name="id" value=""/>
                        <input id="username" type="hidden" name="name" value=""/>
                        <span class="input-group-btn">
                        <button class="btn btn-primary btn-sm" type="button" onclick="alert('Bạn cần đăng nhập để chat !')">Gửi</button>
                        </span>
                    </div>
                </div>
            </form>
    		</div>
					</div>
				</div>
	<%
	}%>
<%@ include file="/templates/public/inc/footer.jsp" %>