<%@page import="daos.StarDAO"%>
<%@page import="models.Star"%>
<%@page import="models.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/news.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/news_responsive.css">
</head>
<style>
	  div,label{margin:0;padding:0;}
	  h1{font-size:1.5em;margin:10px;}
	  /****** Style Star Rating Widget *****/
	  #rating{border:none;float:left;}
	  #rating>input{display:none;}/*ẩn input radio - vì chúng ta đã có label là GUI*/
	  #rating>label:before{margin:5px;font-size:1.25em;font-family:FontAwesome;display:inline-block;content:"\f005";}/*1 ngôi sao*/
	  #rating>.half:before{content:"\f089";position:absolute;}/*0.5 ngôi sao*/
	  #rating>label{color:#ddd;float:right;}/*float:right để lật ngược các ngôi sao lại đúng theo thứ tự trong thực tế*/
	  /*thêm màu cho sao đã chọn và các ngôi sao phía trước*/
	  #rating>input:checked~label,
	  #rating:not(:checked)>label:hover, 
	  #rating:not(:checked)>label:hover~label{color:#FFD700;}
	  /* Hover vào các sao phía trước ngôi sao đã chọn*/
	  #rating>input:checked+label:hover,
	  #rating>input:checked~label:hover,
	  #rating>label:hover~input:checked~label,
	  #rating>input:checked~label:hover~label{color:#FFED85;}
	  </style>
