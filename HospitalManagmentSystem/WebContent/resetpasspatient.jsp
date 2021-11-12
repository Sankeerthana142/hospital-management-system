<!DOCTYPE html>
<html lang="en">
<%@ page import="java.sql.*" %>
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

    <title>reception_reg</title>
	
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
<%String password=null,str2=null,str1=null,str3=null;
String email=(String)session.getAttribute("email");
 str2=request.getParameter("password");
System.out.println(str2);
 str3=request.getParameter("password1");
System.out.println(str3);
Connection con=null;

String url="jdbc:mysql://localhost:3306/hospital";
try {
	con=DriverManager.getConnection(url,"root","");
	Class.forName("com.mysql.jdbc.Driver");
	Statement st=con.createStatement();
	String str="Select * from patient where email='"+email+"'";
	System.out.println(str);
	ResultSet rs=st.executeQuery(str);
	if(rs.next())
	{
		 str1=rs.getString("password");
		if(str1.equals(str2))
		{
			String str4="update patient set password='"+str3+"'where email='"+email+"'";
			System.out.println(str4);
			int result=st.executeUpdate(str4);
			if(result>0)
			{ 
				String str5="update login set password='"+str3+"'where user='"+email+"'";
				System.out.println(str5);
				int result1=st.executeUpdate(str5);
				if(result1>0)
				{ 
					System.out.println("successfully reset password");
					RequestDispatcher rd=request.getRequestDispatcher("patient.jsp");
					rd.forward(request, response);
				}
				
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
} %>
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
               <h4><b> Doctor</b></h4>
              </div>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            
            <!-- /.navbar-collapse -->
        </div>
        <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
			  <ul class="nav navbar-nav">
				<li class="active"><a href="home.jsp"><b>Logout</b></a></li>
				
			  </ul>
            </div>
        <!-- /.container -->
        </div>
    </nav>
	

	<!-- Section: intro -->
    <section id="intro" class="intro">
		<div class="intro-content">
			<div class="container">
				<div class="row">
					<div class="col-lg-4">
					<div class="wow fadeInUp" data-wow-offset="0" data-wow-delay="0.1s">
					
							<div class="button"><i class="fa fa-user-md fa-3x circled bg-skin"></i></div>
							<h4 class="h-bold"></h4>
						</div>
				
					</div>
					
				
					
					</div>
		

				
				<div class="row">
					<div class="col-lg-6">
						<div class="form-wrapper">
						<div class="wow fadeInRight" data-wow-duration="2s" data-wow-delay="0.2s">
						
							<div class="panel panel-skin">
							<div class="panel-heading">
									<h3 class="panel-title"><span class="fa fa-pencil-square-o"></span> Reset Password<small></small></h3>
									</div>
									<div class="panel-body">
									<form role="form"  class="lead">
										<div class="row">
											<div class="col-xs-6 col-sm-6 col-md-6">
												<div class="form-group">
													<label>Enter the current password</label>
													<input type="password" name="password"  class="form-control input-md">
												</div>
											</div>
											
										
											<div class="col-xs-6 col-sm-6 col-md-6">
												<div class="form-group">
													<label>Enter the new password</label>
													<input type="password" name="password1" class="form-control input-md">
												</div>
											</div>
											
										
										<input type="submit" value="Submit" class="btn btn-skin btn-block btn-lg">
										
									
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
