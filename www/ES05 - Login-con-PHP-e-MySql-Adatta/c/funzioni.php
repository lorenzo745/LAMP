<?php 

define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'ES05_user');
define('DB_PASSWORD', 'mia_password');
define('DB_NAME', 'ES05');

function controllosessione()  
{  
    if (isset($_SESSION['utente'])) {  
        return [true, 'sessione avviata con successo'];  
    } else {  
        return [false, 'sessione non avviata'];  
    }  
}  


function controllo_login($username,$password)  
{ 
    $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

    if (!$conn) {
        die("Attenzione! Connessione al database fallita." . mysqli_connect_error());
    }

    $username = $_POST['utente'];
    $password = $_POST['password'];

    $query = "SELECT * FROM account WHERE username = '" . $username . "' AND password = '" . $password . "'";
    $result = mysqli_query($conn, $query);

    // Verifica se la query ha restituito risultati
    if (mysqli_num_rows($result) > 0) {
        return [true,'login effettuato con successo'];
    } else {
        return [false,'login non effettuato con successo'];
    }

    // Chiudi la connessione al database
    mysqli_close($conn);
}

function uscita()
{
    session_start();
    session_destroy();
    header("Location: index.php");
    die();
}

function impostaCollegamento(){ 
    if(controllosessione()[0]){
        $collegamento= "<a href='uscita.php'>uscita</a>";
        } else {
        $collegamento = "<a href='login.php'>login</a>";
    }
    return $collegamento;
}
