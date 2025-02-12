<?php

function controlloSessione() 
{
    if(isset($_SESSION['utente'])){
        return true;
        } else {
        return false;
    }
}

function controlloLogin($utente,$password){
    $username_corretto = 'admin';
    $password_corretta = 'password123';

    $username_inserito = $_POST['utente'];
    $password_inserita = $_POST['password'];

    if ($username_inserito == $username_corretto && $password_inserita == $password_corretta) {
        // Se i dati sono corretti, salva il nome utente nella sessione e reindirizza l'utente alla pagina principale
        $_SESSION['utente'] = $username_inserito;
        return true;
    }
    else {
        return false;
    }
}

function logout(){
    session_start();
    session_destroy();
    header("Location: login.php");
}

function impostaCollegamento(){ 
    if(checksession()[0]){
        $collegamento= "<a href='logout.php'>logout</a>";
        } else {
        $collegamento = "<a href='login.php'>login</a>";
    }
    return $collegamento;
}
?>