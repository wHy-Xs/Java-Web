<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入EL函数库 --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<jsp:useBean id="stu" class="model.Student"/>
  </head>
  
  <body>
 	<c:set var="nidaye" value="sldjfls"/></br>

 <c:remove var="nidaye"/>
 <c:out value="${nidaye }"/>

 
 <c:set  target="${stu }" property="id" value="123"/>
   <c:set target="${stu}" property="name">孤傲苍狼</c:set>
   <c:set target="${stu}" property="password" value="123"/>
   <c:out value="${stu.name}"/>
   <c:out value="${stu.password }"/>
   <c:out value="${stu.id }"/>
   
    <%
    Map map=new HashMap();
    request.setAttribute("map2", map);     %>
     <c:set var="nimenhao" target="${map2}" property="nihao" value="abd"/>
     <c:out value="${map2.nihao}"/>
     <c:remove var="map2"/>
  </body>
</html>
