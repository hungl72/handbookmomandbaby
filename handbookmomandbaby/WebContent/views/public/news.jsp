<%@page import="daos.CommentDAO"%>
<%@page import="models.CommentChildren"%>
<%@page import="models.Comment"%>
<%@page import="models.ListNews"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/news.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/news_responsive.css">
<script src="https://sp.zalo.me/plugins/sdk.js"></script>

</head>

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

	<!-- News -->

	<div class="news" style="padding: 0px 0px 20px 0px;">
		<div class="container">
			<div class="row">
				
				<!-- News Posts -->
				<div class="col-md-8 col-xs-12">
						<%
							if(request.getAttribute("news") != null){
								ArrayList<ListNews> listNews = (ArrayList)request.getAttribute("news");
								for(ListNews list : listNews){
									
						%>
                        	<h3><%=list.getListnews_name()%></h3>
                            <img src="<%=request.getContextPath()%>/uploads/images/<%=list.getListnews_image()%>" class="img-responsive" style="width: auto; height: 500px;"/>
                            <div>
                                <p><%=list.getListnews_content()%></p>
                            </div>
					<div id="zalo">
                            <div class="zalo-share-button" data-href="" data-oaid="579745863508352884" data-layout="2" data-color="blue" data-customize=false data-callback='ok()'></div>
                            </div>
<script>
$(window).on("load",function a(){
	var url = location.href; 
	$('#zalo').html('<div class="zalo-share-button" data-href='+url+' data-oaid="579745863508352884" data-layout="2" data-color="blue" data-customize=false data-callback="ok()"></div>');
});
</script>
<script src="https://sp.zalo.me/plugins/sdk.js"></script>

                        <form >
                          <h3>Viết bình luận của bạn</h3>
                          <div class="form-group">
                           <input type="hidden" name="comment_id" value="<%=list.getListnews_id()%>" id="idNews"placeholder="Name" /> 
                            <textarea class="form-control" id="commentContent"></textarea>
                            <%
                            	if(session.getAttribute("account") != null){
                            %>
                            <button type="button" id="submitButton" style="border-radius: 5px;border: 1px solid rebeccapurple;background-color: rebeccapurple;color: #FFFFFF;padding: 5px;margin-top: 20px;">Đăng bình luận</button>
                            <%
                            	}else{
                            %>
                             <button type="button" onclick="alert('Bạn phải đăng nhập trước khi bình luận !')" style="border-radius: 5px;border: 1px solid rebeccapurple;background-color: rebeccapurple;color: #FFFFFF;padding: 5px;margin-top: 20px;">Đăng bình luận</button>
                            <%
                            	}
                            %>
                          </div>
                        </form>
                        <%}}%>
                        <div id="comment" style="height: 400px; overflow: auto;">
                        <%
                        	int comment_children_id = 0;
                        	if(request.getAttribute("comment") != null){
                        		ArrayList<Comment> comment = (ArrayList)request.getAttribute("comment");
                        		if(comment.size() > 0){
                        			for(Comment c : comment){
                    	%>
                    	<div id="commentParentId<%=c.getComment_id()%>">
                        <p id="updateChangeDel<%=c.getComment_id()%>" style="font-weight: bold;"><%=c.getComment_content()%> -> <span style="color: #283290;font-weight: bold;">Bình luận bởi</span> : <span style="color: #283290;font-weight: bold;"><%=c.getNameAccount()%></span> - <span style="color: #283290;font-weight: bold;">Lúc</span> : <span style="color: #283290;font-weight: bold;"><%=c.getComment_datecreated()%></span>
                        <a href="javascript:void(0)"  onclick="show(<%=c.getComment_id()%>)"> Trả lời -> <%=c.getNameAccount()%></a>
                        <%
                        	try{
                        	if(c.getIDAccount() == account.getAccount_id()){
                        %>
                        <a href="javascript:void(0)"  onclick="showChange(<%=c.getComment_id()%>)"> Sửa</a>
                         <a href="javascript:void(0)"  onclick="del(<%=c.getComment_id()%>)"> Xóa</a>
                        <%}
                        			}catch(Exception e){}
                        %>
                        </p>
                        <div id="change<%=c.getComment_id()%>"  hidden="hidden">
                        	<textarea id="contentParent<%=c.getComment_id()%>" class ="form-control"><%=c.getComment_content()%></textarea>
                        	<a href="javascript:void(0)"  onclick="runChange(<%=c.getComment_id()%>)"> Sửa nội dung</a>
                        </div>
                        <span id="responseComment<%=c.getComment_id()%>"></span>
                        <%
                        		for(CommentChildren cc : new CommentDAO().findAllCommentChildrennn(c.getComment_id())){
                        			comment_children_id = cc.getComment_children_id();
                        %>
  						<p id="reply<%=comment_children_id%>" style="font-weight: bold;padding-left: 20px;width: 95%;" hidden="hidden;">
  						<textarea class ="form-control" id ="replyContent<%=cc.getIDComment()%><%=cc.getComment_children_id()%>" placeholder="@<%=cc.getNameAccount()%>"></textarea>
  						
  						 <%
                            	if(session.getAttribute("account") != null){
                            %>
  						<a href="javascript:void(0)" onclick="post(<%=cc.getIDComment()%>,<%=comment_children_id%>)">Phản hồi</a></p>
  						<%}else{
  						%>
  							<a href="javascript:void(0)" onclick="alert('Bạn phải đăng nhập trước khi bình luận !')">Phản hồi</a></p>
  							<%
  						}%>
  						
                        <%
                        			}
                        %>
                        <a href="javascript:void(0)" onclick="setInterval(loadCommentChildren(<%=c.getComment_id()%>),1000)">Xem thêm</a>
                        <p id="reply<%=c.getComment_id()%>" style="font-weight: bold;padding-left: 20px;width: 95%;" hidden="hidden;">
                        <textarea class ="form-control" id ="replyContent<%=c.getComment_id()%><%=0%>" placeholder="@<%=c.getNameAccount()%>"></textarea>
                        
                         <%
                            	if(session.getAttribute("account") != null){
                            %>
                        <a href="javascript:void(0)" onclick="post(<%=c.getComment_id()%>,<%=0%>)">Phản hồi</a></p>
                        <%}else{
                        %>
                        <a href="javascript:void(0)" onclick="alert('Bạn phải đăng nhập trước khi bình luận !')">Phản hồi</a></p>
                        <%
                        }%>
                        
                        <hr />
                        </div>
	                    <%
	                    }}else{
	                    %>
	                    <h3>Chưa có bình luận nào cho bài viết này !</h3>
	                    <%	
	                    }
	                    }
	                    %>    	
                        </div>

				</div>
				<div class="col-md-4 col-xs-12">

                    <div style="margin-top: 20px;">
                        <div class="container" style="padding: 0;">
                        <%
                        	if(request.getAttribute("listNewsRelate") != null){
                        		ArrayList<ListNews> listNews = (ArrayList)request.getAttribute("listNewsRelate");
                        			if(listNews.size() > 0){
                        %>
                        <h3>Bài viết liên quan</h3>
                        <ul>
                        					                        <%
                        	if(request.getAttribute("listNewsRelate") != null){
                        		ArrayList<ListNews> listNewsRelate = (ArrayList)request.getAttribute("listNewsRelate");
                        		for(ListNews l : listNewsRelate){
                       %>
                            <li><i class="fa fa-check"></i><a href="<%=request.getContextPath()%>/news?menu_id=<%=l.getMenu_id()%>&listnews_id=<%=l.getListnews_id()%>" style="margin-left: 5px;"><%=l.getListnews_name()%></a></li>
                                                     <%                        		
                         			}
                            }
                            %>
                        </ul>
                        <%}}%>
                        </div>

                    </div>
				</div>
				</div>
		</div>
	</div>
	</div>
	</div>
