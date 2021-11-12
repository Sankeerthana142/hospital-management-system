
<!DOCTYPE html>
<html lang="en">
<%@ page import="java.sql.*" %>
<%@ page import=" javax.servlet.RequestDispatcher"%>
<%@ page import= "javax.servlet.ServletException"%>
<%@ page import ="javax.servlet.http.HttpServlet"%>
<%@ page import ="javax.servlet.http.HttpServletRequest"%>
<%@ page import ="javax.servlet.http.HttpServletResponse"%>
<%@ page import ="javax.servlet.http.HttpSession"%>
<%@ page import=" java.io.File" %>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>reception_page</title>
	
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
<%
String name=null,dob=null,jod=null,sex=null,address=null,contact=null,image=null;
String email=(String)session.getAttribute("email");
System.out.println(email);
Connection con=null;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","");
Statement st=con.createStatement();
String str="Select * from receptionist where email='"+email+"'";
System.out.println(str);
ResultSet rs=st.executeQuery(str);
if(rs.next())
{
	System.out.println("Working");
	name=rs.getString("name");
	dob=rs.getString("dob");
	jod=rs.getString("jod");
	sex=rs.getString("sex");
	address=rs.getString("address");
	contact=rs.getString("contact");
	
	image=rs.getString("image");
	System.out.println(image);
	
	File savefile= new File("images/" + image);
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
		
	}
}

%>

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
              <div class="col-sm-6 col-md-8">
               <h6><b> Welcome receptionist</b></h6>
              </div>
              </div>
            
<div class="collapse navbar-collapse navbar-right navbar-main-collapse">
			  <ul class="nav navbar-nav">
			 
			  
				<li class="active"><a href="resetpass.jsp">Reset password</a></li>
				<li><a href="apporeq.jsp">appointment request</a></li>
				<li><a href="patientview.jsp">Patients</a></li>
				<li><a href="recepdoctor.jsp">Doctors</a></li>
				<li><a href="appointments.jsp">patient appointment</a></li>
				<li class="active"><a href="home.jsp"><b>Logout</b></a></li>
			  </ul>
            </div>
            
            <!-- Collect the nav links, forms, and other content for toggling -->
            
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
        
      
    </nav>
	

	<!-- Section: intro -->
    <section id="intro" class="intro">
		<div class="intro-content">
			<div class="container">
				<div class="row">
				<div>
				
					<div class="col-lg-6">
					<div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0.1s">
					<img src=<%="images/"+image %> width = "125" height = "125"> 
							<!-- <div class="button"><i class="fa fa-user fa-3x circled bg-skin"></i></div> -->
							
							<h4 class="h-bold"></h4>
						</div>
				
					</div>
					
					</div>
					
					
				
					
					</div>
		

			
				<div class="row">
					<div class="col-lg-6">
						<div class="form-wrapper">
						<div class="wow fadeInRight" data-wow-duration="2s" data-wow-delay="0.2s">
						
							<div class="panel panel-skin">
							<div class="panel-heading">
									<h3 class="panel-title"><span class="fa fa-pencil-square-o"></span>Receptionist record<small></small></h3>
									</div>
									<div class="panel-body">
									<form role="form" class="lead" >
										<div class="row">
											<div class="col-xs-6 col-sm-6 col-md-6">
												<div class="form-group">
													<label>Name</label>
													<input type="text" name="name" value="<%=name %>"class="form-control input-md" disabled>
												</div>
											</div>
											
										
											<div class="col-xs-6 col-sm-6 col-md-6">
												<div class="form-group">
													<label>Date of Birth</label>
													<input type="date" name="dob" value= "<%=dob %>"class="form-control input-md"disabled>
												</div>
											</div>
											<div class="col-xs-6 col-sm-6 col-md-6">
												<div class="form-group">
													<label>Joining Date</label>
													<input type="date" name="jod"  value="<%=jod %>" class="form-control input-md"disabled>
												</div>
											</div>
											<div class="col-xs-6 col-sm-6 col-md-6">
												<div class="form-group">
													<label>Sex</label>
													<input type="text" name="sex" value=" <%=sex %>" class="form-control input-md"disabled>
												</div>
											</div>
											<div class="col-xs-6 col-sm-6 col-md-6">
												<div class="form-group">
													<label>Address</label>
													<input type="text" name="address"  value=" <%=address %>"class="form-control input-md"disabled>
												</div>
											</div>
											
										 	<div class="col-xs-6 col-sm-6 col-md-6">
												<div class="form-group">
													<label>Contact number</label>
													<input type="text" name="contact"  value=" <%=contact %>"class="form-control input-md"disabled>
												</div>
											</div>
											<div class="col-xs-6 col-sm-6 col-md-6">
												<div class="form-group">
													<label>Email</label>
													<input type="email" name="email" value=" <%=email %>" class="form-control input-md"disabled>
												</div>
											</div>
										</div>
										
										
									
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
