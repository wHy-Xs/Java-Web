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
	function openUserAddDialog() {
            $("#dlg").dialog("open").dialog("setTitle", "添加用户信息");
            url = "${pageContext.request.contextPath}/test1/save";
        }
    
   function saveUser() {
            $("#fm").form("submit", {
                url: url,
                onSubmit: function () {
                alert("onsubmit");
                    return $(this).form("validate");
                },
                success: function (result) {
                    $.messager.alert("系统提示", "保存成功");
                  resetValue();
                    $("#dlg").dialog("close");
                    $("#dg").datagrid("reload");
              //    location.replace('${pageContext.request.contextPath}/test1/list');
                }
            });
        }
        
       function deleteUser() {
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length == 0) {
                $.messager.alert("系统提示", "请选择要删除的数据！");
                return;
            }
            var strIds = [];
            for (var i = 0; i < selectedRows.length; i++) {
                strIds.push(selectedRows[i].id);
            }
            var ids = strIds.join(",");
            $.messager.confirm("系统提示", "您确认要删除这<font color=red>"
                    + selectedRows.length + "</font>条数据吗？", function (r) {
                if (r) {
                    $.post("${pageContext.request.contextPath}/test1/delete", {
                        ids: ids
                    }, function (result) {
                        if (result.success) {
                            $.messager.alert("系统提示", "数据已成功删除！");
                            $("#dg").datagrid("reload");
                        } else {
                            $.messager.alert("系统提示", "数据删除失败！");
                        }
                    }, "json");
                }
            });
        }
        
        
         function openUserModifyDialog() {
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length != 1) {
                $.messager.alert("系统提示", "请选择一条要编辑的数据！");
                return;
            }
            var row = selectedRows[0];
            alert(row.id);
            $("#dlg").dialog("open").dialog("setTitle", "编辑用户信息");
           
            $('#fm').form('load', row);
            alert("ddddddddddfsfsdfsfsdfs");
            $("#password").val("******");
            url = "${pageContext.request.contextPath}/test1/save?id=" + row.id;
           
        }
        function resetValue() {
            $("#userName").val("");
            $("#password").val("");
        }
        function closeUserDialog() {
            $("#dlg").dialog("close");
            resetValue();
        }
    
    
    
    
   
    
    
    
    
    
    
    
	</script>
  </head>
  
<body>
	<table id="dg" title="用户管理" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true"
        url="${pageContext.request.contextPath}/test1/list"
       fit="true"
       toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="id" width="50" align="center">编号</th>
        <th field="userName" width="100" align="center">用户名</th>
    </tr>
    </thead>
</table>
<div id="tb">
    <div>
        <a href="javascript:openUserAddDialog()" class="easyui-linkbutton"
           iconCls="icon-add" plain="true">添加</a> <a
            href="javascript:openUserModifyDialog()" class="easyui-linkbutton"
            iconCls="icon-edit" plain="true">修改</a> <a
            href="javascript:deleteUser()" class="easyui-linkbutton"
            iconCls="icon-remove" plain="true">删除</a>
    </div>
    <div>
        &nbsp;用户名：&nbsp;<input type="text" id="s_userName" size="20"
                               onkeydown="if(event.keyCode==13) searchUser()"/> <a
            href="javascript:searchUser()" class="easyui-linkbutton"
            iconCls="icon-search" plain="true">搜索</a>
    </div>
</div>
<div id="dlg" class="easyui-dialog"
     style="width: 620px;height:250px;padding: 10px 20px" closed="true"
     buttons="#dlg-buttons">
    <form id="fm" method="post" >
        <table cellspacing="8px">
            <tr>
                <td>用户名：</td>
                <td><input type="text" id="userName" name="userName"
                           class="easyui-validatebox" required="true"/>&nbsp;<font
                        color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="text" id="passWord" name="passWord"
                           class="easyui-validatebox" required="true"/>&nbsp;<font
                        color="red">*</font>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:saveUser()" class="easyui-linkbutton"
       iconCls="icon-ok">保存</a> <a href="javascript:closeUserDialog()"
                                   class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>

</body>
	
</html>
