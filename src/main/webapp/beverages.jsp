<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food and Beverages</title>
    <style>
        body {
            margin: 50;
            font-family: Arial, sans-serif;
            background-color: #000;
            color: white;
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
            gap: 15px;
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

        .navilogin a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s;
        }

        .navilogin a:hover {
            color: #ff6f00;
        }

        .food-section {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr;
            gap: 15px;
            align-items: center;
            text-align: left;
            margin-bottom: 20px;
        }

        .food-section img {
            width: 50px;
            height: auto;
            margin-right: 10px;
        }

        .food-section button {
            background-color: #0056b3;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
        }

        .food-section button:hover {
            background-color: #003f8a;
        }

        .summary {
            background-color: #ddd;
            color: black;
            padding: 20px;
            margin-top: 20px;
        }

        .summary h2 {
            font-size: 20px;
            margin-bottom: 15px;
        }

        .payment-method img {
            width: 50px;
            height: auto;
            margin-right: 10px;
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
        <a href="#"><img src="C:\Users\Asiri Thiwanka\Desktop\ticket-booking\ABC_logo_111x41.png" alt="logo"
                class="naviicon"></a>
        <div class="navbar">
            <a href="#">Home</a>
            <a href="#">Movies</a>
            <a href="#">Offers</a>
        </div>
        <div class="navilogin">
            <a href="#">Login</a>
            <a href="#">Sign Up</a>
        </div>
    </header>

    <!-- Main Content -->
    <div class="content">
        <div class="mx-10px">
            <h1>Singham Again (Hindi) - Digital 3D - 19.00</h1>

            <!-- Food and Beverages -->
            <div class="food-section">
                <div>
                    <img src="waterbottle.jpg" alt="Water Bottle">
                    <span>Water Bottle 500ml - LKR 150.00</span>
                </div>
                <div><input type="number" value="1" min="1"></div>
                <div><button>Add</button></div>
            </div>

            <div class="food-section">
                <div>
                    <img src="sprite.png" alt="Sprite">
                    <span>Sprite 500ml - LKR 270.00</span>
                </div>
                <div><input type="number" value="1" min="1"></div>
                <div><button>Add</button></div>
            </div>

            <div class="food-section">
                <div>
                    <img src="butterpopcorn.png" alt="Butter Popcorn">
                    <span>Butter Popcorn - LKR 550.00</span>
                </div>
                <div><input type="number" value="1" min="1"></div>
                <div><button>Add</button></div>
            </div>

            <div class="food-section">
                <div>
                    <img src="kriscobiscuit.jpeg" alt="Krisco Biscuit">
                    <span>Krisco Biscuit - LKR 380.00</span>
                </div>
                <div><input type="number" value="1" min="1"></div>
                <div><button>Add</button></div>
            </div>

            <div class="food-section">
                <div>
                    <img src="onionbiscuit.jpeg" alt="Onion Biscuit">
                    <span>Onion Biscuit - LKR 100.00</span>
                </div>
                <div><input type="number" value="1" min="1"></div>
                <div><button>Add</button></div>
            </div>

            <!-- Purchase Summary -->
            <div class="summary">
                <h2>Purchase Summary</h2>
                <div>Adult ticket (x1): LKR 950.00</div>
                <div>Butter popcorn: LKR 550.00</div>
                <h2>Select Your Payment Method</h2>
                <div class="payment-method">
                    <img src="mastercard.png" alt="MasterCard">
                    <img src="visa.png" alt="Visa">
                </div>
                <form>
                    <input type="text" placeholder="Full Name" required>
                    <br><br>
                    <input type="tel" placeholder="Mobile No" required>
                    <br><br>
                    <input type="checkbox" required> I agree to terms and conditions
                    <br><br>
                    <button type="submit">Pay Now</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
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