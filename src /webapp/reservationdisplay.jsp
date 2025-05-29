<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="dbconnect.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Alva's Hotel - All Reservations</title>
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
            padding: 40px 20px;
            color: #2e2e2e;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .container {
            width: 100%;
            max-width: 900px;
            background: rgba(255, 255, 255, 0.25);
            border-radius: 20px;
            padding: 40px 30px;
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        h1 {
            font-size: 2.8rem;
            color: #3d3d3d;
            text-align: center;
            margin-bottom: 8px;
        }

        .divider {
            height: 4px;
            width: 80px;
            margin: 12px auto 30px;
            background: #6a0572;
            border-radius: 50px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            color: #3d3d3d;
            font-weight: 500;
            font-size: 1rem;
        }

        th, td {
            padding: 14px 12px;
            text-align: center;
            border-bottom: 1px solid rgba(61, 61, 61, 0.15);
        }

        th {
            background: linear-gradient(135deg, #6a0572, #ab83a1);
            color: white;
            font-weight: 600;
            letter-spacing: 0.05em;
        }

        tr:hover {
            background-color: rgba(106, 5, 114, 0.1);
        }

        .back-link {
            margin-top: 30px;
            text-align: center;
        }

        .back-link a {
            display: inline-block;
            text-decoration: none;
            background: linear-gradient(135deg, #6a0572, #ab83a1);
            color: white;
            padding: 14px 36px;
            border-radius: 12px;
            font-weight: 600;
            letter-spacing: 0.04em;
            box-shadow: 0 6px 20px rgba(106, 5, 114, 0.3);
            transition: all 0.3s ease;
        }

        .back-link a:hover {
            background: linear-gradient(135deg, #4a044e, #84417d);
            transform: translateY(-2px);
        }

        @media (max-width: 600px) {
            h1 {
                font-size: 2rem;
            }

            th, td {
                padding: 10px 8px;
                font-size: 0.9rem;
            }

            .back-link a {
                padding: 12px 24px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>All Reservations</h1>
        <div class="divider"></div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Room</th>
                    <th>Check-In</th>
                    <th>Check-Out</th>
                    <th>Contact</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM reservations ORDER BY reservationId ASC");

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("reservationId") %></td>
                    <td><%= rs.getString("customerName") %></td>
                    <td><%= rs.getString("roomNumber") %></td>
                    <td><%= rs.getDate("checkInDate") %></td>
                    <td><%= rs.getDate("checkOutDate") %></td>
                    <td><%= rs.getString("contact") %></td>
                </tr>
                <%
                        }
                        rs.close();
                        stmt.close();
                        con.close();
                    } catch (Exception e) {
                %>
                <tr>
                    <td colspan="6" style="color: red; font-weight: 600;">Error: <%= e.getMessage() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <div class="back-link">
            <a href="index.jsp">⬅ Back to Home</a>
        </div>
    </div>
</body>
</html>
