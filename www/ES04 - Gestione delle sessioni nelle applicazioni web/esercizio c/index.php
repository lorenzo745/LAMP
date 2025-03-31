<?php
    session_start();

    require_once 'funzioni.php';

    $collegamento = impostaCollegamento();
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Pagina di Benvenuto</title>
    </head>
    <body>
        <h1>Benvenuto <?php echo $_SESSION['utente'] ?></h1>
        <a href="riservata.php">Riservata</a><br />
        <?php echo $collegamento; ?>
    </body>
</html>