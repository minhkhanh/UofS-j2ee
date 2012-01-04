<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
//     request.setCharacterEncoding("UTF-8");
// 	  response.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<t:useAttribute name="title" classname="String" id="tilesTitle" />
<title>${tilesTitle}</title>
<link href="<c:url value='/res/style/main.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/res/style/sidewrap.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/res/style/mainwrap.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/res/style/header.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/res/style/userpanel.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/res/style/mainmenu.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/res/style/timepicker.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/res/jquery-ui/trontastic/jquery-ui-1.8.16.custom.css'/>" rel="stylesheet"
  type="text/css" />
<script src="<c:url value='/res/script/jquery-1.6.2.js' />"></script>

<script src="<c:url value='/res/jquery-ui/trontastic/jquery-ui-1.8.16.custom.min.js' />"></script>
<script src="<c:url value='/res/script/jquery-ui-timepicker-addon.js' />"></script>

<link href="<c:url value='/res/ajaxupload/fileuploader.css'/>" rel="stylesheet" type="text/css" />
<script src="<c:url value='/res/script/main.js' />" type="text/javascript"></script>
<script src="<c:url value='/res/script/jquery.form-2.77.js' />" type="text/javascript"></script>
<script>
	$(function() {
		$("input:submit, button").button();
	});
</script>
</head>
<body>
  <c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="request"></c:set>
  <input type="hidden" value="${pageContext.servletContext.contextPath }" id="contextPath">
  <div id="container">

    <div id="userpanel">
      <t:insertAttribute name="userpanel" />
    </div>
    <div id="header">
      <t:insertAttribute name="header" />
    </div>
    <div id="mainmenu">
      <t:insertAttribute name="mainmenu" />
    </div>

    <div id="bodywrap">
      <div class="clearfloat"></div>

      <div id="contentwrap">
        <t:insertAttribute name="contentwrap" />
      </div>

      <div id="sidewrap">
        <div id="sidecontent" class="ui-widget">
          <t:insertAttribute name="sidebar" />
        </div>
        <br />
      </div>

      <div id="mainwrap">
        <div id="maincontent" class="ui-widget">
          <t:insertAttribute name="content" />
        </div>
      </div>

      <br class="clearfloat" />
    </div>

    <t:insertAttribute name="footer" />

  </div>

</body>
</html>