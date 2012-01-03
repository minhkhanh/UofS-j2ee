<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="contentframe ui-widget-content ui-corner-all">
	<div class="captionbox ui-widget-header ui-corner-top">KẾT QUẢ
		TÌM KIẾM</div>
		<c:choose>
			<c:when test="${soSPTimNhanh == 0 }">
				<tr>
				 <td>Không tìm thấy kết quả tương ứng.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<!-- THÔNG TIN VỀ SỐ LƯỢNG SẢN PHẨM TÌM KIẾM ĐƯỢC -->
	<div class="content">
		<form name="formThongSoHienThi" method="get" action="#">
			<table width="100%" cellpadding="5" cellspacing="0">
				<tr>
					<td align="left">Có ${soSPTimNhanh} kết quả tìm kiếm</td>
				</tr>
					<tr>
						<td align="left">Trang <c:forEach var="i" begin="1"
								end="${soTrang}">
								<a
									href="Search.vby?khoaTimKiem=${param.khoaTimKiem}&maLoaiSanPham=${param.maLoaiSanPham}&giaNhoNhat=${param.giaNhoNhat}&giaLonNhat=${param.giaLonNhat}&thoiGian=${param.thoiGian}&trangHienThi=${i}&soSPTrenTrang=${soSPTrenTrang}&kieuHienThi=${kieuHienThi}">
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
								<option value="-1" selected="selected">Tất cả</option>
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
					<tr>
						<td><input type="hidden" name="maLoaiSanPham"
							value="${param.maLoaiSanPham}" /> <input type="hidden"
							name="khoaTimKiem" value="${param.khoaTimKiem}" /> <input
							type="hidden" name="trangHienThi" value="${trangHienThi}" /> <input
							type="hidden" name="giaNhoNhat" value="${param.giaNhoNhat}" /> <input
							type="hidden" name="giaLonNhat" value="${param.giaLonNhat}" /> <input
							type="hidden" name="thoiGian" value="${param.thoiGian }" /></td>
					</tr>
			</table>
		</form>
		
		<!-- THÔNG TIN SƠ LƯỢC TỪNG SẢN PHẨM -->

		<div class="linelist_top"></div>
		<table width="100%" class="autionlist" cellspacing="0" cellpadding="5">
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
		<div class="linelist_top"></div>				
	</div>
			</c:otherwise>
		</c:choose>
</div>
</div>