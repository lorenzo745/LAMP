<!--riservata.php: Verifica se l'utente è autenticato. Se non lo è, reindirizzalo alla pagina di login. Mostra un messaggio di benvenuto all'utente autenticato e un link per effettuare il logout. 
-->
<?php
    session_start();
    if (!isset($_SESSION['utente'])) {
        // L'utente non è autenticato, quindi redirect alla pagina di login
        $url = 'login.php?error=Fare prima il login&from=';
        $url .= basename($_SERVER['PHP_SELF']);
        header("Location: $url");
        die();
    }
    // L'utente è autenticato, mostra il messaggio di benvenuto 
?>
<!DOCTYPE html>
    <html lang="en">
<head>
    <title>Pagina Riservata</title>
</head>
<body>
    <h1>Benvenuto, <?php echo $_SESSION['utente'];?>!</h1>
    <a href="index.php">Home page</a>
    <br>
    <a href="uscita.php">Logout</a>
</body>
</html>

