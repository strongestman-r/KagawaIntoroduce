<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://map.yahooapis.jp/js/V1/jsapi?appid
=dj00aiZpPUI5b2JlM21DOEk5TyZzPWNvbnN1bWVyc2VjcmV0Jng9NzY-"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>
<script src="yaddressmaps.js"></script>
<script type="text/javascript">
</script>
<title>香川県観光地紹介サービス</title>
</head>
<body>
<p><font size="5" color="green">香川県観光地紹介サービス</font></p>
<p>香川県の観光地スポットを紹介しています。</p>
<p>タグを選択すると観光地を紹介します。</p>
<form name="form1">
<input type="radio" name="field1" value="自然が多い">自然が多い
<input type="radio" name="field1" value="景色がきれい">景色がきれい
<input type="radio" name="field1" value="人気がある">人気がある
<input type="radio" name="field1" value="食事がおいしい">食事がおいしい
<input type="submit" value="選択">
</form>
<% 
String q = request.getParameter("field1");
if(q != null){
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	String url = "jdbc:mysql://localhost/mydb?characterEncoding=UTF-8";
	Connection conn = DriverManager.getConnection(url,"test","pass");

	PreparedStatement stmt = conn.prepareStatement(
			"SELECT * FROM tourist WHERE features=?");
	stmt.setString(1,q);

	out.println("<p>"+"<font size=2 color=green>"+q+"の特徴を持つ観光スポット"+"</font>"+"</p>");
	ResultSet rs = stmt.executeQuery();

	while(rs.next()){
		String Spot_No = rs.getString("Spot_No");
		String Spot_Name = rs.getString("Spot_Name");
		String Description = rs.getString("Description");
		
		out.println("<p>"+"<font size=4 color=red>"+Spot_No+" "+Spot_Name+
				"</font>"+"</p>");
		out.println("<a href="+Spot_No+".jsp>"+"→詳細"+"</a>");
	}
	rs.close();
	stmt.close();
	conn.close();
}
%>
</body>
</html>