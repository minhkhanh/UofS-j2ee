<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="contentframe">
  <div class="captionbox">XIN CHÀO</div>
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