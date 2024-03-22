<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registration Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f0f0;
    }

    .container {
      background-color: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      width: 300px;
      margin: auto;
    }

    h1 {
      text-align: center;
      margin-bottom: 20px;
    }

    label {
      font-weight: bold;
    }

    input[type="text"],
    input[type="password"] {
      width: calc(100% - 12px);
      padding: 10px;
      margin: 8px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
    }

    hr {
      border: 1px solid #f0f0f0;
      margin-top: 20px;
      margin-bottom: 20px;
    }

    .registerbtn {
      background-color: #4CAF50;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      width: 100%;
      margin-bottom: 10px;
    }

    .registerbtn:hover {
      background-color: #45a049;
    }

    .signin {
      text-align: center;
    }

    .signin a {
      color: #007bff;
      text-decoration: none;
    }

    .signin a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<form action="action_page.php">
  <div class="container">
    <h1>Registration Form</h1>
    <p>Let me know how you did! Feel free to drop me a line on GitHub!</p>
    <hr>
     
    <label for="Name">What should we call you?: </label>
    <input type="text" placeholder="Enter Full Name" name="Name" id="Name" required>
    
    <label for="email">How can we reach you?: </label>
    <input type="text" placeholder="Enter Email" name="email" id="email" required>

    <label for="psw">Ancient Secret: </label>
    <input type="password" placeholder="Enter Password" name="psw" id="psw" required>

    <label for="psw-repeat">Ancient Secret, again: </label>
    <input type="password" placeholder="Repeat Password" name="psw-repeat" id="psw-repeat" required>
    
    <hr>
    <p>When you create an account, you agree to the legal stuff.<a href="#">Terms & Privacy</a>.</p>
    <button type="submit" class="registerbtn">Register</button>
  </div>

  <div class="container signin">
    <p>Already have an account? <a href="#">GET ON IN HERE!</a>.</p>
  </div>
</form>

</body>
</html>

