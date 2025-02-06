<!--Crea un modulo di login che richieda un nome utente e una password. Verifica le credenziali inserite e, se corrette, crea una variabile di sessione per memorizzare -->
<?php
 session_start();
    if (isset($_SESSION['utente']))
    {
        header("Location: index.php");
        die();
    }
                                                         
    if (isset($_GET['error'])) {                                         
       // Mostra il messaggio di errore passato tramite query string     
       $errMsg=$_GET['error'];  
    }
    
    if ($_SERVER["REQUEST_METHOD"] == "POST"){
    
    $utente_corretto = 'Lorenzo';
    $password_corretta = 'Password123!';

    $utente= $_POST['nome'];
    $password = $_POST['password'];

    if ($utente == $utente_corretto && $password == $password_corretta) {
        $_SESSION['utente'] = $utente;
        $from = $_POST['from'] ?? 'index.php'; 
        header("Location: $from");
        exit;
    } else {
        $mess= "<h2 style ='color:red'>Nome utente o password errati. Riprova.</h2>";
    }
}
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form validazione</title>
    <link rel="stylesheet" href="stile.css">
</head>
<body>
    <?=$mess?>
    <h1>FORM DI REGISTRAZIONE</h1>
    <form action="<?php echo $_SERVER['PHP_SELF']?>" method="POST">

        <h2>Informazioni riguardanti l'utente</h2>
        
        <!-- Nome -->
        <label for="nome"><strong>Nome*:</strong></label>
        <input type="text" id="nome" name="nome" pattern="[A-Za-zÀ-ÿ\s]+" required>
        <br><br>

        <!-- Password -->
        <label for="password"><strong>Password* :</strong></label>
        <input type="password" id="password" name="password" pattern="(?=.*[A-Z])(?=.*\d)(?=.*\W).{8,}" required>
        <br><br>

        <input type="submit" value="Invia">

        <input type="hidden" name="from" value="<?= $_GET['from'] ?? '' ?>">
    </form>
</body>
</html>
