<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${sessionScope.khachHang != null}">
    <div class="contentframe">
        <div class="captionbox">THÔNG TIN NGƯỜI ĐẶT HÀNG</div>
        <div class="content">
            <table class="info_table" width="100%" cellpadding="5" cellspacing="0">
                <tr>
                    <td align="right" width="17%"><strong>Họ và tên:</strong></td>
                    <td width="83%">${sessionScope.khachHang.tenDangNhap}</td>
                </tr>
                <tr>
                    <td align="right"><strong>Địa chỉ:</strong></td>
                    <td>${sessionScope.khachHang.diaChi}</td>
                </tr>
                <tr>
                    <td align="right"><strong>Email:</strong></td>
                    <td>${sessionScope.khachHang.email}</td>
                </tr>
                <tr>
                    <td align="right"><strong>Điện thoại:</strong></td>
                    <td>${sessionScope.khachHang.dienThoai}</td>
                </tr>
            </table>
        </div>
    </div>

    <div class="contentframe">
        <div class="captionbox">THÔNG TIN NGƯỜI ĐẶT HÀNG</div>
        <div class="content">
            <table class="info_table" width="100%" cellpadding="5" cellspacing="0">
                <tr>
                    <td align="right" width="17%"><strong>Họ và tên:</strong></td>
                    <td width="83%">${sessionScope.khachHang.tenDangNhap}</td>
                </tr>
                <tr>
                    <td align="right"><strong>Địa chỉ:</strong></td>
                    <td>${sessionScope.khachHang.diaChi}</td>
                </tr>
                <tr>
                    <td align="right"><strong>Email:</strong></td>
                    <td>${sessionScope.khachHang.email}</td>
                </tr>
                <tr>
                    <td align="right"><strong>Điện thoại:</strong></td>
                    <td>${sessionScope.khachHang.dienThoai}</td>
                </tr>
            </table>
        </div>
    </div>
</c:if>

<div class="contentframe">
    <div class="captionbox">THÔNG TIN GIỎ HÀNG</div>
    <div class="content">
        <table width="100%" border="1" cellspacing="0" cellpadding="5">
            <tr align="center" bgcolor="#999999">
                <td width="6%"><strong>STT</strong>
                </td>
                <td width="17%"><strong>HÌNH</strong>
                </td>
                <td width="22%"><strong>TÊN HÀNG</strong>
                </td>
                <td width="15%"><strong>S.LƯỢNG</strong>
                </td>
                <td width="15%"><strong>G.BÁN</strong>
                </td>
                <td width="15%"><strong>T.TIỀN</strong>
                </td>
                <td width="10%"><strong>XÓA</strong>
                </td>
            </tr>

            <c:forEach var="tivi" items="${sessionScope.gioHang}" varStatus="status">

                <tr valign="top">
                    <td align="center">${status.count}</td>
                    <td align="center"><a href="TrangChiTietTivi.do?maTivi=${tivi.maTivi }"><img width="100%"
                            src="${tivi.hinhAnh }" alt="Ảnh sản phẩm" border="0" /> </a>
                    </td>
                    <td><a href="TrangChiTietTivi.do?maTivi=${tivi.maTivi }">${tivi.tenTivi }</a>
                    </td>
                    <td><label for="soLuong"></label> <input name="soLuong" disabled="disabled" type="text"
                        value="${tivi.soLuongTon }" size="17" />
                    </td>
                    <td align="right"><fmt:formatNumber type="number" currencyCode="VND" value="${tivi.giaBan}" />
                    </td>
                    <td align="right">${tivi.soLuongTon }</td>
                    <td align="center"><a href='TrangGioHang.do?action=xoaDong&dongCanXoa=${status.index }'> <img
                            src="images/button/delete-button.png" width="20" height="20" /> </a>
                    </td>
                </tr>
                <tr valign="top">
                    <td width="75%" colspan="5" align="right">Cước vận chuyển</td>
                    <td colspan="2" align="center">0</td>
                </tr>
                <tr valign="top">
                    <td width="75%" colspan="5" align="right">Thuế</td>
                    <td colspan="2" align="center">0</td>
                </tr>
                <tr valign="top">
                    <td width="75%" colspan="5" align="right">Tổng tiền</td>
                    <td colspan="2" align="center"><strong><fmt:formatNumber type="number"
                                groupingUsed="true" value="${tivi.giaBan * tivi.soLuongTon }" />
                    </strong></td>
                </tr>
            </c:forEach>

            <tr>
                <td width="75%" colspan="5" align="right"><strong>TỔNG CỘNG:</strong></td>
                <td colspan="2" align="center"><strong><font color="#FF0000">
                <fmt:formatNumber type="number" groupingUsed="true" value="${requestScope.sumPrice}" /> </font>
                </strong></td>
            </tr>
        </table>
        <br />
        <table width="100%">
            <tr align="center">
                <td width="33%"><input type="button" style="width: 50%" class="mybutton" value="TIẾP TỤC MUA"
                    onclick="location.href='TrangTimKiemNhanh.do?tenTivi=&maDanhMuc='" />
                </td>
                <td width="33%"><input type="button" style="width: 50%" class="mybutton" value="CẬP NHẬT"
                    onclick="location.href='#'" /></td>
                <td width="33%"><input type="button" style="width: 50%" class="mybutton" value="THANH TOÁN"
                    onclick="location.href='TrangGioHang.do?action=thanhToan'" /></td>
            </tr>
        </table>
    </div>
</div>