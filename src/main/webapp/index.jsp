<%@page import="org.apache.catalina.connector.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Books Management</title>
<style type="text/css">
	body{
		font-family: 'Poppins', sans-serif;
	}

	.header{
	position:fixed;
	top:0;
	right:0;
	left:0;
	height:60px;
	background-color: #333;
	color:#fff;
	padding: 0 40px;
	z-index:999;
	}
	
	.header a{
		margin:0;
		position:relative;
		transition : 1s linear;
		text-decoration:none;
		font-size: 24px;
		color:white;
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
	margin-top:60px;
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
	.form-search{
		display: flex;
		align-items: center;
	}
	
	.input-search{
	 outline: none; 
	 border:1px solid #ccc;
	 border-radius: 4px;
	 padding: 4px 0 4px 8px;	
	}
	
	.btn-search{
		background-color: white;
		color: #000;
		outline: none;
		padding: 4px 8px;
		border:1px solid #ccc;
	 	border-radius: 4px;
	 	position: relative;
		z-index: 100;
		overflow: hidden;
		transition: all 1s;
		
	}
	.btn-search::after {
	  content: "";
	  border-radius: 50%;
	  z-index: -10;
	  transition: all 0.5s cubic-bezier(0.86, 0.31, 0.55, 0.99);
	  width: 2px;
	  top: 50%;
	  left: 50%;
	  height: 2px;
	  position: absolute;
	  display: inline-block;
	  background: #1e96da;
	  opacity: 0;
	}
	
	.btn-search:hover {
  	cursor: pointer;
  	color: white;
  	border:none;
	}
	
	.btn-search:hover::after {
	  transform: scale(105);
	  opacity: 1;
	}
	
</style>
</head>
<body>	

<div class="header d-flex justify-content-between align-items-center ">
	<a href="">Home</a>
	<form action="/CrudBookStore/search" class="form-search">
		<input type="text" name="bookName" class="input-search" placeholder="Enter name book..." >
		<button type="submit" class="btn-search ml-2">Search</button>
	</form>
	<a href="logout">Log out</a>
	
</div>

<div class="slider">
  <h2>Books in store</h2>
  <h2>Books in store</h2>
</div>
<div class="container">
	
  <table class="table table-striped mt-4">
    <tr class="bg-dark bg-gradient text-white">
      <th>Book Name</th>
      <th>Author</th>
      <th>Price</th>
      <th >Actions</th>
     </tr>
<c:forEach items="${rs}" var="book" >
    <tr class="bg-secondary bg-gradient text-white">      
        <td class="align-middle"><c:out value ="${book.bookName}"/></td>
        <td class="align-middle"><c:out value ="${book.author} "/></td>
        <td class="align-middle"><c:out value ="${book.price}"/></td>
        <td class="">
        
        	<button class="btn btn-primary mr-2  " onclick = 
        	 >
        	<a class="text-decoration-none text-white" href="./edit/${book.id}"/>Edit</a></button>
        	<button class = "btn btn-danger" data-id = <c:out value ="${book.id }"/> data-toggle="modal" data-target="#deleteModal">Delete</button>
        </td> 
    </tr>
</c:forEach>
  </table> 
  
  <div class="d-flex  mb-4">
	  <button class = "m-auto btn btn btn-dark "><a class="text-white" href="addForm.jsp" style= "text-decoration:none">Add a new book</a></button>
  </div>
</div>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       Bạn có chắc muốn xóa?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger btn-confirm">Có</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Không</button>
      </div>
    </div>
  </div>
</div>
<form action="" method = "POST" hidden></form>

</body>
<script type ="text/javascript">
  	let deleteForm = document.forms[0];
$('#deleteModal').on('show.bs.modal', function (e) {
  	let button = e.relatedTarget;
  	console.log(deleteForm);
  	let id = $(button).data("id");
  	console.log(id);
  	deleteForm.action = "delete/"+id;
  	console.log(deleteForm);	
})
$('.btn-confirm').on('click',function(e){
	deleteForm.submit();
})

</script>

</html>