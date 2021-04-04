<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifelongeducationcenterapp", "root", "0000");
		
		
		String id = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber"); 
		String pw = request.getParameter("pw");
		
		String sql ="select * from example where id = ? and phoneNumber = ? and pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		
	}catch(Exception e){
		response.setStatus(400);
	}
%>