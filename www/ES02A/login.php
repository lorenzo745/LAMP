<?php
$username = $_POST['username'];
$passwd = $_POST['password'];


if($username=="Mario" && $passwd=="123") {
  $msg = "<h2>Inserire altre credenziali<h2>";
} else {
  $msg = "Benvenuto $username nella pagina riservata del mio sito!";
}
?>

<!DOCTYPE html>
<html>
<head>
  <title>Accesso a pagina riservata</title>
</head>
<body>
  <h1>Pagina di login</h1>
  
  <?=$msg?>

</body>
</html>