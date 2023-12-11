<?php
    $dsn = 'mysql:dbname=ndule;host=127.0.0.1';
    $user = 'root';
    $password = '';

    try {
        $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
        $db = new PDO($dsn, $user, $password);
    } catch (Exception $e) {
        die('Erreur :'.$e->getMessage());
    }

?>