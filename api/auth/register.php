<?php

    session_start();

    // Acces depuis n'importe que site ou appareil
    header("Access-Control-Allow-Origin: *");
    // Formats des donnees envoyees
    header("Content-Type: application/json; charset=UTF-8");
    // Methodes autorisees
    header("Access-Control-Allow-Methods: POST");
    // Duree de la requete
    header("Success-Control-Max-Age: 3600");
    // Entetes autorisees
    header("Access-control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {

        include '../../models/register.php';
        include '../../config/config.php';

        $client_pseudo = htmlspecialchars(strip_tags($_POST['client_pseudo']));
        $client_profile = htmlspecialchars(strip_tags($_POST['client_profile']));
        $client_gender = htmlspecialchars(strip_tags($_POST['client_gender']));
        $client_email = htmlspecialchars(strip_tags($_POST['client_email']));
        $client_phone = htmlspecialchars(strip_tags($_POST['client_phone']));
        $client_password = htmlspecialchars(strip_tags($_POST['client_password']));
        $conf_client_password = htmlspecialchars(strip_tags($_POST['conf_client_password']));

        if ($client_password == $conf_client_password) {
            $client_password = md5($client_password);
            $response = new User($client_pseudo, $client_profile, $client_gender, $client_email, $client_phone, $client_password);

            // $var = $response->NewAccount();
            // print_r($response->NewAccount());

            // echo json_encode(["erreur" => $var]);

            if ($response->NewAccount()) {
                $_SESSION['client_pseudo'] = $client_pseudo;
                header("location: ../../views/dashboard_client.php");
            } else {
                header("HTTP/1.0 503");
                echo json_encode(['erreur' => 'Erreur de creation du compte']);
            }
            // if ($response == "Execution failed") {
            //     header("HTTP/1.0 503");
            //     echo json_encode(['erreur' => 'Erreur de creation du compte']);
            // } else {
            //     print_r($response);
            //     if ($response->NewAccount()) {
            //         $_SESSION['client_pseudo'] = $client_pseudo;
            //         header("location: ../../views/dashboard_client.php");
            //     } else {
            //         echo json_encode(['erreur' => 'Methode NewAccount failed']);
            //     }
            // }
        } else {
            header("HTTP/1.0 503");
            echo json_encode(["erreur" => "Les mots de passe ne correspondent pas"]);
        }

    } else {
        // Gerer l'erreur
        http_response_code(405);
        header("HTTP/1.0 405 Method Not Allowed");
        echo json_encode(["erreur" => "La methode n'est pas admise"]);
    }

?>
