<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Visualizzazione Dati Utente</title>
</head>
<body>
    <h1>Dati inseriti nel form:</h1>

    <?php
    // Verifica se il form è stato inviato correttamente tramite POST
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Recupera i dati inviati dal form senza sanitizzazione
        $nome = trim($_POST['nome']);

        $cognome = trim($_POST['cognome']);

        $dataNascita = trim($_POST['data_nascita']);

        $cf = strtoupper(trim($_POST['codice_fiscale']));

        $email = trim($_POST['email']);

        $tel = trim($_POST['tel']);

        $via = trim($_POST['via']);

        $nCivico = trim($_POST['nCivico']);

        $cap = trim($_POST['cap']);

        $comune = trim($_POST['comune']);

        $provincia = strtoupper(trim($_POST['provincia']));

        $username = trim($_POST['username']);

        $password = trim($_POST['password']);

        
        // Visualizzazione dei dati
        echo "<p><strong>Nome:</strong> $nome</p>";
        echo "<p><strong>Cognome:</strong> $cognome</p>";
        echo "<p><strong>Data di nascita:</strong> $data_nascita</p>";
        echo "<p><strong>Codice Fiscale:</strong> $codice_fiscale</p>";
        echo "<p><strong>Email:</strong> $email</p>";
        echo "<p><strong>Cellulare:</strong> $cellulare</p>";
        echo "<p><strong>Indirizzo:</strong> (via/piazza) $via $nCivico, $CAP $comune ($provincia)</p>";
        echo "<p><strong>Nickname:</strong> $nickname</p>";
        echo "<p><strong>Password:</strong> $password</p>";
    } else {
        echo "<p>Nessun dato è stato inviato.</p>";
    }
    ?>

</body>
</html>
