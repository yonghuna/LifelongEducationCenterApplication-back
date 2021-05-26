<%@page import="com.db.ConnectDB"%>
<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	JSONObject jObject = new JSONObject();
	String sql;
	response.setContentType("text/html; charset=utf-8");
	try{
		
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip +"/LifeLongEducation", "finalproject", "3579");
		
		
		
		String payment = request.getParameter("payment");
		String id= request.getParameter("id"); 
	
		 
		
		System.out.println(payment);
		System.out.println(id);

		
		
	
		try{
		
				sql="update enrollment set payment = ? where id = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, payment);
				ps.setString(2, id);
				ps.execute();
				jObject.put("result", "ok");
				System.out.println("payment in ok");
			
		}catch(Exception e){
			jObject.put("result", "false");
			System.out.println("payment update false : " + e);
		}
		
	}catch(Exception e){
		response.setStatus(400);
		System.out.println("db connecton false");
	}
	out.print(jObject.toJSONString());
	
%>