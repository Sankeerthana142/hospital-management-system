package com.pack1;
import java.io.IOException;


import java.sql.*;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		System.out.println("stage");
	String user=request.getParameter("user");
	System.out.println(user);
	String pass=request.getParameter("password");
	System.out.println(pass);
	Connection con=null;
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "");
		Statement st=con.createStatement();
		
		String str="Select * from login where user='"+user+"' and password='"+pass+"'";
		System.out.println(str);
		ResultSet rs=st.executeQuery(str);
		if(rs.next())
		{   
			String str1=rs.getString("module");
			
			if(str1.equalsIgnoreCase("admin"))
			{
			System.out.print("successfully login");
			RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
			HttpSession session=request.getSession();
			session.setAttribute("email",user);
			rd.forward(request,response);
			}
			if(str1.equalsIgnoreCase("doctor"))
			{
			System.out.print("successfully login");
			RequestDispatcher rd=request.getRequestDispatcher("doctor.jsp");
			HttpSession session=request.getSession();
			session.setAttribute("email",user);
			rd.forward(request,response);
			}
			if(str1.equalsIgnoreCase("receptionist"))
			{
			System.out.print("successfully login");
			RequestDispatcher rd=request.getRequestDispatcher("receptionist.jsp");
			HttpSession session=request.getSession();
			session.setAttribute("email",user);
			rd.forward(request,response);
			}
			if(str1.equalsIgnoreCase("patient"))
			{
			System.out.print("successfully login");
			RequestDispatcher rd=request.getRequestDispatcher("patient.jsp");
			HttpSession session=request.getSession();
			session.setAttribute("email",user);
			rd.forward(request,response);
			}
		}
		else
		{
			
			System.out.print("not successfully login");
			HttpSession session=request.getSession();
			session.setAttribute("email1","invalid");
		
			RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
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

