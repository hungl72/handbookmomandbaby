<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V12</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/templates/loginlogout/images/icons/favicon.ico"/>
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
<!--==============================================================================
=================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('<%=request.getContextPath()%>/templates/loginlogout/images/happyfamily.jpg');">
			<div class="wrap-login100 p-t-190 p-b-30">
				<form id="signup" method="post" action="<%=request.getContextPath()%>/signup" class="login100-form validate-form">

					<div class="wrap-input100 m-b-10" data-validate = "Username is required">
						<input class="input100" type="text" name="username" placeholder="Họ và tên">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user"></i>
						</span>
					</div>

					<div class="wrap-input100 m-b-10" data-validate = "Username is required">
						<input class="input100" type="text" name="email" placeholder="Email">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user"></i>
						</span>
					</div>

					<div class="wrap-input100 m-b-10" data-validate = "Password is required">
						<input class="input100" type="password" id="pass" name="pass" placeholder="Mật khẩu">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock"></i>
						</span>
					</div>

                    <div class="wrap-input100 m-b-10" data-validate = "Password is required">
						<input class="input100" type="password" name="repass" placeholder="Nhập lại mật khẩu">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock"></i>
						</span>
					</div>

                    <div class="wrap-input100 m-b-10" data-validate = "Password is required">
						
						<input type="text" id="datepicker" name="date" class="input100" value="2011-08-19">
						<span class="focus-input100"></span>
                        <span class="symbol-input100">
							<i class="fa fa-calendar"></i>
						</span>
					</div>					
					<%
					try{
						int result = 0;
						if(request.getAttribute("result") != null){
							result = Integer.parseInt(String.valueOf(request.getAttribute("result")));
							if(result == -1){
					%>
					<div class="wrap-input100 validate-input m-b-10" data-validate = "Password is required">
						<h5 style="color: yellow;">Email đã tồn tại, hãy nhập email khác !</h5>
					</div>
					<%}}else{}
						}catch(Exception e){}%>
					<div class="container-login100-form-btn p-t-10">
						<button class="login100-form-btn">
							Đăng ký
						</button>
					</div>

					<div class="text-center w-full p-t-25 p-b-230">
						<a  href="<%=request.getContextPath()%>/login" class="txt1">
							Đã có tài khoản ?
                            <i class="fa fa-long-arrow-right"></i>
						</a>
					</div>

				</form>
			</div>
		</div>
	</div>
	</div>
	


<script>
$(function() {
    $( "#datepicker" ).datepicker({
        dateFormat : 'yy-mm-dd',
        changeMonth : true,
        changeYear : true,
        yearRange: '-100y:c+nn',
        maxDate: '-1d'
    });
});
$().ready(function() {
	$("#signup").validate({
		onfocusout: false,
		onkeyup: false,
		onclick: false,
		rules: {
			"username": {
				required: true,
			},
			"email": {
				required: true,
				email: true,
			},
			"pass": {
				required: true,
				minlength: 8,
			},
			"repass": {
				required: true,
				minlength: 8,
				equalTo: "#pass",
			},
		},
		messages: {
			"username": {
				required: "Họ tên không được để trống",
			},
			"email": {
				required: "Email không được để trống",
				email: "Email không đúng định dạng"
			},
			"pass": {
				required: "Mật khẩu không được để trống",
				minlength: "Mật khẩu tối thiểu 8 ký tự"
			},
			"repass": {
				required: "Mật khẩu không được để trống",
				minlength: "Mật khẩu tối thiểu 8 ký tự",
				equalTo: "Mật khẩu không khớp !",
			},
		}
	});
});
</script>
<style>
#ui-datepicker-div{
    left: 564.6px;
    z-index: 2;
    background-color: cornsilk;
    opacity: 0.9;
    padding: 1rem;
    border-radius: 5px;
    top: 480px;
}
</style>
</body>
</html>