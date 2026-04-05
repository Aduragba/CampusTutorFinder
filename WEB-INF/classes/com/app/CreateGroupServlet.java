package com.app;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class CreateGroupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String groupName = request.getParameter("groupName");
        String subject = request.getParameter("subject");
        String createdBy = request.getParameter("createdBy");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/tutorfinder",
                "tutorapp",
                "StrongPassword123!"
            );

            String sql = "INSERT INTO study_groups (group_name, subject, created_by) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, groupName);
            stmt.setString(2, subject);
            stmt.setString(3, createdBy);

            stmt.executeUpdate();

            response.sendRedirect("viewGroups.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
