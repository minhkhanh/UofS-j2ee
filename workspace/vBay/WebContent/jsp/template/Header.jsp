<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="toplogo">
  <img src="<c:url value='/res/image/logo.png'/>" />
</div>
<div id="quicksearch">
  <div class="bl">
    <div class="br">
      <div class="tl">
        <div class="tr">
          <form method="get" action="Search.vby" name="formTimNhanh">
            <input type="text" name="khoaTimKiem" value="" style="width: 100%" />
            <select name="maLoaiSanPham" style="width: 75%">
              <option value="" selected="selected">Tất cả</option>
              <option value="mã danh mục thứ nhất">Antiques</option>
              <option value="mã danh mục thứ hai">Baby</option>
              <option value="mã danh mục thứ hai">Coins And Currency</option>
              <option value="mã danh mục thứ hai">DVD's And Movies</option>
              <option value="mã danh mục thứ hai">Electronics</option>
            </select>
            <input type="submit" value="Tìm kiếm" name="submitTimNhanh" style=" width : 102px;">
          </form>
          <a href="Search.vby?typeSearch=advancedSearch">Tìm kiếm nâng cao...</a>
        </div>
      </div>
    </div>
  </div>
</div>