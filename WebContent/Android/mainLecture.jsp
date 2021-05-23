<%@page import="com.db.ConnectDB"%>
<%@ page import= "java.sql.*, org.json.simple.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	response.setCharacterEncoding("UTF-8");

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip +"/LifeLongEducation", "finalproject", "3579");
		
		PreparedStatement ps;
		ResultSet rs;
		
		//String division = request.getParameter("division");
		String sql ="select S.name, S.number,S.division, K.divisiondetail,S.startdate,S.enddate from subject as S, subjectkind as K where S.division=K.division and S.status = "+"?"+" limit 3";
		
	
		ps = con.prepareStatement(sql);
		ps.setString(1, "수강신청");
		System.out.println(" >>> SQL : " + sql + "<<<");
		rs = ps.executeQuery();
		
		
		JSONArray array = new JSONArray();
		while(rs.next()){
			JSONObject object = new JSONObject();
			object.put("name",rs.getString("name"));
			object.put("division",rs.getString("division"));
			object.put("divisiondetail",rs.getString("divisiondetail"));
			object.put("startdate",rs.getString("startdate"));
			object.put("enddate",rs.getString("enddate"));
			object.put("number",rs.getInt("number"));
			array.add(object);
		}
		out.print(array.toJSONString());
		System.out.println("main lecture OK");
	}catch(Exception e){
		response.setStatus(400);
		System.out.println("error : " + e);
		
	}
%>

