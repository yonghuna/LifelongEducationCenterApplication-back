<%@page import="com.db.ConnectDB"%>
<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	JSONObject jObject = new JSONObject();
	response.setContentType("text/html; charset=utf-8");
	try{
		
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip +"/LifeLongEducation", "finalproject", "3579");
		
		
		
		 
		
		String pwOK = request.getParameter("pwOK"); 
		String phoneNumber = request.getParameter("phonenumber"); 
		String address = request.getParameter("address"); 
		String addressnumber = request.getParameter("addressnumber");
		String detailedAddress = request.getParameter("detailedaddress");
		String id = request.getParameter("id");
		String education = request.getParameter("education");
		String school = request.getParameter("school");
		String major = request.getParameter("major");
		String admissionmajor = request.getParameter("admissionmajor");
		String password = request.getParameter("password");
		 
		
		System.out.println(id);
		System.out.println(phoneNumber);
		System.out.println(address);
		System.out.println(pwOK);
		System.out.println(addressnumber);
		System.out.println(detailedAddress);
		System.out.println(education);
		System.out.println(school);
		System.out.println(major);
		System.out.println(admissionmajor);
		System.out.println(password);
		
	
		try{
			String sql="update INTO users (password, phonenumber, birth, address, detailedaddress,addressnumber, education, school, major, admissionmajor) VALUES (?,?,?,?,?,?,?,?,?,?) where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, phoneNumber);
			ps.setString(2, phoneNumber);
			ps.setString(3, phoneNumber);
			ps.setString(4, phoneNumber);
			ps.setString(5, phoneNumber);
			ps.setString(6, phoneNumber);
			ps.setString(7, phoneNumber);
			ps.setString(8, phoneNumber);
			ps.setString(9, phoneNumber);
			ps.setString(10, phoneNumber);
			ps.setString(11, id);
			ps.execute();
			jObject.put("result", "ok");
			System.out.println("update ok");
		}catch(Exception e){
			jObject.put("result", "false");
			System.out.println("update false : " + e);
		}
		
	}catch(Exception e){
		response.setStatus(400);
		System.out.println("db connecton false");
	}
	out.print(jObject.toJSONString());
	
%>