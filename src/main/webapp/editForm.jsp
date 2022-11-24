<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="" method = "POST">
  <label for="fname" >Book name: </label><br>
  <input type="text" id="fname" name="bookName" value= "${book.bookName}" ><br>
  <label for="lname">Author: </label><br>
  <input type="text" id="lname" name="author" value= "${book.author}"><br><br>
  <label for="lname">Price: </label><br>
  <input type="text" id="lname" name="price" value= "${book.price}"><br><br>
  <input type="submit" value="Submit">
</form>
</body>
</html>