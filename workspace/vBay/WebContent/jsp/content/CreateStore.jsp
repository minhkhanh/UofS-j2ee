<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="contentframe ui-widget-content ui-corner-all">
  <div class="captionbox ui-widget-header ui-corner-top">TẠO CỦA HÀNG</div>
  <div class="content">
    <c:if test="${!empty actionFailure }">
      <jsp:include page="/jsp/component/CautionMessage.jsp">
        <jsp:param value="${actionFailure}" name="cautionMessage" />
      </jsp:include>
    </c:if>  
    <form action="<c:url value='./Store/createStore' />" method="post">
    	<input type="submit" name="submitCreateStore" value="Tạo cửa hàng" />      
    </form>
  </div>
</div>