<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");

	response.setContentType("text/html; charset=utf-8");
	try{
		JSONArray jArray = new JSONArray();
		JSONObject jObject = new JSONObject();
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://54.180.105.45:3306/LifeLongEducation", "finalproject", "3579");
		
		
		String course = request.getParameter("course");
		String name = request.getParameter("name"); 
		String birthday = request.getParameter("birthday");
		String phoneNumber = request.getParameter("phoneNumber"); 
		String address = request.getParameter("address"); 
		String pw = request.getParameter("pw");
		String addressnumber = request.getParameter("addressNumber");
		String detailedAddress = request.getParameter("detailedAddress");
		
		System.out.println(phoneNumber);
		System.out.println(pw);
		System.out.println(course);
		System.out.println(address);
		System.out.println(birthday);
		System.out.println(name);
		System.out.println(addressnumber);
		System.out.println(detailedAddress);
		
	
		try{
			String sql="insert into user(phonenumber, password, course, addressnumber, address, detailedaddress, birth, name) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, phoneNumber);
			ps.setString(2, pw);
			ps.setString(3, course);
			ps.setString(4, addressnumber);
			ps.setString(5, address);
			ps.setString(6, detailedAddress);
			ps.setString(7, birthday);
			ps.setString(8, name);
			ps.execute();
			jObject.put("result", "ok");
			jArray.add(jObject);
			System.out.println("ok");
		}catch(Exception e){
			jObject.put("result", "false");
			jArray.add(jObject);
			System.out.println("false");
		}
		
	}catch(Exception e){
		response.setStatus(400);
		
	}
%>