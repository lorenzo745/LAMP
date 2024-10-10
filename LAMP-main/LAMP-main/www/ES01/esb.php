<!DOCTYPE html>
<html lang >
<head>
<title>Esercitazione b</title>
</head>
<body>
    <?php
        $name = "Paolo";

        // Get the current time in the Europe/Rome timezone
        $today = new DateTime("now", new DateTimeZone('Europe/Rome'));
        $hour = $today->format('H');

        // Determine the greeting based on the time of day
        if ($hour >= 8 && $hour < 12) {
            $greeting = "Buongiorno";
        } elseif ($hour >= 12 && $hour < 20) {
            $greeting = "Buonasera";
        } else {
            $greeting = "Buonanotte";
        }

        // Get the user agent to detect the browser
        $browser = $_SERVER['HTTP_USER_AGENT'];

        // Output the greeting and browser information
        echo "$greeting $name, benvenuto nella mia prima pagina PHP!<br>";
        echo "Stai usando il browser: $browser";
    ?>