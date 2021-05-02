<%@page import="com.db.ConnectDB"%>
<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	JSONObject jObject = new JSONObject();
	String sql;
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
		 
		
		System.out.println(id);
		System.out.println(phoneNumber);
		System.out.println(address);
		System.out.println(pwOK);
		System.out.println(addressnumber);
		System.out.println(detailedAddress);
		
		
	
		try{
			if(pwOK.equals("ok")){
				String password = request.getParameter("password");
				System.out.println(password);
				sql="update user set phonenumber = ?, addressnumber = ?, address = ?, detailedaddress = ?, password = ? where id = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, phoneNumber);
				ps.setString(2, addressnumber);
				ps.setString(3, address);
				ps.setString(4, detailedAddress);
				ps.setString(5, password);
				ps.setString(6, id);
				ps.execute();
				jObject.put("result", "ok");
				System.out.println("password in ok");
			}else{
				sql= "update user set phonenumber = ?, addressnumber = ?, address = ?, detailedaddress = ? where id = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, phoneNumber);
				ps.setString(2, addressnumber);
				ps.setString(3, address);
				ps.setString(4, detailedAddress);
				ps.setString(5, id);
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