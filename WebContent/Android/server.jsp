<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.db.ConnectDB"%>

<%
	
	request.setCharacterEncoding("UTF-8");
	String start = request.getParameter("start"); // TEST
	System.out.println(start);
	
	if(start.equals("start")) {
		System.out.println("성공");	
		ConnectDB connectDB = new ConnectDB();
		String example1 = connectDB.exmaple();
		out.print(example1);
	}
%>


