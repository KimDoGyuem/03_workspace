<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String title = request.getParameter("title");
String id = request.getParameter("id");
String text = request.getParameter("text");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
	Statement st = con.createStatement();
	String sql = "insert into dog_board(d_title,d_id,d_text) values('"+
	title+"','"+id+"','"+text+"')";
	System.out.println("전송한 sql:"+sql);
	int resultCount = st.executeUpdate(sql);
	if(resultCount == 1){
	System.out.println("글쓰기 성공");
	}else{
	System.out.println("글쓰기 실패");
	}
}catch(Exception e){
	e.printStackTrace();
}
response.sendRedirect("list.jsp");
%>