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
		 * ������̣�
		 * 1.һ��post���󷢹���������doPost�������д�����������Ҫ������Ӧ֮���������������ʾ����
		 * 2.�Ե�½���û������������У�飬�����ȷ���½�ɹ����������Ĳ��ܵ�½
		 * 3.�����½�ɹ������Ƿ���Ҫ����cookie��
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
