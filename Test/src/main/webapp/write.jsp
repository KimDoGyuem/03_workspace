<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="common.css">
</head>
<body>
	<form action="writeproc.jsp" method="get">
	글제목:<input name="title"><br>
	글쓴이:<input name="id"><br>
	글내용:<textarea name="text" rows="5" cols="30"></textarea><br>
	<input type="submit" value="글쓰기">
	</form>
</body>
</html>