<DOCTYPE html>
    <head>
    <h4> esercizio form </h4>
    </head>
<body>
    <form action="esercizio_form.php" method="post">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" required><br>

        <label for="cognome">Cognome:</label>
        <input type="text" id="cognome" name="cognome" required><br>

        <label for="data_nascita">Data di Nascita:</label>
        <input type="text" id="data_nascita" name="data" required><br>

        <label for="codice_fiscale">Codice:</label>
        <input type="text" id="codice_fiscale" name="codice"><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="tel">Tel:</label>
        <input type="tel" id="tel" name="tel"><br>

        <label type="via">Via:</label>
        <input type="text" id="via" name="via" require><br>

        <label for="comune">Comune:</label>
        <input type="text" id="comune" name="comune"><br>

        <label for="cap">CAP:</label>
        <input type="text" id="cap" name="cap" require><br>

        <label for="provincia">Provincia:</label>
        <input type="text" id="provincia" name="provincia" require><br>

        <label for="nickname">Nickname:</label>
        <input type="text" id="nickname" name="nickname"><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>




        <input type="submit" value="Invia">
    </form>

<?php
