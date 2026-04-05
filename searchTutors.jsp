<%@ page import="java.sql.*" %>
<h2>Search Tutors</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Subjects</th>
        <th>Availability</th>
        <th>Major</th>
    </tr>

<%
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/tutorfinder",
        "tutorapp",
        "StrongPassword123!"
    );

    String sql = "SELECT u.name, u.email, tp.subjects, tp.availability, tp.major " +
                 "FROM users u JOIN tutor_profiles tp ON u.user_id = tp.tutor_id " +
                 "WHERE u.role = 'TUTOR'";

    stmt = conn.prepareStatement(sql);
    rs = stmt.executeQuery();

    while (rs.next()) {
%>
    <tr>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("subjects") %></td>
        <td><%= rs.getString("availability") %></td>
        <td><%= rs.getString("major") %></td>
    </tr>
<%
    }
} catch (Exception e) {
%>
    <tr>
        <td colspan="5">Error: <%= e.getMessage() %></td>
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
