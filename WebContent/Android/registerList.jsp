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
		
		String division = request.getParameter("division");
		String id = request.getParameter("id");
		String sql ="select S.*, E.id from subject as S left outer join enrollment as E on S.number = E.subjectnumber where status = '수강불가' and division = ? union select S.*, E.id from subject as S left outer join enrollment as E on S.number = E.subjectnumber where status = '수강신청' and division = ? and id = ? union select S.*, E.id from subject as S left outer join enrollment as E on E.subjectnumber= null where status = '수강신청' and division = ? and not S.number = ANY(select S.number from subject as S left outer join enrollment as E on S.number = E.subjectnumber where status = '수강신청' and division = ? and id = ?)";
		
	
		ps = con.prepareStatement(sql);
		ps.setString(1, division);
		ps.setString(2, division);
		ps.setString(3, id);
		ps.setString(4, division);
		ps.setString(5, division);
		ps.setString(6, id);
		System.out.println(" >>> SQL : " + sql + "<<<");
		System.out.println(division);
		System.out.println(id);
		rs = ps.executeQuery();
		
		
		JSONArray array = new JSONArray();
		while(rs.next()){
			JSONObject object = new JSONObject();
			object.put("name",rs.getString("name"));
			object.put("startdate",rs.getString("startdate"));
			object.put("enddate",rs.getString("enddate"));
			object.put("studyfee",rs.getString("studyfee"));
			object.put("starttime",rs.getString("starttime"));
			object.put("endtime",rs.getString("endtime"));
			object.put("dayoftheweek",rs.getString("dayoftheweek"));
			object.put("professor",rs.getString("professor"));
			object.put("status",rs.getString("status"));
			object.put("id",rs.getString("id"));
			object.put("division",rs.getString("division"));
			object.put("number",rs.getInt("number"));
			object.put("year",rs.getInt("year"));
			object.put("semester",rs.getInt("semester"));
			System.out.println("ok");
			array.add(object);
		}
		out.print(array.toJSONString());
		System.out.println("ok");
	}catch(Exception e){
		response.setStatus(400);
		System.out.println("error : " + e);
		
	}
%>
