<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Details</title>
        <style>
            /* General Styles */
            body {
                margin: 0;
                font-family: Arial, sans-serif;
                background-color: #000;
                color: #fff;
            }

            header {
                background-color: #222;
                color: white;
                padding: 10px 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            header .navbar a {
                color: white;
                text-decoration: none;
                margin: 0 10px;
                font-size: 16px;
                transition: color 0.3s;
            }

            header .navbar a:hover {
                color: #ff6f00;
            }

            .movie-banner img {
                width: 100%;
                height: auto;
            }

            .movie-info {
                padding: 20px;
                background-color: #111;
                border-radius: 10px;
                margin: 20px auto;
                max-width: 1200px;
            }

            .movie-info h1 {
                font-size: 36px;
                color: #ffc107;
            }

            .movie-info h2 {
                margin-top: 20px;
                color: #ffc107;
            }

            .movie-info p, .movie-info ul {
                line-height: 1.6;
            }

            .navigation {
                display: flex;
                justify-content: space-between;
                padding: 20px;
            }

            .navigation .nav-btn {
                color: #ffc107;
                text-decoration: none;
                font-weight: bold;
                transition: transform 0.3s;
            }

            .navigation .nav-btn:hover {
                transform: scale(1.1);
            }

            footer {
                background-color: #111;
                padding: 20px;
                text-align: center;
                color: #aaa;
            }

            footer .footer-links a {
                color: #ffc107;
                text-decoration: none;
                margin: 0 10px;
                font-size: 14px;
            }

            footer .newsletter input {
                padding: 5px;
                width: 200px;
            }

            footer .newsletter button {
                padding: 5px 10px;
                background-color: #ffc107;
                border: none;
                color: #000;
                cursor: pointer;
            }

            footer .newsletter button:hover {
                background-color: #e0a800;
            }
        </style>
    </head>
    <body>
        <% 
            // Database connection
            String jdbcURL = "jdbc:mysql://localhost:3306/cinema"; // Replace with your DB details
            String jdbcUsername = "root"; // Replace with your username
            String jdbcPassword = "password"; // Replace with your password
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            // Movie details variables
            String title = "";
            String duration = "";
            String rating = "";
            String storyline = "";
            String genres = "";
            String director = "";
            String producer = "";
            String writer = "";
            String music = "";
            List<String> actors = new ArrayList<>();

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                // Query movie details (Replace '1' with the dynamic movie ID)
                String sql = "SELECT * FROM movies WHERE id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, 1); // Replace '1' with movie ID
                rs = stmt.executeQuery();

                if (rs.next()) {
                    title = rs.getString("title");
                    duration = rs.getString("duration");
                    rating = rs.getString("rating");
                    storyline = rs.getString("storyline");
                    genres = rs.getString("genres");
                    director = rs.getString("director");
                    producer = rs.getString("producer");
                    writer = rs.getString("writer");
                    music = rs.getString("music");

                    // Fetch actors
                    String actorsQuery = "SELECT name FROM actors WHERE movie_id = ?";
                    PreparedStatement actorsStmt = conn.prepareStatement(actorsQuery);
                    actorsStmt.setInt(1, rs.getInt("id"));
                    ResultSet actorsRS = actorsStmt.executeQuery();
                    while (actorsRS.next()) {
                        actors.add(actorsRS.getString("name"));
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>

        <header>
            <img src="##" alt="logo" class="naviicon">
            <div class="navbar">
                <a href="index.jsp">Home</a>
                <a href="#">Movies</a>
                <a href="#">Offers</a>
                <a href="#">Login</a>
                <a href="#">Sign Up</a>
            </div>
        </header>

        <main>
            <section class="movie-banner">
                <img src="images/banner.jpg" alt="<%= title %>">
            </section>

            <section class="movie-info">
                <h1><%= title %></h1>
                <p class="rating">Duration: <%= duration %> | Rating: <%= rating %></p>

                <h2>Storyline</h2>
                <p><%= storyline %></p>

                <h2>Genres:</h2>
                <p><%= genres %></p>

                <h2>Actors:</h2>
                <ul>
                    <% for (String actor : actors) { %>
                        <li><%= actor %></li>
                    <% } %>
                </ul>

                <h2>Team:</h2>
                <ul>
                    <li><strong>Directed by:</strong> <%= director %></li>
                    <li><strong>Produced by:</strong> <%= producer %></li>
                    <li><strong>Written by:</strong> <%= writer %></li>
                    <li><strong>Music by:</strong> <%= music %></li>
                </ul>
            </section>

            <div class="navigation">
                <a href="#" class="nav-btn">&lt;&lt; Back</a>
                <a href="#" class="nav-btn">Next &gt;&gt;</a>
            </div>
        </main>

        <footer>
            <div class="footer-links">
                <a href="#">Home</a>
                <a href="#">Contact Us</a>
                <a href="#">Movies</a>
                <a href="#">Terms and Conditions</a>
                <a href="#">Offers</a>
                <a href="#">About Us</a>
            </div>
            <div class="newsletter">
                <p>Subscribe for Newsletter</p>
                <input type="email" placeholder="Enter Your Email...">
                <button>SUBSCRIBE</button>
            </div>
        <p>&copy; 2024 ABC Cinema by Group AV. All rights reserved.</p>
        </footer>
    </body>
</html>