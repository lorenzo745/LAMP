<!DOCTYPE html>
<html lang="it">
<head>
    <title>Login</title>
</head>
<body>
        <h2>Login</h2>

        <h3 style= color:red><?= $mess ?>

        <form action="<?= $_SERVER['PHP_SELF']; ?>" method="POST">
            
            <input type="text" name="utente" id="utente" placeholder="utente" pattern=".{3,}" required title="Minimo 3 lettere">
            <br>
            
            <input type="password" name="password" id="password" placeholder="password" pattern=".{3,}" required title="Minimo 3 lettere">
            <br>

            <input type="password" name="cpassword" id="cpassword" placeholder="cpassword" pattern=".{3,}" required title="Minimo 3 lettere">
            <br>

            <input type="email" name="email" id="email" placeholder="email">
            <input type="submit" value="Login" id="login-button">

            <input type="hidden" name="from" value="<?= $_GET['from'] ?? null ?>"> 
        </form>
            <?= $links ?>
</body>
</html>