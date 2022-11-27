
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
		text-transform:uppercase;
		top:50%;
		left:50%;
		transform: translate(-50%,-50%);	
		font-size: 4rem;
	}
	
	.slider h2:nth-child(1) {
		color:transparent;
		-webkit-text-stroke: 2px #1e96da;
	}
	
	.slider h2:nth-child(2) {
		color:#1e96da;
		clip-path: polygon(0 43%, 10% 56%, 16% 61%, 28% 64%, 38% 63%, 47% 59%, 55% 54%, 61% 50%, 71% 45%, 88% 45%, 95% 51%, 98% 57%, 100% 69%, 100% 100%, 0% 100%);	
	}
	
	@keyframes animateSlider{
		0%,100%
		{
		clip-path: polygon(0% 55%, 4% 47%, 12% 41%, 26% 40%, 35% 41%, 43% 48%, 50% 57%, 58% 62%, 67% 64%, 74% 63%, 82% 61%, 89% 57%, 94% 52%, 100% 46%, 100% 100%, 0% 100%);
		}
		50%
		{
		clip-path: polygon(0 43%, 10% 56%, 16% 61%, 28% 64%, 38% 63%, 47% 59%, 55% 54%, 61% 50%, 71% 45%, 88% 45%, 95% 51%, 98% 57%, 100% 69%, 100% 100%, 0% 100%);
		}
	}
	
</style>
</head>
<body>
<div class="header d-flex justify-content-between align-items-center ">
	<a href="">Home</a>
	<a href="login.jsp">Log out</a>
</div>

<div class="slider">
  <h2>Add a new book</h2>
  <h2>Add a new book</h2>
</div>

<div class="container d-flex">
	<form  action="add" method = "POST" class="m-auto"><br><br>
	  <label for="fname">Book name </label><br>
	  <input type="text" id="fname" name="bookName" ><br><br>
	  <label for="lname">Author </label><br>
	  <input type="text" id="lname" name="author"><br><br>
	  <label for="lname">Price </label><br>
	  <input type="text" id="lname" name="price"><br><br>
	  <input class="btn btn-primary" type="submit" value="Submit" >
	  <a href="/CrudBookStore" class="btn btn-secondary" value="Back" >Back</a>
	</form>
</div>
</body>

<script type="text/javascript">
	

</script>
</html>