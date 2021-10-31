<%@page import="models.Account"%>
<%@page import="models.Message"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>			
    	<%
	Account acc = null;
    	try{
	if(session.getAttribute("account") != null){
		acc = (Account)session.getAttribute("account");
%>

<footer class="footer">
		<div class="footer_container">
			<div class="container">
				<div class="row">
					
					<!-- Footer - About -->
					<div class="col-lg-4 footer_col">
						<div class="footer_about">
							<div class="footer_logo_container">
								<a href="#" class="d-flex flex-column align-items-center justify-content-center">
									<div class="logo_content">
										<div class="logo d-flex flex-row align-items-center justify-content-center">
											<div class="logo_text">Hand<span>Book</span></div>
											<div class="logo_box">+</div>
										</div>
										<div class="logo_sub">Mẹ Và Bé</div>
									</div>
								</a>
							</div>
							<div class="footer_about_text">
								<p>TRUNG TÂM LIÊN HỆ</p>
							</div>
							<ul class="footer_about_list">
								<li><div class="footer_about_icon"><img src="<%=request.getContextPath()%>/templates/public/images/phone-call.svg" alt=""></div><span>+84 343404477</span></li>
								<li><div class="footer_about_icon"><img src="<%=request.getContextPath()%>/templates/public/images/envelope.svg" alt=""></div><span>camnangmevabe@gmail.com</span></li>
								<li><div class="footer_about_icon"><img src="<%=request.getContextPath()%>/templates/public/images/placeholder.svg" alt=""></div><span>Số 03 Quang Trung, Hải Châu, Đà Nẵng</span></li>
							</ul>
						</div>
					</div>

					<!-- Footer - Links -->
					<div class="col-lg-4 footer_col">
						<div class="footer_links footer_column">
							<div class="footer_title">Đường dẫn</div>
							<ul>
								<li><a href="<%=request.getContextPath()%>/index">Doanh nghiệp</a></li>
								<li><a href="<%=request.getContextPath()%>/faq">FAQ</a></li>
								<li><a href="<%=request.getContextPath()%>/contact">Liên hệ</a></li>
							</ul>
						</div>
					</div>

					<!-- Footer - News -->

				</div>
			</div>
		</div>
		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="copyright_content d-flex flex-lg-row flex-column align-items-lg-center justify-content-start">
							<div class="cr"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></div>
							<div class="footer_social ml-lg-auto">
								<ul>
									<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>			
		</div>
	</footer>
</div>

<script>
	$(document).on('click', '.panel-heading span.icon_minim', function (e) {
		var $this = $(this);
		if (!$this.hasClass('panel-collapsed')) {
			$this.parents('.panel').find('.panel-body').slideUp();
			$this.addClass('panel-collapsed');
			$this.removeClass('glyphicon-minus').addClass('glyphicon-plus');
		} else {
			$this.parents('.panel').find('.panel-body').slideDown();
			$this.removeClass('panel-collapsed');
			$this.removeClass('glyphicon-plus').addClass('glyphicon-minus');
		}
	});
	$(document).on('focus', '.panel-footer input.chat_input', function (e) {
		var $this = $(this);
		if ($('#minim_chat_window').hasClass('panel-collapsed')) {
			$this.parents('.panel').find('.panel-body').slideDown();
			$('#minim_chat_window').removeClass('panel-collapsed');
			$('#minim_chat_window').removeClass('glyphicon-plus').addClass('glyphicon-minus');
		}
	});
	$(document).on('click', '#new_chat', function (e) {
		var size = $( ".chat-window:last-child" ).css("margin-left");
		 size_total = parseInt(size) + 400;
		alert(size_total);
		var clone = $( "#chat_window_1" ).clone().appendTo( ".container" );
		clone.css("margin-left", size_total);
	});
	$(document).on('click', '.icon_close', function (e) {
		//$(this).parent().parent().parent().parent().remove();
		$( "#chat_window_1" ).remove();
	});

	$('.glyphicon-facetime-video').click(function(event) {
	
		  window.open($('#popup_video').attr("href"), "popupWindow", "width=800,height=800,scrollbars=yes");
		  return false;
	  });
	
	function change0()
	{
	   document.getElementById("tab-0").style.borderBottom = '2px solid #DC3545';
	   document.getElementById("tab-1").style.borderBottom = '';
	   document.getElementById("tab-2").style.borderBottom = '';
	   document.getElementById("tab-3").style.borderBottom = '';
	}
	function change1()
	{
	   document.getElementById("tab-1").style.borderBottom = '2px solid #DC3545';
	   document.getElementById("tab-0").style.borderBottom = '';
	   document.getElementById("tab-2").style.borderBottom = '';
	   document.getElementById("tab-3").style.borderBottom = '';
	}
	function change2()
	{
	   document.getElementById("tab-2").style.borderBottom = '2px solid #DC3545';
	   document.getElementById("tab-0").style.borderBottom = '';
	   document.getElementById("tab-1").style.borderBottom = '';
	   document.getElementById("tab-3").style.borderBottom = '';
	}
	function change3()
	{
	   document.getElementById("tab-3").style.borderBottom = '2px solid #DC3545';
	   document.getElementById("tab-0").style.borderBottom = '';
	   document.getElementById("tab-1").style.borderBottom = '';
	   document.getElementById("tab-2").style.borderBottom = '';
	}
	
    $(document).ready(function (){
        $('.btn-number1').click(function(event){
          event.preventDefault();
          var fieldName = $(this).attr('data-field1');
          var adults = $('#price').val();
          var promotion = $('#promotion').val();
          var type = $(this).attr('data-type');
          var input = $("input[name='"+fieldName+"']");
          var currentInput = parseInt(input.val());
          if(!isNaN(currentInput)){
            if(type == 'minus1'){
              var minVal = parseInt(input.attr('min1'));
              if(!minVal) minVal = 0;
              if(currentInput>minVal){input.val(currentInput-1).change();
                subAdults = ((currentInput-1)*parseFloat(adults)*(100-parseFloat(promotion))/100).toFixed(3);
                $('#total').val(subAdults);
                totalMonney = parseFloat($('.totalMonney').text(subAdults));}
              if(parseInt(input.val()) == minVal){$(this).attr('disabled',true);}
            }else if(type == 'plus1'){
              var maxVal = parseInt(input.attr('max1'));
              if(!maxVal) maxVal = 10;
              if(currentInput<maxVal){input.val(currentInput+1).change();
                sumAdults = ((currentInput+1)*parseFloat(adults)*(100-parseFloat(promotion))/100).toFixed(3);
                $('#total').val(sumAdults);
                totalMonney = parseFloat($('.totalMonney').text(sumAdults)).toFixed(3);}
              if(parseInt(input.val()) == maxVal){$(this).attr('disabled',true);}
            }	
          }else{input.val(0);}
        });
        $('.input-number-adults').focusin(function(){$(this).data('rootVal', $(this).val());});
        $('.input-number-adults').change(function(){
          var minValAdults = parseInt($(this).attr('minAdults'));
          var maxValAdults = parseInt($(this).attr('maxAdults'));
          if(!minValAdults){minValAdults==1}if(!maxValAdults){maxValAdults==1}
          var curVal = parseInt($(this).val());
          var nameVal = $(this).attr('name');
          if(curVal>=minValAdults){$(".btn-number1[data-type='minus1']").removeAttr('disabled');}
          else{alert('Không thể nhỏ hơn 0 !!!');$(this).val($(this).data('rootVal'));}
          if (curVal<=maxValAdults) {$(".btn-number1[data-type='plus1']").removeAttr('disabled');}
          else{alert('Tối đa chỉ được 10 !!!');$(this).val($(this).data('rootVal'));}
        });
      });

	</script>
<script src="<%=request.getContextPath()%>/templates/public/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/templates/public/styles/bootstrap4/popper.js"></script>
<script src="<%=request.getContextPath()%>/templates/public/styles/bootstrap4/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/templates/public/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="<%=request.getContextPath()%>/templates/public/plugins/easing/easing.js"></script>
<script src="<%=request.getContextPath()%>/templates/public/plugins/parallax-js-master/parallax.min.js"></script>
<script src="<%=request.getContextPath()%>/templates/public/js/custom.js"></script>
<script src="<%=request.getContextPath()%>/templates/public/js/news.js"></script>
</body>
</html>
<%
	}else{
%>
			<style>
				.chat_area{bottom:0; height:40px;     float: left !important;
				width: 100% !important;position:sticky;
				background: #fff !important;}
				
				.chat_box:focus,#btn-chat:focus{outline:none !important;}
				.base_sent{margin: 4px;}
				.base_receive{margin:4px;}
			</style>
			
			<div class="page">
				<div class="container">

				
			  
			</div>
			</div>
<footer class="footer">
		<div class="footer_container">
			<div class="container">
				<div class="row">
					
					<!-- Footer - About -->
					<div class="col-lg-4 footer_col">
						<div class="footer_about">
							<div class="footer_logo_container">
								<a href="#" class="d-flex flex-column align-items-center justify-content-center">
									<div class="logo_content">
										<div class="logo d-flex flex-row align-items-center justify-content-center">
											<div class="logo_text">Hand<span>Book</span></div>
											<div class="logo_box">+</div>
										</div>
										<div class="logo_sub">Mẹ Và Bé</div>
									</div>
								</a>
							</div>
							<div class="footer_about_text">
								<p>TRUNG TÂM LIÊN HỆ</p>
							</div>
							<ul class="footer_about_list">
								<li><div class="footer_about_icon"><img src="<%=request.getContextPath()%>/templates/public/images/phone-call.svg" alt=""></div><span>+84 343404477</span></li>
								<li><div class="footer_about_icon"><img src="<%=request.getContextPath()%>/templates/public/images/envelope.svg" alt=""></div><span>camnangmevabe@gmail.com</span></li>
								<li><div class="footer_about_icon"><img src="<%=request.getContextPath()%>/templates/public/images/placeholder.svg" alt=""></div><span>Số 03 Quang Trung, Hải Châu, Đà Nẵng</span></li>
							</ul>
						</div>
					</div>

					<!-- Footer - Links -->
					<div class="col-lg-4 footer_col">
						<div class="footer_links footer_column">
							<div class="footer_title">Đường dẫn</div>
							<ul>
								<li><a href="<%=request.getContextPath()%>/index">Doanh nghiệp</a></li>
								<li><a href="<%=request.getContextPath()%>/faq">FAQ</a></li>
								<li><a href="<%=request.getContextPath()%>/contact">Liên hệ</a></li>
							</ul>
						</div>
					</div>

					<!-- Footer - News -->

				</div>
			</div>
		</div>
		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="copyright_content d-flex flex-lg-row flex-column align-items-lg-center justify-content-start">
							<div class="cr"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></div>
							<div class="footer_social ml-lg-auto">
								<ul>
									<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>			
		</div>
	</footer>
</div>

<script>
	$(document).on('click', '.panel-heading span.icon_minim', function (e) {
		var $this = $(this);
		if (!$this.hasClass('panel-collapsed')) {
			$this.parents('.panel').find('.panel-body').slideUp();
			$this.addClass('panel-collapsed');
			$this.removeClass('glyphicon-minus').addClass('glyphicon-plus');
		} else {
			$this.parents('.panel').find('.panel-body').slideDown();
			$this.removeClass('panel-collapsed');
			$this.removeClass('glyphicon-plus').addClass('glyphicon-minus');
		}
	});
	$(document).on('focus', '.panel-footer input.chat_input', function (e) {
		var $this = $(this);
		if ($('#minim_chat_window').hasClass('panel-collapsed')) {
			$this.parents('.panel').find('.panel-body').slideDown();
			$('#minim_chat_window').removeClass('panel-collapsed');
			$('#minim_chat_window').removeClass('glyphicon-plus').addClass('glyphicon-minus');
		}
	});
	$(document).on('click', '#new_chat', function (e) {
		var size = $( ".chat-window:last-child" ).css("margin-left");
		 size_total = parseInt(size) + 400;
		alert(size_total);
		var clone = $( "#chat_window_1" ).clone().appendTo( ".container" );
		clone.css("margin-left", size_total);
	});
	$(document).on('click', '.icon_close', function (e) {
		//$(this).parent().parent().parent().parent().remove();
		$( "#chat_window_1" ).remove();
	});

	$('.glyphicon-facetime-video').click(function(event) {
	
		  window.open($('#popup_video').attr("href"), "popupWindow", "width=800,height=800,scrollbars=yes");
		  return false;
	  });
	
	function change0()
	{
	   document.getElementById("tab-0").style.borderBottom = '2px solid #DC3545';
	   document.getElementById("tab-1").style.borderBottom = '';
	   document.getElementById("tab-2").style.borderBottom = '';
	   document.getElementById("tab-3").style.borderBottom = '';
	}
	function change1()
	{
	   document.getElementById("tab-1").style.borderBottom = '2px solid #DC3545';
	   document.getElementById("tab-0").style.borderBottom = '';
	   document.getElementById("tab-2").style.borderBottom = '';
	   document.getElementById("tab-3").style.borderBottom = '';
	}
	function change2()
	{
	   document.getElementById("tab-2").style.borderBottom = '2px solid #DC3545';
	   document.getElementById("tab-0").style.borderBottom = '';
	   document.getElementById("tab-1").style.borderBottom = '';
	   document.getElementById("tab-3").style.borderBottom = '';
	}
	function change3()
	{
	   document.getElementById("tab-3").style.borderBottom = '2px solid #DC3545';
	   document.getElementById("tab-0").style.borderBottom = '';
	   document.getElementById("tab-1").style.borderBottom = '';
	   document.getElementById("tab-2").style.borderBottom = '';
	}
	
    $(document).ready(function (){
        $('.btn-number1').click(function(event){
          event.preventDefault();
          var fieldName = $(this).attr('data-field1');
          var adults = $('#price').val();
          var promotion = $('#promotion').val();
          var type = $(this).attr('data-type');
          var input = $("input[name='"+fieldName+"']");
          var currentInput = parseInt(input.val());
          if(!isNaN(currentInput)){
            if(type == 'minus1'){
              var minVal = parseInt(input.attr('min1'));
              if(!minVal) minVal = 0;
              if(currentInput>minVal){input.val(currentInput-1).change();
                subAdults = ((currentInput-1)*parseFloat(adults)*(100-parseFloat(promotion))/100).toFixed(3);
                $('#total').val(subAdults);
                totalMonney = parseFloat($('.totalMonney').text(subAdults));}
              if(parseInt(input.val()) == minVal){$(this).attr('disabled',true);}
            }else if(type == 'plus1'){
              var maxVal = parseInt(input.attr('max1'));
              if(!maxVal) maxVal = 10;
              if(currentInput<maxVal){input.val(currentInput+1).change();
                sumAdults = ((currentInput+1)*parseFloat(adults)*(100-parseFloat(promotion))/100).toFixed(3);
                $('#total').val(sumAdults);
                totalMonney = parseFloat($('.totalMonney').text(sumAdults)).toFixed(3);}
              if(parseInt(input.val()) == maxVal){$(this).attr('disabled',true);}
            }	
          }else{input.val(0);}
        });
        $('.input-number-adults').focusin(function(){$(this).data('rootVal', $(this).val());});
        $('.input-number-adults').change(function(){
          var minValAdults = parseInt($(this).attr('minAdults'));
          var maxValAdults = parseInt($(this).attr('maxAdults'));
          if(!minValAdults){minValAdults==1}if(!maxValAdults){maxValAdults==1}
          var curVal = parseInt($(this).val());
          var nameVal = $(this).attr('name');
          if(curVal>=minValAdults){$(".btn-number1[data-type='minus1']").removeAttr('disabled');}
          else{alert('Không thể nhỏ hơn 0 !!!');$(this).val($(this).data('rootVal'));}
          if (curVal<=maxValAdults) {$(".btn-number1[data-type='plus1']").removeAttr('disabled');}
          else{alert('Tối đa chỉ được 10 !!!');$(this).val($(this).data('rootVal'));}
        });
      });

	</script>
	
<script src="<%=request.getContextPath()%>/templates/public/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/templates/public/styles/bootstrap4/popper.js"></script>
<script src="<%=request.getContextPath()%>/templates/public/styles/bootstrap4/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/templates/public/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="<%=request.getContextPath()%>/templates/public/plugins/easing/easing.js"></script>
<script src="<%=request.getContextPath()%>/templates/public/plugins/parallax-js-master/parallax.min.js"></script>
<script src="<%=request.getContextPath()%>/templates/public/js/custom.js"></script>
<script src="<%=request.getContextPath()%>/templates/public/js/news.js"></script>
</body>
</html>
<%
}
    	}catch(Exception e){}
%>    	