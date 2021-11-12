<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<%@ page import=" javax.servlet.RequestDispatcher"%>
<%@ page import= "javax.servlet.ServletException"%>
<%@ page import ="javax.servlet.http.HttpServlet"%>
<%@ page import ="javax.servlet.http.HttpServletRequest"%>
<%@ page import ="javax.servlet.http.HttpServletResponse"%>
<%@ page import ="javax.servlet.http.HttpSession"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%String name=null,dob=null,sex=null,address=null,contact=null,email=null,doctorid=null,doctorname=null,appdate=null,apptime=null,remarks=null;

email=(String)session.getAttribute("email");
System.out.println(email);
doctorname=request.getParameter("doctorname");
System.out.println(doctorname);
remarks=request.getParameter("remarks");
System.out.println(remarks);
Connection con=null;
try
{

	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","");
	Statement st=con.createStatement();
	Statement st1=con.createStatement();
	String str="select * from patient where email='"+email+"'";
	System.out.println(str);
	
	ResultSet rs=st.executeQuery(str);
	if(rs.next())
	{
		name=rs.getString("name");
		dob=rs.getString("dob");
		sex=rs.getString("sex");
		address=rs.getString("address");
		contact=rs.getString("contact");
		email=rs.getString("email");
	
		String str1="insert into appoinmentreq(name,dob,sex,address,contact,email,doctorname,remarks)values('"+name+"','"+dob+"','"+sex+"','"+address+"','"+contact+"','"+email+"','"+doctorname+"','"+remarks+"')";
		System.out.println(str1);
		int result=st1.executeUpdate(str1);
		if(result>0)
		{
		System.out.println("successfull insert");
	
		RequestDispatcher rd=request.getRequestDispatcher("patient.jsp");
		rd.forward(request, response);
		}
		
	}
	
	
}
catch(Exception e)
{
	System.out.println(e);
}
finally
{
	try
	{
		con.close();
	}
	catch(Exception e)
	{
		System.out.println();
	}
}
 %>
		
<body>

</body>
</html>