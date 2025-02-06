<?php
    session_start();
    if(isset($_SESSION['utente'])){
        $collegamento = "<a href='uscita.php'>Esci</a>";
    } else {
        $collegamento = "<a href='accesso.php'>Accedi</a>";
    }
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <title>Pagina di Benvenuto</title>
</head>
<body>
    <h1>Benvenuto</h1>
    <a href="area_riservata.php">Accedi all'area riservata</a>
    <br>
    <?php echo $collegamento; ?>
</body>
</html>
