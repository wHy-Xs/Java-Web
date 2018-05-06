<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setCharacterEncoding("utf-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Login</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link type="text/css" rel="stylesheet" href="css/loginDiv_Css.css"/>
	<!--
	
	<script src="" type="text/javascript"></script>
	-->
  </head>
  
  <body>
	<div class="loginDiv">
		<form id="loginForm" method="post" action="main">
			<p><span style="display:inline-block;width:60px;text-align:right;">用户名</span><input type="text"  name="username"></p>
			<p><span style="display:inline-block;width:60px;text-align:right;">密&nbsp;&nbsp;&nbsp;码</span><input type="password" name="password"></p>
			<p><input type="submit" name="submit" value="登陆"><input type="checkbox" name="stayCo" ></p>
		</form>
	</div>
		
  </body>
</html>
