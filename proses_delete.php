<?php 
include 'koneksi.php';

// // echo "<br>=====DEBUG QUERY======<br>";
// echo "UPDATE `buku` set `judul` = '$judul', `tahun` = '$tahun', `id_penerbit` = '$penerbit', `id_pengarang` = '$pengarang', `id_katalog` = '$katalog', `qty_stok` = '$stok', `harga_pinjam` = '$harga_pinjam', `updated_at`= '$updated_at' where `isbn` = '$_GET[isbn]'";
// // echo "<br>======================<br>";

$result = mysqli_query($conn, "DELETE from produk where `id` = '$_GET[id]'");

header("Location:index.php");

?>