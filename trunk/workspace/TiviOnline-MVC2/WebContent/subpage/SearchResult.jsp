<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<form name="frmThongSoHienThi" method="get" action="">
    <table width="100%" cellpadding="5" cellspacing="0">
        <tr>
            <td align="left">Trang <c:forEach begin="1" end="${requestScope.soTrang}" varStatus="status">
                    <c:choose>
                        <c:when test="${requestScope.trangHienThi != status.index}">
                            <a href="${requestScope.url}&trangHienThi=${status.count}">${status.count}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${requestScope.url}&trangHienThi=${status.count}"><b>${status.count}</b> </a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </td>

            <td align="right" width="50%"><label for="soTiviTrenTrang">Số tivi trên trang </label> <select
                name="soTiviTrenTrang" style="width: 20%" onchange="submit()">
                    <c:choose>
                        <c:when test="${requestScope.soTiviTrenTrang == 5}">
                            <option value="5" selected="selected">5</option>
                        </c:when>
                        <c:otherwise>
                            <option value="5">5</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${requestScope.soTiviTrenTrang == 10}">
                            <option value="10" selected="selected">10</option>
                        </c:when>
                        <c:otherwise>
                            <option value="10">10</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${requestScope.soTiviTrenTrang == 20}">
                            <option value="20" selected="selected">20</option>
                        </c:when>
                        <c:otherwise>
                            <option value="20">20</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${requestScope.soTiviTrenTrang == 50}">
                            <option value="50" selected="selected">50</option>
                        </c:when>
                        <c:otherwise>
                            <option value="50">50</option>
                        </c:otherwise>
                    </c:choose>
                    <%--                     <c:choose> --%>
                    <%--                         <c:when test="${requestScope.soTiviTrenTrang == -1}"> --%>
                    <!--                             <option value="-1" selected="selected">Tất cả</option> -->
                    <%--                         </c:when> --%>
                    <%--                         <c:otherwise> --%>
                    <!--                             <option value="-1">Tất cả</option> -->
                    <%--                         </c:otherwise> --%>
                    <%--                     </c:choose> --%>
            </select></td>
        <tr>
            <td width="50%"></td>
            <td align="right"><label for="kieuHienThi">Kiểu hiển thị </label> <select name="kieuHienThi"
                style="width: 20%" onchange="submit()">
                    <c:choose>
                        <c:when test="${requestScope.kieuHienThi.equals('details')}">
                            <option value="detail" selected="selected">Chi tiết</option>
                        </c:when>
                        <c:otherwise>
                            <option value="detail">Chi tiết</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${requestScope.kieuHienThi.equals('brief')}">
                            <option value="brief" selected="selected">Ngắn gọn</option>
                        </c:when>
                        <c:otherwise>
                            <option value="brief">Ngắn gọn</option>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${requestScope.kieuHienThi.equals('list')}">
                            <option value="list" selected="selected">Danh sách</option>
                        </c:when>
                        <c:otherwise>
                            <option value="list">Danh sách</option>
                        </c:otherwise>
                    </c:choose>
            </select> <input type="hidden" name="maDanhMuc" value="<c:out value="${param.maDanhMuc}" default=""/>" /> <input
                type="hidden" name="tenTivi" value="<c:out value="${param.tenTivi}" default=""/>" /> <input
                type="hidden" name="trangHienThi" value="${requestScope.trangHienThi }" /> <input type="hidden"
                name="soTiviTrenTrangPrev" value="${requestScope.soTiviTrenTrang }" /> <input type="hidden"
                name="giaMin" value="${param.giaMin}" /> <input type="hidden" name="giaMax" value="${param.giaMax}" />
            </td>
        </tr>
    </table>
</form>
<hr />

<br />

