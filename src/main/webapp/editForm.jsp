<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style type="text/css">
	body{
		font-family: 'Poppins', sans-serif;
	}

	.header{
	height:60px;
	background-color: #333;
	color:#fff;
	padding: 0 24px;
	}
	
	.header a{
		margin:0;
		position:relative;
		transition : 1s linear;
		text-decoration:none;
		font-size: 24px;
		color: white;
	}
	
	.header a:hover{
		cursor:pointer;
		color: #1e96da;
	}
	
	.header a:hover:after {
		width: 100%;
	}
	
	.header a:after{
		content:"";
		position: absolute;
		left:0;
		bottom:-2px;
		width: 0;
		height: 2px;
		background-color: #1e96da;
		transition : 1s;
	}
	
	.slider{
	height:200px;
	background-image: url("https://d-themes.com/react/molla/demo-5/images/page-header-bg.jpg");
	position: relative;
	}
	
	.slider h2{
		position: absolute;
		color:#fff;
		text-transform:uppercase;
		top:50%;
		left:50%;
		transform: translate(-50%,-50%);	
		font-size: 4rem;
	}
	
	.slider h2:nth-child(1) {
		color: transparent;
		-webkit-text-stroke: 2px #1e96da;
	}
	
	.slider h2:nth-child(2) {
		color: #1e96da;
		animation: animate 4s ease-in-out infinite;
	}
	
	
	@keyframes animate {
		0%,
		100% {
			clip-path: polygon(
				0% 45%,
				16% 44%,
				33% 50%,
				54% 60%,
				70% 61%,
				84% 59%,
				100% 52%,
				100% 100%,
				0% 100%
			);
		}

		50% {
			clip-path: polygon(
				0% 60%,
				15% 65%,
				34% 66%,
				51% 62%,
				67% 50%,
				84% 45%,
				100% 46%,
				100% 100%,
				0% 100%
			);
		}
	}
	
	.errorname,
	.errorauthor,
	.erorrprice{
		color:red;
	}
	
	.layout{
		margin-top: 62px; 
	}
	
	.form-bg{
		border: 1px solid #ccc; 
		padding: 36px ;
		position: relative;
	}
	
	.form-title{
	position: absolute;
	top: -18px;
	left: 12px;
	z-index: 100;
	background-color: #fff;
	color:#1e96da;
	padding: 0 4px;
	font-size: 22px;
	}
	
	.input-field{
		width: 320px;
		padding: 4px 6px;
		border: 1px solid #ccc;
		border-radius: 4px;
		outline: none;
	}
	
	.input-field:focus{
		border: 1px solid #1e96da;
	}
	
</style>
</head>
<body>
<div class="header d-flex justify-content-between align-items-center ">
	<a href="">Home</a>
	<a href="login.jsp">Log out</a>
</div>

<div class="slider">
  <h2>Edit book</h2>
  <h2>Edit book</h2>
</div>

<div class="layout d-flex">
 <div class="m-auto form-bg">
 <span class="form-title">From Edit Book</span>
	<form action="" method = "POST" class="m-auto">
	<div class="name mb-4">
	  <label for="fname" >Book name </label><br>
	  <input type="text" id="fname" name="bookName" class="input-field" value= "${book.bookName}" onblur="handleblurName(event)">
	</div>
	<div class="author mb-4">
	  <label for="lname">Author </label><br>
	  <input type="text" id="lname" name="author" class="input-field" value= "${book.author}" onblur="handleblurAuthor(event)">
	</div>
	<div class="price mb-4">
	  <label for="lname">Price </label><br>

	  <input type="text" id="lname" name="price" class="input-field" value= "${book.price}" onblur="handleblurPrice(event)">
	</div>
	
	  <input class=" btn btn-primary " type="submit"  value="Submit">
     <a href="/CrudBookStore" class="btn btn-secondary" value="Back" >Back</a>

	</form>
 </div>
</div>
</body>

<script type="text/javascript">
	function handleblurName(event) {
		const tmp = document.querySelector('.name')
		const checkerror = document.querySelector('.errorname')
		if(checkerror) {
			checkerror.remove()
		}
		const error = document.createElement("div");
		const name = event.target.value;
		error.classList.add("errorname");
		if(name.trim() == ""){
			error.innerText = "Require"	
		}
		tmp.appendChild(error);
	}
	
	function handleblurAuthor(event) {
		const tmp = document.querySelector('.author')
		const checkerror = document.querySelector('.errorauthor')
		if(checkerror) {
			checkerror.remove()
		}
		const error = document.createElement("div");
		const author = event.target.value;
		error.classList.add("errorauthor");
		if(author.trim() == ""){
			error.innerText = "Require"	
		}
		tmp.appendChild(error);
	}
	
	function handleblurPrice(event) {
		const tmp = document.querySelector('.price')
		const checkerror = document.querySelector('.erorrprice')
		if(checkerror) {
			checkerror.remove()
		}
		const error = document.createElement("div");
		const price = event.target.value;
		error.classList.add("erorrprice");
		
		if(!(Number(price))){
			error.innerText = "Price is Number"	
		}
		
		if(price.trim() == ""){
			error.innerText = "Require"	
		}
		tmp.appendChild(error);
	}
</script>
</html>

