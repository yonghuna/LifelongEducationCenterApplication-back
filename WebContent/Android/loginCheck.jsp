<%@page import="com.db.ConnectDB"%>
<%@ page import="java.sql.*, org.json.simple.*"%>

<%
	response.setCharacterEncoding("UTF-8");
	JSONObject object = new JSONObject();
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip+ "/LifeLongEducation", "finalproject", "3579");
		
		
		String name = request.getParameter("name");
		String birth = request.getParameter("birth"); 
		String sex = request.getParameter("sex");
		
		System.out.println(name);
		System.out.println(birth);
		System.out.println(sex);
	
		
	
		String sql ="SELECT * FROM user where name = ? and birth = ? and sex = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, birth);
		ps.setString(3, sex);
		ResultSet rs = ps.executeQuery();
			
		
		if(rs.next()){
			object.put("result", "have");
			System.out.println("check false");
				
		}else{
			System.out.println("check ok");
			object.put("result", "ok");
		}
		
			
	}catch (Exception e){
		object.put("result", "id");
		System.out.println("SQL 오류 : " + e);
	}
	out.print(object.toJSONString());
	
	
			
%>