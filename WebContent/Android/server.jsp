<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>

<%
	Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/디비", "디비아이디" , "패스워드");    
   
    ResultSet rs = null;
    PreparedStatement stmt = null;
    boolean flagStatus = false;

 	// 초기 선언
 	JSONObject jsonMain = new JSONObject();
 	JSONArray jArray = new JSONArray();
 	JSONObject jObject = new JSONObject();
       
    String Key = request.getParameter("Serial_key");        
    // CHECKING DATA EXIST
    try{
    	String sql = " 쿼리를 만들어 넣어주세요 ";    	
   		stmt = conn.prepareStatement(sql);
   		rs = stmt.executeQuery();
   		
   		if(rs.next()){
   		    // 안드로이드로 보낼 메시지를 만듬
   			jObject.put("START_TIME", rs.getString("START_TIME"));
   			jObject.put("STOP_TIME", rs.getString("STOP_TIME"));
   			jObject.put("REG_TIME", rs.getString("REG_TIME"));		
   		    // 위에서 만든 각각의 객체를 하나의 배열 형태로 만듬
   			jArray.add(0, jObject);   			
   		    // 최종적으로 배열을 하나로 묶음
   			jsonMain.put(rs.getString("SERIAL_KEY"), jArray);   		    
   		    // 안드로이드에 보낼 데이터를 출력
   			out.println(jsonMain.toJSONString());   		    
		}else{			
			conn.close();
		} 	       		   		
    }catch(SQLException sqlex){   
        application.log("[Select_Time_info.jsp-로그] sqlex="+sqlex.getMessage());
   	}catch(Exception ex){
   		application.log("[Select_Time_info.jsp-로그] ex="+ex.getMessage());
   	}finally{
   		if(rs!=null)
   			try{rs.close();
   			}catch(SQLException ex){}
   		if(conn!=null)
   			try{conn.close();
   			}catch(SQLException ex){}
   		
   	}     


%>
