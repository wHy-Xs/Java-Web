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
       //1 从客户端接收id  
       int id=Integer.parseInt(request.getParameter("id"));  
         
       //2 利用StudentDao类queryStudentById方法得到Student对象  
        studentDao studentDao=new studentDao();  
        Student stu=studentDao.queryStudentById(id);  
   %>  
  <body>  
  
<form action=<%=basePath+"right"%> method="post">  
<table>  
<caption>修改学生信息</caption>  
<tr>  
<td>姓名<%=basePath %></td>  
<td><input type="text" name="id" value="<%=stu.getId()%>"/></td>  
</tr>  
<tr>  
<td>出生年月</td>  
<td><input type="text" name="username"  value="<%=stu.getName()%>"/></td>  
</tr>  
<tr>  
<td>出生年月</td>  
<td><input type="text" name="password"  value="<%=stu.getPassword()%>"/></td>  
</tr>  
<tr>  
<tr>  
</tr>  
<tr>  
<td colspan="2">  
<input type="submit" value="确定" />  
<input type="reset" value="取消"/>  
</td>  
  

</form>  

	
</body>
<html>