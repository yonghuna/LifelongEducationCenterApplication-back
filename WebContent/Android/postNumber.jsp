<%@page import="com.db.ConnectDB"%>
<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	JSONObject object = new JSONObject();
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip +"/LifeLongEducation", "finalproject", "3579");
		
	
		ResultSet rs;
		
		int number = Integer.parseInt(request.getParameter("number"));
	
		
		System.out.println(number);
		String sql ="select count(number) from qna_post WHERE number = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, number);
	
		
		System.out.println(" >>> SQL : " + sql + "<<<");
		rs = ps.executeQuery();
		
		
		if(rs.next()){
			object.put("count",rs.getInt("count(number)"));
			System.out.println("postnumber ok");
		}
		out.print(object.toJSONString());
		
	}catch(Exception e){
		response.setStatus(400);
		System.out.println("error : " + e);
		
	}
%>