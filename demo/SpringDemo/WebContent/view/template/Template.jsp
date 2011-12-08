<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />

<tiles:useAttribute name="title" classname="String" id="tilesTitle" />
<title>${tilesTitle}</title>
<link href="<c:url value="/res/style/main.css"></c:url>" rel='stylesheet' type='text/css' />
<link href="<c:url value="/res/style/sidewrap.css"></c:url>" rel='stylesheet' type='text/css' />
<link href="<c:url value="/res/style/mainwrap.css"></c:url>" rel='stylesheet' type='text/css' />
<link href="<c:url value="/res/style/header.css"></c:url>" rel='stylesheet' type='text/css' />
<link href="<c:url value="/res/style/userpanel.css"></c:url>" rel='stylesheet' type='text/css' />

</head>

<body>
    <div id="container">

        <tiles:insertAttribute name="userpanel" />

        <tiles:insertAttribute name="header" />

        <div id="wrap">
            <div class="clearfloat"></div>
            <tiles:insertAttribute name="sidebar" />
            <div id="mainwrap">
                <div id="maincontent">

                    <tiles:insertAttribute name="main" />

                </div>
            </div>
            <br class="clearfloat" />
        </div>

        <tiles:insertAttribute name="footer" />

    </div>

</body>
</html>