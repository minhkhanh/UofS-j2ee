<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="toplogo">
  <img src="<c:url value='/res/image/logo02.png'/>" />
</div>
<div id="quicksearch">
  <div class="bl">
    <div class="br">
      <div class="tl">
        <div class="tr">
          <form method="get" action="Search.vby" name="formTimNhanh">
            <input type="text" name="khoaTimKiem" value="" style="width: 100%" />
            <select name="maLoaiSanPham" style="width: 75%">
            <option value="-1" selected="selected">Tất cả</option>
            <c:forEach var="loaiSanPham" items="${dsLoaiSanPham}">
            	<option value="${loaiSanPham.maLoaiSanPham }">${loaiSanPham.tenLoaiSanPham }</option>
            </c:forEach>
            </select>
            <input type="submit" value="Tìm kiếm" name="submitTimNhanh" style=" width : 102px;">
          </form>
          <a href="Search.vby?typeSearch=advancedSearch">Tìm kiếm nâng cao...</a>
        </div>
      </div>
    </div>
  </div>
</div>