<%-- 
    Document   : attendence
    Created on : 16-Nov-2023, 10:29:04 am
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <center>
             <form  action="Submitattendance.jsp">
                 Date:<input type="text" name="date"/>&nbsp;&nbsp;
             <table border="2"><tr><th>Name</th><th>Roll No</th><th>Attendance</th></tr>
      
        <%
       
         try
            {
            //data base connectivity notes
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sis?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","root");
            PreparedStatement ps=con.prepareStatement("select * from attendance");
            ResultSet rs=ps.executeQuery();
            int i=1;
            while(rs.next())
            {%>

           <tr><td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><input type="radio" name="<%=String.valueOf(i)%>"  value="Absent"/>Absent&nbsp;&nbsp;&nbsp;<input type="radio" name="<%=String.valueOf(i)%>" value="Present"/>Present</td></tr>
                
            <% i++;}
            session.setAttribute("total",i-1);
            }
            catch(Exception e)
            {
            out.println(e.getMessage());
            }
       
        %>
             </table>
           
                 <input type="submit" value="submit attendance"/>
             </form>
 </center>
         </body>
</html>