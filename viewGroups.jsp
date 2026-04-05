<%@ page import="java.sql.*" %>
<h2>Study Groups</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>Title</th>
        <th>Course Code</th>
        <th>Owner ID</th>
        <th>Location</th>
    </tr>

<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/tutorfinder",
        "tutorapp",
        "StrongPassword123!"
    );

    stmt = conn.createStatement();
    rs = stmt.executeQuery("SELECT * FROM study_groups");

    while (rs.next()) {
%>
    <tr>
        <td><%= rs.getString("title") %></td>
        <td><%= rs.getString("course_code") %></td>
        <td><%= rs.getInt("owner_id") %></td>
        <td><%= rs.getString("location") %></td>
    </tr>
<%
    }
} catch (Exception e) {
%>
    <tr>
        <td colspan="4">Error: <%= e.getMessage() %></td>
    </tr>
<%
} finally {
    try { if (rs != null) rs.close(); } catch (Exception e) {}
    try { if (stmt != null) stmt.close(); } catch (Exception e) {}
    try { if (conn != null) conn.close(); } catch (Exception e) {}
}
%>
</table>

<br>
<a href="index.jsp">Back to Home</a>
