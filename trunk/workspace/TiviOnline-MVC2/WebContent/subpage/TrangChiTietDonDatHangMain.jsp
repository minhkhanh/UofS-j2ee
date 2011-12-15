<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="contentframe">
    <div class="captionbox">XEM THÔNG TIN ĐƠN ĐẶT HÀNG</div>
    <div class="content">
        <table class="info_table" cellpadding="5" cellspacing="0" width="100%">
            <tr>
                <td width="19%" align="right"><strong>Người đặt</strong>
                </td>
                <td width="81%">${requestScope.donDatHang.khachHang.tenDangNhap }</td>
            </tr>
            <tr>
                <td align="right"><strong>Ngày đặt</strong>
                </td>
                <td><fmt:formatDate value="${requestScope.donDatHang.ngayDatHang }" type="both" /></td>
            </tr>
            <tr>
                <td align="right"><strong>Tình trạng</strong>
                </td>
                <td>${requestScope.donDatHang.tinhTrang.tenTinhTrang }</td>
            </tr>
        </table>
    </div>
</div>
<div class="contentframe">
    <div class="captionbox">CHI TIẾT ĐƠN ĐẶT HÀNG</div>
    <div class="content">
        <table width="100%" border="1" cellspacing="0" cellpadding="5">
            <tr align="center" bgcolor="#999999">
                <td width="6%"><strong>STT</strong>
                </td>
                <td width="21%"><strong>HÌNH</strong>
                </td>
                <td width="28%"><strong>TÊN HÀNG</strong>
                </td>
                <td width="13%"><strong>S.LƯỢNG</strong>
                </td>
                <td width="16%"><strong>G.BÁN</strong>
                </td>
                <td width="16%"><strong>T.TIỀN</strong>
                </td>
            </tr>
            <c:forEach var="chiTietDonDatHang" items="${requestScope.dsChiTietDonDatHang }" varStatus="status">
                <tr>
                    <td width="6%">${status.count}</td>
                    <td align="center"><a
                        href="TrangChiTietTivi.do?maTivi=${chiTietDonDatHang.tivi.maTivi }"><img
                            width="100%" src="${chiTietDonDatHang.tivi.hinhAnh }" alt="Xem chi tiết"
                            border="0" /> </a>
                    </td>
                    <td align="center"><a
                        href="TrangChiTietTivi.do?maTivi=${chiTietDonDatHang.tivi.maTivi }">${chiTietDonDatHang.tivi.tenTivi
                            }</a></td>
                    <td width="13%">${chiTietDonDatHang.tivi.soLuongTon }</td>
                    <td width="16%"><fmt:formatNumber value="${chiTietDonDatHang.tivi.giaBan}"
                            type="currency" currencyCode="VND" /></td>
                    <td width="16%"><fmt:formatNumber
                            value="${chiTietDonDatHang.tivi.giaBan * chiTietDonDatHang.tivi.soLuongTon}"
                            type="currency" currencyCode="VND" />
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>