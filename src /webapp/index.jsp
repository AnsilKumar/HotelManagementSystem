<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Alva's Hotel</title>
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
            max-width: 800px;
            background: rgba(255, 255, 255, 0.25);
            border-radius: 20px;
            padding: 50px 40px;
            text-align: center;
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        h1 {
            font-size: 2.8rem;
            color: #3d3d3d;
            margin-bottom: 16px;
        }

        .divider {
            height: 4px;
            width: 80px;
            margin: 16px auto 30px;
            background: #6a0572;
            border-radius: 50px;
        }

        .subtitle {
            font-size: 1.1rem;
            margin-bottom: 36px;
            color: #4a4a4a;
        }

        .menu {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
            gap: 20px;
        }

        .menu a {
            padding: 14px 18px;
            background: linear-gradient(135deg, #6a0572, #ab83a1);
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            box-shadow: 0 6px 20px rgba(106, 5, 114, 0.3);
        }

        .menu a:hover {
            background: linear-gradient(135deg, #4a044e, #84417d);
            transform: translateY(-2px);
        }

        footer {
            margin-top: 40px;
            font-size: 0.95rem;
            color: #333;
        }

        footer strong {
            color: #000;
        }

        @media (max-width: 600px) {
            h1 {
                font-size: 2rem;
            }

            .menu {
                grid-template-columns: 1fr;
            }

            .menu a {
                font-size: 1rem;
                padding: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Alva's Hotel</h1>
        <div class="divider"></div>
        <p class="subtitle">Manage Your Bookings with Ease</p>

        <div class="menu">
            <a href="reservationadd.jsp">Add Booking</a>
            <a href="reservationupdate.jsp">Update Booking</a>
            <a href="reservationdelete.jsp">Delete Booking</a>
            <a href="reservationdisplay.jsp">View Bookings</a>
            <a href="reportsummary.jsp">Report Summary</a>
        </div>

        <footer>
            Developed by <strong>Ansil Kumar</strong>
        </footer>
    </div>
</body>
</html>
