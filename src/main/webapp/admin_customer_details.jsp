<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
    <title>customer</title>
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
        <h1>Customer Details</h1>
        <table>
            <tr>
                <th>Customer ID</th>
                <th>Customer Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Actions</th>
            </tr>
            <%
                Connection conn = (Connection) application.getAttribute("DBConnection");
                String query = "SELECT * FROM customer";
                try {
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("customer_id") %></td>
                <td><%= rs.getString("customer_name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("phone") %></td>
                <td>
                    <a href="##?id=<%= rs.getInt("customer_id") %>">Edit</a> |
                    <a href="##?id=<%= rs.getInt("customer_id") %>">Delete</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
        </table>
    </div>
</body>
</html>
