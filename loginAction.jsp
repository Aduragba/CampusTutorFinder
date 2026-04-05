<%@ page import="java.sql.*" %>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");

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

    String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
    stmt = conn.prepareStatement(sql);
    stmt.setString(1, email);
    stmt.setString(2, password);

    rs = stmt.executeQuery();

    if (rs.next()) {
%>
        <h2>Login successful!</h2>
        <p>Welcome, <%= rs.getString("name") %></p>
        <p>Role: <%= rs.getString("role") %></p>
        <a href="index.jsp">Go to Home</a>
<%
    } else {
%>
        <h2>Invalid email or password.</h2>
        <a href="login.jsp">Try Again</a>
<%
    }
} catch (Exception e) {
%>
    <h2>Error occurred:</h2>
    <pre><%= e.getMessage() %></pre>
<%
} finally {
    try { if (rs != null) rs.close(); } catch (Exception e) {}
    try { if (stmt != null) stmt.close(); } catch (Exception e) {}
    try { if (conn != null) conn.close(); } catch (Exception e) {}
}
%>
