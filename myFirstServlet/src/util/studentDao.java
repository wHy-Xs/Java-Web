package util;

import java.sql.SQLException;  
import java.util.*;

import model.Student;
  
public class studentDao extends BaseDao {  
public int add(Student stu)  
{  
    int result=0;  
    con=getConn();  
    String sql="insert into user(id,name,password) values(?,?,?)";  
    try {  
        pst=con.prepareStatement(sql);  
    pst.setInt(1,stu.getId());  
    pst.setString(2,stu.getName());  
    pst.setString(3, stu.getPassword());  
    result=pst.executeUpdate();  
  
    } catch (SQLException e) {  
        // TODO Auto-generated catch block  
        e.printStackTrace();  
    }  
    finally{  
        closeAll();  
    }  
      
    return result;  
}  
public int del(int id)  
{  
    int result=0;  
    con=getConn();  
    String sql="delete from user where id=?";  
    try {  
        pst=con.prepareStatement(sql);  
        pst.setInt(1, id);  
    result=pst.executeUpdate();  
  
    } catch (SQLException e) {  
        // TODO Auto-generated catch block  
        e.printStackTrace();  
    }  
    finally{  
        closeAll();  
    }  
    return result;  
}  
public int update(Student stu)  
{  
    int result=0;  
    con=getConn();  
    String sql="update user set name='"+stu.getName()+"',password='"+stu.getPassword()+"' where id="+stu.getId();  
    System.out.println(stu.getId());  
    try {  
        pst=con.prepareStatement(sql);  
    result=pst.executeUpdate(sql);  
  
    } catch (SQLException e) {  
        // TODO Auto-generated catch block  
        e.printStackTrace();  
    }  
    finally  
    {  
        closeAll();  
    }  
    return result;  
}  
public List<Student> queryAll()  
{  
    List<Student> list=new ArrayList<Student>();  
    con=getConn();  
    String sql="select * from user";  
    try {  
    pst=con.prepareStatement(sql);  
    rs=pst.executeQuery();  
    while(rs.next())  
    {  
        Student stu= new Student();  
        stu.setId(rs.getInt(1));  
        stu.setName(rs.getString(2));  
        stu.setPassword(rs.getString(3));  
     
        list.add(stu);  
    }  
  
    } catch (SQLException e) {  
        // TODO Auto-generated catch block  
        e.printStackTrace();  
    }  
    finally  
    {  
        closeAll();  
    }  
    return list;  
}  
public Student queryStudentById(int id){  
    Student stu=new Student();  
    con=getConn();  
    String sql="select * from user where id="+id;  
    try {  
        pst=con.prepareStatement(sql);  
    rs=pst.executeQuery(sql);  
    if(rs.next())  
    {  
        stu.setId(rs.getInt(1));  
        stu.setName(rs.getString(2));  
        stu.setPassword(rs.getString(3));  
     
    }  
  
    } catch (SQLException e) {  
        // TODO Auto-generated catch block  
        e.printStackTrace();  
    }  
    return stu;  
}  


}  