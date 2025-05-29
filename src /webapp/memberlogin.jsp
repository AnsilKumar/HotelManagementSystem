<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Member Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(120deg, #a18cd1, #fbc2eb);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.25);
            border-radius: 20px;
            padding: 40px 30px;
            max-width: 400px;
            width: 100%;
            text-align: center;
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        h2 {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #3d3d3d;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            color: #444;
            text-align: left;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-top: 6px;
            border: none;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.8);
            font-size: 1rem;
        }

        input[type="submit"] {
            background: linear-gradient(135deg, #6a0572, #ab83a1);
            color: white;
            padding: 12px;
            margin-top: 24px;
            width: 100%;
            border-radius: 10px;
            border: none;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #4a044e, #84417d);
            transform: translateY(-2px);
        }

        .error-message {
            margin-top: 20px;
            color: red;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Member Login</h2>
        <form method="POST">
            <label for="registrationId">Registration ID:</label>
            <input type="text" id="registrationId" name="registrationId" required />

            <label for="roomNumber">Room Number:</label>
            <input type="text" id="roomNumber" name="roomNumber" required />

            <input type="submit" value="Login" />
        </form>

        <%
            String message = "";
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String registrationId = request.getParameter("registrationId");
                String roomNumber = request.getParameter("roomNumber");

                // Simple hardcoded login check
                if ("12345".equals(registrationId) && "101".equals(roomNumber)) {
                    session.setAttribute("registrationId", registrationId);
                    session.setAttribute("roomNumber", roomNumber);
                    session.setAttribute("guestName", "Ansil Kumar");

                    response.sendRedirect("memberdetails.jsp");
                } else {
                    message = "Invalid Registration ID or Room Number!";
                }
            }

            if (!message.isEmpty()) {
                out.println("<p class='error-message'>" + message + "</p>");
            }
        %>
    </div>
</body>
</html>
