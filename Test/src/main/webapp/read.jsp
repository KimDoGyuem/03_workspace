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
	String readNo = request.getParameter("no");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select*from dog_board where d_no=" + readNo);
		rs.next();
		String title = rs.getString("d_title");
		String text = rs.getString("d_text");
		String id = rs.getString("d_id");
	%>
	글번호:<%=readNo %><br>
	글제목:<%=title %><br>
	글쓴이:<%=id %><br>
	글내용:<%=text %><br><hr>
	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	<a href="delproc.jsp?no=<%=readNo%>">글삭제</a>
	<a href="edit.jsp?no=<%=readNo%>">글수정</a>
</body>
</html>