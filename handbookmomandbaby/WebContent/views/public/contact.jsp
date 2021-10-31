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
							<div class="home_title"><span>HandBook</span> Liên hệ</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Contact -->

	<div class="contact">
		<div class="container">
			<div class="row">
				<!-- Contact Info -->
				<div class="col-lg-6">
					<div class="section_title"><h2>Kết nối với chúng tôi</h2></div>
					<div class="contact_text">
						<p>Chúng tôi rất vui khi tiếp nhận ý kiến của các bạn, mọi ý kiến và góp ý của bạn sẽ giúp chúng tôi cải thiện tốt hơn dịch vụ của chúng tôi.</p>
					</div>
					<ul class="contact_about_list">
						<li><div class="contact_about_icon"><img src="<%=request.getContextPath()%>/templates/public/images/phone-call.svg" alt=""></div><span>+45 677 8993000 223</span></li>
						<li><div class="contact_about_icon"><img src="<%=request.getContextPath()%>/templates/public/images/envelope.svg" alt=""></div><span>office@template.com</span></li>
						<li><div class="contact_about_icon"><img src="<%=request.getContextPath()%>/templates/public/images/placeholder.svg" alt=""></div><span>Main Str. no 45-46, b3, 56832, Los Angeles, CA</span></li>
					</ul>
				</div>

				<!-- Contact Form -->
				<div class="col-lg-6 form_col">
					<div class="contact_form_container">
					<%
						try{
							if(request.getParameter("msg").equals("success")){
					%>
					<h3 style="color: red;font-weight: bold;">Gửi góp ý thành công</h3>
					<%	
							}else{
					%>
					<h3 style="color: red;font-weight: bold;">Gửi góp ý thất bại</h3>
					<%
							}}catch(Exception e){}
					%>
						<form action="<%=request.getContextPath()%>/contact" method="post" id="contact_form" class="contact_form">
							<div class="input_container"><input type="text" class="contact_input" name="title"  placeholder="Nội dung"></div>
							<div class="input_container"><textarea class="contact_input contact_text_area" name="content" placeholder="Tin nhắn"></textarea></div>
							<%
                            	if(session.getAttribute("account") != null){
                            %>
							<button class="button contact_button"><a type="submit">Gửi thông tin</a></button>
							<%}else{
							%>
							<button onclick="alert('Trước khi gửi bạn cần phải đăng nhập !')" class="button contact_button"><a href="javascript:void(0)">Gửi thông tin</a></button>
							<%	
							}%>
						</form>
					</div>
				</div>
			</div>
			<div class="col-xs-12" style="margin-top: 25px;">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3833.8204743580072!2d108.22070411494111!3d16.074803188877524!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314218307d81c91d%3A0xbc7c14cab8a09c8!2zxJDhuqFpIGjhu41jIER1eSBUw6Ju!5e0!3m2!1svi!2s!4v1615211302566!5m2!1svi!2s" style="border:0;width: 100%;height: 500px;" allowfullscreen="" loading="lazy"></iframe>
			</div>
			</div>
			</div>
			</div>
<%@ include file="/templates/public/inc/footer.jsp" %>
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
<script>
$().ready(function() {
	$("#contact_form").validate({
		onfocusout: false,
		onkeyup: false,
		onclick: false,
		rules: {
			"title": {
				required: true,
			},
			"content": {
				required: true,
			},
		},
		messages: {
			"title": {
				required: "Tiêu đề không được để trống",
			},
			"content": {
				required: "Nội dung không được để trống",
			}
		}
	});
});
</script>