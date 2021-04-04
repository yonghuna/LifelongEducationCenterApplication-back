<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifelongeducationcenterapp", "root", "0000");
		
		
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber"); 
		String pw = request.getParameter("pw");
		
		
		try{
			String sql ="SELECT * FROM example where name = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			System.out.println(" >>> SQL : " + sql + "<<<");
			ResultSet rs = ps.executeQuery();
			
			JSONObject object = new JSONObject();
			if(rs.next()) {
				if (rs.getString("phoneNumber").equals(phoneNumber)){
					if(rs.getString("pw").equals(pw)){
						object.put("name", rs.getString("name"));
						object.put("phoneNumber", rs.getString("phoneNumber"));
						object.put("pw", rs.getString("pw"));
					}
				}
			}
			out.print(object.toJSONString());
		}catch (Exception e){
			response.setStatus(400);
		}
		
		
%>