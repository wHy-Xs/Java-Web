function check(){
	 var flag = true;  
                var admin = document.getElementById("admin").value;  
                var password = document.getElementById("pwd").value;  
                if ("" == admin){  
                    alert("请输入账号！");  
                    flag = false;  
                    return false;  
                }  
                else if ("" == password){  
                    alert("请输入密码！");  
                    flag = false;  
                    return false;  
                }  
                if(flag == true){  
                    //form.submit();  
                    return true;  
                }  
	
	
}

		 