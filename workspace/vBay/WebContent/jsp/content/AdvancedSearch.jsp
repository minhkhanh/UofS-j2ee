<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="contentframe ui-widget-content ui-corner-all">
	<div class="captionbox ui-widget-header ui-corner-top">TÌM KIẾM
		NÂNG CAO</div>
	<div class="content">
		<form id="formChiTietSP" name="formChiTietSP" action="Search.vby"
			method="GET">
			</br>
			<table>
				<tr>
					<td><label for="khoaTimKiem">Khóa tìm kiếm: </label></td>
					<td><input type="text" name="khoaTimKiem"
						style="width: 240px;"></td>
				</tr>
				<tr>
					<td><label for="maLoaiSanPham">Danh mục sản phẩm:</label></td>
					<td><select name="maLoaiSanPham" style="width: 242px;">
							<option value="-1" selected="selected">Tất cả</option>
							<c:forEach var="loaiSP" items="${dsLoaiSP}">
								<option value="${loaiSP.maLoaiSanPham }">${loaiSP.tenLoaiSanPham}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>Ngày hết hạn:</td>
					<td><input type="text" name="thoiGian" style="width: 241px;"></td>
				</tr>
				<tr>
					<td>Mức đấu giá:</td>
				</tr>
				<tr>
					<td colspan="2">Từ <select name="giaNhoNhat"
						style="width: 90px;">
							<option value="0" selected="selected"></option>
							<option value="1">1tr</option>
							<c:forEach var="i" begin="1" end="4">
								<option value="${i*2}">${i*2}tr</option>
							</c:forEach>
					</select> VNĐ - Đến <select name="giaLonNhat" style="width: 95px;">
							<option value="0" selected="selected"></option>
							<c:forEach var="i" begin="1" end="5">
								<option value="${i*2}">${i*2}tr</option>
							</c:forEach>
					</select> VNĐ
					</td>
				</tr>
				</br>
				<tr>
					<td><input type="submit" name="submitTimNangCao"
						value="Tìm kiếm"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
