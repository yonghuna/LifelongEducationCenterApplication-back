<%@page import="com.db.ConnectDB"%>
<%@ page import="java.sql.*, org.json.simple.*"%>

<%
	response.setCharacterEncoding("UTF-8");
	JSONObject object = new JSONObject();
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip+ "/LifeLongEducation", "finalproject", "3579");
		
		
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber"); 
		String pw = request.getParameter("password");
		
		System.out.println(name);
		System.out.println(phoneNumber);
		System.out.println(pw);
	
		
	
		String sql ="SELECT * FROM user where name = ? and phonenumber = ? and password = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, phoneNumber);
		ps.setString(3, pw);
		ResultSet rs = ps.executeQuery();
			
		
		
		
		if(rs.next()){
			object.put("result", "ok");
			object.put("id",rs.getString("id"));
			object.put("course",rs.getString("course"));
			object.put("name",rs.getString("name"));
			System.out.println("login OK");
				
		}else{
			object.put("result", "false");
		}
		
			
	}catch (Exception e){
		object.put("result", "false");
		System.out.println("SQL 오류 : " + e);
	}
	out.print(object.toJSONString());
	
	
			
%>