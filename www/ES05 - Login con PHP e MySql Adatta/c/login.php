<?php 

require 'funzioni.php';

session_start();

if (isset($_SESSION['username'])) {
    $mess = 'Accesso gia effettuato';
}
else if ($_SESSION['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    [$Accessoretval, $Accessoerrmsg] = controllo_login($username, $password);

    $mess = $loginerrmsg;
}
    