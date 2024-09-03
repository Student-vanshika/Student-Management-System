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
          
        
            String sn=request.getParameter("t1");
            String fn=request.getParameter("t2");
            String dob=request.getParameter("t3");
            String m=request.getParameter("t4");
            String e=request.getParameter("t5");
            String ad=request.getParameter("t6");
            String c=request.getParameter("t7");
          
            //data base connectivity notes
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sis?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
            PreparedStatement ps=con.prepareStatement("insert into studentregistration (studentname,fathername,dateofbirth,mobileno,email,address,course)values(?,?,?,?,?,?,?)");
            ps.setString(1,sn);
            ps.setString(2,fn);
            ps.setString(3,dob);
            ps.setString(4,m);
            ps.setString(5,e);
            ps.setString(6,ad);
            ps.setString(7,c);
            
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
