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
	<h3>게시판</h3>
	<hr>
	글번호 | 글제목 | 글쓴이 <br>
	---------------------------<br>
	<%
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select*from dog_board");
		while (rs.next()) {
			String no = rs.getString("d_no");
			String title = rs.getString("d_title");
			String text = rs.getString("d_text");
			String id = rs.getString("d_id");
	%>
	<%=no %> | <a href="read.jsp?no=<%=no%>"><%=title %></a> | <%=id %><br>
	<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	<hr>
	<a href="write.jsp">글쓰기</a>
</body>
</html>