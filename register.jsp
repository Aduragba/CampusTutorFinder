<h2>Registration</h2>

<h2>Register</h2>

<form action="registerAction.jsp" method="post">
    Name: <input type="text" name="name" required><br><br>
    Email: <input type="email" name="email" required><br><br>
    Password: <input type="password" name="password" required><br><br>

    Role:
    <select name="role">
        <option value="STUDENT">Student</option>
        <option value="TUTOR">Tutor</option>
    </select><br><br>

    <button type="submit">Register</button>
</form>
