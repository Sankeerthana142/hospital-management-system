<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import=" java.sql.*"%>
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
<title>apporeq2</title>
</head>
<%
String pemail=(String)session.getAttribute("emailpatie");
String appdate=request.getParameter("appdate");
String apptime=request.getParameter("apptime");
System.out.println(pemail);

System.out.println(apptime);
System.out.println(appdate);
Connection con=null;

String url="jdbc:mysql://localhost:3306/hospital";
try {
	con=DriverManager.getConnection(url,"root","");
	Class.forName("com.mysql.jdbc.Driver");
	Statement st=con.createStatement();
	Statement st1=con.createStatement();
	Statement st2=con.createStatement();
	String str1="select * from appoinmentreq where email='"+pemail+"'";
	System.out.println(str1);
	ResultSet rs=st.executeQuery(str1);
	if(rs.next())
	{
		
		
	String pname=rs.getString("name");

	String remarks=rs.getString("remarks");
	String doctorname=rs.getString("doctorname");
	String str2="select email from doctor where name='"+doctorname+"'";
	ResultSet rs2=st2.executeQuery(str2);
	if(rs2.next())
	{
	String doctorid=rs2.getString("email");
	String str="INSERT INTO appoinments(pname,pemail,doctorname,doctorid,appdate,apptime)values('"+pname+"','"+pemail+"','"+doctorname+"','"+doctorid+"','"+appdate+"','"+apptime+"')";
	System.out.println(str);
	int result=st1.executeUpdate(str);
	if(result>0)
	{  
		System.out.println("successfully inserted");
		RequestDispatcher rd=request.getRequestDispatcher("apporeq.jsp");
		rd.forward(request, response);
		
	}
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
}%>
<body>

</body>
</html>