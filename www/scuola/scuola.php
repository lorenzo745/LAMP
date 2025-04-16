<?php 

define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'ES05_user');
define('DB_PASSWORD', 'mia_password');
define('DB_NAME', 'scuola');

$conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Query per ottenere tutti gli studenti
$sql = "SELECT * FROM studenti";
$result = mysqli_query($conn, $sql);
if(!$result) exit ("errore");
while ($riga= mysqli_fetch_assoc($result)) {
    foreach($riga as $col){
        echo "$col";
    }

}
?>


