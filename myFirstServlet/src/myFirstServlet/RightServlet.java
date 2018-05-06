package myFirstServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Student;
import util.studentDao;

public class RightServlet extends HttpServlet {

	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		
		System.out.println("djsfkl;dsfkhjlk;");
		String id=req.getParameter("id");
		String username=req.getParameter("username");
		String pwd=req.getParameter("password");
		
		System.out.println(id);
		System.out.println(username);
		
		Student student=new Student();
		student.setId(Integer.parseInt(id));
		student.setName(username);
		student.setPassword(pwd);
		studentDao stu=new studentDao();
		stu.update(student);
		
		List<Student> list=stu.queryAll();
		req.setAttribute("st",list);
		
		resp.sendRedirect("jsp/right.jsp");
		
	}
	
}
