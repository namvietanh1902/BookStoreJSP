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
</head>
<body>	
<div class="container">

  <h2>Books in store</h2>
  <button class = "btn"><a href="addForm.jsp" style= "text-decoration:none">Add a book</a></button>
	
  <table class="table table-striped">
    <tr>
      <th>Book Name</th>
      <th>Author</th>
      <th>Price</th>
      <th>Actions</th>
     </tr>
<c:forEach items="${rs}" var="book">
    <tr>      
        <td><c:out value ="${book.bookName}"/></td>
        <td><c:out value ="${book.author}"/></td>
        <td><c:out value ="${book.price}"/></td>
        <td>
        
        	<button class="btn btn-edit" onclick = 
        	 >
        	<a href="./edit/${book.id}"/>Edit</a></button>
        	<button class = "btn" data-id = <c:out value ="${book.id }"/> data-toggle="modal" data-target="#deleteModal">Delete</button>
        </td> 
    </tr>
</c:forEach>
  </table> 
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