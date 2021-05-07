<%@page import="com.db.ConnectDB"%>
<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	String sql;
	response.setContentType("text/html; charset=utf-8");
	try{
		
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip +"/LifeLongEducation", "finalproject", "3579");
		
		
		
		String number = request.getParameter("number"); 
		String title = request.getParameter("title"); 
		String reportingdate = request.getParameter("reportingdate"); 
		String contents = request.getParameter("contents");
		String id = request.getParameter("id");
		
		int number1 = Integer.parseInt(number);
		 
		
		System.out.println(id);
		System.out.println(title);
		System.out.println(reportingdate);
		System.out.println(contents);
		System.out.println(number);
		
		
		try{
				sql="update qna set title = ?, reportingdate = ?, contents = ? where id = ? and number = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, title);
				ps.setString(2, reportingdate);
				ps.setString(3, contents);
				ps.setString(4, id);
				ps.setInt(5, number1);
				ps.execute();
				System.out.println("update modify ok");
		}
			
		catch(Exception e){
			System.out.println("update false : " + e);
		}
		
	}catch(Exception e){
		response.setStatus(400);
		System.out.println("db connecton false");
	}

	
%>