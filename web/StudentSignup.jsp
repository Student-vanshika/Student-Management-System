<%-- 
    Document   : studentsignup
    Created on : Dec 2, 2023, 12:59:14 PM
    Author     : pc
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Questions</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%
        
    
        try
        {
          
        
            String u=request.getParameter("t1");
            String p=request.getParameter("t2");
            String rn=request.getParameter("t3");
            String c=request.getParameter("t4");
          
            //data base connectivity notes
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sis?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
            PreparedStatement ps=con.prepareStatement("insert into signup (username,password,course,rollno)values(?,?,?,?)");
            ps.setString(1,u);
            ps.setString(2,p);
            ps.setString(3,rn);
            ps.setString(4,c);
            
            ps.executeUpdate();
            
            {out.println("added successfully");
         %>
        <h1> <a href="index.html"> Add another Student </a> </h1>
        <%
            }
            
        }
catch(Exception e)
        {
           
                out.println(e.getMessage());
           
                
            }
        
        %>
    </body>
</html>
