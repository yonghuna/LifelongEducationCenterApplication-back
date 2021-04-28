<%@page import="com.db.ConnectDB"%>
<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	JSONObject object = new JSONObject();
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip +"/LifeLongEducation", "finalproject", "3579");
		
	
		ResultSet rs;
		
		String id = request.getParameter("id");
		System.out.println(id);
		String sql ="select * from user where id = ?";
	
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		
		System.out.println(" >>> SQL : " + sql + "<<<");
		rs = ps.executeQuery();
		
		
	
		if(rs.next()){
			
			object.put("name",rs.getString("name"));
			object.put("birth",rs.getString("birth"));
			object.put("phonenumber",rs.getString("phonenumber"));
			object.put("addressnumber",rs.getString("addressnumber"));
			object.put("address",rs.getString("address"));
			object.put("detailedaddress",rs.getString("detailedaddress"));		
		
		}
		out.print(object.toJSONString());
		System.out.println("user ok");
	}catch(Exception e){
		response.setStatus(400);
		System.out.println("error : " + e);
		
	}
%>