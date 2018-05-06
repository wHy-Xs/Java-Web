<%@ page language="java" import="java.util.*" pageEncoding="utf-8"  contentType="text/html; charset=utf-8" %> 
<%@page import="util.*" %>
<%@page import="model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入EL函数库 --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:useBean id="stu" class="util.studentDao"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
	
	<table border=1>
	
<%
 List<Student> list=stu.queryAll();
 session.setAttribute("st",list);
%>

<c:forEach var="st1" items="${st}">
	<tr>
		<td>${st1.id}</td>
		<td>${st1.name}</td>
		<td>${st1.password}</td>
		<td><a href="update.jsp?id=${st1}">xiugai</a>&nbsp;<a href="delete.jsp?id=${st1}">gengxin</a></td>
	</tr>
</c:forEach>
</table>
	
	
</body>
</html>