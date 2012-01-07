<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="contentframe ui-widget-content ui-corner-all">
	<div class="captionbox ui-widget-header ui-corner-top">${tenLoaiSanPham.toUpperCase() }</div>
	<div class="content">
		<form name="formThongSoHienThi" method="get" action="#">
			<table width="100%" cellpadding="5" cellspacing="0">
				<tr>
					<td align="left">Trang <c:forEach var="i" begin="1"	end="${soTrang}">
							<a
								href="ShowProducts.vby?maLoaiSanPham=${param.maLoaiSanPham}&tenLoaiSanPham=${param.tenLoaiSanPham}&trangHienThi=${i}&soLuongSPTrenTrang=${param.soLuongSPTrenTrang}">
								<c:choose>
									<c:when test="${trangHienThi == i}">
										<b>${i}</b>
									</c:when>
									<c:otherwise>${i}</c:otherwise>
								</c:choose>
							</a>
						</c:forEach>
					</td>
					<td align="right" width="50%"><label for="soLuongSPTrenTrang">Số sản phẩm trên trang </label> <select name="soLuongSPTrenTrang"
						style="height: 25px; width: 53px;" onchange="submit()">														
							<c:forEach var="i" begin="1" end="3">
								<c:choose>									
									<c:when test="${i*10 == param.soLuongSPTrenTrang}">
										<option value="${i*10}" selected="selected">${i*10}</option>
									</c:when>
									<c:otherwise>
										<option value="${i*10}">${i*10}</option>																			
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td><input type="hidden" name="maLoaiSanPham"
						value="${param.maLoaiSanPham}" /> <input type="hidden"
						name="tenLoaiSanPham" value="${param.tenLoaiSanPham}" /> <input
						type="hidden" name="trangHienThi" value="${param.trangHienThi}" /> 
						
				</tr>
			</table>
		</form>
		<div class="linelist_top"></div>
		<table width="100%" class="autionlist" cellspacing="0" cellpadding="5">
			<tr style="text-align: center;color: yellow;">
				<th width="60%" colspan="2">Mô tả</th>
				<th width="13%">Giá</th>
				<th width="14%">Bids</th>
				<th width="13%">Kết thúc</th>
			</tr>
			<c:forEach var="sp" items="${dsSanPhamTheoDanhMuc}" varStatus="status">
				<tr>
					<td width="20%"><a href="#"><img width="75px"
							height="75px"
							src="<c:url value='${dsHinhAnh.get(status.index)}'/>"> </a></td>
							<td width="40%"><a href="#"><b>${sp.tenSanPham.toUpperCase()}</b></a></td>
							<td width="13%" style="text-align: center;">${sp.giaKhoiDiem }</td>
							<td width="14%" style="text-align: center;">${sp.giaHienTai}</td>
							<td width="13%">${sp.ngayHetHan}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>