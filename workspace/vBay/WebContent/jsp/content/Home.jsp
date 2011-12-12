<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="contentframe ui-widget-content ui-corner-all">
  <div class="captionbox ui-widget-header ui-corner-top">XIN CHÀO</div>
  <div class="content">
    Các bạn đang ở trang web Đấu Giá Online.
    <br />
    <c:if test="${!empty nameAttr }">
    <h2>name = ${nameAttr }</h2>
    </c:if>
    <c:if test="${empty nameAttr }">
    <h2>Không có param name trong url</h2>
    </c:if>
  </div>
</div>