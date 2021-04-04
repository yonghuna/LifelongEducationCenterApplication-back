<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifelongeducationcenterapp", "root", "0000");
		
		
		String course = request.getParameter("course");
		String name = request.getParameter("name"); 
		String birthday = request.getParameter("birthday");
		String phoneNumber = request.getParameter("phoneNumber"); 
		String address = request.getParameter("address"); 
		String pw = request.getParameter("pw");
		

		
		String sql="insert into example(phoneNumber, pw, course, address, birthday, name) values(?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
	
		ps.setString(1, phoneNumber);
		ps.setString(2, pw);
		ps.setString(3, course);
		ps.setString(4, address);
		ps.setString(5, birthday);
		ps.setString(6, name);
		ps.execute();
	}catch(Exception e){
		response.setStatus(400);
	}
%>