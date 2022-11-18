<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="controller.DBConnect"%>
<%@page import="controller.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Home page</title>
<meta name="description" content="Garden Complaint System ">
<meta name="author" content="Himanshi">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800'
	rel='stylesheet' type='text/css'>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="assets/css/normalize.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/fontello.css">
<link href="assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css"
	rel="stylesheet">
<link href="assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
<link href="assets/css/animate.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="assets/css/bootstrap-select.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/icheck.min_all.css">
<link rel="stylesheet" href="assets/css/price-range.css">
<link rel="stylesheet" href="assets/css/owl.carousel.css">
<link rel="stylesheet" href="assets/css/owl.theme.css">
<link rel="stylesheet" href="assets/css/owl.transitions.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script>
      
     
      $(function(){
          $("#basic").change(function(){
              var display=$("#basic option:selected").val();
              $("#name").val(display);
          })
      })
      
   </script>

<style>
      * {
        box-sizing: border-box;
      }
      .openBtn {
        display: flex;
        justify-content: left;
      }
      .openButton {
        border: none;
        border-radius: 5px;
        background-color: #1c87c9;
        color: white;
        padding: 14px 20px;
        cursor: pointer;
        position: fixed;
      }
      .loginPopup {
        position: relative;
        text-align: center;
        width: 100%;
      }
      .formPopup {
      	width: 35%;
        display: none;
        position: fixed;
        left: 45%;
        top: 5%;
        transform: translate(-50%, 5%);
        border: 3px solid #999999;
        z-index: 9;
      }
      .formContainer {
        max-width: 560px;
        padding: 20px;
        background-color: #fff;
      }
      .formContainer input[type=text],
      .formContainer input[type=password] {
        width: 100%;
        padding: 15px;
        margin: 5px 0 20px 0;
        border: none;
        background: #eee;
      }
      .formContainer .dropdown{
      	width: 100%;
        padding: 15px;
        margin: 5px 0 20px 0;
        border: none;
        background-color: #eee;
        outline: none;
      }
      .formContainer .btn {
        padding: 12px 20px;
        border: none;
        background-color: #8ebf42;
        color: #fff;
        cursor: pointer;
        width: 100%;
        margin-bottom: 15px;
        opacity: 0.8;
      }
      .formContainer .cancel {
        background-color: #cc0000;
      }
      .formContainer .btn:hover,
      .openButton:hover {
        opacity: 1;
      }
    </style>
