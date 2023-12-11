<?php

    class User {

        private $client_pseudo;
        private $client_profile;
        private $client_gender;
        private $client_email;
        private $client_phone;
        private $client_password;

        public function __construct($client_pseudo, $client_profile, $client_gender, $client_email, $client_phone, $client_password)
        {
            $this->client_pseudo = $client_pseudo;
            $this->client_profile = $client_profile;
            $this->client_gender = $client_gender;
            $this->client_email = $client_email;
            $this->client_phone = $client_phone;
            $this->client_password = $client_password;
        }

        public function NewAccount()
        {
            global $db;
            // VAriables
            $client_pseudo = $this->client_pseudo;
            $client_profile = $this->client_profile;
            $client_gender = $this->client_gender;
            $client_email = $this->client_email;
            $client_phone = $this->client_phone;
            $client_password = $this->client_password;
            // Operations
            $req = "INSERT INTO client(client_pseudo, client_profile, client_gender, client_email, client_phone, client_password) VALUES(?,?,?,?,?,?)";
            $stat = $db->prepare($req);
            $exec = $stat->execute(array($client_pseudo, $client_profile, $client_gender, $client_email, $client_phone, $client_password));
            // var_dump($exec);
            // die;
            if ($exec) {
                return array($client_email, $client_pseudo);
            } else {
                echo "Execution failed";
                // echo $exec;
            }
        }

        public function followMusician($musician_id)
        {

        }

        public function unfollowMusician($musician_id)
        {
            
        }

    }

?>