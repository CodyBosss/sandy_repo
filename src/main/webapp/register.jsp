<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Page</title>
</head>
<body>
    <h2>User Registration</h2>
    <form action="RegisterServlet" method="post">
        <label>Full Name:</label> 
        <input type="text" name="fullname" required><br><br>

        <label>Email:</label> 
        <input type="email" name="email" required><br><br>

        <label>Password:</label> 
        <input type="password" name="password" required><br><br>

        <input type="submit" value="Register">
    </form>
</body>
</html>