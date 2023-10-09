<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "sql_kuadrat";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT * FROM akar_kuadrat";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo "<table border=1><tr><th>No</th><th>Angka</th><th>Hasil</th></tr>";
        while($row = $result->fetch_assoc()) {
            echo "<tr><td>".$row["id"]."</td><td>".$row["nilai_input"]."</td><td>".$row["akar_kuadrat"]."</td></tr>";
        }
        echo "</table>";
    } else {
        echo "Tidak ada hasil perhitungan.";
    }

    $conn->close();
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Hitung Akar Kuadrat</title>
    </head>
    <body>
        <a href="index.html">Kembali</a>
    </body>
</html>