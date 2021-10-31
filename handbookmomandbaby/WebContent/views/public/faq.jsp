<%@page import="models.Faq"%>
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
							<div class="home_title"><span>HandBook</span> Các câu hỏi thường gặp</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-md-10 col-xs-12">
			  <div class="form-group">
			    <textarea style="height: 150px;" class="form-control" id="createQuestion" placeholder="Hãy đăng câu hỏi của bạn lên đây ..."></textarea>
			  </div>
			  <div>
				 <div class="form-group" style="display: flex;justify-content: space-between;">
			    <input type="checkbox" class="form-check-input" id="check">
			    <label style="padding-left: 20px;">Đăng ẩn danh (Mặc định là đăng công khai)</label>
			    <%
			    		if((Account)session.getAttribute("account") != null){
			    %>
			   	<button  id="create"  class="btn btn-primary">Đăng câu hỏi</button> 
			   	<%}else{
			   	%>
			   	<button id="postQuestion"  onclick="alert('Trước khi đăng câu hỏi bạn cần phải đăng nhập !')"  class="btn btn-primary">Đăng câu hỏi</button> 
			   	<%
			   	}%>
			    </div>	
		  	</div>
			</div>
			<div class="col-md-10 col-xs-12">
			<h4>Đang đợi trả lời</h4>
			<div id="c">
			<%
				if(request.getAttribute("listFaqState0") != null){
					ArrayList<Faq> listFaq = (ArrayList)request.getAttribute("listFaqState0");
					for(Faq f : listFaq){
						if(f.getFaq_anonymous() == 0) {
			%>
			<div id="waiting<%=f.getFaq_id()%>">
				<h3><%=f.getFaq_question()%>  
				<%
					try{
						if(account.getIDUserGroup() == 2){
				%>
				-> <a href="javascript:void(0)"  onclick="show(<%=f.getFaq_id()%>)">Trả lời</a></h3>
				<%
						}else{}
					}catch (Exception e){}
				%>
				
					<h5>Câu hỏi đến từ <span style="color: #283290;"><%=f.getFaq_username()%></span> -> Đang đợi phản hồi từ <span style="color: #283290;">chuyên gia</span></h5>
					<p id="reply<%=f.getFaq_id()%>" style="font-weight: bold;" hidden="hidden;"><textarea class ="form-control" id ="replyContent<%=f.getFaq_id()%>"></textarea><a href="javascript:void(0)" onclick="post(<%=f.getFaq_id()%>)">Phản hồi</a></p>
					</div>
				<%	
						}else{
				%>
					<div id="waiting<%=f.getFaq_id()%>">
				<h3><%=f.getFaq_question()%>  
				<%
					try{
						if(account.getIDUserGroup() == 2){
				%>
				-> <a href="javascript:void(0)"  onclick="show(<%=f.getFaq_id()%>)">Trả lời</a></h3>
				<%
						}else{}
					}catch (Exception e){}
				%>
					<h5>Câu hỏi đến từ <span style="color: #283290;">một bạn giấu tên</span> -> Đang đợi phản hồi từ <span style="color: #283290;">chuyên gia</span></h5>
					<p id="reply<%=f.getFaq_id()%>" style="font-weight: bold;" hidden="hidden;"><textarea class ="form-control" id ="replyContent<%=f.getFaq_id()%>"></textarea><a href="javascript:void(0)" onclick="post(<%=f.getFaq_id()%>)">Phản hồi</a></p>
					</div>
				<%	
						}
					}
				}
			%>
			</div>
			</div>

			<div class="col-md-10 col-xs-12">
			<h4>Đã trả lời</h4>
			<div id="q">
			<%
				if(request.getAttribute("listFaqState1") != null){
					ArrayList<Faq> listFaq = (ArrayList)request.getAttribute("listFaqState1");
					for(Faq f : listFaq){
						if(f.getFaq_anonymous() == 0) {
			%>
			
			<div>
				<a href="javascript:void(0);" onclick="question(<%=f.getFaq_id()%>)"><h3><%=f.getFaq_question()%><span id="plusminus<%=f.getFaq_id()%>" style="float: right;">+</span></h3></a>
				<h5>Câu hỏi đến từ <span style="color: #283290;"><%=f.getFaq_username()%></span> -> Đã trả lời bởi <span style="color: #283290;">chuyên gia</span></h5>
								<%
					try{
						if(account.getIDUserGroup() == 2){
				%>
				<a href="javascript:void(0)"  onclick="show(<%=f.getFaq_id()%>)">Sửa câu trả lời</a>
								<%
						}else{}
					}catch (Exception e){}
				%>
				<p id="reply<%=f.getFaq_id()%>" style="font-weight: bold;" hidden="hidden;"><textarea class ="form-control" id ="replyContent<%=f.getFaq_id()%>"></textarea><a href="javascript:void(0)" onclick="fix(<%=f.getFaq_id()%>)">Phản hồi</a></p>
			</div>
			<div class="col-md-12 col-xs-12" >
				<p id="responsequestion<%=f.getFaq_id()%>" style="display: none;"><%=f.getFaq_feedback()%></p>
			</div>

				<%			
								}else{
				%>
				<div>
				<a href="javascript:void(0);" onclick="question(<%=f.getFaq_id()%>)"><h3><%=f.getFaq_question()%><span id="plusminus<%=f.getFaq_id()%>" style="float: right;">+</span></h3></a>
				<h5>Câu hỏi đến từ <span style="color: #283290;">một bạn giấu tên</span> -> Đã trả lời bởi <span style="color: #283290;">chuyên gia</span></h5>
												<%
					try{
						if(account.getIDUserGroup() == 2){
				%>
				<a href="javascript:void(0)"  onclick="show(<%=f.getFaq_id()%>)">Sửa câu trả lời</a>
								<%
						}else{}
					}catch (Exception e){}
				%>
				<p id="reply<%=f.getFaq_id()%>" style="font-weight: bold;" hidden="hidden;"><textarea class ="form-control" id ="replyContent<%=f.getFaq_id()%>"></textarea><a href="javascript:void(0)" onclick="fix(<%=f.getFaq_id()%>)">Phản hồi</a></p>
			</div>
			<div class="col-md-12 col-xs-12" >
				<p id="responsequestion<%=f.getFaq_id()%>" style="display: none;"><%=f.getFaq_feedback()%></p>
			</div>
				<%					
								}
							}
					}
				%>
							</div>
	</div>
			<div class="row">
				
			</div>
		</div>
	</div>
	</div>
	</div>
