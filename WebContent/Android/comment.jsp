<%@page import="com.db.ConnectDB"%>
<%@ page import="java.sql.*, org.json.simple.*"%>

<%
	response.setCharacterEncoding("UTF-8");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip+ "/LifeLongEducation", "finalproject", "3579");
		
		
		int number = Integer.parseInt(request.getParameter("number"));

		System.out.println(number);
		
		
		String sql ="select * from qna_post where number = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, number);
		ResultSet rs = ps.executeQuery();
		JSONArray array = new JSONArray();
		while(rs.next()){		
			JSONObject object = new JSONObject();
			object.put("date",rs.getString("date"));
			object.put("contents",rs.getString("contents"));
			System.out.println("qna_comment ok");
			array.add(object);			
		}
		out.print(array.toJSONString());
		
	}catch (Exception e){
		System.out.println("SQL 오류 : " + e);
	}
	
	
	
			
%>