<script>
$("#submitButton").click(function() {
	var idNews = $("input[id='idNews']").val();
	var commentContent = $("textarea[id='commentContent']").val();
	if(commentContent != ""){
	$.ajax({
		url : '<%=request.getContextPath()%>/commentnews',
		type : 'post',
		data :{idNews : idNews, commentContent : commentContent},
		success : function(data) {
			$("#comment").html(data);
			$("#commentContent").val("");
			var chatHistory = document.getElementById("comment");
			chatHistory.scrollTop = chatHistory.scrollHeight;
		}
	});
	}else{
		alert('Bạn chưa nhập nội dung bình luận !');
	}
});	
var chatHistory = document.getElementById("comment");
chatHistory.scrollTop = chatHistory.scrollHeight;

function show(x){
	$('#reply'+x).removeAttr("hidden");
	$('#reply'+x).show();
}

function showChange(x){
	$('#change'+x).removeAttr("hidden");
}

function showChangeChildren(x){
	$('#changeChildren'+x).removeAttr("hidden");
}

function del(x){
	var idNews = $("input[id='idNews']").val();
	$.ajax({
		url: '<%=request.getContextPath()%>/delComment',
		method: 'get',
		data: {comment_id : x, idNews : idNews},
		success:function(data){
			$("#commentParentId"+x).remove();
		}
	});
}
function runChange(x){
	var comment_content = $("#contentParent"+x).val();
	$.ajax({
		url : '<%=request.getContextPath()%>/changeComment',
		method : 'post',
		data : {comment_id : x, comment_content : comment_content},
		success:function(data){
			$("#updateChangeDel"+x).html(data);
			$("#change"+x).attr('hidden','hidden');
		}
	});
}

function runChangeChildren(x){
	var comment_content = $("#contentChildren"+x).val();
	$.ajax({
		url : '<%=request.getContextPath()%>/changeCommentChildren',
		method : 'post',
		data : {comment_id : x, comment_content : comment_content},
		success:function(data){
			$("#updateChangeDelChildren"+x).html(data);
			$("#changeChildren"+x).attr('hidden','hidden');
		}
	});
}

function loadCommentChildren(IDComment){
	$.ajax({            
        url: '<%=request.getContextPath()%>/commentchildren',
        method: 'post',
        data:{IDComment : IDComment},
        success:function(data){
        	$('#responseComment'+IDComment).html(data);
        }
    });
}

function post(IDComment,comment_children_id){
	var replyContent = $('#replyContent'+IDComment+comment_children_id+''+'').val();
	if(replyContent != ""){
	$.ajax({            
        url: '<%=request.getContextPath()%>/commentchildren',
        method: 'get',
        data:{IDComment : IDComment, replyContent : replyContent, idNews : $("input[id='idNews']").val(),comment_children_id:comment_children_id},
        success:function(data){
        	$('#reply'+IDComment+comment_children_id).html(data);
        	var a = '<textarea class ="form-control id =replyContent'+''+IDComment+comment_children_id+'></textarea><a href="javascript:void(0)" onclick="post('+IDComment+')">Phản hồi</a>';
        	//document.getElementById('reply'+IDComment+comment_children_id).innerHTML = a;
        	$('#replyContent'+IDComment+comment_children_id).val("");
        	$('#reply'+IDComment).hide();
        	loadCommentChildren(IDComment);
        }
    });
	}else{
		alert('Bạn chưa nhập nội dung phản hồi !');
	}
}
function ok(){
	alert('Chia sẻ bài viết thành công');
}

</script>
<%@ include file="/templates/public/inc/footer.jsp" %>