<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String editNo = request.getParameter("no");
String title = request.getParameter("title");
String id = request.getParameter("id");
String text = request.getParameter("text");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
	Statement st = con.createStatement();
	String sql = "update dog_board set d_title='"
			+title+"',d_id='"+id+"',d_text='"+text+"' where d_no="+editNo;
	System.out.println("전송한 sql:"+sql);
	int resultCount = st.executeUpdate(sql);
	if(resultCount == 1){
	System.out.println("글수정 성공");
	}else{
	System.out.println("글수정 실패");
	}
}catch(Exception e){
	e.printStackTrace();
}
response.sendRedirect("list.jsp");
%>