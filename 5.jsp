<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
html,body{height:100%;}
</style>
<script src="https://map.yahooapis.jp/js/V1/jsapi?appid
=dj00aiZpPUI5b2JlM21DOEk5TyZzPWNvbnN1bWVyc2VjcmV0Jng9NzY-"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>
<script src="yaddressmaps.js"></script>
<script>
$(document).ready(function(){
	$("#button").click(function(){
		var address=$("#address").val();
		drawMap(address);
	})
})
</script>
<title>Insert title here</title>
</head>
<body>
<% 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String url = "jdbc:mysql://localhost/mydb?characterEncoding=UTF-8";
	Connection conn = DriverManager.getConnection(url,"test","pass");

	PreparedStatement stmt = conn.prepareStatement(
			"SELECT * FROM tourist WHERE Spot_No='5'");

	ResultSet rs = stmt.executeQuery();

	while(rs.next()){
		String Spot_No = rs.getString("Spot_No");
		String Spot_Name = rs.getString("Spot_Name");
		String Description = rs.getString("Description");
		
		out.println("<p>"+"<font size=4 color=red>"+Spot_Name+
				"</font>"+"</p>"+"<p>"+Description+"</p>");
	}
%>
<p><img src="5.jpg" width="100%" height="100%"></p>
<input id="address" type="text" value="香川県小豆郡土庄町" size="50" />
<button id="button">地図を作る</button>
<div id="map_canvas" style="width:100%;height:90%;"></div>
</body>
</html>