<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/news.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/news_responsive.css">

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
 <style>
 .form-gap {
    padding-top: 70px;
}
 </style>
 <div class="form-gap"></div>
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default" style="margin:  10rem 0 5rem 0;">
              <div class="panel-body">
                <div class="text-center">
                  <h3><i class="fa fa-lock fa-4x"></i></h3>
                  <h5 style="color: red;">Lưu ý, mật khẩu chỉ được nhập 1 lần nếu nhập sai mật khẩu sẽ bị hủy bạn phải tiến hành lại khôi phục lại từ đầu !!!</h5>
                  <h3 class="text-center">Bạn quên mật khẩu ?</h3>
                  <h5>Nhập email của bạn vào đây : </h5>
                  <div class="panel-body">
    
                    <form id="register-form" role="form" autocomplete="off" class="form" method="post" action="<%=request.getContextPath()%>/forgotpass">
                      <div class="form-group">
                        <div class="input-group">
                          <input id="email" name="email" placeholder="Email" class="form-control"  type="email">
                        </div>
                      </div>
                      <div class="form-group">
                        <input name="btndisabled" name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Khôi phục mật khẩu" type="submit">
                      </div>
                      
                                            <%
                      try{
  					if(request.getParameter("result").equals("error")){
					%>
					<p style="color: red;">Chuỗi bí mật không chính xác, mật khẩu đã bị hủy bạn vui lòng nhập lại email !</p>
					<%
  					}}catch(Exception e){}
                      %>
                      <a href="<%=request.getContextPath()%>/login">Quay lại trang đăng nhập</a>
                      <%
                      try{
                    	  String error = String.valueOf(request.getParameter("error"));
                      	if(error.equals("blocked")){
                      %>
                      <p style="color: red;">Đã có lỗi xảy ra hãy thử khôi phục lại mật khẩu !</p>
                      <%
                      	}else if(error.equals("email")){
                      	%>
                      	<p style="color: red;">Email không tồn tại trong hệ thống !</p>
                      	<%	
                      	}else{}
                      }catch(Exception e){}
                      %>
                      <input type="hidden" class="hide" name="token" id="token" value=""> 
                    </form>
    
                  </div>
                </div>
              </div>
            </div>
          </div>
	</div>
</div>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
<script>
$().ready(function() {
	$("#register-form").validate({
		onfocusout: false,
		onkeyup: false,
		onclick: false,
		rules: {
			"email": {
				required: true,
				email: true,
			},
		},
		messages: {
			"email": {
				required: "Email không được để trống",
				email: "Sai định dạng email"
			},
		}
	});
});
</script>