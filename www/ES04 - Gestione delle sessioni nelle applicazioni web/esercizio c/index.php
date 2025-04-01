<?php
    session_start();

    require_once 'funzioni.php';

    $collegamento = '';


    if(checksession()[0]){
        $collegamento= "<a href='logout.php'>logout</a>";
        } else {
        $collegamento = "<a href='login.php'>login</a>";
    }
    
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