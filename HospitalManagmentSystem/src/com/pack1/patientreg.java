package com.pack1;
import java.sql.*;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class patientreg extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException 
	{
String name=request.getParameter("name");
String dob=request.getParameter("dob");
String sex=request.getParameter("sex");
String address=request.getParameter("address");
String contact=request.getParameter("contact");
String email=request.getParameter("email");
String password=request.getParameter("password");
String remarks=request.getParameter("remarks");
System.out.println(password);


Connection con=null;

String url="jdbc:mysql://localhost:3306/hospital";
try {
	con=DriverManager.getConnection(url,"root","");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Statement st=con.createStatement();
	String str="INSERT INTO patient(name,dob,sex,address,contact,email,password,remarks)values('"+name+"','"+dob+"','"+sex+"','"+address+"','"+contact+"','"+email+"','"+password+"','"+remarks+"')";
	System.out.println(str);
	int result=st.executeUpdate(str);
	if(result>0)
	{   
		String str2="patient";
		String str1="INSERT INTO login(user,password,module)values('"+email+"','"+password+"','"+str2+"')";
		System.out.println(str1);
		int result1=st.executeUpdate(str1);
		if(result1>0)
		{
		System.out.println("successfully inserted");
		RequestDispatcher rd=request.getRequestDispatcher("receptionist.jsp");
		rd.forward(request, response);
		}
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

