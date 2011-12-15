<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="contentframe">
    <div class="captionbox">THÔNG TIN CHI TIẾT TIVI</div>
    <div class="content">
        <table class="tiviinfo_table" width="100%" cellpadding="5" cellspacing="0">
            <tr>
                <td rowspan="4" width="30%" height="90px" align="center" valign="middle"><img width="100%"
                    height="200%" src="${requestScope.tivi.hinhAnh }" /></td>
                <td width="35%" height="30px"><strong>Giá: </strong> <fmt:formatNumber type="currency"
                        currencyCode="VND" value="${requestScope.tivi.giaBan}" /></td>
                <td height="30px"><strong>Kích thước: </strong>${requestScope.tivi.kichThuoc }</td>
            </tr>
            <tr>
                <td width="35%" height="30px"><strong>Mô tả: </strong>${requestScope.tivi.moTa }</td>
                <td height="30px"><strong>Khuyến mãi: </strong>${requestScope.tivi.khuyenMai }</td>
            </tr>
            <tr>
                <td width="35%" height="30px"><strong>Danh mục: </strong> <a
                    href='TrangTimKiemNhanh.do?maDanhMuc=${requestScope.tivi.danhMuc.maDanhMuc }'>${requestScope.danhMuc.tenDanhMuc
                        }</a></td>
                <td height="30px"><strong>Xuất xứ: </strong>${requestScope.tivi.xuatXu}</td>
            </tr>
            <tr>
                <td width="35%" height="30px"><strong>Số lượng:</strong>${requestScope.tivi.soLuongTon}</td>
                <td height="30px"><strong>Ảnh khác: </strong>${requestScope.tivi.hinhAnh}</td>
            </tr>
            <tr>
                <td height="30px" align="center" valign="top"><font color="#FF0000">${requestScope.tivi.tenTivi}</font>
                </td>
                <td height="30px" colspan="2"><c:choose>
                        <c:when test="${requestScope.isAdmin.equals('true') }">
                            <a href="TrangSuaTivi.do?maTivi=${requestScope.tivi.maTivi}" class="mybutton">Sửa sản
                                phẩm </a>
                            <a class="mybutton"
                                onclick="if(confirm('Bạn có chắc muốn xóa ${tivi.maTivi} không?'))
                                            location.href='${requestScope.deleteLink}';">Xóa
                                sản phẩm </a>
                        </c:when>
                        <c:otherwise>
                            <a href="TrangChiTietTivi.do?maTivi=${requestScope.tivi.maTivi}&action=datMua"
                                class="mybutton">Đặt mua </a>
                        </c:otherwise>
                    </c:choose></td>
            </tr>
        </table>
    </div>
</div>