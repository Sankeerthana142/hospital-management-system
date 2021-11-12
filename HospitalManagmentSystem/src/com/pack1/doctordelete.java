package com.pack1;
import java.io.IOException;


import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class doctordelete extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response, ServletRequest session) throws ServletException 
	{
String emaildoc=(String)session.getParameter("email");



Connection con=null;

String url="jdbc:mysql://localhost:3306/hospital";
try {
	con=DriverManager.getConnection(url,"root","");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Statement st=con.createStatement();
	String str="Delete * from doctor where email='"+emaildoc+"'";
	System.out.println(str);
	int result=st.executeUpdate(str);
	if(result>0)
	{   
		System.out.println("successfully deleted");
		RequestDispatcher rd=request.getRequestDispatcher("dview.jsp");
		rd.forward(request, response);
		}
	
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
finally
{
try {
	con.close();
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
}
	}
}


