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
<% 
String email=(String)request.getParameter("emaildoc");
System.out.println("my email is"+email);



Connection con=null;

String url="jdbc:mysql://localhost:3306/hospital";
try {
	con=DriverManager.getConnection(url,"root","");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Statement st=con.createStatement();
	String str="Delete from patient where email='"+email+"'";
	System.out.println(str);
	int result=st.executeUpdate(str);
	if(result>0)
	{   
		String str1="Delete from login where user='"+email+"'";
		System.out.println(str1);
		int result1=st.executeUpdate(str1);
		if(result1>0)
		{
		System.out.println("successfully deleted");
		RequestDispatcher rd=request.getRequestDispatcher("patientview.jsp");
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
}%>
<body>

</body>
</html>