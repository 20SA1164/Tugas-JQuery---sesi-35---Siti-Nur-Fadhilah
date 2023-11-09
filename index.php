<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
    <title>Penjualan</title>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <?php
                include 'koneksi.php';
                $query = mysqli_query($conn, "SELECT * FROM produk as p join supplier as s ON p.id_supplier = s.id_sup join kategori_produk as kp on p.id_produk_kategori = kp.id_kategori");
                ?>
                <center>
                    <h1>DATA PRODUK</h1>
                </center>
                <a href="tambah.php" class="btn btn-light" style="margin-bottom:5px"><i class="fa-solid fa-user-plus"></i></a>
                <table id="data-tabel" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>
                                Kode Produk
                            <th>
                                Gambar
                            </th>
                            <th>
                                Nama Produk
                            </th>
                            <th>
                                Deskripsi
                            </th>
                            <th>
                                Kategori
                            </th>
                            <th>
                                Harga Satuan
                            </th>
                            <th>
                                Stok Barang
                            </th>
                            <th>
                                Supplier
                            </th>
                            <th>
                                Created at
                            </th>
                            <th>
                                Updated at
                            </th>
                            <th>
                                Aksi
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if (mysqli_num_rows($query) > 0) {
                            $no = 1;
                            while ($data = mysqli_fetch_array($query)) {
                        ?>
                                <tr>
                                    <td><?php echo $data["kode_produk"] ?></td>
                                    <td><img src="<?php echo $data["gambar"] ?>" width="100"></td>
                                    <td><?php echo $data["nama_produk"] ?></td>
                                    <td><?php echo $data["deskripsi"] ?></td>
                                    <td><?php echo $data["nama_kategori"] ?></td>
                                    <td><?php echo $data["harga"] ?></td>
                                    <td><?php echo $data["stok"] ?></td>
                                    <td><?php echo $data["nama"] ?></td>
                                    <td><?php echo $data["created_at"] ?></td>
                                    <td><?php echo $data["updated_at"] ?></td>
                                    <td><a href="edit.php?id=<?php echo $data["id"] ?>"><button type="button" class="btn btn-warning"><i class="fa-regular fa-pen-to-square"></i></button></a>
                                        <br>
                                        <a href="proses_delete.php?id=<?php echo $data["id"] ?>" data-id="<?php echo $data["id"] ?>" class="btn-delete">
                                            <button type="button" class="btn btn-danger"><i class="fa-regular fa-trash-can"></i></button>
                                        </a>
                                    </td>
                                </tr>
                            <?php $no++;
                            } ?>
                        <?php } ?>
                    </tbody>

                </table>
            </div>
        </div>
    </div>
    <script src="https://kit.fontawesome.com/6beb2a82fc.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
    <script>
        new DataTable('#data-tabel');
    </script>
    <script>
        $(document).ready(function() {
            // Menangani klik tombol "Hapus"
            $('.btn-delete').on('click', function(e) {
                e.preventDefault(); // Mencegah tindakan asli tautan

                var id = $(this).data('id');
                var confirmation = confirm("Apakah Anda yakin ingin menghapus produk ini?");

                if (confirmation) {
                    // Jika pengguna mengonfirmasi, arahkan ke halaman proses penghapusan
                    window.location.href = "proses_delete.php?id=" + id;
                } else {
                    // Jika pengguna membatalkan, tidak terjadi apa-apa
                }
            });
        });
    </script>

</body>

</html>