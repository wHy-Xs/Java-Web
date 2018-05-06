<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/demo/demo.css"/>
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="jquery-3.1.1/jquery-3.1.1.js"></script>
	
	<script type="text/javascript">
		function checkLogin(){
			if($("#userName").val()==""){
				alert("用户名不能为空！");
				reutrn;
			}
			
			if($("#passWord").val()==""){
				alert("密码不能为空！");
				return;
			}
			
			$.ajax({
				data:{userName:$("#userName").val(),passWord:$("#passWord").val()},
				type:'post',
				dataType:'json',
				url:"<%=basePath%>test1/toLogin",
				error:function(data){
					alert("登陆错误!")
				},
				success:function(data){
					if(data.result=="success"){
						window.location.href="<%=basePath%>test1/login";
					}else{
						alert("用户名和密码错误！")
					}
				}
			});
		}
		
	</script>
  </head>
  
  <body>
  	 <div id="login" class="easyui-window" style="padding-top: 5px;padding-left: 15px" >  
        <form id="loginForm">  
        <table>  
        <tr>  
            <td>  
                <table>  
                <tr><td>用户名</td><td><input  class="easyui-validatebox"   id="userName" name="userName"  type="text"  placeholder="用户名"/></td><td></td></tr>  
                <tr><td>密 码</td><td><input  class="easyui-validatebox"  id="passWord" name="passWord" type="password" placeholder="密码"></td><td></td></tr>  
                <tr><td>角 色</td><td><select name="roleName" id="roleName"> 
                				<option value="1">普通用户</option>
                				<option value="2">管理员</option>
                				</select> </td></tr>  
                
                </table>  
            </td>  
            <td>
            	<input type="button" id="submit" name="submit" onclick="checkLogin()"/>
            </td>
            </tr>  
        </table>  
        </form>  
    </div>  
	
  </body>
</html>
