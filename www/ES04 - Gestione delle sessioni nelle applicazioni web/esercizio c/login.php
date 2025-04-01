<?php
    session_start();

    if($_SERVER['REQUEST_METHOD'] == 'GET') {
        $_SESSION['prove'] = 5;
        $_SESSION['tempo'] = null;
    }

    require 'funzioni.php';

    $collegamento = '';


    if(checksession()[0]){
        $collegamento= "<a href='logout.php'>logout</a>";
        } else {
        $collegamento = "<a href='login.php'>login</a>";
    }

    [$sessionretval, $sessionerrmsg] = controllosessione();

    if ($sessionRetval) {
        $redirectPage = $_GET['from'] ?? 'index.php';
        $destination = 'Location: ' . $redirectPage;
    
        header($destination);
        die();
    }

    $err_mess = $_GET['error'] ?? '';

    [$retval, $retmsg] = controlloLogin($username, $password);

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && 
    (!isset($_SESSION['tempo']) || time() - $_SESSION['tempo'] >= 60)) {

    $username = $_SESSION['username'];
    $password = $_POST['password'];

    [$retval, $retmsg] = controlloLogin($username, $password);

    if ($retval) {
        session_unset();

        $_SESSION['username'] = $username;

        header('Location: ' . ($_POST['from'] ?? 'index.php'));
        die();
}else {
            $err_mess = $retmsg;
            $_SESSION['prove']--;
            $err_mess .= '. Tentativi rimasti: '.$_SESSION['prove'];
            if($_SESSION['prove'] == 0) {
                $err_mess = 'Tentativi esauriti, account bloccato per 60 secondi';
                $_SESSION['tempo'] = $_SERVER['REQUEST_TIME'];
            }
        }
    }
    else if ($_SESSION['timestamp']) {
        $timeLeft = $_SESSION['timestamp'] + 60 - $_SERVER['REQUEST_TIME'];
    
        if ($timeLeft <= 0) {
            $_SESSION['tentativi'] = 5;
            $_SESSION['timestamp'] = null;
        } else {
            $err_msg = "Account bloccato. Riprova tra $timeLeft secondi";
        }
    }
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Login</title>
</head>
<body>
    <div id="login-container">
        <h2>Login</h2>
        <div id="error-container"><?= $err_msg ?></div>
        <form action="<?php ($_SERVER['PHP_SELF']) ?>" method="POST">
            <input type="text" name="username" id="username" placeholder="Username" required>
            <br>
            <input type="password" name="password" id="password" placeholder="Password" required>
            <br>
            <input type="submit" value="Login" id="login-button">
            <input type="hidden" name="from" value="<?=$_GET['from'] ?? null?>">
        </form>
    </div>
</body>
</html>