<!--Pagina index.php di benvenuto che visualizza il nome utente loggato o il nome generico “Ospite” e permette di accedere alla pagina di login.php-->
<?php
    session_start();

    if (isset($_SESSION['username'])) {
        echo "<h1>Benvenuto, $_SESSION[username]!</h1>";
    } 
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Home Page</title>
    </head>
    <body>
        <h1>Pagina di Benvenuto</h1>
        
        <h3><a href='login.php'>Accedi</a><br></h3>
        <h3><a href='logout.php'>Logout</a><br></h3>
        <h3><a href='protected_page.php'>Pagina protetta</a></h3>
    </body>

</html>


