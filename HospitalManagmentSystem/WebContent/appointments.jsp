<!DOCTYPE html>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<html lang="en">
<%@ page import="java.sql.*" %>
<%-- <%@ page import="java.util.Date" %> --%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import=" javax.servlet.RequestDispatcher"%>
<%@ page import= "javax.servlet.ServletException"%>
<%@ page import ="javax.servlet.http.HttpServlet"%>
<%@ page import ="javax.servlet.http.HttpServletRequest"%>
<%@ page import ="javax.servlet.http.HttpServletResponse"%>
<%@ page import ="javax.servlet.http.HttpSession"%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>appoinment</title>
	
    <!-- css -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="plugins/cubeportfolio/css/cubeportfolio.min.css">
	<link href="css/nivo-lightbox.css" rel="stylesheet" />
	<link href="css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
	<link href="css/owl.carousel.css" rel="stylesheet" media="screen" />
    <link href="css/owl.theme.css" rel="stylesheet" media="screen" />
	<link href="css/animate.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet">

	<!-- boxed bg -->
	<link id="bodybg" href="bodybg/bg1.css" rel="stylesheet" type="text/css" />
	<!-- template skin -->
	<link id="t-colors" href="color/default.css" rel="stylesheet">


</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">

<div id="wrapper">
	
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="top-area">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-md-6">
					<p class="bold text-left">Monday - Saturday, 8am to 10pm </p>
					</div>
					<div class="col-sm-6 col-md-6">
					<p class="bold text-right">Call us now +919400119093</p>
					</div>
				</div>
			</div>
		</div>
        <div class="container navigation">
		
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
               
                    <img src="img/logo.png" alt="" width="150" height="40" />
              <div class="col-sm-6 col-md-12">
               <h4><b> appointment</b></h4>
              </div>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            
            <!-- /.navbar-collapse -->
       
        <!-- /.container -->
        <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
			  <ul class="nav navbar-nav">
			  <li class="active"><a href="addappoint.jsp"><b>take a appointment</b></a></li>
				<li class="active"><a href="home.jsp"><b>Logout</b></a></li>
				
			  </ul>
            </div>
             </div>
        </div>
    </nav>
	

	<!-- Section: intro -->
    <section id="intro" class="intro">
		<div class="intro-content">
			<div class="container">
				<div class="row">
					<div class="col-lg-4">
					<div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0.1s">
					
							<div class="button"><i class="fa fa-wheelchair fa-3x circled bg-skin"></i></div>
							<h4 class="h-bold"></h4>
						</div>
				
					</div>
					
				
					
					</div>
		

				
				<div class="row">
					<div class="col-lg-16">
						<div class="form-wrapper">
						<div class="wow fadeInRight" data-wow-duration="2s" data-wow-delay="0.2s">
						
							<div class="panel panel-skin">
							<div class="panel-heading">
									<h3 class="panel-title"><span class="fa fa-pencil-square-o"></span> APPOINTMENTS<small></small></h3>
									</div>
									<div class="panel-body">
									<form role="form" class="lead" action="patientreg" method="post">
										<div class="row">
										<table>
										<tr>
										<th><font size="3">Patient Name</font></th>
										<th><font size="3">Patient email</font></th>
										<th><font size="3">doctor Name</font></th>
										<th><font size="3">doctor email</font></th>
										<th><font size="3">Appointment date</font></th>
										<th><font size="3">Appointment time</font></th>
										
										</th>
										</tr>
										<% 
										
										 
										
									
										LocalTime lt=LocalTime.now();
										DateTimeFormatter format=DateTimeFormatter.ofPattern("HH:mm:ss");
										String ft=lt.format(format);
										System.out.println(ft);
										String email1=(String)request.getParameter("email1");
										//System.out.println(email1);
										DateFormat df=new SimpleDateFormat("yyyy/MM/dd");
											java.util.Date dt=new java.util.Date();
											String dt1=(df.format(dt));
											Calendar cal=Calendar.getInstance();
											System.out.println(df.format(cal.getTime()));
										String pname=null,pemail=null,doctorname=null,doctorid=null;
										String apptime=null;
										java.util.Date appdate=null;
										Connection con=null;
										try
										{
											Class.forName("com.mysql.jdbc.Driver");
											con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","");
											Statement st=con.createStatement();
											String str="select * from appoinments";
											ResultSet rs=st.executeQuery(str);
											while(rs.next())
											{
												
												pname=rs.getString("pname");
												pemail=rs.getString("pemail");
												appdate=rs.getDate("appdate");
												apptime=rs.getString("apptime");
												doctorname=rs.getString("doctorname");
												doctorid=rs.getString("doctorid");
												
												//Date dt1=df.parse(appdate);
											
											   
											/* 	 if(apptime.after(t) && appdate.after(LocalDate.now()))
												{
													String str1="update  set appdate='null',apptime='null'where doctorid='"+pemail+"'" ;
													System.out.println(str1);
													int result=st.executeUpdate(str1);
													if(result>0)
													{
														RequestDispatcher rd=request.getRequestDispatcher("appoinments.jsp");
														rd.forward(request, response);
													}
												}
												  */
												
										
										
										%>
											<tr>
													<td><input type="text" name="pname" value="<%=pname %>"  class="form-control input-md"></td>
												
													<td><input type="email" name="pemail" value="<%=pemail %>"  class="form-control input-md"></td>
													<td><input type="text" name="pname" value="<%=doctorname %>"  class="form-control input-md"></td>
												
													<td><input type="email" name="pemail" value="<%=doctorid %>"  class="form-control input-md"></td>
													<td><input type="date" name="appdate"  value="<%=appdate%>" class="form-control input-md"></td>
												
													<td><input type="time" name="apptime" value="<%=apptime %>"  class="form-control input-md"></td>
											
											    	
												</tr>
												
		
		                      <% 	
		                      if((appdate.compareTo(dt)<=0))
								{
									String str1="delete from appoinments where appdate='"+appdate+"'" ;
									System.out.println(str1);
									int result=st.executeUpdate(str1);
									if(result>0)
									{
										RequestDispatcher rd=request.getRequestDispatcher("appoinments.jsp");
										rd.forward(request, response);
									}
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
									</table>
									</div>
									</form>
								</div>
							</div>				
						
						</div>
						</div>
					</div>					
				</div>		
			</div>
		</div>	
		</div>
			
    </section>
	
	<!-- /Section: intro -->
	<footer>
	
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-4">
					<div class="wow fadeInDown" data-wow-delay="0.1s">
					<div class="widget">
						<h5>About Medicio</h5>
						<p>
						Medicio Hospital is a health care institution providing patient treatment with specialized medical and nursing staff and medical equipments
						</p>
					</div>
					</div>
					<div class="wow fadeInDown" data-wow-delay="0.1s">
					<div class="widget">
						<h5>Information</h5>
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">Medical treatment</a></li>
							<li><a href="#">Terms & conditions</a></li>
						</ul>
					</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4">
					<div class="wow fadeInDown" data-wow-delay="0.1s">
					<div class="widget">
						<h5>Medicio center</h5>
						<p>
						Highly experienced, skilled and distinguished in their respective fields of expertise practitioners
						</p>
						<ul>
							<li>
								<span class="fa-stack fa-lg">
									<i class="fa fa-circle fa-stack-2x"></i>
									<i class="fa fa-calendar-o fa-stack-1x fa-inverse"></i>
								</span> Monday - Saturday, 8am to 10pm
							</li>
							<li>
								<span class="fa-stack fa-lg">
									<i class="fa fa-circle fa-stack-2x"></i>
									<i class="fa fa-phone fa-stack-1x fa-inverse"></i>
								</span> +919400119093
							</li>
							<li>
								<span class="fa-stack fa-lg">
									<i class="fa fa-circle fa-stack-2x"></i>
									<i class="fa fa-envelope-o fa-stack-1x fa-inverse"></i>
								</span> hello@medicio.com
							</li>

						</ul>
					</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4">
					<div class="wow fadeInDown" data-wow-delay="0.1s">
					<div class="widget">
						<h5>Our location</h5>
						<p>Medicio Hospital,delhi</p>		
						
					</div>
					</div>
				</div>
			</div>	
		</div>
		<div class="sub-footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-6 col-lg-6">
					<div class="wow fadeInLeft" data-wow-delay="0.1s">
					<div class="text-left">
				<!--  	<p>hai</p>-->
					</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-6 col-lg-6">
					<div class="wow fadeInRight" data-wow-delay="0.1s">
					<div class="text-right">
						<!--  <p><a href="http://bootstraptaste.com/">Bootstrap Themes</a> by BootstrapTaste</p>
					-->
					</div>
              
					</div>
				</div>
			</div>	
		</div>
		</div>
	</footer>

</div>
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>

	<!-- Core JavaScript Files -->
    <script src="js/jquery.min.js"></script>	 
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.easing.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/jquery.scrollTo.js"></script>
	<script src="js/jquery.appear.js"></script>
	<script src="js/stellar.js"></script>
	<script src="plugins/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/nivo-lightbox.min.js"></script>
    <script src="js/custom.js"></script>


</body>

</html>
