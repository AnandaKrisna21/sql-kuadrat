<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["nilaiInput"])) {
        $nilaiInput = $_POST["nilaiInput"];

        // Koneksi ke basis data
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "sql_kuadrat";

        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Koneksi gagal: " . $conn->connect_error);
        }

        // Memanggil stored procedure
        $stmt = $conn->prepare("CALL hitung_akar_kuadrat(?)");
        $stmt->bind_param("d", $nilaiInput);
        $stmt->execute();
        $stmt->bind_result($hasil, $jumlah_iterasi);
        $stmt->fetch();

        // Menyusun hasil ke dalam array
        $result = [
            "hasil" => $hasil,
            "jumlah_iterasi" => $jumlah_iterasi
        ];

        echo json_encode($result);

        $stmt->close();
        $conn->close();
    } else {
        echo json_encode(["error" => "Permintaan tidak valid."]);
    }
?>
