<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://3.35.11.204/LifeLongEducation", "finalproject", "3579");
		
		
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber"); 
		String pw = request.getParameter("password");
		
		
		JSONArray jArray = new JSONArray();
		JSONObject jObject = new JSONObject();
		
		try{
			String sql ="SELECT user FROM user where name = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			System.out.println(" >>> SQL : " + sql + "<<<");
			ResultSet rs = ps.executeQuery();
			
		
			if(rs.next()) {
				if (rs.getString("phoneNumber").equals(phoneNumber)){
					
					if(rs.getString("password").equals(pw)){
						jObject.put("id",rs.getString("id"));
						jArray.add(jObject);
						System.out.println("ok");
					}
					else{
						jObject.put("id", "false");
						jArray.add(jObject);
						System.out.println("error");
					}
				}
				else{
					jObject.put("id", "false");
					jArray.add(jObject);
					System.out.println("error");
				}
			
			}
		}catch (Exception e){
			System.out.println("SQL 오류");
			response.setStatus(400);
		}
		out.println(jArray.toJSONString());
		
%>