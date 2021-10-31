<%@page import="daos.ProductDAO"%>
<%@page import="models.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/templates/admin/inc/header.jsp" %>
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Tổng quan</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Người dùng</div>
                                                <%
                                                	if(request.getAttribute("countUser") != null){
                                                		int countUser = (Integer)request.getAttribute("countUser");
                                                %>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><%=countUser%> người</div>
                                            <%} %>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-user fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Danh mục cha</div>
                                                 <%
                                                	if(request.getAttribute("countMenuParent") != null){
                                                		int countMenuParent = (Integer)request.getAttribute("countMenuParent");
                                                %>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><%=countMenuParent%> danh mục</div>
                                            <%} %>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-list-alt fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

						<div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Danh mục con</div>
                                                <%
                                                	if(request.getAttribute("countMenuChildren") != null){
                                                		int countMenuChildren = (Integer)request.getAttribute("countMenuChildren");
                                                %>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><%=countMenuChildren%> danh mục</div>
                                            <%} %>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-list-alt fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Sản phẩm
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                 <%
                                                	if(request.getAttribute("countProduct") != null){
                                                		int countProduct = (Integer)request.getAttribute("countProduct");
                                                %>
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><%=countProduct%> sản phẩm</div>
                                                    <%} %>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fa fa-tag fa-2x text-red-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>        
                    <!-- Content Row -->
                    <div class="row">
						<canvas id="myChart" style="width:100%;max-width:800px;"></canvas>
                    </div>
                    </div>
                            </div>
<script>
    var xValues = [
 <%
    	ArrayList<Product> listProduct = new ProductDAO().listAllProduct();
    	for(Product p : listProduct){
 %>	
'<%=p.getProduct_name()%>',    	
<%}%>];

new Chart("myChart", {
  type: "bar",
  data: {
    labels: xValues,
    datasets: [{
      label: 'Thống kê lượt truy cập vào các sản phẩm (theo lượt xem)',
      data: [
 <%
      	ArrayList<Product> listViews = new ProductDAO().listAllProduct();
      	for(Product l : listViews){
 %>	
  <%=l.getProduct_views()%>,
     <%}%>],
      borderColor: "red",
      fill: false
    }]
  },
  options: {
    legend: {display: true,}        
  }
});
</script>
  <%@ include file="/templates/admin/inc/footer.jsp" %>