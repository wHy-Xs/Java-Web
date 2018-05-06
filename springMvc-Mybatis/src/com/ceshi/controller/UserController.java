package com.ceshi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ceshi.model.PageBean;
import com.ceshi.model.User;
import com.ceshi.service.UserService;
import com.ceshi.util.StringUtil;

@Controller
@RequestMapping("/test1")
public class UserController {
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/toLogin")
	public void toLogin(User user,HttpServletResponse response,HttpServletRequest request){
		System.out.println("toloign");
		

		System.out.println("===========================");
		
		String result="{\"result\":\"error\"}";
		
		System.out.println(user.getUserName());
		System.out.println(user.getPassWord());		
		
			
		User currentUser=userService.login(user.getUserName(),user.getPassWord());
		System.out.println(currentUser.getUserName());
		if(currentUser!=null){
			result="{\"result\":\"success\"}";
			HttpSession session=request.getSession();
			session.setAttribute("currentUser",currentUser);
			request.setAttribute("ceshi",currentUser);
			
		}
		
		response.setContentType("application/json");
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request){
		System.out.println("login");
		//通过requestMapping进行重定向,request中的参数为null
		
		return "main";
	}
	
	
	@RequestMapping("/list")
	 public String list(@RequestParam(value = "page", required = false) String page, @RequestParam(value = "rows", required = false)String rows, User s_user, HttpServletResponse response) throws Exception {
      
		System.out.println("list---------------------------");
		System.out.println(page);
		PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
     
       Map<String, Object> map = new HashMap<String, Object>();
       
       map.put("userName", StringUtil.formatLike(s_user.getUserName()));
       map.put("start", pageBean.getStart());
       map.put("size", pageBean.getPageSize());
       
       List<User> userList = userService.findUsers(map);
       System.out.println(userList.get(0).getUserName());
       Long total = userService.getTotalUser(map);
       System.out.println(total);
       JSONObject result = new JSONObject();
       System.out.println(result);
       JSONArray jsonArray = JSONArray.fromObject(userList);
       System.out.println(jsonArray);
       result.put("rows", jsonArray);
       result.put("total", total);
     
       response.setContentType("text/html;charset=utf-8");
       response.addHeader("Access-Control-Allow-Origin", "*");
       PrintWriter out = response.getWriter();
       out.println(result.toString());
       out.flush();
       out.close();
    
       return null;
   }

	
	 @RequestMapping("/modifyPassword")
	    public String modifyPassword(User user, HttpServletResponse response) throws Exception {
	       
	        user.setPassWord(user.getPassWord());
	        
	        int resultTotal = userService.update(user);
	        JSONObject result = new JSONObject();
	        if (resultTotal > 0) {
	            result.put("success", true);
	        } else {
	            result.put("success", false);
	        }
	  
	        response.setContentType("text/html;charset=utf-8");
	        response.addHeader("Access-Control-Allow-Origin", "*");
	        PrintWriter out = response.getWriter();
	        out.println(result.toString());
	        out.flush();
	        out.close();
	        return null;
	}
	
	@RequestMapping("/lai")
	public String test(){
		System.out.println("test");
		return "test3";
	}
	
	
	
	
	 @RequestMapping("/save")
	    public String save(User user, HttpServletResponse response,HttpServletRequest request) throws Exception {
	        
		 System.out.println("save--------------------");
		 int resultTotal = 0;
	      String id1=request.getParameter("id");
	      System.out.println(id1);
	    //    user.setPassWord(user.getPassWord());
	     //   user.setUserName(user.getUserName());
	     System.out.println(user.getId());
	        
	        if (user.getId() == null) {
	        	System.out.println("add---------------------");
	            resultTotal = userService.addUser(user);
	            System.out.println(resultTotal);
	            System.out.println("ppppppppppppppppppppppppppppppp");
	        } else {
	        	System.out.println("update---------------------");
	            resultTotal = userService.updateUser(user);
	            System.out.println("0000000000000000000000000000000000000");
	        }
	        JSONObject result = new JSONObject();
	        if (resultTotal > 0) {
	            result.put("success", true);
	        } else {
	            result.put("success", false);
	        }
	      
	        response.setContentType("text/html;charset=utf-8");
	        response.addHeader("Access-Control-Allow-Origin", "*");
	        PrintWriter out = response.getWriter();
	        out.println(result.toString());
	        out.flush();
	        out.close();
	        return null;
	}
	
	
	 @RequestMapping("/delete")
	    public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
	        JSONObject result = new JSONObject();
	        String[] idsStr = ids.split(",");
	        for (int i = 0; i < idsStr.length; i++) {
	            userService.deleteUser(Integer.parseInt(idsStr[i]));
	        }
	        result.put("success", true);
	        
	        response.setContentType("text/html;charset=utf-8");
	        response.addHeader("Access-Control-Allow-Origin", "*");
	        PrintWriter out = response.getWriter();
	        out.println(result.toString());
	        out.flush();
	        out.close();
	        return null;
	}
	
	 
	
	
	
	
}
