<?php 
    require 'funzioni.php';

    session_start();

    [$sessionRetval, $sessionmsg] = controlloSessione();

    if (!$sessionRetval) {
        $url = 'Location: login.php?from=' . basename($_SERVER['PHP_SELF']) . '&error=' . $sessionmsg;
        header($url);
        die();
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pagina Riservata</title>
</head>
<body>
    <?="<h3>Benvenuto " . $_SESSION['username'] . "</h3>"?>

    <a href="index.php">Home page</a>
    <br>
    <a href="logout.php">Logout</a>
</body>
</html>

    
        