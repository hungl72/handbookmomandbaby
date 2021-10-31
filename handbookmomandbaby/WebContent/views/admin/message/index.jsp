<%@page import="models.Message"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/expert/inc/header.jsp" %>

 <style>
    .container{max-width:1170px; margin:auto;}
img{ max-width:100%;}
.inbox_people {
  background: #f8f8f8 none repeat scroll 0 0;
  float: left;
  overflow: hidden;
  width: 40%; border-right:1px solid #c4c4c4;
}
.inbox_msg {
  border: 1px solid #c4c4c4;
  clear: both;
  overflow: hidden;
}
.top_spac{ margin: 20px 0 0;}


.recent_heading {float: left; width:40%;}
.srch_bar {
  display: inline-block;
  text-align: right;
  width: 60%; padding:
}
.headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}

.recent_heading h4 {
  color: #05728f;
  font-size: 21px;
  margin: auto;
}
.srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
.srch_bar .input-group-addon button {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  padding: 0;
  color: #707070;
  font-size: 18px;
}
.srch_bar .input-group-addon { margin: 0 0 0 -27px;}

.chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
.chat_ib h5 span{ font-size:13px; float:right;}
.chat_ib p{ font-size:14px; color:#989898; margin:auto}
.chat_img {
  float: left;
  width: 11%;
}
.chat_ib {
  float: left;
  padding: 0 0 0 15px;
  width: 88%;
}

.chat_people{ overflow:hidden; clear:both;}
.chat_list {
  border-bottom: 1px solid #c4c4c4;
  margin: 0;
  padding: 18px 16px 10px;
}
.inbox_chat { height: 550px; overflow-y: scroll;}

.active_chat{ background:#ebebeb;}

.incoming_msg_img {
  display: inline-block;
  width: 6%;
}
.received_msg {
  display: inline-block;
  padding: 0 0 0 10px;
  vertical-align: top;
  width: 92%;
 }
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 3px;
  color: #646464;
  font-size: 14px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
}
.time_date {
  color: #747474;
  display: block;
  font-size: 12px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 57%;}
.mesgs {
  float: left;
  padding: 30px 15px 0 25px;
  width: 60%;
}

 .sent_msg p {
  background: #05728f none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 14px;
  margin: 0; color:#fff;
  padding: 5px 10px 5px 12px;
  width:100%;
}
.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
.sent_msg {
  float: right;
  width: 46%;
}
.input_msg_write input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  color: #4c4c4c;
  font-size: 15px;
  min-height: 48px;
  width: 100%;
}

.type_msg {border-top: 1px solid #c4c4c4;position: relative;}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  position: absolute;
  right: 0;
  top: 11px;
  width: 33px;
}
.messaging { padding: 0 0 50px 0;}
.msg_history {
  height: 516px;
  overflow-y: auto;
}
</style>
<body>
<div class="container-fluid">
<h3 class=" text-center" style="font-weight: bold;">Tư vấn người dùng</h3>
<div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4 style="font-weight: bold;">On/Off <span style="color: red;"> -> <span class="online">0</span>/<span class="offline">0</span></span> </h4>
            </div>
          </div>
          <%
          	if(request.getAttribute("checkStatus") != null){
          %>
          <div class="inbox_chat">
          <div class="contentMess">
            <div class="chat_list active_chat">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5><span class="chat_date"></span></h5>
                </div>
              </div>     
            </div>
            </div>
          </div>
        </div>
        <div class="mesgs">
          <div class="msg_history" style="display: flex;flex-direction: column-reverse;">
          	<div class="mess">
          	<%
          	if(request.getAttribute("checkStatus") != null){
          		if(request.getAttribute("findAll") != null){
          			ArrayList<Message> findAll = (ArrayList<Message>)request.getAttribute("findAll");
          			for(Message m : findAll){
          				if(m.getId_expert() == 2){
          	%>
        	<div class="incoming_msg">
              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p><%=m.getMessage_sent()%></p>
                  <span class="time_date"><%=m.getMessage_time_sent()%></span></div>
              </div>
            </div>
          	<%
          				}else{
          	%>
          	 <div class="outgoing_msg">
              <div class="sent_msg">
                <p><%=m.getMessage_sent()%></p>
                <span class="time_date"><%=m.getMessage_time_sent()%></span> </div>
            </div>
          	<%		
          				}
          			}
          		}
          	}
          	%>
          	</div>
          </div>
          <form id="chat">
                 <div class="panel-footer">
                    <div class="input-group">
                        <input id="message" name="message" type="text" class="form-control input-sm chat_input" placeholder="Tư vấn khách hàng ..." />
                        <input id="id" type="hidden" name="id" value="<%=expert.getAccount_id()%>"/>
                        <input id="username" type="hidden" name="name" value="<%=expert.getAccount_name()%>"/>
                        <span class="input-group-btn">
                        <button class="btn btn-primary" id="submitMessage">Gửi</button>
                        </span>
                    </div>
                </div>
            </form>
        </div>
        <%}else{
%>
<div class="inbox_chat">
          	Không có khách hàng nào online !
          </div>
        </div>
        <div class="mesgs">
          <div class="msg_history" style="display: flex;flex-direction: column-reverse;">
          	<div class="mess">
        	<div class="incoming_msg">
            </div>
          	</div>
          </div>
        </div>
<%
}%>
      </div>   
    </div>
    </div>

