<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
    <title>Movies</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f5;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: row;
        }

     
        .sidebar {
            width: 20%;
            background-color: #121848;
            color: white;
            height: 100vh;
            position: fixed;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 20px;
        }

        .sidebar h3 {
            margin: 0;
            padding: 10px 0;
        }

        .sidebar a {
            text-decoration: none;
            color: white;
            padding: 10px 20px;
            margin: 5px 0;
            width: 80%;
            text-align: center;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .sidebar a:hover {
            background-color: #646ba4;
            transform: scale(1.05);
        }

        
        .content {
            margin-left: 20%;
            padding: 20px;
            width: 80%;
        }

        h1 {
            text-align: center;
            color: #1000e2;
            margin-top: 20px;
        }

        table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #1000e2;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #646ba4;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        h1 {
            text-align: center;
            color: #1000e2;
            margin-top: 20px;
            animation: fadeIn 1s ease-in-out;
        }

        form {
            
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            animation: slideIn 0.8s ease-in-out;
        }

        label {
            display: block;
            font-size: 16px;
            margin: 10px 0 5px;
            color: #333;
        }

        input[type="text"], input[type="date"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus, input[type="date"]:focus, input[type="number"]:focus {
            border-color: #4CAF50;
            outline: none;
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
        }

        input[type="submit"] {
            background-color: #1000e2;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #746cd0;
            transform: scale(1.1);
        }
        
        .goback{
            display: inline-block;
            text-decoration: none;
            color: white;
            background-color: #1000e2;
            padding: 10px 20px;
            border-radius: 5px;
            margin: 20px auto;
            text-align: center;
            
            transition: background-color 0.3s, transform 0.3s;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
   
    <div class="sidebar">
        <h3>ABC Movies</h3>
        <a href="admin_home.jsp">Dashboard</a>
        <a href="admin_customer_details.jsp">Customers</a>
        <a href="admin_feedback_section.jsp">Feedback</a>
        <a href="login.html">Sign Out</a>
    </div>

    
    <div class="content">
        <h1>Add Movie</h1>
    <form action="save_movie.jsp" method="post">
        <label>Title:</label>
        <input type="text" name="title" required>
        <label>Cover URL:</label>
        <input type="text" name="Cover_url" required>
        <label>Status:</label>
        <input type="text" name="status" required>
        <label>Action:</label>
        <input type="text" name="action" required>
        <input type="submit" value="Save">
        <a href="admin_home.jsp" class="goback">Go Back </a>
    </form>
        
    </div>
</body>
</html>
