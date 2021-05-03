<%@page import="com.db.ConnectDB"%>
<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip +"/LifeLongEducation", "finalproject", "3579");
		
		PreparedStatement ps;
		ResultSet rs;
		
		String number = request.getParameter("number");
		String sql ="select * from subject where number = ?" ;
		
	
	
		ps = con.prepareStatement(sql);
		ps.setString(1, number);
		System.out.println(" >>> SQL : " + sql + "<<<");
		System.out.println(number);
		rs = ps.executeQuery();
		
		JSONArray array = new JSONArray();
		JSONObject object = new JSONObject();
		while(rs.next()){
			
			object.put("name",rs.getString("name"));
			object.put("startdate",rs.getString("startdate"));
			object.put("enddate",rs.getString("enddate"));
			object.put("studyfee",rs.getString("studyfee"));
			object.put("starttime",rs.getString("starttime"));
			object.put("endtime",rs.getString("endtime"));
			object.put("dayoftheweek",rs.getString("dayoftheweek"));
			object.put("professor",rs.getString("professor"));
			object.put("briefhistory", rs.getString("briefhistory"));
			object.put("introduce", rs.getString("introduce"));
			object.put("datedetail", rs.getString("datedetail"));
			object.put("status", rs.getString("status"));
			object.put("yaer", rs.getInt("year"));
			object.put("semester", rs.getInt("semester"));
			
			array.add(object);
			System.out.println("lecture detail ok");
		}
		out.print(array.toJSONString());
	}catch(Exception e){
		response.setStatus(400);
		System.out.println("detail error" + e);
	}
%>