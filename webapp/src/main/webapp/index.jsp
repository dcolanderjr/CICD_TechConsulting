<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Your Title Here</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }

    .container {
      width: 400px;
      margin: 50px auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    input[type=text], input[type=password] {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }

    button {
      background-color: #4CAF50;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      width: 100%;
    }

    button:hover {
      opacity: 0.8;
    }

    .signin {
      text-align: center;
    }

    .signin a {
      color: #2196F3;
    }

    h1 {
      color: #333;
      text-align: center;
      margin-bottom: 20px;
    }

    hr {
      border: 0;
      height: 1px;
      background: #ccc;
      margin: 20px 0;
    }

    p {
      color: #666;
      text-align: center;
    }

    a {
      text-decoration: none;
      color: #4CAF50;
    }

    a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<form action="action_page.php">
  <div class="container">
    <h1>And we have completed the application!</h1>
    <p>Let me know how you did! Feel free to drop me a line on GitHub!</p>
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
  </div>
  <div class="container signin">
    <p>Already have an account? <a href="#">GET ON IN HERE!</a>.</p>
  </div>

   <h1> And we did it, we have created our first CI/CD Pipeline!</h1>
   <br>
   <h1> This concludes the project. Thank you again! </h1>
   <h1> kloudkamp.com  </h1>
</form>

</body>
</html>
