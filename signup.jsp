<%@page import ="java.sql.*"%>
<%@page import ="java.util.*"%>
<%@page import ="javax.mail.*"%>
<%@page import ="javax.mail.internet.*"%>


<html>
<head>
<title>Authenticate App by mayank</title>
<style>
*{font-size:50px;font-family:Cambria;}
body{background-color:lightblue;}
</style>

</head>

<body>
<center>
<h1>Signup page</h1>
<a href="index.jsp">already registered</a>
<br>
<br>
<form>

<input type="email" name="un" placeholder="Enter email"/>
<br><br>
<input type="submit" name="btn" value="Send Password"/>
</form>
<h2>Password would be send to the email></h2>

<%
if (request.getParameter("btn")!=null)
{
String un =request.getParameter("un");
String text[]={"1","2","3","4","5","6","7","8","9","0"};
String pw="";
for(int i=1;i<4;i++)
pw =pw+ text[(int)(Math.random()*text.length)];
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/mayank";
Connection con =DriverManager.getConnection(url,"root","abc123");

String sql="insert into users values(?,md5(?))";
PreparedStatement pst =con.prepareStatement(sql);
pst.setString(1,un);
pst.setString(2,pw);
pst.executeUpdate();
System.out.println(pw);


Properties p =System.getProperties();
p.put("mail.smtp.host","smtp.gmail.com");
p.put("mail.smtp.port",587);
p.put("mail.smtp.auth",true);
p.put("mail.smtp.starttls.enable",true);

Session ms= Session.getInstance(p,new Authenticator(){
public PasswordAuthentication getPasswordAuthentication(){

String un1 ="mayankwadhwani505@gmail.com";
String pw1 ="oxmovnvtclozybwx";
return new PasswordAuthentication(un1,pw1);

}
});


try
{
MimeMessage msg = new MimeMessage(ms);
String subject="mail from mayank classes";
msg.setSubject(subject);
String txt ="ur password is " +pw;
msg.setText(txt);
msg.setFrom(new InternetAddress("mayankwadhwani505@gmail.com"));
msg.addRecipient(Message.RecipientType.TO, new InternetAddress(un));
Transport.send(msg);
out.println("we will contact you soon");
}
catch(Exception e){
out.println("issue-->"+ e);
}
out.println("Registeration Done , please check your email");
con.close();
}
catch(SQLException e)
{
out.println("issue" + e);
}
}
%>
</center>
</body>
</html>


















