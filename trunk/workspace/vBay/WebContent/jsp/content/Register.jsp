<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/CustomTagLibrary" prefix="tmk" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link href="<c:url value='/res/style/register.css'/>" rel="stylesheet" type="text/css" />
<script src="<c:url value='/res/script/register.js' />"></script>
<%-- <c:if test="${dkThanhCong eq true}">
	<table width="500px" border="1" cellspacing="0" cellpadding="5" align="center">
			<tr bgcolor="#666666">
				<td class="bgColorMain"><strong><font color="#FFFFFF">ĐĂNG KÝ THÀNH VIÊN</font></strong></td>
			</tr>
			<tr>
				<td align="center"> <a href="<c:url value='./dang-ky' />">Đăng ký thành công click để về trang chủ!</a></td>
			</tr>
	</table>
</c:if> --%>

<%-- <c:if test="${dkThanhCong eq false}"> --%>

<c:if test="${!empty actionFailure }">
  <jsp:include page="/jsp/component/CautionMessage.jsp">
    <jsp:param value="${actionFailure}" name="cautionMessage" />
  </jsp:include>
</c:if>

<table width="500px" border="1" cellspacing="0" cellpadding="5"
	align="center">
	<tr bgcolor="#666666">
		<td class="bgColorMain"><strong><font color="#FFFFFF">ĐĂNG KÝ THÀNH VIÊN</font>
		</strong>
		</td>
	</tr>
	<tr>
		<td valign="top">
			<form id="frmDangKy" name="frmDangKy" method="post" action="<c:url value='/general/register' />" 
				onsubmit="return checkValidationReg();">
				<table width="100%">
					<tr>
						<td colspan="2"><strong>Thông tin đăng nhập</strong>
						</td>
					</tr>
					<tr>
						<td><label for="tenDangNhap">Tên đăng nhập</label></td>
						<td><input type="text" name="tenDangNhap" style="width: 100%" value="${param.tenDangNhap }"
							onkeyup="checkValidationRegObj('tenDangNhap')" /></td>
					</tr>
					<tr>
						<td><label for="matKhau">Mật khẩu</label></td>
						<td><input type="password" name="matKhau" style="width: 100%"
							onkeyup="checkValidationRegObj('matKhau')" /></td>
					</tr>
					<tr>
						<td><label for="matKhau2">Nhập lại mật khẩu</label></td>
						<td><input type="password" name="matKhauXacNhan"
							style="width: 100%"
							onkeyup="checkValidationRegPassRetype('matKhauXacNhan', 'matKhau')" />
						</td>
					</tr>
					<tr>
						<td><label for="email">Email</label></td>
						<td><input type="text" name="email" style="width: 100%" value="${param.email }"
							onkeyup="checkValidationRegObj('email')" /></td>
					</tr>					
					<tr>
						<td colspan="2"><strong>Thông tin cá nhân</strong>
						</td>
					</tr>
					<tr>
						<td><label for="hoVaTen">Họ và tên</label></td>
						<td><input type="text" name="hoVaTen" style="width: 100%" value="${param.hoVaTen }"
							onkeyup="checkValidationRegObj('hoVaTen')" /></td>
					</tr>
					<tr>
						<td><label for="diaChi">Địa chỉ</label></td>
						<td><input type="text" name="diaChi" style="width: 100%" value="${param.diaChi }"
							onkeyup="checkValidationRegObj('diaChi')" /></td>
					</tr>
					<tr>
						<td><label for="dienThoai">Điện thoại</label></td>
						<td><input type="text" name="dienThoai" style="width: 100%" value="${param.dienThoai }"
							onkeyup="checkValidationRegObj('dienThoai')" /></td>
					</tr>
					<tr>
						<td><label for="ngaySinh">Ngày sinh</label></td>
						<td><input type="text" name="ngaySinh" style="width: 100%" value="${param.ngaySinh }"
							onkeyup="checkValidationRegObj('ngaySinh')" /></td>
					</tr>
					<tr>
						<td><label for="noiSinh">Nơi sinh</label></td>
						<td><input type="text" name="noiSinh" style="width: 100%" value="${param.noiSinh }"
							onkeyup="checkValidationRegObj('noiSinh')" /></td>
					</tr>										
					<tr>
						<td><label for="maTheTinDung">Mã thẻ tín dụng</label></td>
						<td><input type="text" name="maTheTinDung" style="width: 100%" value="${param.maTheTinDung }"
							onkeyup="checkValidationRegObj('maTheTinDung')" /></td>
					</tr>
					<tr>
						<td><label for="maLoaiGioiTinh">Giới tính</label></td>
						<td><select  id="maLoaiGioiTinh" style="width: 100%">  
							<c:forEach items='${danhSachLoaiGioiTinh}' var='item'>  
							   <option value="${item.maLoaiGioiTinh}"> <c:out value='${item.tenLoaiGioiTinh}'/></option>  
							</c:forEach>  
						</select></td>
						
<%-- 						<td><input type="text" name="maLoaiGioiTinh" style="width: 100%" value="${param.maLoaiGioiTinh }"
							onkeyup="checkValidationRegObj('maTheTinDung')" /></td>
 --%>					</tr>										
					<tr>
						<td><label for="reCAPTCHA" <c:if test="${kqCaptcha eq false}">style='color: red;'</c:if> >Nhập mã an ninh</label></td>
						<td>
						    <tmk:ReCaptchaTag privateKey="${privateKey }" publicKey="${publicKey }" />
						</td>
					</tr>
					<tr>
						<td></td>
						<td align="center"><input type="submit" name="dangKy"
							value="Đăng ký" /></td>
					</tr>
					<c:if test="${kqTrungTen }">
						<tr>
							<td colspan="2"><font color="#FF0000">Tên đăng nhập đã tồn tại. Vui lòng chọn tên đăng nhập khác</font></td>
						</tr>
					</c:if>
				</table>
			</form></td>
	</tr>
</table>
<%-- </c:if> --%>