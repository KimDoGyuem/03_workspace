<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<a href='q08_1.jsp'>페이지1</a>
<a href='q08_2.jsp'>페이지2</a>

<%
	int x = Integer.parseInt(request.getParameter("x"));
	int y = Integer.parseInt(request.getParameter("y"));
%>

<%=x+y%>
