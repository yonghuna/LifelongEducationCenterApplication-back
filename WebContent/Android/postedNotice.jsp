<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://54.180.105.45:3306/LifeLongEducation", "finalproject", "3579");
		
		PreparedStatement ps;
		ResultSet rs;
		
		String division = request.getParameter("division");
		String sql ="select * from subject where division = ?" ;
		
	
		ps = con.prepareStatement(sql);
		ps.setString(1, division);
		System.out.println(" >>> SQL : " + sql + "<<<");
		System.out.println(division);
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
			object.put("number",rs.getInt("number"));
			
			array.add(object);
		}
		out.print(array.toJSONString());
		System.out.println("0");
	}catch(Exception e){
		response.setStatus(400);
		System.out.println("error : " + e);
		
	}
%>