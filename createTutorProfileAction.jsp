<%@ page import="java.sql.*" %>
<%
int tutorId = Integer.parseInt(request.getParameter("tutor_id"));
String bio = request.getParameter("bio");
String major = request.getParameter("major");
String subjects = request.getParameter("subjects");
String availability = request.getParameter("availability");

Connection conn = null;
PreparedStatement stmt = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/tutorfinder",
        "tutorapp",
        "StrongPassword123!"
    );

    String sql = "INSERT INTO tutor_profiles (tutor_id, bio, major, subjects, availability) VALUES (?, ?, ?, ?, ?)";
    stmt = conn.prepareStatement(sql);

    stmt.setInt(1, tutorId);
    stmt.setString(2, bio);
    stmt.setString(3, major);
    stmt.setString(4, subjects);
    stmt.setString(5, availability);

    stmt.executeUpdate();

    response.sendRedirect("searchTutors.jsp");

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
