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
        <label for="nome"><strong>Nome*:</strong></label>
        <input type="text" id="nome" name="nome" pattern="[A-Za-zÀ-ÿ\s]+" required>
        <br><br>

        <!-- Password -->
        <label for="password"><strong>Password* :</strong></label>
        <input type="password" id="password" name="password" pattern="(?=.*[A-Z])(?=.*\d)(?=.*\W).{8,}" required>
        <br><br>

        <input type="submit" value="Invia">
    </form>
</body>
</html>

