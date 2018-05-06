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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
		<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/demo/demo.css"/>
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
	
	<script type="text/javascript">
$(document).ready(function(){
	var height = $(window).height() - $(".alignleft").height() - $(".searchbar").height()  - 40;
	// alert($(window).height());
	// alert($(".alignleft").height());
	// alert($(".searchbar").height());
	// alert(height);
	$.ajaxSetup({
		//关闭AJAX相应的缓存
		cache:false
	});
    $("#datagrid").datagrid({
		method:"post",
		url:"<%=basePath%>login/getAllUser",
		title:"用户信息",
		iconCls:"icon-save",
		pagination:"true",
		pagePosition:"bottom",
		pageNumber:1,
		pageSize:10,
		pageList:[10,20],
		striped:"true",
		fitColumns:"true",
		nowrap:"true",
		singleSelect:"true",
		rownumbers:"true",
		border:"true",
		idField:"id",
		//height:490,
		height:height,
		//fit: true,
		nowrap: true,//数据长度超出列宽时将会自动截取。
		//height:height+"px",
		toolbar:[{
				text:'增加',
				iconCls:'icon-adda',
				handler:add
				}],
		columns:[ [
	
			{title:"用户名",field:"username",width:"35%",align:"center",},
			{title:"姓名",field:"truename",width:"35%",align:"center"},
			{title:"操作",field:" ",width:"23%",align:"center",
				formatter:function(value, rowData,
						rowIndex) {
					var strHtml = "";

					strHtml += "<a href='javascript:void(0)' onclick='showUser(\""+rowData.id+"\");' class='ahover hoversee' > 查看</a> ";
					strHtml += "<a href='javascript:void(0)' onclick='updateUser(\""+rowData.id+"\");' class='ahover hoveredit' >修改</a> ";
					strHtml += "<a href='javascript:void(0)' onclick='delUser(\""+rowData.id+"\",\""+rowData.username+"\");' class='ahover hoverdel' >删除</a> ";

					return strHtml;
				}

			} 			
		] ]
		
				
						
	});
    $(window).resize(function(){
		   	$('#datagrid').datagrid('resize', {
		         height:function(){return document.body.clientHeight;},
		   	});
    }); 
	function add(){
		window.location.href = 'login/toJsp?flag=role/addUser';
    }
	
});
	</script>
	
	
  </head>
  
<body>
	
		<table id="datagrid" class="tabledatagrid clearfixa"></table>



</body>
	
</html>
