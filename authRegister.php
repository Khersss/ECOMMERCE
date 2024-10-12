<?php
    $fullname = $_POST["fullName"];
    $username = $_POST["username"];
    $password = $_POST["password"];
    $confirmPassword = $_POST["confirmPassword"];

    if($_SERVER["REQUEST_METHOD"] == "POST"){
        //RECEIVE USER INPUT
        //VERIFY PASSWORD AND CONFIRM PASSWORD TO BE MATCH
        if(trim($password) == trim($confirmPassword)){
            
            $host = "localhost";
            $database = "ecommerceb2";
            $dbusername = "root";
            $dbpassword = "";
            

            $dsn = "mysql: host=$host;dbname=$database;";
            try {
                $conn = new PDO($dsn, $dbusername, $dbpassword);
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                $stmt = $conn->prepare("INSERT INTO userss (fullName, username, password, created_at, updated_at) VALUES (:p_fullName, :p_username, :p_password, NOW(), NOW())");
                $stmt ->bindParam(':p_fullName', $fullname);
                $stmt ->bindParam(':p_username', $username);
                $stmt ->bindParam(':p_password', $password);

                $password = password_hash(trim($password), PASSWORD_BCRYPT);

                if($stmt->execute()){
                    header("location:/registration.php?success=Registration Succesfull");
                   
                }else{
                    header("location:/registration.php?error=Insert Error");
                }

            } catch (Exception $e){
                echo "Connection Failed: " . $e->getMessage();
            }

        }else{
            header("location:/registration.php?error=Password Mismatch");
        }
    }
?>