<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	<%
	String editNo = request.getParameter("no");
	String title ="";
	String id ="";
	String text ="";
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select*from dog_board where d_no="+editNo);
		rs.next();
		title = rs.getString("d_title"); 
		id = rs.getString("d_id"); 
		text = rs.getString("d_text"); 
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	글번호:<%=editNo %><br>
	<form action="editproc.jsp" method="get">
	<input name="no" type="hidden" value=<%=editNo %>>
	글제목:<input name="title" value=<%=title %>><br>
	글쓴이:<input name="id" value=<%=id %>><br>
	글내용:<textarea name="text" rows="5" cols="30"><%=text %></textarea><br>
	<input type="submit" value="글수정">
	</form>
</body>
</html>