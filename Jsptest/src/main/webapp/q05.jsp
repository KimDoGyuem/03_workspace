<%@page import="com.jsp.q.Cat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Cat cat = new Cat();
	cat = null;
	%>
	<%=cat.name%>
</body>
</html>