<table width="100%" class="tiviinfo_table" cellspacing="0" cellpadding="5">
    <c:forEach var="tivi" items="${requestScope.dsTivi}" varStatus="status">
        <c:choose>
            <%------------- DETAIL VIEW ------------%>
            <c:when test="${requestScope.kieuHienThi.equals('detail')}">

                <tr>
                    <td rowspan="4" width="25%" height="150px" align="center" valign="middle"><img height="150px"
                        width="100%" src="${tivi.hinhAnh}" />
                    </td>
                    <td><strong>Giá:</strong> <fmt:formatNumber type="currency" currencyCode="VND"
                            value="${tivi.giaBan}" />
                    </td>
                </tr>
                <tr>
                    <td><strong>Kích thước: </strong>${tivi.kichThuoc}</td>
                </tr>
                <tr>
                    <td><strong>Danh mục:</strong> <a href="TrangTimKiemNhanh.do?maDanhMuc=${tivi.danhMuc.maDanhMuc}">
                            ${tivi.danhMuc.tenDanhMuc} </a></td>
                </tr>
                <tr>
                    <td><strong>Số lượng:</strong>${tivi.soLuongTon }</td>
                </tr>
                <tr>
                    <td align="center" valign="top"><font color="#FF0000">${tivi.tenTivi }</font></td>
                    <td><c:choose>
                            <c:when test="${requestScope.isAdmin.equals('true') }">
                                <input type="button" class="mybutton" value="Sửa sản phẩm" style="width: 20%"
                                    onclick="location.href='TrangSuaTivi.do?maTivi=${tivi.maTivi}'" />
                                <input type="button" class="mybutton" value="Xóa sản phẩm" style="width: 20%"
                                    onclick="if(confirm('Bạn có chắc muốn xóa ${tivi.maTivi} không?'))
                                            location.href='${requestScope.deleteLink}&maTivi=${tivi.maTivi}';" />
                            </c:when>
                            <c:otherwise>
                                <input type="button" class="mybutton" value="Đặt mua" style="width: 20%"
                                    onclick="location.href='${requestScope.url}&trangHienThi=${requestScope.trangHienThi}&action=datMua&maTivi=${tivi.maTivi}'" />
                            </c:otherwise>
                        </c:choose> <input type="button" class="mybutton" value="Xem chi tiết" style="width: 20%"
                        onclick="location.href='TrangChiTietTivi.do?maTivi=${tivi.maTivi}'" /></td>
                </tr>
            </c:when>

            <%------------- BRIEF VIEW ------------%>
            <c:when test="${requestScope.kieuHienThi.equals('brief') && status.index % 2 == 0}">
                <tr>
                    <td height="100px" width="50%" align="center" valign="middle"><img height="100px"
                        src="${tivi.hinhAnh}" /></td>
                    <c:if test="${status.index + 1 < requestScope.dsTivi.size() }">
                        <td height="100px" width="50%" align="center" valign="middle"><img height="100px"
                            src="${requestScope.dsTivi[status.index+1].hinhAnh }" /></td>
                    </c:if>
                </tr>
                <tr>
                    <td width="50%" align="center"><strong>Tên tivi:</strong>${tivi.tenTivi }</td>
                    <c:if test="${status.index + 1 < requestScope.dsTivi.size() }">
                        <td width="50%" align="center"><strong>Tên tivi:</strong>${requestScope.dsTivi[status.index+1].tenTivi}</td>
                    </c:if>
                </tr>
                <tr>
                    <td width="50%" align="center"><strong>Giá:</strong> <fmt:formatNumber type="currency"
                            currencyCode="VND" value="${tivi.giaBan}" />
                    </td>

                    <c:if test="${status.index + 1 < requestScope.dsTivi.size() }">
                        <td width="50%" align="center"><strong>Giá 2:</strong> <fmt:formatNumber type="currency"
                                currencyCode="VND" value="${requestScope.dsTivi[status.index+1].giaBan}" /></td>
                    </c:if>
                </tr>
                <tr>
                    <td width="50%" align="center"><c:choose>
                            <c:when test="${requestScope.isAdmin.equals('true') }">
                                <input type="button" class="mybutton" value="Sửa" style="width: 20%"
                                    onclick="location.href='TrangSuaTivi.do?maTivi=${tivi.maTivi}'" />
                                <input type="button" class="mybutton" value="Xóa" style="width: 20%"
                                    onclick="if(confirm('Bạn có chắc muốn xóa ${tivi.maTivi} không?'))
                                            location.href='${requestScope.deleteLink}&maTivi=${tivi.maTivi}';" />
                            </c:when>
                            <c:otherwise>
                                <input type="button" class="mybutton" value="Đặt mua" style="width: 30%"
                                    onclick="location.href='${requestScope.url}&trangHienThi=${requestScope.trangHienThi}&action=datMua&maTivi=${tivi.maTivi}'" />
                            </c:otherwise>
                        </c:choose> <input type="button" class="mybutton" value="Chi tiết" style="width: 30%"
                        onclick="location.href='TrangChiTietTivi.do?maTivi=${tivi.maTivi}'" /></td>

                    <c:if test="${status.index + 1 < requestScope.dsTivi.size() }">
                        <td width="50%" align="center"><c:choose>
                                <c:when test="${requestScope.isAdmin.equals('true') }">
                                    <input type="button" class="mybutton" value="Sửa" style="width: 20%"
                                        onclick="location.href='TrangSuaTivi.do?maTivi=${tivi.maTivi}'" />
                                    <input type="button" class="mybutton" value="Xóa" style="width: 20%"
                                        onclick="if(confirm('Bạn có chắc muốn xóa ${tivi.maTivi} không?'))
                                            location.href='${requestScope.deleteLink}&maTivi=${tivi.maTivi}';" />
                                </c:when>
                                <c:otherwise>
                                    <input type="button" class="mybutton" value="Đặt mua" style="width: 30%"
                                        onclick="location.href='${requestScope.url}&trangHienThi=${requestScope.trangHienThi}&action=datMua&maTivi=${tivi.maTivi}'" />
                                </c:otherwise>
                            </c:choose> <input type="button" class="mybutton" value="chi tiết" style="width: 30%"
                            onclick="location.href='TrangChiTietTivi.do?maTivi=${tivi.maTivi}'" /></td>
                    </c:if>
                </tr>
            </c:when>

            <%------------- LIST VIEW ------------%>
            <c:when test="${requestScope.kieuHienThi.equals('list')}">
                <tr>
                    <td width="40%"><a href="TrangChiTietTivi.do?maTivi=${tivi.maTivi }"><font color="#ff0000">${tivi.tenTivi
                                }</font> </a></td>
                    <td width="20%"><strong><fmt:formatNumber type="currency" currencyCode="VND"
                                value="${tivi.giaBan}" /> </strong></td>
                    <td width="40%" align="center">
                        <c:choose>
                            <c:when test="${requestScope.isAdmin.equals('true') }">
                                <input type="button" class="mybutton" value="Sửa" style="width: 20%"
                                    onclick="location.href='TrangSuaTivi.do?maTivi=${tivi.maTivi}'" />
                                <input type="button" class="mybutton" value="Xóa" style="width: 20%"
                                    onclick="if(confirm('Bạn có chắc muốn xóa ${tivi.maTivi} không?'))
                                            location.href='${requestScope.deleteLink}&maTivi=${tivi.maTivi}';" />
                            </c:when>
                            <c:otherwise>
                                <input type="button" class="mybutton" value="Đặt mua" style="width: 30%"
                                    onclick="location.href='${requestScope.url}&trangHienThi=${requestScope.trangHienThi}&action=datMua&maTivi=${tivi.maTivi}'" />
                            </c:otherwise>
                        </c:choose> <input type="button" class="mybutton" value="Chi tiết" style="width: 30%"
                        onclick="location.href='TrangChiTietTivi.do?maTivi=${tivi.maTivi}'" /></td>
                </tr>
            </c:when>
        </c:choose>
    </c:forEach>
</table>