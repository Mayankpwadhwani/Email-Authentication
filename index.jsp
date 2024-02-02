<%@page import="java.sql.*"%>

<html>
<head>

<title> Authentication by mayank</title>
<style>
*{font-size:50px; font family:cambria;}
body {background-color:lightblue;}

</style>
</head>

<body>
<center>
<h1>login page </h1>

<a href="signup.jsp"> new users click here</a>

<br><br>
<form>

<input type="email" name ="un" placeholder="Enter registered email"/>
<br><br>
<input type="password" name="pw" placeholder="Enter a password"/>
<br><br>
<input type="submit" name="btn" value="Login"/ >
</form>

<%
if (request.getParameter("btn")!=null)
{
String un=request.getParameter("un");
String pw=request.getParameter("pw");

try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url= "jdbc:mysql://localhost:/mayank";
Connection con =DriverManager.getConnection(url,"root","abc123");

String sql ="select* from users where un = ? and pw =md5(?)";
PreparedStatement pst =con.prepareStatement(sql);
pst.setString(1,un);
pst.setString(2,pw);
ResultSet rs= pst.executeQuery();
if (rs.next())
{

session.setAttribute("un",un);
response.sendRedirect("home.jsp");
}
else {
out.println("invalid length");
}
con.close();
}
catch(SQLException e)
{
out.println("issue" + e);

}
}
%></center>
</body>
</html>












