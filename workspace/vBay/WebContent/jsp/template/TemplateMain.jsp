<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<t:useAttribute name="title" classname="String" id="tilesTitle" />
<title>${tilesTitle}</title>
<link href="<c:url value='/res/style/main.css'></c:url>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/res/style/sidewrap.css'></c:url>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/res/style/mainwrap.css'></c:url>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/res/style/header.css'></c:url>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/res/style/userpanel.css'></c:url>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/res/style/mainmenu.css'></c:url>" rel="stylesheet" type="text/css" />
</head>
<body>

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
        <div id="sidecontent">
          <t:insertAttribute name="sidebar" />
        </div>
        <br />
      </div>

      <div id="mainwrap">
        <div id="maincontent">
          <t:insertAttribute name="content" />
        </div>
      </div>

      <br class="clearfloat" />
    </div>

    <t:insertAttribute name="footer" />

  </div>

</body>
</html>