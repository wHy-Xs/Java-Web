<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.ceshi.model.User" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <%
User operator =(User)session.getAttribute("currentUser");
String name = "";
String id = "";
if(operator!=null){
	name = operator.getUserName();
	
}
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/demo/demo.css"/>
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
	
	<script type="text/javascript">
		function addTab(title, url){
		if ($('#tt').tabs('exists', title)){
			$('#tt').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="${pageContext.request.contextPath}/test1/'+url+'" style="width:100%;height:100%;"></iframe>';
		$('#tt').tabs('add',{
			title:title,
			content:content,
			closable:true
			});
		}
			}
			
		
		
	</script>
	
	
	
	
	
  </head>
  
  <body class="easyui-layout">
<div data-options="region:'north',title:'North Title',split:true" style="height:100px;">
	 <table width="100%">
        <tr>
            <td width="50%"></td>
            <td valign="bottom"
                style="font-size: 20px;color:#8B8B8B;font-family: '楷体';"
                align="right" width="50%"><font size="3">&nbsp;&nbsp;<strong>dd</strong>${currentUser.userName}</font>【管理员】
            </td>
        </tr>
    </table>
</div>
<div data-options="region:'center'">

<div id="tt" class="easyui-tabs" fit="true">
    <div title="首页" data-options="iconCls:'icon-home'">
            <div align="center" style="padding-top: 100px">
                <font color="grey" size="10">ssm demo</font>
            </div>
        </div>
        
         <div title="Tab3" data-options="iconCls:'icon-reload',closable:true" style="padding:20px;display:none;">
		tab3
    </div>
   
</div>

</div>       
<div data-options="region:'west',title:'导航菜单栏',split:true" style="width:200px;height:500px;">
		
	<div id="aa" class="easyui-accordion">
    <div title="Title1" data-options="iconCls:'icon-save'" style="overflow:auto;padding:10px;">
    <a 
    	id="add"
		href="javascript:addTab('tag1','test1.jsp')" 
		class="easyui-linkbutton" 
		data-options="iconCls:'icon-add'">easyui</a>
    </div>
    <div title="Title2" data-options="iconCls:'icon-reload'"  style="padding:10px;">
    		 <a 
		href="javascript:addTab('tag2','test2.jsp')" 
		class="easyui-linkbutton" 
		data-options="iconCls:'icon-search'">easyui</a>
    </div>
	<div title="Title3" data-options="iconCls:'icon-reload',selected:true" style="padding:10px;">
    		 <a 
				href="javascript:addTab('tag4','lai')" 
				class="easyui-linkbutton" 
				data-options="iconCls:'icon-search'"
				 >easyui</a>
    </div>
    </div>
    
    </div>

</html>
