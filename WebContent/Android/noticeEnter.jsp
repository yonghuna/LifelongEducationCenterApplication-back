<%@page import="com.db.ConnectDB"%>
<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	JSONObject object = new JSONObject();
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip +"/LifeLongEducation", "finalproject", "3579");
		
	
		ResultSet rs;
		
		String number= request.getParameter("number");
		System.out.println(number);
		String sql ="select * from notice where number = ?";
	
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, number);
		
		System.out.println(" >>> SQL : " + sql + "<<<");
		rs = ps.executeQuery();
		
		
	
		if(rs.next()){
			
			object.put("number",rs.getString("number"));
			object.put("title",rs.getString("title"));
			object.put("reportingdate",rs.getString("reportingdate"));
			object.put("views",rs.getString("views"));
			object.put("contents",rs.getString("contents"));
			
			
		}
		out.print(object.toJSONString());
		System.out.println("noticeEnter ok");
	}catch(Exception e){
		response.setStatus(400);
		System.out.println("error : " + e);
		
	}
%>