<%@page import="com.db.ConnectDB"%>
<%@ page import= "java.sql.*, org.json.simple.*" %>

<%
	response.setCharacterEncoding("UTF-8");
	JSONObject jObject = new JSONObject();
	response.setContentType("text/html; charset=utf-8");
	try{
		
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip +"/LifeLongEducation", "finalproject", "3579");
		
		
		String id = request.getParameter("id");
		String subjectnumber = request.getParameter("subjectnumber"); 
		String subjectyear = request.getParameter("subjectyear");
		String subjectsemester = request.getParameter("subjectsemester"); 
		String subjectdivision = request.getParameter("subjectdivision"); 
		
		
		System.out.println(id);
		System.out.println(subjectnumber);
		System.out.println(subjectyear);
		System.out.println(subjectsemester);
		System.out.println(subjectdivision);
	
		
	
		try{
			String sql="insert into enrollment(id, subjectnumber, subjectyear, subjectsemester, subjectdivision) values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, subjectnumber);
			ps.setString(3, subjectyear);
			ps.setString(4, subjectsemester);
			ps.setString(5, subjectdivision);
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