<script>
	function question(x){
	    $("#responsequestion"+x).slideToggle();
	    if($("#plusminus"+x).text() == '+'){
	    	$("#plusminus"+x).text('-');
	    	$("#plusminus"+x).text('+');
	    }

	};
	
function show(x){
	$('#reply'+x).removeAttr("hidden");
}

function postQuestion(){
	if($('#createQuestion').val() == ""){
		return false;
	}else{
		return true;
	}
}

$("#create").click(function() {
	var anonymous = 0;
	<%
		if(account != null){
	%>
	if(postQuestion() == true){
		
	
	$.ajax({
		url: '<%=request.getContextPath()%>/repquestionauto',
		method: 'get',
		data:{question : $("textarea[id='createQuestion']").val(), user_id : <%=account.getAccount_id()%>, user_name : '<%=account.getAccount_name()%>', anonymous : anonymous = document.getElementById('check').checked?1:0},
		success:function(data){
			$('#c').html(data);
		}
	});
	$('#createQuestion').val("");
	}else{
		alert('Bạn chưa nhập câu hỏi !');
	}
	<%
		}else{
			
		}
	%>
});

function post(IDFaq){
	$.ajax({            
        url: '<%=request.getContextPath()%>/faq',
        method: 'post',
        data:{IDFaq : IDFaq, replyContent : $("textarea[id='replyContent"+IDFaq+"']").val()},
        success:function(data){
        	document.getElementById('waiting'+IDFaq).innerHTML = "";
        	$('#q').html(data);
        }
    });
}

function fix(IDFaq){
	$.ajax({            
        url: '<%=request.getContextPath()%>/fixquestion',
        method: 'post',
        data:{IDFaq : IDFaq, replyContent : $("textarea[id='replyContent"+IDFaq+"']").val()},
        success:function(data){
        	$('#responsequestion'+IDFaq).html(data);
        	$('#replyContent'+IDFaq).val("");
        }
    });
}

function loadQuestionAuto(){
	$.ajax({
		url: '<%=request.getContextPath()%>/repquestionauto',
		method: 'get',
		data:{},
		success:function(data){
			$('#c').html(data);
		}
	});
}

function loadQuestionAuto1(){
	$.ajax({
		url: '<%=request.getContextPath()%>/repquestionauto',
		method: 'post',
		data:{},
		success:function(data){
			$('#q').html(data);
		}
	});
}

</script>
<%@ include file="/templates/public/inc/footer.jsp" %>