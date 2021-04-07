<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifelongeducationcenterapp", "root", "0000");
		
		
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber"); 
		String pw = request.getParameter("pw");
		
		
		JSONArray jArray = new JSONArray();
		JSONObject jObject = new JSONObject();
		
		try{
			String sql ="SELECT * FROM example where name = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			System.out.println(" >>> SQL : " + sql + "<<<");
			ResultSet rs = ps.executeQuery();
			
		
			if(rs.next()) {
				if (rs.getString("phoneNumber").equals(phoneNumber)){
					
					if(rs.getString("pw").equals(pw)){
						jObject.put("result", "ok");
						jArray.add(jObject);
						System.out.println("ok");
					}
					else{
						jObject.put("result", "false");
						jArray.add(jObject);
						System.out.println("error");
					}
				}
				else{
					jObject.put("result", "false");
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