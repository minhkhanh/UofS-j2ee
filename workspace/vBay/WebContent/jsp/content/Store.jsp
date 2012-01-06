<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					<a href='./Detail.vby?id=${sanPham.maSanPham}'>${sanPham.tenSanPham} - ${sanPham.giaHienTai?sanPham.giaHienTai:sanPham.giaKhoiDiem}</a>
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
					<a href='./Detail.vby?id=${sanPham.maSanPham}'>${sanPham.tenSanPham} - ${sanPham.giaHienTai?sanPham.giaHienTai:sanPham.giaKhoiDiem}</a>
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
<%--   <table width="100%" class="product_table" cellspacing="0" cellpadding="5">
    <tr>
      <td width="20%"><strong>Hình ảnh</strong></td>
      <td width="28%"><strong>Mô tả</strong></td>
      <td width="19%"><strong>Giá</strong></td>
      <td width="9%"><strong>Số lượng</strong></td>
      <td width="7%"><strong>Bids</strong></td>
      <td width="17%"><strong>Thời điểm kết thúc</strong></td>
    </tr>
    <tr>
      <td width="20%"><a href="#"><img width="150px" height="150px"
          src="<c:url value='res/image/homer_wall_clock.jpg'/>"> </a></td>
      <td width="28%">Đồng hồ vui nhộn</td>
      <td width="19%"><strong>VNĐ 100.000</strong></td>
      <td width="9%"><strong>1</strong></td>
      <td width="7%"><strong>0</strong></td>
      <td width="17%"><strong>22/12/2012</strong></td>
    </tr>
    <tr>
      <td width="20%"><a href="#"><img width="150px" height="150px"
          src="<c:url value='res/image/digital-blot-clock.jpg' />"> </a></td>
      <td width="28%">Đồng hồ giấy điện tử</td>
      <td width="19%"><strong>VNĐ 100.000</strong></td>
      <td width="9%"><strong>1</strong></td>
      <td width="7%"><strong>0</strong></td>
      <td width="17%"><strong>22/12/2012</strong></td>
    </tr>
  </table> --%>
	<table class="product_table" width="100%" cellspacing="0" cellpadding="5">
		<tr>
			<th width="60%" colspan="2">Mô tả</th>
			<th width="13%">Giá</th>
			<th width="14%">Bids</th>
			<th width="13%">Kết thúc</th>
		</tr>
		<c:forEach var="sp" items="${dsSanPham}" varStatus="status">
			<tr>
				<td width="20%"><a href="#"><img width="75px"
						height="75px"
						src="<c:url value='${dsHinhAnh.get(count.index)}'/>"> </a></td>
				<c:choose>
					<c:when test="${status.first == true }">
						<td colspan="4">${sp.moTaSanPham}</td>
					</c:when>
					<c:otherwise>
						<td width="40%"><a href="#"><b>${sp.tenSanPham.toUpperCase()}</b></a></td>
						<td width="13%" align="center">${sp.giaKhoiDiem }</td>
						<td width="14%" align="center">${sp.giaHienTai}</td>
						<td width="13%">${sp.ngayHetHan}</td>
					</c:otherwise>
				</c:choose>
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