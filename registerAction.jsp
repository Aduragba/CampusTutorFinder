<%@ page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");
String role = request.getParameter("role");

Connection conn = null;
PreparedStatement stmt = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/tutorfinder",
        "tutorapp",
        "StrongPassword123!"
    );

    String sql = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";
    stmt = conn.prepareStatement(sql);
    stmt.setString(1, name);
    stmt.setString(2, email);
    stmt.setString(3, password);
    stmt.setString(4, role);

    int rows = stmt.executeUpdate();

    if (rows > 0) {
%>
        <h2>Registration successful!</h2>
        <a href="register.jsp">Register another user</a><br>
        <a href="index.jsp">Back to home</a>
<%
    } else {
%>
        <h2>Registration failed.</h2>
<%
    }
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
