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
<title>addappojava</title>
</head>
<%
String pname=request.getParameter("pname");

String pemail=request.getParameter("pemail");
String doctorname=request.getParameter("doctorname");
String doctorid=request.getParameter("doctorid");
String email=request.getParameter("email");
String appdate=request.getParameter("appdate");
String apptime=request.getParameter("apptime");

Connection con=null;

String url="jdbc:mysql://localhost:3306/hospital";
try {
	con=DriverManager.getConnection(url,"root","");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Statement st=con.createStatement();
	String str="INSERT INTO appoinments(pname,pemail,doctorname,doctorid,appdate,apptime)values('"+pname+"','"+pemail+"','"+doctorname+"','"+doctorid+"','"+appdate+"','"+apptime+"')";
	System.out.println(str);
	int result=st.executeUpdate(str);
	if(result>0)
	{  
		System.out.println("successfully inserted");
		RequestDispatcher rd=request.getRequestDispatcher("appointments.jsp");
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
}%>
<body>

</body>
</html>