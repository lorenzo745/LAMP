<!DOCTYPE html>
<html>
<head>
    <title>Esercitazione c</title>
</head>
<body>

<?php
// Pattern (a)
echo "(a)<br>";
for ($i = 1; $i <= 8; $i++) {
    for ($j = 1; $j <= $i; $j++) {
        echo "*";
    }
    echo "<br>";
}

// Pattern (b)
echo "<br>(b)<br>";
for ($i = 8; $i >= 1; $i--) {
    for ($j = 1; $j <= $i; $j++) {
        echo "*";
    }
    echo "<br>";
}

// Pattern (c)
echo "<br>(c)<br>";
for ($i = 8; $i >= 1; $i--) {
    // Print leading spaces
    for ($j = 1; $j <= 8 - $i; $j++) {
        echo "&nbsp;&nbsp;";
    }
    // Print asterisks
    for ($k = 1; $k <= $i; $k++) {
        echo "*";
    }
    echo "<br>";
}

// Pattern (d)
echo "<br>(d)<br>";
for ($i = 1; $i <= 8; $i++) {
    // Print leading spaces
    for ($j = 1; $j <= 8 - $i; $j++) {
        echo "&nbsp;&nbsp;";
    }
    // Print asterisks
    for ($k = 1; $k <= $i; $k++) {
        echo "*";
    }
    echo "<br>";
}
?>

</body>
</html>