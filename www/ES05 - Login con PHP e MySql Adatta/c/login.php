<?php 

require 'funzioni.php';

session_start();

if (isset($_SESSION['username'])) {
    $mess = 'Accesso gia effettuato';
}
else if ($_SESSION['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    [$Accessoretval, $Accessomsg] = controllo_login($username, $password);

    $mess = $Accessomsg;

    if ($loginRetval) {
        $_SESSION['username'] = $username;
        
        $redirectPage = $_POST['from'] ?? 'index.php';
        header("Location: $redirectPage");
        exit;
    }

    $collegamento= impostaCollegamento();
}
?>


<!DOCTYPE html>
<html lang="it">
<head>
    <title>Login</title>
</head>
<body>
        <h2>Login</h2>

        <?= $msg ?>

        <form action="<?= $_SERVER['PHP_SELF']; ?>" method="POST">
            
            <input type="text" name="username" id="username" placeholder="Username" pattern=".{3,}" required title="Minimo 3 lettere">
            <br>
            
            <input type="password" name="password" id="password" placeholder="Password" pattern=".{3,}" required title="Minimo 3 lettere">
            <br>
            <input type="submit" value="Login" id="login-button">

            <input type="hidden" name="from" value="<?= $_GET['from'] ?? '' ?>"> 
        </form>
            <?= $links ?>
</body>
</html>


    