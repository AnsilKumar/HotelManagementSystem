<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Report Submission - Hotel Management</title>
    <style>
        body {
            background-color: #0d47a1;
            font-family: Arial, sans-serif;
            color: white;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .container {
            background: white;
            color: #0d47a1;
            max-width: 800px;
            margin: auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        form label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #aaa;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        input[type="submit"] {
            margin-top: 20px;
            background-color: #1E40AF;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: #0C2D7D;
        }

        .back-btn {
            display: block;
            width: fit-content;
            margin: 30px auto 0;
            padding: 10px 20px;
            background-color: #1E40AF;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }

        .back-btn:hover {
            background-color: #0C2D7D;
        }

        .message {
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
            color: #2e7d32;
        }

        .error {
            color: #d93025;
        }
    </style>
</head>
<body>
    <h1>Submit a Report</h1>

    <div class="container">
        <form method="post" action="process_report.jsp">
            <label for="reportType">Report Type:</label>
            <select name="reportType" required>
                <option value="">Select a type</option>
                <option value="Maintenance">Maintenance</option>
                <option value="Complaint">Complaint</option>
                <option value="Other">Other</option>
            </select>

            <label for="roomNumber">Room Number:</label>
            <input type="text" name="roomNumber" required />

            <label for="date">Date:</label>
            <input type="date" name="date" required />

            <label for="description">Description:</label>
            <textarea name="description" required></textarea>

            <input type="submit" value="Submit Report" />
        </form>

        <a class="back-btn" href="index.jsp">← Back to Home</a>
    </div>
</body>
</html>
