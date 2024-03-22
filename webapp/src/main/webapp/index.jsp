<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Your Title Here</title>
  <!-- Add Roboto font from Google Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap">
  <style>
    body {
      font-family: 'Roboto', sans-serif; /* Use Roboto font */
      background-color: #000;
      color: #fff;
      margin: 0;
      padding: 0;
    }

    .main-container {
      display: flex;
      justify-content: space-between;
    }

    .registration-container,
    .info-container {
      width: 400px;
      margin: 50px auto;
    }

    .registration-container {
      background-color: #333;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1);
    }

    .info-container {
      text-align: right;
    }

    input[type=text], input[type=password] {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #fff;
      border-radius: 4px;
      box-sizing: border-box;
      background-color: #666;
      color: #fff;
      font-family: 'Roboto', sans-serif; /* Use Roboto font */
    }

    input[type=text]:focus, input[type=password]:focus {
      outline: none;
      border: 1px solid #fff;
    }

    button.registerbtn {
      background-color: #000;
      color: #fff;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      width: 100%;
      font-family: 'Roboto', sans-serif; /* Use Roboto font */
    }

    button.registerbtn:hover {
      background-color: #333;
    }

    .signin {
      text-align: center;
      color: #ccc;
    }

    .signin a {
      color: #2196F3;
    }

    h1 {
      color: #fff;
      text-align: center;
      margin-bottom: 20px;
      font-weight: 500; /* Use Roboto Medium */
    }

    hr {
      border: 0;
      height: 1px;
      background: #fff;
      margin: 20px 0;
    }

    p {
      color: #ccc;
      text-align: center;
    }

    a {
      text-decoration: none;
      color: #4CAF50;
    }

    a:hover {
      text-decoration: underline;
    }

    .right-content {
      text-align: center;
    }
  </style>
</head>
<body>

<div class="main-container">
  <div class="registration-container">
    <form action="action_page.php">
      <h1>Application and CICD Pipeline completed! Hi Ehtasham & Ameer!</h1>
      <p>Let me know how you did! Feel free to drop me a line on <a href="https://github.com/dcolanderjr">GitHub</a>!</p>
      <hr>
       
      <label for="Name"><b>What should we call you?: </b></label>
      <input type="text" placeholder="Enter Full Name" name="Name" id="Name" required>
      
      <label for="email"><b>How can we reach you?: </b></label>
      <input type="text" placeholder="Enter Email" name="email" id="email" required>

      <label for="psw"><b>Ancient Secret: </b></label>
      <input type="password" placeholder="Enter Password" name="psw" id="psw" required>

      <label for="psw-repeat"><b>Ancient Secret, again: </b></label>
      <input type="password" placeholder="Repeat Password" name="psw-repeat" id="psw-repeat" required>

      <p>When you create an account, you agree to the legal stuff. I eat sand. <a href="#">Terms & Privacy</a>.</p>
      <button type="submit" class="registerbtn">Register</button>
    </form>
  </div>

  <div class="info-container">
    <h1> And we did it, we have created our first CI/CD Pipeline!</h1>
    <br>
    <h1> This concludes the project. Thank you again! </h1>
    <h1><a href="https://kloudkamp.com">kloudkamp.com</a></h1>
  </div>
</div>

</body>
</html>
