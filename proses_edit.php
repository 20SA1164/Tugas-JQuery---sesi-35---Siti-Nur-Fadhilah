<?php 
include 'koneksi.php';
date_default_timezone_set('Asia/Jakarta');

// get variable from form input
$produk = $_POST["nama_produk"];
$deskripsi = $_POST["deskripsi"];
$kategori = $_POST["kategori"];
$harga = $_POST["harga"];
$stok = $_POST["stok"];
$supplier = $_POST["supplier"];
$updated_at = date('Y-m-d H:i:s');

// Upload Proses
$target_dir = "images/"; // path directory image akan di simpan
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]); // full path dari image yg akan di simpan
if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) { // fungsi ini utk memindahkan file dr tempat asal ke target_file
    echo "The file ". htmlspecialchars(basename($_FILES["fileToUpload"]["name"])). " has been uploaded.<br>";
} else {
    echo "Sorry, there was an error uploading your file.<br>";
}

$result = mysqli_query($conn, "UPDATE `produk` set `gambar` = '$target_file', `nama_produk` = '$produk', `deskripsi` = '$deskripsi', `id_produk_kategori` = '$kategori', `harga` = '$harga', `stok` = '$stok', `id_supplier` = '$supplier', `updated_at`= '$updated_at' where `id` = '$_GET[id]'");

header("Location:index.php");

?>