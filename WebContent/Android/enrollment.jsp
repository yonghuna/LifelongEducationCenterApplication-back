<%@page import="com.db.ConnectDB"%>
<%@ page import="java.sql.*, org.json.simple.*"%>

<%
	response.setCharacterEncoding("UTF-8");
	JSONArray array = new JSONArray();
	JSONObject object = new JSONObject();
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip+ "/LifeLongEducation", "finalproject", "3579");
		
		
		String id = request.getParameter("id");

		System.out.println(id);
		
		
		String sql = "SELECT * FROM enrollment where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
			
		if(rs.next()){		
			object.put("subjectnumber",rs.getString("subjectnumber"));
			System.out.println("false");
			array.add(object);
				
		}else{
			System.out.println("check ok");		
		}
		
			
	}catch (Exception e){
		System.out.println("SQL 오류 : " + e);
	}
	out.print(array.toJSONString());
	
	
			
%>