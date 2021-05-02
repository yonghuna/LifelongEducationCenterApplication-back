<%@page import="com.db.ConnectDB"%>
<%@ page import="java.sql.*, org.json.simple.*"%>

<%
	response.setCharacterEncoding("UTF-8");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip+ "/LifeLongEducation", "finalproject", "3579");
		
		
		String id = request.getParameter("id");

		System.out.println(id);
		
		
		String sql = "SELECT * FROM enrollment where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		JSONArray array = new JSONArray();
		while(rs.next()){		
			JSONObject object = new JSONObject();
			object.put("subjectnumber",rs.getString("subjectnumber"));
			object.put("subjectyear",rs.getString("subjectyear"));
			object.put("subjectsemester",rs.getString("subjectsemester"));
			object.put("grade",rs.getString("grade"));
			object.put("payment",rs.getString("payment"));
			object.put("Certificaterealname",rs.getString("Certificaterealname"));
			object.put("Certificaterandomname",rs.getString("Certificaterandomname"));
			System.out.println("ok");
			array.add(object);
				
		}
		out.print(array.toJSONString());
		
	}catch (Exception e){
		System.out.println("SQL 오류 : " + e);
	}
	
	
	
			
%>