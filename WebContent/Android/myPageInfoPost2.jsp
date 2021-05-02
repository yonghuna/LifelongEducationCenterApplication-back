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
		
		
	
		try{
			if(pwOK.equals("ok")){
				String password = request.getParameter("password");
				System.out.println(password);
				String sql="update user set password = ?, phonenumber = ?, address = ?, detailedaddress = ?,addressnumber = ?, education = ?, school = ?, major = ?, admissionmajor = ? where id = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, password);
				ps.setString(2, phoneNumber);
				ps.setString(3, address);
				ps.setString(4, detailedAddress);
				ps.setString(5, addressnumber);
				ps.setString(6, education);
				ps.setString(7, school);
				ps.setString(8, major);
				ps.setString(9, addressnumber);
				ps.setString(10, id);
				jObject.put("result", "ok");
				System.out.println("update ok");
			}else {
				String sql="update user set phonenumber = ?, address = ?, detailedaddress = ?,addressnumber = ?, education = ?, school = ?, major = ?, admissionmajor = ? where id = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, phoneNumber);
				ps.setString(2, address);
				ps.setString(3, detailedAddress);
				ps.setString(4, addressnumber);
				ps.setString(5, education);
				ps.setString(6, school);
				ps.setString(7, major);
				ps.setString(8, addressnumber);
				ps.setString(9, id);
				ps.execute();
				jObject.put("result", "ok");
				System.out.println("update ok");
			}
		
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