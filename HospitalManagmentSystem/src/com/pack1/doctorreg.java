package com.pack1;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Iterator;
import java.io.File;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
 

public class doctorreg extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
String name=request.getParameter("name");
String dob=request.getParameter("dob");
String jod=request.getParameter("jod");
String sex=request.getParameter("sex");
String address=request.getParameter("address");
String specialization=request.getParameter("specialization");
String contact=request.getParameter("contact");
String email=request.getParameter("email");
String password=request.getParameter("password");
System.out.println(email);

boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (!isMultipart) {
System.out.println("Hai'");
PrintStream out=null;
int count1=0;
//out.print(count1+1);
}
	else {
FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
List items = null;
try {
items = upload.parseRequest(request);
} catch (FileUploadException e) {
e.printStackTrace();
}
Iterator itr = items.iterator();
while (itr.hasNext()) {
FileItem item = (FileItem) itr.next();
if (item.isFormField()) {
	String name1 = item.getFieldName();
	String value = item.getString();
	if (name1.equals("name")) {
	name = value;

	}if (name1.equals("dob")) {
	dob = value;

	}
	if (name1.equals("jod")) {
		jod = value;

		}
	if (name1.equals("sex")) {
		sex = value;

		}
	if (name1.equals("address")) {
		address = value;

		}
	if (name1.equals("specialization")) {
		specialization = value;

		}
	if (name1.equals("contact")) {
		contact = value;

		}
	if (name1.equals("email")) {
	email = value;
	}
	
	if (name1.equals("password")) {
	password = value;
	}
} else {
Connection con=null;
String image=item.getName();




String url="jdbc:mysql://localhost:3306/hospital";
try {
	File savedFile = new File("C:/Users/sankeerthana/HospitalManagmentSystem/WebContent/images" + image);
	item.write(savedFile);
	System.out.println(savedFile);
	con=DriverManager.getConnection(url,"root","");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Statement st=con.createStatement();
	
	String str="INSERT INTO doctor(name,dob,jod,sex,address,specialization,contact,email,password,image)values('"+name+"','"+dob+"','"+jod+"','"+sex+"','"+address+"','"+specialization+"','"+contact+"','"+email+"','"+password+"','"+image+"')";
	System.out.println(str);
	int result=st.executeUpdate(str);
	if(result>0)
	{   
		String str2="doctor";
		
		String str1="INSERT INTO login(user,password,module)values('"+email+"','"+password+"','"+str2+"')";
		
		System.out.println(str1);
		int result1=st.executeUpdate(str1);
		if(result1>0)
		{
		System.out.println("successfully inserted");
		RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
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
}
	}
}

	

