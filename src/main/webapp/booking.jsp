<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Seat Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        nav {
            background-color: #333;
            overflow: hidden;
        }
        nav a {
            color: white;
            padding: 14px 20px;
            float: left;
            text-decoration: none;
            text-align: center;
        }
        nav a:hover {
            background-color:#FFD700 ;
            color: black;
        }
        .container {
            padding: 100px;
            text-align: center;
            background-color:#FDDA0D;
        }
        .seats {
            display: grid;
            grid-template-columns: repeat(10, 60px);
            grid-gap: 10px;
            justify-content: center;
            margin: 20px 0;
        }
        .seat {
            width: 60px;
            height: 60px;
            background-color:#404040;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            color: white;
        }
        .seat.booked {
            background-color:#FFBF00 ;
            cursor: not-allowed;
        }
        .seat.selected {
            background-color:#191970 ;
        }
        .confirmation {
            display: none;
            margin-top: 20px;
        }
        .confirmation.show {
            display: block;
        }
footer {
    background-color: #111;
    padding: 20px;
    text-align: center;
    color: #aaa;
    margin-top:00px;
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

    <!-- Navigation Bar -->
    <nav>
        <a href="index.jsp">Home</a>
        <a href="#">Movies</a>
        <a href="#">Others</a>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <h1>Welcome to ABC Cinema</h1>
        <p>Select your seats below. <br>1-10 Seats are Front Seats</p>

        <!-- Seat Selection Grid -->
        <div class="seats" id="seats">
            <!-- Seats will be generated dynamically -->
        </div>

        <!-- Confirm Booking -->
        <button id="confirmBtn" onclick="confirmBooking()">Confirm Booking</button>

        <!-- Confirmation Message -->
        <div class="confirmation" id="confirmationMessage">
            <h2>Your seats have been successfully booked!</h2>
        </div>
    </div>
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
    <p>&copy; 2024 Cineverse. All rights reserved.</p>
</footer>


    <script>
        const seatCount = 50; // Total number of seats
        let selectedSeats = [];

        // Generate seats dynamically
        const seatsContainer = document.getElementById('seats');
        for (let i = 0; i < seatCount; i++) {
            const seat = document.createElement('div');
            seat.classList.add('seat');
            seat.id = `seat-${i}`;
            seat.innerText = i + 1; // Display the seat number
            seat.addEventListener('click', () => toggleSeatSelection(i));
            seatsContainer.appendChild(seat);
        }

        // Toggle seat selection
        function toggleSeatSelection(index) {
            const seat = document.getElementById(`seat-${index}`);
            if (!seat.classList.contains('booked')) {
                seat.classList.toggle('selected');
                if (seat.classList.contains('selected')) {
                    selectedSeats.push(index);
                } else {
                    selectedSeats = selectedSeats.filter(seatIndex => seatIndex !== index);
                }
            }
        }

        // Confirm booking
        function confirmBooking() {
            if (selectedSeats.length > 0) {
                document.getElementById('confirmationMessage').classList.add('show');
                selectedSeats.forEach(seatIndex => {
                    document.getElementById(`seat-${seatIndex}`).classList.add('booked');
                });
                // Disable further seat selection
                document.querySelectorAll('.seat').forEach(seat => {
                    seat.removeEventListener('click', () => toggleSeatSelection());
                    seat.style.cursor = 'not-allowed';
                });
            } else {
                alert('Please select at least one seat!');
            }
        }
    </script>

</body>
</html>
