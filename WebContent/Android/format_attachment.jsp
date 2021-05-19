<%@page import="com.db.ConnectDB"%>
<%@ page import="java.sql.*, org.json.simple.*"%>

<%
	response.setCharacterEncoding("UTF-8");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip+ "/LifeLongEducation", "finalproject", "3579");
		
		
		int number = Integer.parseInt(request.getParameter("number"));

		System.out.println(number);
		
		
		String sql ="select * from format_attachment where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, number);
		ResultSet rs = ps.executeQuery();
		JSONArray array = new JSONArray();
		while(rs.next()){		
			JSONObject object = new JSONObject();
			object.put("number",rs.getInt("number"));
			object.put("randomname",rs.getString("randomname"));
			object.put("realname",rs.getString("realname"));
			object.put("path",rs.getString("path"));
			object.put("size",rs.getString("size"));	
			System.out.println("format ok");
			array.add(object);			
		}
		out.print(array.toJSONString());
		
	}catch (Exception e){
		System.out.println("SQL error : " + e);
	}	
%>


