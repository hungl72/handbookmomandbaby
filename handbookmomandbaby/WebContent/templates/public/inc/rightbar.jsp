				<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
				<div class="col-lg-3">
					<div class="sidebar">

						<!-- Search -->
						<div class="sidebar_search">
							<form action="#" id="sidebar_search_form" class="sidebar_search_form">
								<input type="text" class="search_input" placeholder="Tìm kiếm" required="required">
								<button class="search_button"><img src="<%=request.getContextPath()%>/templates/public/images/search.png" alt=""></button>
							</form>
						</div>

						<!-- Categories -->
                        <div class="col-xs-12">
							<h4 style="font-weight: bold;margin-top: 10px;">Đăng ký nhận bản tin mới nhất từ chúng tôi</h4>
							<form class="col-xs-12">
                                <input class="col-xs-12" type="text" name="" placeholder="Tên" required="required" style="background-color: pink;border-radius: 5px;border: 2px solid pink;margin-bottom: 5px;width: 100%;">
                                <input type="text" name="" placeholder="Số điện thoại" required="required" style="background-color: pink;border-radius: 5px;border: 2px solid pink;margin-bottom: 5px;width: 100%;">
                                <input type="text" name="" placeholder="Email" required="required" style="background-color: pink;border-radius: 5px;border: 2px solid pink;margin-bottom: 5px;width: 100%;">
                                <input type="date" name="" required="required" style="background-color: pink;border-radius: 5px;border: 2px solid pink;margin-bottom: 5px;width: 100%;">
								<button type="submit" style="border-radius: 5px;border: 2px solid pink;margin-bottom: 5px;width: 100%;">Đăng ký</button>
                            </form>
                        </div>
						</div>
						<!-- Working Hours -->
						<div class="box working_hours">
							<div class="box_icon d-flex flex-column align-items-start justify-content-center"><div style="width:29px; height:29px;"><img src="<%=request.getContextPath()%>/templates/public/images/alarm-clock.svg" alt=""></div></div>
							<div class="box_title">Lịch làm việc</div>
							<div class="working_hours_list">
								<ul>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<div>Thứ 2 – Thứ 6</div>
										<div class="ml-auto">8.00 – 19.00</div>
									</li>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<div>Thứ 7</div>
										<div class="ml-auto">9.30 – 17.00</div>
									</li>
									<li class="d-flex flex-row align-items-center justify-content-start">
										<div>Chủ nhật</div>
										<div class="ml-auto">9.30 – 15.00</div>
									</li>
								</ul>
							</div>
						</div>

					</div>