</head>
<body>
	<!-- Body content -->

	<div class="header-connect">
		<div class="container">
			<div class="row">
				<div class="col-md-5 col-sm-8  col-xs-12">
					<div class="header-half header-call">
						<p>
							<span><i class="pe-7s-call"></i> +91 234 567 7890</span> <span><i
								class="pe-7s-mail"></i> quadwave@company.com</span>
						</p>
					</div>
				</div>
				<div class="button navbar-right">
					<button class="navbar-btn nav-button wow bounceInRight login"
						onclick="openForm()"
						data-wow-delay="0.45s">Add Employee</button>
				</div>
			</div>
		</div>
	</div>
	<!--End top header -->

	<nav class="navbar navbar-default ">
	<div class="container">
		<div class="panel panel-default sidebar-menu wow fadeInRight animated">
			<div class="panel-heading">
				<form action="" method="get">
					<input type="text" class="form-control" name="q" placeholder="Search here...">
				</form>
			</div>
			
		</div>
	</div>
	</nav>
	<!-- End of nav bar -->
	
	
	<%
			ResultSet rs2 = null;
	 		Connection conn = null;
	%>

	<%
			String Data = request.getParameter("q");
			String query1;
			if(Data != null){
				query1 = "select * from users where ename like '%"+ Data + "%' or empid like '%"+ Data + "%' or designation like '%"+Data+"%'";
			}else{
				query1 = "select * from users";
			}

			conn = DBConnect.getConnection();
			PreparedStatement ps=conn.prepareStatement(query1);  
			
			
			rs2 = ps.executeQuery();
	%>
			
			<h2 style="text-align: center;">All Employee Details</h2>
	<div class="container mt-3">

		<table class="table table-bordered table-dark"
			class="table-responsive " style="background-color: #32383e;">
			<thead>
				<tr>
					<th scope="col" style="text-align: center; color: #f7f1f1f5;">Emp
						Id</th>
					<th scope="col" style="text-align: center; color: #f7f1f1f5;">Emp
						Name</th>
					<th scope="col" style="text-align: center; color: #f7f1f1f5;">Date
						of Joining</th>
					<th scope="col" style="text-align: center; color: #f7f1f1f5;">Year
						of Experience</th>
					<th scope="col" style="text-align: center; color: #f7f1f1f5;">Designation</th>

				</tr>
			</thead>
				<tbody>
					<%
						while (rs2.next()) {
					%>
					<tr>
						<td scope="row" style="text-align: center; color: #f7f1f1f5;"><%=rs2.getString(1)%></td>
						<td style="text-align: center; color: #f7f1f1f5;"><%=rs2.getString(2)%></td>
						<td style="text-align: center; color: #f7f1f1f5;"><%=rs2.getString(3)%></td>
						<td style="text-align: center; color: #f7f1f1f5;"><%=rs2.getString(4)%></td>
						<td style="text-align: center; color: #f7f1f1f5;"><%=rs2.getString(5)%></td>	
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	
	<%
		ResultSet rs3 = null;
		Connection conn1 = null;
		
		String query2 = "select * from users";
		conn1 = DBConnect.getConnection();
		PreparedStatement ps1=conn1.prepareStatement(query2);  
		rs3 = ps1.executeQuery();
		
	%>
	
<div class="loginPopup">
      <div class="formPopup" id="popupForm">
        <form action="addserv" class="formContainer" method="post">
          <h2>Add Employee</h2>
          <div class="form-group">
				<label for="zones">Employee Id </label> 
				<select id="basic" class="selectpicker form-control" name="zone" >
				<option>-Emp Id-</option>
				<%
					while (rs3.next()) {
				%>
				<option  value="<%= rs3.getString(2) %>"><%=rs3.getString(1)%></option>
				<%
				}
				%>
				</select>
		</div>
		<div class="form-group">
          <label for="name">
            <strong>Employee Name</strong>
          </label>
          <input class="form-control" type="name" id="name" placeholder="Emp Name" name="ename" required readonly></div>
          <div class="form-group">
          <label for="name">
            <strong>Date of Joining</strong>
          </label>
          <input class="form-control" type="Date" id="doj" placeholder="DOJ" name="doj" required></div>
          <div class="form-group">
          <label for="name">
            <strong>Year of Experience</strong>
          </label>
          <input class="form-control" type="name" id="yoe" placeholder="YOE" name="yoe" required></div>
          <div class="form-group">
          <label for="text">
            <strong>Designation</strong>
          </label>
          <input type="name" class="form-control" id="designation" placeholder="Designation" name="designation" required></div>
          <div class="text-center">
			<button type="submit" class="btn btn-default">Save</button>
			<button type="submit" class="btn cancel" onclick="closeForm()">Cancel</button>
		</div>
        
    
        </form>
      </div>
</div>


    <script>
      function openForm() {
        document.getElementById("popupForm").style.display = "block";
      }
      function closeForm() {
        document.getElementById("popupForm").style.display = "none";
      }
    </script>



	<script src="assets/js/modernizr-2.6.2.min.js"></script>

	<script src="assets/js/jquery-1.10.2.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="bootstrap/js/popper.min.js"></script>
	<script src="bootstrap/js/jquery.slim.min.js"></script>
	<script src="assets/js/bootstrap-select.min.js"></script>
	<script src="assets/js/bootstrap-hover-dropdown.js"></script>

	<script src="assets/js/easypiechart.min.js"></script>
	<script src="assets/js/jquery.easypiechart.min.js"></script>


	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/wow.js"></script>

	<script src="assets/js/icheck.min.js"></script>
	<script src="assets/js/price-range.js"></script>

	<script src="assets/js/main.js"></script>
</body>
</html>