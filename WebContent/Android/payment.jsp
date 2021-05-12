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
		String sql ="select U.name , S.name as subjectname, S.studyfee, E.paymentnumber from enrollment as E , subject as S, user as U where E.id = U.id and ? = S.number";
	
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, number);
		
		System.out.println(" >>> SQL : " + sql + "<<<");
		rs = ps.executeQuery();
		
		
	
		if(rs.next()){
			
			object.put("name",rs.getString("name"));
			object.put("subjectname",rs.getString("subjectname"));
			object.put("studyfee",rs.getString("studyfee"));
			object.put("paymentnumber",rs.getString("paymentnumber"));
	
		}
		out.print(object.toJSONString());
		System.out.println("payment ok");
	}catch(Exception e){
		response.setStatus(400);
		System.out.println("error : " + e);
		
	}
%>