<%@page import="com.db.ConnectDB"%>
<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
JSONObject jObject = new JSONObject();
	response.setContentType("text/html; charset=utf-8");
	try{
		
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip +"/LifeLongEducation", "finalproject", "3579");
		
		
		String course = request.getParameter("course");
		String name = request.getParameter("name"); 
		String birthday = request.getParameter("birthday");
		String phoneNumber = request.getParameter("phoneNumber"); 
		String address = request.getParameter("address"); 
		String pw = request.getParameter("pw");
		String addressnumber = request.getParameter("addressNumber");
		String detailedAddress = request.getParameter("detailedAddress");
		String sex = request.getParameter("sex"); 
		
		System.out.println(course);
		System.out.println(name);
		System.out.println(birthday);
		System.out.println(phoneNumber);
		System.out.println(address);
		System.out.println(pw);
		System.out.println(addressnumber);
		System.out.println(detailedAddress);
		System.out.println(sex);
		
	
		try{
			String sql="insert into user(phonenumber, password, course, addressnumber, address, detailedaddress, birth, name, sex) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, phoneNumber);
			ps.setString(2, pw);
			ps.setString(3, course);
			ps.setString(4, addressnumber);
			ps.setString(5, address);
			ps.setString(6, detailedAddress);
			ps.setString(7, birthday);
			ps.setString(8, name);
			ps.setString(9, sex);
			ps.execute();
			jObject.put("result", "ok");
			System.out.println("ok");
		}catch(Exception e){
			jObject.put("result", "false");
			System.out.println("register : " + e);
		}
		
	}catch(Exception e){
		response.setStatus(400);
		System.out.println("db connecton false");
	}
	out.print(jObject.toJSONString());
	
%>