<script>
setInterval(checkStatus, 1500);
setInterval(online, 1500);
setInterval(offline, 1500);
var y;
function loadChat(xx){
	y=xx;
    $.ajax({            
        url: '<%=request.getContextPath()%>/loadmessage',
        method: 'post',
        data:{id : xx},
        success:function(data){
			$('.mess').html(data);
        }
    });
  setInterval(automatic, 1000);
    function automatic(){
    	var mess = $('.message').val();
    	if(mess != null || mess != "" || mess != ''){
    	$.ajax({            
            url: '<%=request.getContextPath()%>/adminmessage',
            method: 'post',
            data:{id : y, name : name, username : $('#username').val(), message : mess},
            success:function(data){
            	$('.mess').html(data);
            }
        });
    	}else{}
    }
};
$("#submitMessage").click(function(e){
	e.preventDefault();
	if($("#message").val() != ""){
    $.ajax({            
        url: '<%=request.getContextPath()%>/adminmessage',
        method: 'post',
        data:{id : y, username : $("#username").val(), message : $("#message").val()},
        success:function(data){
			$('.mess').html(data);
			$('#message').val('');
        }
    });
	}else{
		alert('Bạn chưa nhập nội dung tin nhắn !');
		return false;
	}
});
function load(){
    $.ajax({            
        url: '<%=request.getContextPath()%>/loadmessage',
        method: 'post',
        data:{id : $('#id').val()},
        success:function(data){
			$('.mess').html(data);
        }
    });
};
function automatic(z){
	var mess = $('.message').val();
	if(mess != null || mess != "" || mess != ''){
	$.ajax({
        url: '<%=request.getContextPath()%>/adminmessage',
        method: 'post',
        data:{id : $('#id').val(), username : $('#username').val(), message : mess},
        success:function(data){
        	$('.mess').html(data);
        }
    });
	}else{}
}
function checkStatus(){
	$.ajax({            
        url: '<%=request.getContextPath()%>/checkstatus',
        method: 'post',
        data: {},
        success:function(data){
        	$('.contentMess').html(data);
        }
    });
}
function online(){
    $.ajax({            
        url: '<%=request.getContextPath()%>/checkonline',
        method: 'post',
        data:{},
        success:function(data){
			$('.online').html(data);
        }
    });
};
function offline(){
    $.ajax({            
        url: '<%=request.getContextPath()%>/checkoffline',
        method: 'post',
        data:{},
        success:function(data){
			$('.offline').html(data);
        }
    });
};
function a(){
	$.ajax({            
        url: '<%=request.getContextPath()%>/adminlastmessage',
        method: 'post',
        data: {id : $('#id').val(), },
        success:function(data){
        	$('.contentMess').html(data);
        }
    });
}
</script>
<%@ include file="/templates/admin/inc/footer.jsp" %>