<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V12</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="<%=request.getContextPath()%>/templates/loginlogout/image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/loginlogout/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/loginlogout/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/loginlogout/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/loginlogout/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/loginlogout/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/loginlogout/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/loginlogout/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/loginlogout/css/main.css">
<!--===============================================================================================-->

</head>
<body>
	<div class="limiter">
		<div class="container-login100" style="background-image: url('<%=request.getContextPath()%>/templates/loginlogout/images/img-02.jpg');">
			<div class="wrap-login100 p-t-190 p-b-30">

				<form id="login" method="post" action="<%=request.getContextPath()%>/login" class="login100-form validate-form">

					<div class="wrap-input100 m-b-10">
						<input class="input100" type="text" name="email" placeholder="Tên đăng nhập">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user"></i>
						</span>
					</div>

					<div class="wrap-input100 m-b-10">
						<input class="input100" type="password" name="pass" placeholder="Mật khẩu">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock"></i>
						</span>
					</div>

					<div class="container-login100-form-btn p-t-10">
						<button class="login100-form-btn">
							Đăng nhập
						</button>
					</div>
	<%
	String resetpass = "";
	try{
		resetpass = request.getParameter("resetpass");
		if(request.getAttribute("result").equals("1")){
	%>
					<div class="container-login100-form-btn p-t-10"><a style="color: red;font-weight: bold;" class="txt1">Đăng ký thành công, mời bạn đăng nhập !</a></div>
	<%
		}else if(request.getAttribute("result").equals("-1")){
	%>
			<div class="container-login100-form-btn p-t-10"><a style="color: red;font-weight: bold;" class="txt1">Sai tên đăng nhập hoặc mật khẩu !</a></div>
	<%
		}else if(String.valueOf(resetpass.equals("success")) != null){
	%>
			<div class="container-login100-form-btn p-t-10"><a style="color: red;font-weight: bold;" class="txt1">Khôi phục mật khẩu khành công !</a></div>
	<%
		}else if (String.valueOf(resetpass.equals("error")) != null){
	%>
			<div class="container-login100-form-btn p-t-10"><a style="color: red;font-weight: bold;" class="txt1">Khôi phục mật khẩu thất bại !</a></div>
	<%
		}else{}
	}catch(Exception e){
		
	}
	%>
	<!-- <div class="container-login100-form-btn p-t-10">
						<button class="login100-form-btn">
							<a href="https://www.facebook.com/dialog/oauth?client_id=289316705981347&redirect_uri=http://localhost:8080/HandBookMomAndBaby/login-facebook">Login Facebook</a>
						</button>
					</div>
				 -->
					<div class="text-center w-full p-t-25 p-b-230">
						<a href="<%=request.getContextPath()%>/forgotpass" class="txt1">
							Quên mật khẩu ?
						</a>
						
					</div>
	
					<div class="text-center w-full">
						<a class="txt1" href="<%=request.getContextPath()%>/signup">
							Bạn chưa có tài khoản ? Tạo tài khoản mới
							<i class="fa fa-long-arrow-right"></i>						
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
<!--===============================================================================================-->	
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
<script>
$().ready(function() {
	$("#login").validate({
		onfocusout: false,
		onkeyup: false,
		onclick: false,
		rules: {
			"email": {
				required: true,
				email: true,
			},
			"pass": {
				required: true,
				minlength: 8
			},
		},
		messages: {
			"email": {
				required: "Tên đăng nhập không được để trống",
				email: "Sai định dạng email"
			},
			"pass": {
				required: "Mật khẩu không được để trống",
				minlength: "Mật khẩu tối thiểu 8 ký tự"
			}
		}
	});
});
</script>
</body>
</html>