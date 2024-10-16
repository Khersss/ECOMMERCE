<?php
//received user input
    $username = $_POST["username"];
    $password = $_POST["password"];

    session_start();

    if($_SERVER["REQUEST_METHOD"] == "POST")
    {
        //connect to databse
            $host = "localhost";
            $database = "ecommb2";
            $dbuserame = "root";
            $dbpassword = "";
            
            $dsn = "mysql: host=$host;dbname=$database;";
            try {
                $conn = new PDO($dsn, $dbuserame, $dbpassword);
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
                $stmt = $conn->prepare('SELECT * FROM `users` WHERE username = :p_username');    
                $stmt->bindParam(':p_username', $username);
                $stmt->execute();
                $users = $stmt->fetchAll();
                if($users){ 
                  if(password_verify($password,$users[0]["password"]))
                     echo"login successfully";
                     $_SESSION["fullName"] = $users[0]["fullname"];
                }else{
                    echo "password did not match";
                }
                
            } catch (Exception $e){
                header("location: /registration.php?error=Username Already Existing");
            }
        } 
    ?>