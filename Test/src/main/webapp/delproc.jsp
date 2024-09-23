<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String delNo = request.getParameter("no");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cat", "root", "root");
	Statement st = con.createStatement();
	String sql = "delete from dog_board where d_no="+delNo;
	System.out.println("전송한 sql:"+sql);
	int resultCount = st.executeUpdate(sql);
	if(resultCount == 1){
	System.out.println("글삭제 성공");
	}else{
	System.out.println("글삭제 실패");
	}
}catch(Exception e){
	e.printStackTrace();
}
response.sendRedirect("list.jsp");
%>