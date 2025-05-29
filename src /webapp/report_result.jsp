<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconnect.jsp" %>
<%
    String message = "";
    boolean showForm = true;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            int reservationId = Integer.parseInt(request.getParameter("reservationId"));
            java.sql.Date newCheckIn = java.sql.Date.valueOf(request.getParameter("checkInDate"));
            java.sql.Date newCheckOut = java.sql.Date.valueOf(request.getParameter("checkOutDate"));

            PreparedStatement psCheck = con.prepareStatement("SELECT * FROM reservations WHERE reservationId = ?");
            psCheck.setInt(1, reservationId);
            ResultSet rsCheck = psCheck.executeQuery();

            if (!rsCheck.next()) {
                message = "Error: Reservation ID not found.";
            } else {
                PreparedStatement psUpdate = con.prepareStatement(
                    "UPDATE reservations SET checkInDate = ?, checkOutDate = ? WHERE reservationId = ?"
                );
                psUpdate.setDate(1, newCheckIn);
                psUpdate.setDate(2, newCheckOut);
                psUpdate.setInt(3, reservationId);

                int rows = psUpdate.executeUpdate();
                if (rows > 0) {
                    message = "Reservation dates updated successfully!";
                    showForm = false;
                } else {
                    message = "Error: Update failed.";
                }
                psUpdate.close();
            }

            rsCheck.close();
            psCheck.close();
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            try { con.close(); } catch (Exception e) {}
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Reservation</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(120deg, #a18cd1, #fbc2eb);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
            color: #2e2e2e;
        }

        .container {
            width: 100%;
            max-width: 700px;
            background: rgba(255, 255, 255, 0.25);
            border-radius: 20px;
            padding: 50px 40px;
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        h1 {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 24px;
            color: #3d3d3d;
        }

        .divider {
            height: 4px;
            width: 80px;
            margin: 0 auto 24px;
            background: #6a0572;
            border-radius: 50px;
        }

        label {
            display: block;
            margin-top: 20px;
            font-weight: 600;
            color: #4a4a4a;
        }

        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 14px;
            margin-top: 6px;
            font-size: 1rem;
            border-radius: 10px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            margin-top: 30px;
            background: linear-gradient(135deg, #6a0572, #ab83a1);
            color: white;
            padding: 14px;
            font-size: 1.1rem;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            box-shadow: 0 6px 20px rgba(106, 5, 114, 0.3);
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #4a044e, #84417d);
            transform: translateY(-2px);
        }

        .message {
            text-align: center;
            font-weight: bold;
            margin: 20px 0;
            font-size: 1.1rem;
            color: <%= message.startsWith("Error") ? "#d93025" : "#2e7d32" %>;
        }

        .buttons {
            text-align: center;
            margin-top: 30px;
        }

        .buttons a {
            background: linear-gradient(135deg, #6a0572, #ab83a1);
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 10px;
            font-weight: bold;
            margin: 0 10px;
            transition: all 0.3s ease;
            display: inline-block;
            box-shadow: 0 6px 20px rgba(106, 5, 114, 0.3);
        }

        .buttons a:hover {
            background: linear-gradient(135deg, #4a044e, #84417d);
            transform: translateY(-2px);
        }

        @media (max-width: 600px) {
            h1 {
                font-size: 2rem;
            }

            input[type="submit"],
            .buttons a {
                font-size: 1rem;
                padding: 12px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Update Reservation Dates</h1>
    <div class="divider"></div>

    <% if (!message.isEmpty()) { %>
        <div class="message"><%= message %></div>
        <% if (!showForm) { %>
            <div class="buttons">
                <a href="reservationupdate.jsp">🔁 Update Another</a>
                <a href="index.jsp">🏠 Back to Home</a>
            </div>
        <% } %>
    <% } %>

    <% if (showForm) { %>
    <form method="post">
        <label for="reservationId">Reservation ID:</label>
        <input type="number" name="reservationId" required />

        <label for="checkInDate">New Check-In Date:</label>
        <input type="date" name="checkInDate" required />

        <label for="checkOutDate">New Check-Out Date:</label>
        <input type="date" name="checkOutDate" required />

        <input type="submit" value="Update Reservation" />
    </form>
    <% } %>
</div>
</body>
</html>
