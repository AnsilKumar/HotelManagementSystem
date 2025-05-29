<%@ page import="java.sql.*" %>
<%@ include file="dbconnect.jsp" %>
<html>
<meta charset="UTF-8">
<head>
    <title>Reports Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f6ff; /* very light blue */
            margin: 0; 
            padding: 0;
            color: #1e3a5f; /* dark blue text */
        }
        .container {
            max-width: 800px;
            margin: 40px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 12px #90b4e8; /* blue shadow */
            text-align: center;
        }
        h2 {
            color: #1b2e4b; /* darker blue */
            font-weight: 700;
            letter-spacing: 0.04em;
            margin-bottom: 30px;
        }
        .report-link {
            display: inline-block;
            background: #1b2e4b;
            color: white;
            padding: 15px 30px;
            margin: 15px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            letter-spacing: 0.04em;
            box-shadow: 0 0 8px #5482d6;
            transition: background 0.3s ease;
        }
        .report-link:hover {
            background: #122138;
        }
        p.note {
            color: #2f4f76;
            font-size: 1.1em;
            margin-top: 40px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Reports Dashboard</h2>

    <a href="HotelReportSummary.jsp?type=dateRange" class="report-link">Date Range Reservations</a>
    <a href="HotelReportSummary.jsp?type=frequentRooms" class="report-link">Most Frequent Rooms</a>
    <a href="HotelReportSummary.jsp?type=revenue" class="report-link">Revenue Report</a>

    <p class="note">Select a report to view the summary details.</p>
</div>
</body>
</html>
