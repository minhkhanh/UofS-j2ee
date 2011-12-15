<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="contentframe">
    <div class="captionbox">DANH SÁCH CÁC ĐƠN ĐẶT HÀNG</div>
    <div class="content">

        <table width="100%" border="1" cellspacing="0" cellpadding="5">
            <tr align="center" bgcolor="#999999">
                <td width="3%"><strong>STT</strong>
                </td>
                <td width="25%"><strong>NGÀY ĐẶT HÀNG</strong>
                </td>
                <td width="25%" align="center"><strong>TỔNG TIỀN (VNĐ)</strong></td>
                <td><strong>TÌNH TRẠNG</strong>
                </td>
                <td align="left"><strong>XEM CHI TIẾT</strong>
                </td>
            </tr>

            <c:forEach var="donDatHang" items="${requestScope.dsDonDatHang }" varStatus="status">
                <tr valign="top">
                    <td align="center">${status.count }</td>
                    <td width="25%" align="center"><fmt:formatDate value="${donDatHang.ngayDatHang }" type="both"/> </td>
                    <td width="15%" align="right"><fmt:formatNumber value="${requestScope.sumPriceArray[status.index]}" type="currency" currencyCode="VND"/> </td>
                    <td align="center">${donDatHang.tinhTrang.tenTinhTrang }</td>
                    <td><input type="button" class="mybutton" value="CHI TIẾT"
                        onclick="location.href='TrangChiTietDonDatHang.do?maDonDatHang=${donDatHang.maDonDatHang}'" />
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>