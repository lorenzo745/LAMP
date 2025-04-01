<?php 

define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'ES05_user');
define('DB_PASSWORD', 'mia_password');
define('DB_NAME', 'ES05');

function controllosessione()  
{  
    if (isset($_SESSION['username'])) {  
        return [true, 'sessione avviata con successo'];  
    } else {  
        return [false, 'sessione non avviata'];  
    }  
}  


function controllo_login()  
{ 
    $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

    if (!$conn) {
        die("Attenzione! Connessione al database fallita." . mysqli_connect_error());
    }

    $query = "SELECT * FROM utenti WHERE email = '$email' AND password = '$password'";
    $result = mysqli_query($conn, $query);

    // Verifica se la query ha restituito risultati
    if (mysqli_num_rows($result) > 0) {
        echo "Login riuscito. Benvenuto!"; // L'utente è autenticato con successo
    } else {
        echo "Credenziali non valide. Riprova."; // L'utente non è autenticato
    }

    // Chiudi la connessione al database
    mysqli_close($conn);
}

function logout()
{
    session_start();
    session_destroy();
    header("Location: login.php");
    die();
}

function impostaCollegamento(){ 
    if(checksession()[0]){
        $collegamento= "<a href='logout.php'>logout</a>";
        } else {
        $collegamento = "<a href='login.php'>login</a>";
    }
    return $collegamento;
}
