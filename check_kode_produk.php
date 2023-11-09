<?php
include 'koneksi.php';

if (isset($_POST['kode_produk'])) {
    $kode_produk = $_POST['kode_produk'];

    $query = "SELECT * FROM produk WHERE kode_produk = '$kode_produk'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        echo "exists"; // Kode Produk sudah ada di database
    } else {
        echo "not_exists"; // Kode Produk belum ada di database
    }
}
?>
