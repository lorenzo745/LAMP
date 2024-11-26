<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Raccolta dati dal form
    $nome = filter_input(INPUT_POST, 'nome');
    $cognome = filter_input(INPUT_POST, 'cognome');
    $data_nascita = $_POST['data_nascita'];
    $codice_fiscale = filter_input(INPUT_POST, 'codice_fiscale');
    $email = filter_input(INPUT_POST, 'email');
    $cellulare = filter_input(INPUT_POST, 'cellulare');
    $comune = filter_input(INPUT_POST, 'Comune');
    $indirizzo = filter_input(INPUT_POST, 'indirizzo');
    $nickname = filter_input(INPUT_POST, 'nickname');
    $password = $_POST['password'];

    // Validazione aggiuntiva nickname
    if ($nickname === $nome || $nickname === $cognome) {
        echo "Il nickname non può essere uguale al nome o al cognome.";
        exit;
    }

    // Validazione password
    if (!preg_match("/(?=.*[A-Z])(?=.*\d)(?=.*\W).{8,}/", $password)) {
        echo "La password deve contenere almeno una maiuscola, un numero e un carattere speciale.";
        exit;
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
    <h1>FORM DI REGISTRAZIONE</h1>
    <form action="validazione.php" method="POST">

        <h2>Informazioni riguardanti l'utente</h2>
        
        <!-- Nome -->
        <label for="nome"><strong>Nome:</strong></label>
        <input type="text" id="nome" name="nome" pattern="[A-Za-zÀ-ÿ\s]+" required>

        <!-- Cognome -->
        <label for="cognome"><strong>Cognome*:</strong></label>
        <input type="text" id="cognome" name="cognome" pattern="[A-Za-zÀ-ÿ\s']+" required>

        <!-- Data di nascita -->
        <label for="data_nascita"><strong>Data di Nascita*:</strong></label>
        <input type="date" id="data_nascita" name="data_nascita" required>
        <br><br>

        <!-- Codice Fiscale -->
        <label for="codice_fiscale"><strong>Codice fiscale:</strong></label>
        <input type="text" name="codice_fiscale" pattern="[a-zA-Z0-9]{16}" style="text-transform:uppercase">

        <!-- Email -->
        <label for="email"><strong>Email*:</strong></label>
        <input type="email" id="email" name="email" required>

        <!-- Cellulare -->
        <label for="cellulare"><strong>Cellulare (con prefisso):</strong></label>
        <input type="tel" id="cellulare" name="cellulare" pattern="[0-9]{12}">
        <br><br>

        <!-- Nickname -->
        <label for="nickname"><strong>Nickname*:</strong></label>
        <input type="text" id="nickname" name="nickname" required>

        <!-- Password -->
        <label for="password"><strong>Password* :</strong></label>
        <input type="password" id="password" name="password" pattern="(?=.*[A-Z])(?=.*\d)(?=.*\W).{8,}" required>
        <br><br>

        <h2>Indirizzo</h2>

        <!-- Via -->
        <label for="via"><strong>Via*:</strong></label>
        <input type="text" id="via" name="via" placeholder="via/piazza" required>
        <label for="civico"><strong>Civico:</strong></label>
        <input type="text" id="civico" name="civico" placeholder="numero">

        <!-- CAP -->
        <label for="CAP"><strong>CAP*:</strong></label>
        <input type="text" id="CAP" name="CAP" pattern="^\d{5}$" required>
        <br><br>

        <!-- Comune -->
        <label for="comune"><strong>Comune*:</strong></label>
        <input type="text" id="comune" name="comune" required>

        <!-- Provincia -->
        <label for="provincia"><strong>Provincia*:</strong></label>
        <input type="text" id="provincia" name="provincia" required>
        <br><br>
        <!-- far apparire un testo con scritto * campo obbligatorio-->
        <medium class= "testo-rosso">* Campi obbligatori</medium>
        <br><br>

        <input type="submit" value="Invia">
    </form>
</body>
</html>

