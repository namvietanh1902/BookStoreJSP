<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style type="text/css">
	.backgroud{
		min-height:100vh;
	}

	.signup{
	    background-color: #fff;
	    border: 1px solid #e3e3e3;
	    border-radius: 16px;
	    box-sizing: border-box;
	    font-family: 'Poppins', sans-serif;
	    height: 100%;
	    left: 0;
	    padding: 48px;
	    position: relative;
	    text-align: left;
	    top: 0;
	}
	
	.title{
		font-size:36px;
		font-weight: 600;
		margin-bottom:32px;'
	}
	
	.inputfield{
		width:350px;
		padding: 10px 12px;
		border-radius: 4px;
		border: 1px solid #ccc; 
	}
	
	.btn-signup{
		background-color: #0d6efd;
		padding: 12px 0;
		width:100%;
		border:none;
		color:#fff;
		font-weight:600;
		border-radius: 50px;
		margin-top:20px;
	}
	
	.btn-signup:hover{
		opacity: 0.8;
	}
	
</style>
</head>
<body>
 <div class="d-flex backgroud">
 	<div class="m-auto signup">
 		<h1 class="title">Sign up</h1>
 		
 		<form action="" method="get" class="d-flex flex-column justify-content-start ">
 			<div class="d-flex flex-column mb-4" >
	 			<div class="d-flex justify-content-between ">
	 				<label>Email</label>
	 				<label>Already have an account?  <a class="text-primary text-decoration-none" href="login.jsp">Log in</a></label>
	 			</div>
 				
 				<input type="email" id="email" name="email" class="inputfield" >
 			</div>
 			
 			<div class="d-flex flex-column mt-2 mb-4 ">
 				<label>Password</label>
 				<input type="password" id="password" name="password" class="inputfield" >
 			</div>
 			
 			<div class="d-flex flex-column mt-2 mb-4 ">
 				<label>Confirm Password</label>
 				<input type="password" id="password" name="password" class="inputfield" >
 			</div>
 			
 			
 			<input class="btn-signup" type="submit" value="Sign up">
 		</form>
 	</div>
 
 </div>
</body>
</html>