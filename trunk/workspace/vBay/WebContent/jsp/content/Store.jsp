<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="quickview">
  <div id="ending">
    <div class="contentframe ui-widget-content ui-corner-all">
      <div class="captionbox ui-widget-header ui-corner-top">Các phiên đấu giá sắp kết thúc</div>
      <div class="content">
        <ul class="vertlist">    
			<c:if test="${empty dsSanPhamSapKetThuc }">
				<li>Chưa đăng sản phẩm nào.</li>
			</c:if>        
			<c:forEach var="sanPham" items="${dsSanPhamSapKetThuc}">
				<li>
					<a href='./Detail.vby?id=${sanPham.maSanPham}'>${sanPham.tenSanPham} - ${empty sanPham.giaHienTai?sanPham.giaKhoiDiem:sanPham.giaHienTai}</a>
				</li> 
			</c:forEach>   
        </ul>
      </div>
    </div>
  </div>
  <div id="arival">
    <div class="contentframe ui-widget-content ui-corner-all">
      <div class="captionbox ui-widget-header ui-corner-top">Các sản phẩm mới đăng</div>
      <div class="content">
        <ul class="vertlist">
			<c:if test="${empty dsSanPhamMoiDang }">
				<li>Chưa đăng sản phẩm nào.</li>
			</c:if>        
			<c:forEach var="sanPham" items="${dsSanPhamMoiDang}">
				<li>
					<a href='./Product.vby?maSanPham=${sanPham.maSanPham}'>${sanPham.tenSanPham} - ${empty sanPham.giaHienTai?sanPham.giaKhoiDiem:sanPham.giaHienTai}</a>
				</li> 
			</c:forEach>            
        </ul>
      </div>
    </div>
  </div>
</div>
<hr class="clearfloat" />
<div id="itemlist">
  <form name="formThongSoHienThi" method="get" action="">
  	<input type="hidden" name="id" value="${id }"/>
    <table width="100%" cellpadding="5" cellspacing="0">
					<tr>
						<td align="left">Trang <c:forEach var="i" begin="1"
								end="${soTrang}">
								<a
									href="Store.vby?id=${param.id}&trangHienThi=${i}&soSPTrenTrang=${soSPTrenTrang}">
									<c:choose>
										<c:when test="${trangHienThi == i}">
											<b>${i}</b>
										</c:when>
										<c:otherwise>${i}</c:otherwise>
									</c:choose>
								</a>
							</c:forEach>
						</td>
						<td align="right" width="50%"><label for="soSPTrenTrang">Số
								sản phẩm trên trang </label> <select name="soSPTrenTrang"
							style="height: 25px; width: 53px;" onchange="submit()">
								<!-- <option value="-1" selected="selected">Tất cả</option> -->
								<c:forEach var="i" begin="1" end="3">
									<c:choose>
										<c:when test="${i*10 == soSPTrenTrang}">
											<option value="${i*10}" selected="selected">${i*10}</option>
										</c:when>
										<c:otherwise>
											<option value="${i*10}">${i*10}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
						</select></td>
					</tr>      
    </table>
  </form>
  <br />
	<table class="product_table" width="100%" cellspacing="0" cellpadding="5">
		<tr>
			<th width="20%">Hình</th>
			<th width="40%">Mô tả</th>
			<th width="20%">Tiên sản phẩm</th>
			<th width="13%">Giá</th>
			<th >Bids</th>
			<th width="13%">Kết thúc</th>
		</tr>
		<c:forEach var="sp" items="${dsSanPham}" varStatus="status">
			<tr>
				<td><a href="./Product.vby?maSanPham=${sp.maSanPham }"><img width="75px"
						height="75px"
						src="<c:url value='${dsHinhAnh.get(count.index)}'/>"> </a></td>
				<td>${sp.moTaSanPham}</td>
				<td><a href="#"><b>${sp.tenSanPham.toUpperCase()}</b></a></td>
				<td align="center">${sp.giaKhoiDiem }</td>
				<td align="center">${sp.giaHienTai}</td>
				<td>${sp.ngayHetHan}</td>
			</tr>
		</c:forEach>
	</table>  
  <br />
 <form name="formThongSoHienThi" method="get" action="">
  	<input type="hidden" name="id" value="${id }"/>
    <table width="100%" cellpadding="5" cellspacing="0">
					<tr>
						<td align="left">Trang <c:forEach var="i" begin="1"
								end="${soTrang}">
								<a
									href="Store.vby?id=${param.id}&trangHienThi=${i}&soSPTrenTrang=${soSPTrenTrang}">
									<c:choose>
										<c:when test="${trangHienThi == i}">
											<b>${i}</b>
										</c:when>
										<c:otherwise>${i}</c:otherwise>
									</c:choose>
								</a>
							</c:forEach>
						</td>
						<td align="right" width="50%"><label for="soSPTrenTrang">Số
								sản phẩm trên trang </label> <select name="soSPTrenTrang"
							style="height: 25px; width: 53px;" onchange="submit()">
								<!-- <option value="-1" selected="selected">Tất cả</option> -->
								<c:forEach var="i" begin="1" end="3">
									<c:choose>
										<c:when test="${i*10 == soSPTrenTrang}">
											<option value="${i*10}" selected="selected">${i*10}</option>
										</c:when>
										<c:otherwise>
											<option value="${i*10}">${i*10}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
						</select></td>
					</tr>      
    </table>
  </form>
</div>