package util;
import java.sql.*;  
public class BaseDao {  
	 
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	public Connection getConn(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			String url="jdbc:mysql://localhost:3306/nihao?useUnicode=true&characterEncoding=utf-8";  
			con=DriverManager.getConnection(url,"root","root");
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return con;
	}
	
	public void closeAll(){
		try {
			if(rs!=null)
				rs.close();
			if(pst!=null)
				pst.close();
			if(con!=null)
				con.close();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	}  

