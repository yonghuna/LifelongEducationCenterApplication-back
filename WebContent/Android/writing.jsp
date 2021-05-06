<%@page import="com.db.ConnectDB"%>
<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	JSONObject jObject = new JSONObject();
	response.setContentType("text/html; charset=utf-8");
	try{
		
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip +"/LifeLongEducation", "finalproject", "3579");
		
		
		String id = request.getParameter("id");
		String title = request.getParameter("title"); 
		String reportingdate = request.getParameter("reportingdate");
		String secret = request.getParameter("secret"); 
		String contents = request.getParameter("contents"); 
		
	
		System.out.println(id);
		System.out.println(title);
		System.out.println(reportingdate);
		System.out.println(secret);
		System.out.println(contents);
		
		
	
		try{
			String sql="insert into qna(id, title, reportingdate, secret, contents) values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, title);
			ps.setString(3, reportingdate);
			ps.setString(4, secret);
			ps.setString(5, contents);
			ps.execute();
			System.out.println("posted ok");
		}catch(Exception e){
			System.out.println("posted : " + e);
		}
		
	}catch(Exception e){
		response.setStatus(400);
		System.out.println("db connecton false");
	}
	
%>