<?php 

require 'funzioni.php';

session_start();

if (isset($_SESSION['utente'])) {
    echo "Utente già loggato";
    $mess = 'Accesso gia effettuato';
    header('Location: index.php');

} else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $utente = $_POST['utente'];
    $password = $_POST['password'];
    //echo $utente;
    //echo $password;
    echo "<br>";

    [$Accessoretval, $Accessomsg] = controllo_login($utente, $password);

    $mess = $Accessomsg;

    if ($Accessoretval) {
        $_SESSION['utente'] = $utente;

        $coll = 'Location: ';
        $coll .= $_POST['from'] != null ? $_POST['from'] : 'index.php';
        header($coll);
        die();
    }
        
} 
?>


<!DOCTYPE html>
<html lang="it">
<head>
    <title>Login</title>
</head>
<body>
        <h2>Login</h2>

        <h3 style= color:red><?= $mess ?>

        <form action="<?= $_SERVER['PHP_SELF']; ?>" method="POST">
            
            <input type="text" name="utente" id="utente" placeholder="utente" pattern=".{3,}" required title="Minimo 3 lettere">
            <br>
            
            <input type="password" name="password" id="password" placeholder="password" pattern=".{3,}" required title="Minimo 3 lettere">
            <br>
            <input type="submit" value="Login" id="login-button">

            <input type="hidden" name="from" value="<?= $_GET['from'] ?? null ?>"> 
        </form>
            <?= $links ?>
</body>
</html>


    