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
                  <h1><i class="fa fa-user-secret" aria-hidden="true"></i></h1>
                  <h3>Nhập chuỗi bí mật :</h3>
                  <div class="panel-body">
    				<%
    					String email = "",pass = "",result = "";
    					if(request.getAttribute("email") != null){
    						email = String.valueOf(request.getAttribute("email"));
    					}
    				%>
                    <form id="register-form" role="form" autocomplete="off" class="form" method="post" action="<%=request.getContextPath()%>/confirmpass">
   					 <input name="email" class="form-control" value="<%=email%>" hidden="hidden">
                      <div class="form-group">
                        <div class="input-group">
                          <input type="password" name="pass" placeholder="Key secret ..." class="form-control">
                        </div>
                      </div>
                      <div class="form-group">
                        <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Xác nhận" type="submit">
                      </div>
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
	<script src="demoValidation.js" type="text/javascript"></script>
<script>
$().ready(function() {
	$("#register-form").validate({
		onfocusout: false,
		onkeyup: false,
		onclick: false,
		rules: {
			"pass": {
				required: true,
			},
		},
		messages: {
			"pass": {
				required: "Mật khẩu không được để trống",
			}
		}
	});
});
</script>