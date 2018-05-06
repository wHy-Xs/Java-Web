package myFirstServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
import util.*;


public class FirstServlet extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 请求过程：
		 * 1.一个post请求发过来，进入doPost方法进行处理，首先我们要设置响应之后浏览器的数据显示编码
		 * 2.对登陆的用户名和密码进行校验，如果正确则登陆成功，如果错误的不能登陆
		 * 3.如果登陆成功，看是否需要保存cookie。
		 */
		response.setContentType("text/html;charset=GBK");
		PrintWriter out=response.getWriter();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String stayco=request.getParameter("stayCo");
		
	
		boolean isRight=isLogin(username,password);
		if(isRight){
			check(username,password,stayco,request,response);
			request.setAttribute("st","nihao");
			response.sendRedirect("jsp/main.html");
		}else{
			response.sendRedirect("/error.html");
		}
		
	}
	
	private boolean isLogin(String username,String password){
		boolean flag=false;
		if(username.equals("zfs")&&password.equals("123")){
			flag=true;
		}
		return flag;
		
	}
	
	private void check(String username,String password,String stayco,HttpServletRequest request, HttpServletResponse response){
		
		if(stayco!=null&&stayco.equals("on")){
			Cookie uname=new Cookie("username",username);
			Cookie pwd=new Cookie("password",password);
			uname.setMaxAge(1000);
			pwd.setMaxAge(1000);
			response.addCookie(uname);
			response.addCookie(pwd);
		}else{
			Cookie[]arr=request.getCookies();
			for(Cookie co:arr){
				if(co.getName().equals("username")||co.getName().equals("password")){
					co.setMaxAge(1000);
					response.addCookie(co);
				}
			}
		}
		
	}
	
}
