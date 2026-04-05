<%@ page import="java.sql.*" %>
<%
String groupName = request.getParameter("groupName");
String subject = request.getParameter("subject");

Connection conn = null;
PreparedStatement stmt = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/tutorfinder",
        "tutorapp",
        "StrongPassword123!"
    );

    String sql = "INSERT INTO study_groups (owner_id, course_code, title, description, location) VALUES (?, ?, ?, ?, ?)";
    stmt = conn.prepareStatement(sql);

    stmt.setInt(1, 1); // hardcoded for now
    stmt.setString(2, subject); // course_code
    stmt.setString(3, groupName); // title
    stmt.setString(4, "Created through web form");
    stmt.setString(5, "TBD");

    stmt.executeUpdate();

    response.sendRedirect("viewGroups.jsp");

} catch (Exception e) {
%>
    <h2>Error occurred:</h2>
    <pre><%= e.getMessage() %></pre>
<%
} finally {
    try { if (stmt != null) stmt.close(); } catch (Exception e) {}
    try { if (conn != null) conn.close(); } catch (Exception e) {}
}
%>
