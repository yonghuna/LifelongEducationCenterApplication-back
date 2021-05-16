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
		int number = Integer.parseInt(request.getParameter("number")); 
	
		System.out.println(id);
		System.out.println(number);
	
	
			String sql ="select S.*, E.id from subject as S left outer join enrollment as E on S.number = E.subjectnumber where status = '수강불가' and division = '외국어과정' union select S.*, E.id from subject as S left outer join enrollment as E on S.number = E.subjectnumber where status = '수강신청' and division = '외국어과정' and id = '2021000011' union select S.*, E.id from subject as S left outer join enrollment as E on E.subjectnumber= null where status = '수강신청' and division = '외국어과정' and not S.number = (select S.number from subject as S left outer join enrollment as E on S.number = E.subjectnumber where status = '수강신청' and division = '외국어과정' and id = '2021000011')";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, number);
			ps.setString(2, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				jObject.put("result", "ok");
				System.out.println("check ok");
					
			}else{
				System.out.println("check none");
				jObject.put("result", "false");
			}
			
	}catch(Exception e){
		response.setStatus(400);
		System.out.println("error" + e);
	}
	out.print(jObject.toJSONString());
	
%>