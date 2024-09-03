<%-- 
    Document   : studtentlogin
    Created on : Dec 2, 2023, 1:10:31 PM
    Author     : pc
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%
        
    
        try
        {
           
        
            String user=request.getParameter("t1");
            String pass=request.getParameter("t2");
            //data base connectivity notes
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sis?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
            PreparedStatement ps=con.prepareStatement("select*from signup where username=? and password=?");
           
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rss=ps.executeQuery();
            if(rss.next())
            {
               
                         out.println("<h1>vaild User</h1>");
            %>
            <jsp:include page="StudentLogin.html"/>
            
            <%
            }
            else{
                  out.println("<h1>Invaild User.....plz try again</h1>");
 %>
            <jsp:include page="index.html"/>
            <%
           
        }}
        catch(Exception e)
        {
           try
            {
                out.println(e.getMessage());
            }
            catch(Exception ee)
            {
                
            }
        } %>
    </body>
</html>
