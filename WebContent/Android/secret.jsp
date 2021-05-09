<%@page import="com.db.ConnectDB"%>
<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip +"/LifeLongEducation", "finalproject", "3579");
		
		PreparedStatement ps;
		ResultSet rs;
		String id = request.getParameter("id");
	
		String sql ="Select Q.*, U.name, U.id from qna as Q, user as U where Q.id = U.id and Q.secret = 'true' and Q.id = ?" ;
		
	
		ps = con.prepareStatement(sql);
		System.out.println(" >>> SQL : " + sql + "<<<");
		ps.setString(1, id);
		rs = ps.executeQuery();
		
		
		JSONArray array = new JSONArray();
		while(rs.next()){
			JSONObject object = new JSONObject();
			object.put("number",rs.getString("number"));
			object.put("title",rs.getString("title"));
			object.put("reportingdate",rs.getString("reportingdate"));
			object.put("views",rs.getString("views"));
			object.put("contents",rs.getString("contents"));
			object.put("name",rs.getString("name"));
			object.put("id",rs.getString("id"));
			array.add(object);
		}
		out.print(array.toJSONString());
		System.out.println("qna ok");
	}catch(Exception e){
		response.setStatus(400);
		System.out.println("error : " + e);
		
	}
%>