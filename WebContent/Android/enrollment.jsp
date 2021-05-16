<%@page import="com.db.ConnectDB"%>
<%@ page import="java.sql.*, org.json.simple.*"%>

<%
	response.setCharacterEncoding("UTF-8");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://" + ConnectDB.ip+ "/LifeLongEducation", "finalproject", "3579");
		
		
		String id = request.getParameter("id");

		System.out.println(id);
		
		
		String sql ="select K.name , K.division, K.startdate, K.enddate, R.subjectnumber, R.subjectyear, R.subjectsemester,  R.payment, R.grade,R.Certificaterealname,R.Certificaterandomname,R.Certificatepath from enrollment as R, subject as K where R.subjectnumber = K.number and R.id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		JSONArray array = new JSONArray();
		while(rs.next()){		
			JSONObject object = new JSONObject();
			object.put("name",rs.getString("name"));
			object.put("division",rs.getString("division"));
			object.put("startdate",rs.getString("startdate"));
			object.put("enddate",rs.getString("enddate"));
			object.put("subjectnumber",rs.getString("subjectnumber"));
			object.put("subjectyear",rs.getString("subjectyear"));
			object.put("subjectsemester",rs.getString("subjectsemester"));
			object.put("payment",rs.getString("payment"));
			object.put("grade",rs.getString("grade"));
			object.put("Certificaterealname",rs.getString("Certificaterealname"));
			object.put("Certificatepath",rs.getString("Certificatepath"));		
			System.out.println("ok");
			array.add(object);			
		}
		out.print(array.toJSONString());
		
	}catch (Exception e){
		System.out.println("SQL error : " + e);
	}
	
	
	
			
%>