<!--Pagina per l'autenticazione degli utenti ed accesso alla sezione riservata del sito.-->
<?php 
    session_start();
if($_SESSION['utente']){
    header("Location: index.php");
    die();
}

if (isset($_GET['error'])) {                                         
    // Mostra il messaggio di errore passato tramite query string     
    $errMsg=$_GET['error'];  
}


if($_SERVER['REQUEST_METHOD']=='POST') {
    $username_corretto = 'admin';
    $password_corretta = 'password123';

    $username_inserito = $_POST['username'];
    $password_inserita = $_POST['password'];

    if ($username_inserito == $username_corretta && $password_inserita == $password_corretta) {
        $_SESSION['utente'] = $username_inserito;
        $from = $_POST['from'] ?? 'index.php'; 
        header("Location: $from");
        exit;
    } else {
        $mess= "<h2 style ='color:red'>Nome utente o password errati. Riprova.</h2>";
    }
}
?>

<!DOCTYPE html>
<
