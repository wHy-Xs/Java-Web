<%@ page language="java" import="java.util.*" pageEncoding="utf-8"  contentType="text/html; charset=utf-8" %> 
<%@page import="util.*" %>
<%@page import="model.*"%>
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
	
	<%
		String id=request.getParameter("id");
		studentDao sd=new studentDao();
		out.println(id);
		sd.del(Integer.parseInt(id));
		out.println("shanchu chenggong");
	%>
	 <jsp:forward page="right.jsp"></jsp:forward>  
	
	</form>
	
</body>
<html>