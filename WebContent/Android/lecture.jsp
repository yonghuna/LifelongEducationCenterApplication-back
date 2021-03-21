<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifelongeducationcenterapp", "root", "0000");
		
		String sql ="select * from lecture";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		JSONArray array = new JSONArray();
		while(rs.next()){
			JSONObject object = new JSONObject();
			object.put("LectureName",rs.getString("LectureName"));
			object.put("LecturePeriod",rs.getString("LecturePeriod"));
			object.put("LectureProfessor",rs.getString("LectureProfessor"));
			object.put("LectureTime",rs.getString("LectureTime"));
			object.put("LectureStudyfee",rs.getString("LectureStudyfee"));
			array.add(object);
		}
		out.print(array.toJSONString());
	}catch(Exception e){
		response.setStatus(400);
	}
%>