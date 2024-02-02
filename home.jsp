<html>
<head>

<title> Authenticate App by mayank</title>
<style>
*{font-size:50px; font family:Cambria;}
body {background-color:lightblue;}
</style>
</head>

<body>
<center>

<h1>Home page</h1>

<%
String un=  (String)session.getAttribute("un");
if (un == null)
{

response.sendRedirect("index.jsp");
}
else {
out.println("Welcome " +un);
}

%>
<form>
<input type ="submit" name ="btn" value ="Logout"/> 
</form>
<%
if(request.getParameter("btn") !=null)
{
session.invalidate();
response.sendRedirect("index.jsp");

}
%>
</center>
</body>
</html>

