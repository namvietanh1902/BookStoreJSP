<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		background-image: url("https://yesscale.com/wp-content/uploads/2017/06/h1-background-img-1.jpg")
	}

	.login{
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
	.login-fail{
		color:red;
		padding: 12px;
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
	
	.btn-login{
		background-color: #0d6efd;
		padding: 12px 0;
		width:100%;
		border:none;
		color:#fff;
		font-weight:600;
		border-radius: 50px;
		margin-top:20px;
	}
	
	.btn-login:hover{
		opacity: 0.8;
	}
	
	.forgot{
		text-align: center;
		text-decoration: none;
		color:#333;
		margin-top:20px;
		
	}
	
	.forgot:hover{
		cursor: :pointer;
		color: #0d6efd;
		text-decoration: none;
	}
	
	.errorpass,
	.error{
	color: red;
	}
</style>
</head>
<body>
 <div class="d-flex backgroud">
 	<div class="m-auto login">
 		<h1 class="title">Login</h1>
 		
<<<<<<< HEAD
 		<form action="" method="get" class="d-flex flex-column justify-content-start ">
 			<div class="email d-flex flex-column mb-4" >
	 			<div class="d-flex justify-content-between">
=======
 		<form action="login" method="POST" class="d-flex flex-column justify-content-start ">
 			<div class="d-flex flex-column mb-4" >
	 			<div class="d-flex justify-content-between ">
>>>>>>> 169abfd34c0214f20714c4a3f8cd1be28050f271
	 				<label>Email</label>
	 				<label>Need an account? <a class="text-primary text-decoration-none" href="signup.jsp">Sign up</a></label>
	 			</div>
 				
 				<input type="email" id="email" name="email" class="inputfield" onblur="handleBlurEmail(event)" >
 			</div>
 			
 			<div class="pass d-flex flex-column mt-2 mb-4 ">
 				<label>Password</label>
<<<<<<< HEAD
 				<input type="password" id="password" name="password" class="inputfield" onblur="handleBlurPass(event)" >
=======
 				<input type="password" id="password" name="password" class="inputfield" >
 				<div class="login-fail">
 					<% if ( request.getAttribute("error")!= null){%>
 					<%= (String)request.getAttribute("error") %>
 					<% }%>
 				</div>
>>>>>>> 169abfd34c0214f20714c4a3f8cd1be28050f271
 			</div>
 			
 			
 			<input class="btn-login" type="submit" value="Login">
 			<a href="#" class="forgot">Forgot password? </a>
 		</form>
 	</div>
 
 </div>
</body>
<script>
	
	function handleBlurEmail(event) {
		const tmp = document.querySelector('.email')
		const checkerror = document.querySelector('.error')
		if(checkerror) {
			checkerror.remove()
		}
		const error = document.createElement("span");
		const email = event.target.value;

		error.classList.add("error");
		var check = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/; 
				
		if(!(check.test(email))){
			error.innerText = "Email address is not valid"		
		}		
		tmp.appendChild(error);
	}
	
	function handleBlurPass(event) {
		const tmp = document.querySelector('.pass')
		const checkerror = document.querySelector('.errorpass')
		if(checkerror) {
			checkerror.remove()
		}
		const error = document.createElement("span");
		const pass = event.target.value;
		
		error.classList.add("errorpass");
		if(pass.trim() == ""){
			error.innerText = "Require"	
		}
		tmp.appendChild(error);
	}
	
	
	
	
</script>
</html>