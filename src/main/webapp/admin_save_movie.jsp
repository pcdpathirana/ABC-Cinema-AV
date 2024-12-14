<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%
    String title = request.getParameter("title");
    String genre = request.getParameter("coverurl");
    String releaseDate = request.getParameter("status");
    int duration = Integer.parseInt(request.getParameter("action"));

    Connection conn = (Connection) application.getAttribute("DBConnection");
    String query = "INSERT INTO movie (title, coverurl, status, action) VALUES (?, ?, ?, ?)";

    try {
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, title);
        pstmt.setString(2, genre);
        pstmt.setString(3, releaseDate);
        pstmt.setInt(4, duration);
        pstmt.executeUpdate();
        response.sendRedirect("list_movies.jsp");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
