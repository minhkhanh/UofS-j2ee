<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/CustomTagLibrary" prefix="tmk" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<c:if test="${!empty actionFailure }">
  <jsp:include page="/jsp/component/CautionMessage.jsp">
    <jsp:param value="${actionFailure}" name="cautionMessage" />
  </jsp:include>
</c:if>