</style>
<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="<%=request.getContextPath()%>/templates/public/images/news.jpg" data-speed="0.8"></div>
		<div class="home_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="home_content">
							<div class="home_title"><span>HandBook</span> Thông tin sản phẩm</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- News -->

	<div class="container">
    <div class="col-md-12 col-xs-12">
      <div class="row">
        <div class="col-md-4 col-xs-12">
                <%
        	if(request.getAttribute("listProductById") != null){
        		Product p = (Product)request.getAttribute("listProductById");
		%>
          <img src="<%=request.getContextPath()%>/uploads/images/<%=p.getProduct_image()%>" width="auto" height="300px;"/>
        </div>
        <div class="col-md-8 col-xs-12" style="margin-top: 20px;">
		  <input name="product_id" value="<%=p.getProduct_id()%>" hidden readonly="readonly">
          <h3><%=p.getProduct_name()%></h3>
          <p><%=p.getProduct_introduce()%></p>
          <h4>Giá : <%=p.getProduct_price()%> VNĐ</h4>
          <hr>
          <div class="col-md-5 col-xs-12" style="display: flex;justify-content: left;margin-bottom: 10px;">
            </div>
			<div class="col-md-12 col-xs-12">
			<div class="row">
				
				
   <%
    		float value = new StarDAO().selectValueFinal(p.getProduct_id());
    		if(value == 0){
    %>
    
     <div class="col-md-5 col-xs-12" id="rating" style="margin-left: 5px;">
    	<h4 class="col-md-5 col-xs-5" style="padding: 0px">Mọi người -> </h4>
     	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    		}else if(value > 0 && value < 0.5){
    %>
     <div class="col-md-5 col-xs-12" id="rating" style="margin-left: 5px;">
    	<h4 class="col-md-5 col-xs-5" style="padding: 0px">Mọi người -> </h4>
     	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" checked disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    		}else if(value >= 0.5 && value <= 1){
   	%>
   	<div class="col-md-5 col-xs-12" id="rating" style="margin-left: 5px;">
    	<h4 class="col-md-5 col-xs-5" style="padding: 0px">Mọi người -> </h4>
   		
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" checked disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
   	<%
    		}else if(value >= 1 && value <= 1.5){
    %>
    <div class="col-md-5 col-xs-12" id="rating" style="margin-left: 5px;">
    	<h4 class="col-md-5 col-xs-5" style="padding: 0px">Mọi người -> </h4>
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" checked disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 1.5 && value <= 2){
    %>
    <div class="col-md-5 col-xs-12" id="rating" style="margin-left: 5px;">
    	<h4 class="col-md-5 col-xs-5" style="padding: 0px">Mọi người -> </h4>
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" checked disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 2 && value <= 2.5){
    %>
    <div class="col-md-5 col-xs-12" id="rating" style="margin-left: 5px;">
    	<h4 class="col-md-5 col-xs-5" style="padding: 0px">Mọi người -> </h4>
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" checked disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 2.5 && value <= 3){
    %>
   <div class="col-md-5 col-xs-12" id="rating" style="margin-left: 5px;">
    	<h4 class="col-md-5 col-xs-5" style="padding: 0px">Mọi người -> </h4>
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" checked disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value > 3 && value <= 3.5){
    %>
    
    <div class="col-md-5 col-xs-12" id="rating" style="margin-left: 5px;">
    	<h4 class="col-md-5 col-xs-5" style="padding: 0px">Mọi người -> </h4>
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" checked disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio"  value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 3.5 && value <= 4.0){
    %>
    
    <div class="col-md-5 col-xs-12" id="rating" style="margin-left: 5px;">
    	<h4 class="col-md-5 col-xs-5" style="padding: 0px">Mọi người -> </h4>
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" checked disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}else if(value >= 4.0 && value <= 4.5){
	%>
    <div class="col-md-5 col-xs-12" id="rating" style="margin-left: 5px;">
    	<h4 class="col-md-5 col-xs-5" style="padding: 0px">Mọi người -> </h4>
    	
        <input type="radio" value="5" disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" checked disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
	<%
    	}else{
    %>
    <div class="col-md-5 col-xs-12" id="rating" style="margin-left: 5px;">
    	<h4 class="col-md-5 col-xs-5" style="padding: 0px">Mọi người -> </h4>
    	
        <input type="radio" value="5" checked disabled/>
        <label class = "full"  title="Awesome - 5 stars"></label>
        <input type="radio" value="4.5" disabled/>
        <label class="half" title="Pretty good - 4.5 stars"></label>
        <input type="radio" value="4" disabled/>
        <label class = "full"  title="Pretty good - 4 stars"></label>        
        <input type="radio" value="3.5" disabled/>
        <label class="half" title="Meh - 3.5 stars"></label>       
        <input type="radio" value="3" disabled/>
        <label class = "full"  title="Meh - 3 stars"></label>       
        <input type="radio" value="2.5" disabled/>
        <label class="half" title="Kinda bad - 2.5 stars"></label>     
        <input type="radio" value="2" disabled/>
        <label class = "full"  title="Kinda bad - 2 stars"></label>       
        <input type="radio" value="1.5" disabled/>
        <label class="half" title="Meh - 1.5 stars"></label>     
        <input type="radio" value="1" disabled/>
        <label class = "full"  title="Sucks big time - 1 star"></label>       
        <input type="radio" value="0.5" disabled/>
        <label class="half" title="Sucks big time - 0.5 stars"></label>
    </div><br />
    <%
    	}
    %>
    </div>
			</div>
        </div>
		<div class="container">
			<div class="row">
				<h3 class="col-md-12" style="border: 1px solid #283290;border-radius: 5px;color: #FFFFFF;background-color: #283290;padding: 10px 0px 10px 10px;">Thông tin sản phẩm</h3>
				<p><%=p.getProduct_description()%></p>
			</div>
		</div>
		
			<h4>Bạn đánh giá về sản phẩm này thế nào ?</h4>
		<div class="col-md-2 col-xs-12" id="rating">
		   <input type="radio" id="star5" name="rating" value="5,<%=p.getProduct_id()%>" onclick="star('5,<%=p.getProduct_id()%>')"/>
        <label class = "full" for="star5" title="Awesome - 5 stars"></label>
        
        <input type="radio" id="star4half" name="rating" value="4.5,<%=p.getProduct_id()%>" onclick="star('4.5,<%=p.getProduct_id()%>')"/>
        <label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
        
        <input type="radio" id="star4" name="rating" value="4,<%=p.getProduct_id()%>" onclick="star('4,<%=p.getProduct_id()%>')"/>
        <label class = "full" for="star4" title="Pretty good - 4 stars"></label>
        
        <input type="radio" id="star3half" name="rating" value="3.5,<%=p.getProduct_id()%>" onclick="star('3.5,<%=p.getProduct_id()%>')"/>
        <label class="half" for="star3half" title="Meh - 3.5 stars"></label>
        
        <input type="radio" id="star3" name="rating" value="3,<%=p.getProduct_id()%>" onclick="star('3,<%=p.getProduct_id()%>')"/>
        <label class = "full" for="star3" title="Meh - 3 stars"></label>
        
        <input type="radio" id="star2half" name="rating" value="2.5,<%=p.getProduct_id()%>" onclick="star('2.5,<%=p.getProduct_id()%>')"/>
        <label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
        
        <input type="radio" id="star2" name="rating" value="2,<%=p.getProduct_id()%>" onclick="star('2,<%=p.getProduct_id()%>')"/>
        <label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
        
        <input type="radio" id="star1half" name="rating" value="1.5,<%=p.getProduct_id()%>" onclick="star('1.5,<%=p.getProduct_id()%>')"/>
        <label class="half" for="star1half" title="Meh - 1.5 stars"></label>
        
        <input type="radio" id="star1" name="rating" value="1,<%=p.getProduct_id()%>" onclick="star('1,<%=p.getProduct_id()%>')"/>
        <label class = "full" for="star1" title="Sucks big time - 1 star"></label>
        
        <input type="radio" id="starhalf" name="rating" value="0.5,<%=p.getProduct_id()%>" onclick="star('0.5,<%=p.getProduct_id()%>')"/>
        <label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
	   </div>
      </div>
    </div>
  </div>
  <!-- 
  <p class="mb-1"><a onclick="javascript:window.open('https://twitter.com/intent/tweet?source=webclient&url=https://www.4cs-cure.co.jp/blog/bathtime-relaxinthebathtime/','_blank')" href="javascript:void(0)"><img src="https://www.4cs-cure.co.jp/blog/wp-content/themes/wp_cure/assets/2019/ic-twitter.png" alt="" class="img-fluid align-middle" /></a></p>
                <p class="mb-1"><a onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=https://www.4cs-cure.co.jp/blog/bathtime-relaxinthebathtime/','_blank')" href="javascript:void(0)"><img src="https://www.4cs-cure.co.jp/blog/wp-content/themes/wp_cure/assets/2019/ic-facebook.png" alt="" class="img-fluid align-middle" /></a></p>
                 -->
  <script type="text/javascript">
  
  <%
	StarDAO starDAO = new StarDAO();
	Star star = starDAO.selectTamCountFinal(1);
%>
var count = <%=star.getCount()%>;var average = 0;var value;var star_temporary = <%=star.getstar_temporary()%>
  function star(x){
  	value = $("input[value='"+x+"']").val();alert('Cảm ơn bạn đã đánh giá !');
  	count++;
  	$.ajax({
  		url : '<%=request.getContextPath()%>/ajaxstar',
  		type : 'post',
  		data :{count : count,value : value},
  		success : function(data) {
  			$('#review').html(data);
  		}
  	});
  };
  
$("#plus").click(function() {
	$('#q').text(parseInt($('#q').text())-1);
});
$("#minus").click(function() {
	$('#q').text(parseInt($('#q').text())+1);
});
<%} %>
</script>
<%@ include file="/templates/public/inc/footer.jsp" %>