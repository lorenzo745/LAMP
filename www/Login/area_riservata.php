<!--riservata.php: Verifica se l'utente è autenticato. Se non lo è, reindirizzalo alla pagina di login. Mostra un messaggio di benvenuto all'utente autenticato e un link per effettuare il logout. 
-->
<?php
    session_start();
    if (!isset($_SESSION['utente'])) {
        header("Location: login.php");
        exit;
    }
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

