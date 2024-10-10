<!DOCTYPE html>
<html lang >
<head>
<title>Esercitazione a</title>
</head>
<body>
    <h1>Tavola pitagorica</h1>
        <?php
        echo '<table border="1">'; 
        for($i=1; $i<11; $i++) 
        {
            echo "\n\t<tr>";
            for($j=1; $j<11; $j++)
            {
                $s=$j*$i;
                echo "<td>$s</td>";
            }
        }
        echo "</table>";


        ?>
</body>
</html>