<%@ page import="java.sql.*" %>
<%
    // Database connection setup
    String jdbcURL = "jdbc:mysql://localhost:3306/cinema_db"; // Replace with your database URL
    String jdbcUsername = "root"; // Replace with your database username
    String jdbcPassword = "password"; // Replace with your database password

    Connection connection = null;
    ResultSet nowShowing = null;
    ResultSet upcoming = null;
    ResultSet banners = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        // Fetch Banners (assuming banners are in a separate table)
        String queryBanners = "SELECT image_url FROM banners"; // Assuming you have a banners table
        PreparedStatement psBanners = connection.prepareStatement(queryBanners);
        banners = psBanners.executeQuery();

        // Fetch "Now Showing" movies
        String queryNowShowing = "SELECT id, title, image_url FROM movies WHERE status = 'Now Showing'";
        PreparedStatement psNowShowing = connection.prepareStatement(queryNowShowing);
        nowShowing = psNowShowing.executeQuery();

        // Fetch "Upcoming" movies
        String queryUpcoming = "SELECT id, title, image_url FROM movies WHERE status = 'Upcoming'";
        PreparedStatement psUpcoming = connection.prepareStatement(queryUpcoming);
        upcoming = psUpcoming.executeQuery();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - ABC Cinema</title>
    <style>
        /* General Styles */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #000000;
            overflow-x: hidden;
        }

        header {
            background-color: #222;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .naviicon {
            display: flex;
            align-items: center;
        }

        .navilogin {
            display: flex;
            align-items: center;
            justify-content: right;
        }

        .navbar {
            flex-grow: 1; 
            display: flex;
            justify-content: center;
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

        .navilogin {
            display: flex;
            gap: 15px; 
        }

        .navilogin a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s;
        }

        .navilogin a:hover {
            color: #ff6f00;
        }

        .banner {
            display: flex;
            flex-wrap: nowrap;
            overflow-x: auto;
            scrollbar-width: none;
            -ms-overflow-style: none;
        }

        .banner img {
            width: 300px;
            height: 400px;
            margin: 10px;
            transition: transform 0.3s;
        }

        .banner img:hover {
            transform: scale(1.1);
            cursor: pointer;
        }

        .section-title {
            margin: 20px 0;
            padding: 10px 20px;
            font-size: 20px;
            font-weight: bold;
            background: #222;
            color: white;
            text-transform: uppercase;
        }

        .movies-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 20px;
        }

        .movie-card {
            background: #fff;
            width: 300px;
            margin: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s;
        }

        .movie-card:hover {
            transform: scale(1.05);
        }

        .movie-card img {
            width: 100%;
            border-radius: 10px 10px 0 0;
        }

        .movie-card .details {
            padding: 15px;
            text-align: center;
        }

        .movie-card .details h3 {
            margin: 10px 0;
            font-size: 18px;
            color: #333;
        }

        .movie-card .details button {
            padding: 10px 15px;
            background: #ff6f00;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .movie-card .details button:hover {
            background: #cc5800;
        }

        footer {
            background-color: #111;
            padding: 20px;
            text-align: center;
            color: #aaa;
        }

        footer .footer-links {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        footer .footer-links a {
            color: #ffc107;
            text-decoration: none;
            font-size: 14px;
        }

        footer .newsletter {
            margin-top: 20px;
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

        .offers {
            display: flex;
            justify-content: center;
            align-items: center;
            background: #ff6f00;
            color: white;
            margin: 20px 0;
            padding: 20px;
            font-size: 18px;
        }
    </style>
</head>
<body >
    <header>
        <a href="##" ><img src="resources/images/logo.png" alt="logo" class="naviicon"></a>
        <div class="navbar">
            <a href="index.jsp">Home</a>
            <a href="#">Movies</a>
            <a href="#">Offers</a>
             
        </div>
        <div class="navilogin" >
        <a href="login.html">Login</a>
        <a href="signup.html">Sign Up</a>
        </div>    
    </header>

    <div class="banner">
        <img src="1.jpg" alt="Blade Runner">
        <img src="1.jpg" alt="Jurassic Park">
        <img src="1.jpg" alt="Life of Pi">
        <img src="1.jpg" alt="Dawn of the Apes">
        <img src="1.jpg" alt="Inception">
    </div>

    <div class="section-title">Now Showing</div>
    <div class="movies-grid">
        <div class="movie-card">
            <img src="1.jpg" alt="Singam Again">
            <div class="details">
                <h3>Singam Again (Hindi)</h3>
                <button onclick="location.href='movieDetails.jsp'">Buy Tickets</button>
            </div>
        </div>
        <div class="movie-card">
            <img src="1.jpg" alt="Red One">
            <div class="details">
                <h3>Red One</h3>
                <button onclick="location.href='movieDetails.jsp'">Buy Tickets </button>
            </div>
        </div>
    </div>

    <div class="section-title">Upcoming Movies</div>
    <div class="movies-grid">
        <div class="movie-card">
            <img src="1.jpg" alt="Mufasa">
            <div class="details">
                <h3>Mufasa: The Lion King</h3>
                <button onclick="location.href='movieDetails.jsp'" >Info</button>
            </div>
        </div>
        <div class="movie-card">
            <img src="images/sonic.jpg" alt="Sonic">
            <div class="details">
                <h3>Sonic the Hedgehog 3</h3>
                <button>Info</button>
            </div>
        </div>
    </div>

    <div class="section-title">Offers</div>
    
    <div class="text-section">
            <h1>Buy 1 Get 1 Free!</h1>
            <ul>
                <li>- Buy one movie ticket with Slash payment & get one free popcorn</li>
            </ul>
        </div>
        <div class="image-section">
            <img src="##" alt="Popcorn Image">
          </div>
    
    
    
    

    <footer>
        <div class="footer-links">
            <a href="index.jsp">Home</a>
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
