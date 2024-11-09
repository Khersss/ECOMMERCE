<?php
    session_start();
    $fullName = $_POST["fullName"];
    $username = $_POST["username"];
    $password = $_POST["password"];
    $confirmPassword = $_POST["confirmPassword"];

    if($_SERVER["REQUEST_METHOD"] == "POST")
    {
        if(trim($password) == trim($confirmPassword))
        {  
            $host = "localhost";
            $database = "ecommb2";
            $dbuserame = "root";
            $dbpassword = "";
            
            $dsn = "mysql: host=$host;dbname=$database;";
            try {
                $conn = new PDO($dsn, $dbuserame, $dbpassword);
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
                $stmt = $conn->prepare("INSERT INTO users (fullName,username,password,created_at,updated_at) VALUES (:p_fullName,:p_username,:p_password,NOW(),NOW())");
                
                $stmt->bindParam(':p_fullName', $fullName);
                $stmt->bindParam(':p_username', $username);
                $stmt->bindParam(':p_password', $password);
                
                $password = password_hash(trim($password),PASSWORD_BCRYPT);
               
                if($stmt->execute()){
                    header("location: /registration.php");
                    $_SESSION["success"] = "Registration Successful";
                    exit;
                  
                }else{
                    header("location: /registration.php");
                    $_SESSION["error"] = "Insert Error";
                    exit;
                }

            } catch (Exception $e){
                header("location: /registration.php");
                $_SESSION["error"]="Username Already Exist";
                }
            
        }
        else{
            header("location: /registration.php");
            $_SESSION["error"]="Password Incorrect";
            exit;
        }              
    }
?>