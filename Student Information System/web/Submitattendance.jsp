<%-- 
    Document   : write
    Created on : Nov 18, 2023, 10:18:45 AM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>

<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        try       {
             Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sis?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
           PreparedStatement ps=con.prepareStatement("select * from attendance");
           ResultSet rs=ps.executeQuery();
            File f=new File("D://","attendance.txt");
            f.createNewFile();
            FileWriter fw=new FileWriter(f,true);
            String d=request.getParameter("date");
            fw.write(d+"\n");
            fw.write("Name\t\tRoLLNo\t\tStatus\n");
            fw.write("--------------------------------------------\n");
            int total=Integer.parseInt(session.getAttribute("total").toString());
           
            int i=1;
            while(i<=total){
            rs.next();
            String n=rs.getString(1);
            String r=rs.getString(2);
             String s=request.getParameter(String.valueOf(i));
             fw.write(n+"\t\t"+r+"\t\t"+s+"\n");
             fw.write("---------------------------------------------\n");
             i=i+1;
            }
           
            fw.close();
            out.println("Data Saved");
        }
        catch(Exception e)
        {
        
        }
        %>
    </body>
</html>