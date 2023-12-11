<?php
    session_start();

    // Session
    if (isset($_SESSION['client_pseudo'])) {
        $user = $_SESSION['client_pseudo'];
        // echo json_encode(["client_pseudo" => $_GET["client_pseudo"], "password" => $_GET["password"]]);
        echo json_encode(["message" => "Success"]);
    } else {
        header("location:../api/auth/test.php");
    }
    // Logout
    if (isset($_GET['logout'])) {
        if ($_GET['logout'] == true) {
            session_destroy();
            header("location:../api/auth/test.php");
        }
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Welcome client <?= $user ?></h1>
    <a href="?logout=true">Logout</a>
</body>
</html>