<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tambah Pesanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <?php
    include 'koneksi.php';
    $query = mysqli_query($conn, "SELECT * FROM produk as p join supplier as s ON p.id_supplier = s.id_sup join kategori_produk as kp on p.id_produk_kategori = kp.id_kategori")
    ?>
    <center>
        <div class="card text-bg-light mb-3 mt-5" style="max-width: 50rem;">
            <div class="card-header">
                <h3>ADD PAGE</h3>
            </div>
            <div class="card-body">
                <h5 class="card-title">Data Produk</h5>
                <form action="proses_tambah.php" method="post" enctype="multipart/form-data" id="tambah_barang">
                    <input class="form-control mb-3" type="text" placeholder="Kode Produk" name="kode_produk" id="kode_produk">
                    <input class="form-control mb-3" type="file" name="fileToUpload" id="fileToUpload" required>
                    <input class="form-control mb-3" type="text" placeholder="Nama Produk" name="nama_produk" required>
                    <input class="form-control mb-3" type="text" placeholder="Deskripsi Produk" name="deskripsi" required>
                    <div class="input-group mb-3">
                        <select class="form-select" name="kategori" id="kategori">
                            <option selected>Kategori Produk</option>
                            <?php
                            // Fetch data from the "items" table
                            $query = mysqli_query($conn, "SELECT * FROM kategori_produk");
                            if (mysqli_num_rows($query) > 0) {
                                while ($data = mysqli_fetch_array($query)) {
                                    
                                    echo "<option value='" . $data["id_kategori"] . "'>" . $data["nama_kategori"] . "</option>";
                                }
                            } else {
                                echo "<option value=''>No items available</option>";
                            }
                            ?>
                        </select>
                    </div>
                    <input class="form-control mb-3" type="number" placeholder="Harga Satuan" name="harga" required>
                    <input class="form-control mb-3" type="number" placeholder="Stok" name="stok" required>
                    <div class="input-group mb-3">
                        <select class="form-select" name="supplier" id="supplier">
                            <option selected>Supplier</option>
                            <?php
                            // Fetch data from the "items" table
                            $query = mysqli_query($conn, "SELECT * FROM supplier");
                            if (mysqli_num_rows($query) > 0) {
                                while ($data = mysqli_fetch_array($query)) {
                                    
                                    echo "<option value='" . $data["id_sup"] . "'>" . $data["nama"] . "</option>";
                                }
                            } else {
                                echo "<option value=''>No items available</option>";
                            }
                            ?>
                        </select>
                    </div>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <button type="submit" class="btn btn-info left">Submit</button>
                    </div>

                </form>
            </div>
        </div>
    </center>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#kode_produk").on("blur", function() {
                var kode_produk = $(this).val();

                $.ajax({
                    url: "check_kode_produk.php",
                    type: "POST",
                    data: {
                        kode_produk: kode_produk
                    },
                    success: function(response) {
                        if (response == "exists") {
                            alert("Kode Produk sudah ada di database.");
                            $("#kode_produk").val(""); // Clear the input field
                        }
                    }
                });
            });
        });
    </script>

</body>

</html>