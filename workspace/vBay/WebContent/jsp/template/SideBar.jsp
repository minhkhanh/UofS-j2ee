<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="contentframe ui-widget-content ui-corner-all">
  <div class="captionbox ui-widget-header ui-corner-top">DANH MỤC CHÍNH</div>
  <div class="content">
    <ul class="vertlist">
      <c:forEach var="loaiSanPham" items="${ dsLoaiSanPham}">
        <li><a href="#"><strong>${loaiSanPham.tenLoaiSanPham }</strong></a></li>
      </c:forEach>
    </ul>
  </div>
</div>