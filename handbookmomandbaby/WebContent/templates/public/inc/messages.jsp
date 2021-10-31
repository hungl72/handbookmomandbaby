<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    			<style>
				.chat_area{bottom:0; height:40px;     float: left !important;
				width: 100% !important;position:sticky;
				background: #fff !important;}
				
				.chat_box:focus,#btn-chat:focus{outline:none !important;}
				.base_sent{margin: 4px;}
				.base_receive{margin:4px;}
			</style>
			                    <%
                    	if(account != null && account.getIDUserGroup() != 2){
                    %>
			<div class="page">
				<div class="container">
				<div class="row chat-window col-xs-12 col-md-3" id="chat_window_1" style="margin-left:10px;z-index: 100;">
					<div class="col-xs-12 col-md-12">
						        	<div class="panel panel-default">
                <div class="panel-heading top-bar">
                    <div class="col-md-10 col-xs-10">
                        <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span>&nbsp;<%=account.getAccount_name()%> - (Chat với chuyên gia)</h3>
                        <%}else{
                     %>
                         <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span>&nbsp;Bạn cần tư vấn gì ?</h3>
                       <%
                        } %>
                    </div>
                    <div class="col-md-1 col-xs-1" style="text-align: right;">
                        <a href="javascript:void(0)"><span id="minim_chat_window" class="glyphicon glyphicon-minus icon_minim"></span></a>
                        <!--<a href="#"><span class="glyphicon glyphicon-remove icon_close" data-id="chat_window_1"></span></a> -->
                    </div>
                </div>
                	<div class="panel-body msg_container_base" style="display: flex;flex-direction: column-reverse;">
                	<div class="mess">
                	<% 
                		if(request.getAttribute("findAll") != null){
                			ArrayList<Message> findAll = (ArrayList<Message>)request.getAttribute("findAll");
                			for(Message m : findAll){
                				if(m.getId_expert() == 0){
					%>
                    <div class="row msg_container base_sent">
                        <div class="col-md-10 col-xs-10">
                            <div class="messages msg_sent">
                                <p><%=m.getMessage_sent()%></p>
                                <time datetime="2009-11-13T20:00"><%=m.getMessage_time_sent()%></time>
                            </div>
                        </div>
                        <div class="col-md-2 col-xs-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                    </div>
                    <%
                    			}else{
                    %>				
                      <div class="row msg_container base_receive">
                        <div class="col-md-2 col-xs-2 avatar">
                            <img src="http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg" class=" img-responsive ">
                        </div>
                        <div class="col-md-10 col-xs-10">
                            <div class="messages msg_receive">
                                <p><%=m.getMessage_sent()%></p>
                                <time datetime="2009-11-13T20:00"><%=m.getMessage_time_sent()%></time>
                            </div>
                        </div>
                    </div>
                    <%
                    			}
                    		}
                    	}
                    %>
                </div>
                </div>
               <form id="chat">
                 <div class="panel-footer">
                    <div class="input-group">
                        <input id="message" name="message" type="text" class="form-control input-sm chat_input" placeholder="Bạn có điều gì thắc mắc ?" />
                        <input id="id" type="hidden" name="id" value="<%=account.getAccount_id()%>"/>
                        <input id="username" type="hidden" name="name" value="<%=account.getAccount_name()%>"/>
                        <span class="input-group-btn">
                        <button class="btn btn-primary btn-sm" id="submitMessage">Gửi</button>
                        </span>
                    </div>
                </div>
            </form>
    		</div>
					</div>
				</div>
				
			  
			</div>
			</div>
    			<script>

		    $("#submitMessage").click(function(e){
		    	e.preventDefault();
		    	var message = $("#message").val();
		    	if(message == "" || message == null){
		    		alert('Bạn vui lòng nhập nội dung tin nhắn !');
		    	}else{
		        $.ajax({            
		            url: '<%=request.getContextPath()%>/usermessage',
		            method: 'post',
		            data:{id : <%=account.getAccount_id()%>,  username : $("#username").val(), message : message},
		            success:function(data){
						$('.mess').html(data);
						$('#message').val('');
		            }
		        });
		    	}
		    });

		    var auto = setInterval(automatic, 1000);
		    function automatic(){
		    	var mess = $('.message').val();
		    	if(mess != null || mess != "" || mess != ''){
		    	$.ajax({            
		            url: '<%=request.getContextPath()%>/usermessage',
		            method: 'post',
		            data:{id : <%=account.getAccount_id()%>, name : name, username : $('#username').val(), message : mess},
		            success:function(data){
		            	$('.mess').html(data);
		            }
		        });
		    	}else{}
		    }
			</script>