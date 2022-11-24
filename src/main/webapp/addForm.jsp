
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="add" method = "GET">
  <label for="fname">Book name: </label><br>
  <input type="text" id="fname" name="bookName" ><br>
  <label for="lname">Author: </label><br>
  <input type="text" id="lname" name="author"><br><br>
  <label for="lname">Price: </label><br>
  <input type="text" id="lname" name="price"><br><br>
  <input type="submit" value="Submit">
</form>
</body>
</html>