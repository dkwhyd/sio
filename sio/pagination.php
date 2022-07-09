<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include_once('config.php');
// menentukan batas data yang akan diperoleh dari database
$batas = 3;
// mengambil query halaman, jika ada isi dengan query tersebut, jika tidak ada isi dengan 0
$halaman = isset($_GET['halaman']) ? $_GET['halaman'] : 0;
echo $halaman . "<br>";
// cek apakaha halaman nilainya lebih besar 1 jika ya (halaman x batas) - batas, jika tidak isi dengan 0
$halaman_awal = ($halaman > 1) ? ($halaman * $batas) - $batas : 0;

// untuk memberikan nilai pada halaman, jika klik tombol previous maka nilai halaman kurangi 1
$previous = $halaman - 1;
// untuk memberikan nilai pada halaman, jika klik tombol next maka nilai halaman tambah 1
$next = $halaman + 1;

$allDataObat = mysqli_query($connection, "SELECT * FROM obat ");
$jumlahData = mysqli_num_rows($allDataObat);
$total_halaman = ceil($jumlahData / $batas);

$query = "SELECT * FROM obat limit $halaman_awal, $batas";

$getData = mysqli_query($connection, $query);

$nomor = $halaman_awal + 1;

echo "Total data :$total_halaman";

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>percobaan pagination</title>
</head>

<body>
    <table border="1">
        <thead>
            <tr>
                <td>#</td>
                <td>kode obat</td>
                <td>nama obat</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <?php
                while ($dataObat = mysqli_fetch_array($getData)) {
                    echo "    <tr>";
                    echo "<td>" . $nomor++ . "</td>";

                    echo "<td>" . $dataObat['kd_obat'] . "</td>";
                    echo "<td>" . $dataObat['nama_obat'] . "</td>";
                    echo "   </tr>";
                }

                ?>
            </tr>
        </tbody>
    </table>
    <a <?php if ($halaman > 1) {
            echo "href='?halaman=$previous'";
        } ?>>previous</a>

    <?php
    for ($x = 1; $x <= $total_halaman; $x++) {
    ?>
        <li class="page-item"><a class="page-link" href="?halaman=<?php echo $x ?>"><?php echo $x; ?></a></li>
    <?php
    }
    ?>
    <a <?php if ($halaman > 0) {
            echo "href='?halaman=$next'";
        } ?>>Next</a>
</body>

</html>