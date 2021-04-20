<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://54.180.105.45:3306/LifeLongEducation", "finalproject", "3579");
		
		PreparedStatement ps;
		ResultSet rs;
		
		String number = request.getParameter("number");
		String sql ="select * from subjectbyweek where number = ?" ;
		
	
	
		ps = con.prepareStatement(sql);
		ps.setString(1, number);
		System.out.println(" >>> SQL : " + sql + "<<<");
		System.out.println(number);
		rs = ps.executeQuery();
		
		
		JSONArray array = new JSONArray();
		while(rs.next()){
			JSONObject object = new JSONObject();
			object.put("week",rs.getString("week"));
			object.put("contents",rs.getString("contents"));
			array.add(object);
		}
		System.out.println("detail of week ok");
		out.print(array.toJSONString());
	}catch(Exception e){
		response.setStatus(400);
		System.out.println("detail of week false");
	}
%>