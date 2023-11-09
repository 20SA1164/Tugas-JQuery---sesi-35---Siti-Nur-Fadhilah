-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Nov 2023 pada 10.33
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_produk`
--

CREATE TABLE `kategori_produk` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori_produk`
--

INSERT INTO `kategori_produk` (`id_kategori`, `nama_kategori`) VALUES
(1, 'kecantikan'),
(2, 'kesehatan'),
(3, 'olahraga'),
(4, 'aksesoris'),
(5, 'makanan'),
(6, 'minuman');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `kode_produk` varchar(11) NOT NULL,
  `gambar` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `id_produk_kategori` int(11) DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `kode_produk`, `gambar`, `nama_produk`, `deskripsi`, `id_produk_kategori`, `harga`, `stok`, `id_supplier`, `created_at`, `updated_at`) VALUES
(18, 'K-001', 'images/serum the originote.jpeg', 'Serum The Originote', 'Varian serum The Originote yang pertama adalah The Originote Hyalu-C Serum. Diformulasikan dengan 3 jenis vitamin C, 5 jenis Hyaluronic Acid, dan Flower Blend, serum The Originote ini mampu bertindak sebagai antioksidan.  Kombinasi bahan dalam The Originote Hyalu-C Serum juga dapat mencerahkan kulit kusam, melembabkan, serta merawat keremajaan kulit', 1, 45000.00, 30, 2, '2023-11-08 21:02:52', '2023-11-09 09:02:52'),
(19, 'M-001', 'images/tic tac.png', 'Tic Tac', 'Dua Kelinci snack pilus tic tac rasa sapi panggang.', 5, 7100.00, 30, 4, '2023-11-08 21:21:21', '2023-11-09 09:21:21'),
(20, 'MN-001', 'images/20073495_1.jpg', 'Fruit Tea', 'Minuman teh rasa stroberi dan anggur dengan sensasi dingin. Dibuat dengan daun teh pilihan dan sari buah. Minuman teh yang praktis untuk menghilangkan haus dan menyegarkan harimu.', 6, 3900.00, 100, 4, '2023-11-08 21:25:59', '2023-11-09 09:25:59'),
(21, 'O-001', 'images/volli.png', 'Bola Voli', 'Bola Volley MIKASA MV 2200 SUPER GOLD memiliki kualitas yang baik. Pantulan yang dihasilkan oleh bola voli ini juga maksimal. Untuk produk yang asli bahan dari bola voli ini adalah kulit karakter empuk sehingga tidak keras / sakit di tangan. Ringan dan kulit bola tidak mudah terkelupas sehingga tahan lama.', 3, 170000.00, 30, 4, '2023-11-08 21:26:50', '2023-11-09 09:26:50'),
(22, 'KE-001', 'images/fresh care.jpg', 'FreshCare', 'FreshCare berkhasiat untuk meringankan pusing-pusing, sakit kepala, perut kembung, masuk angin, mabuk perjalanan, gejala flu, pegal-pegal, dan gatal akibat gigitan seranggga.', 2, 23000.00, 50, 4, '2023-11-08 21:28:45', '2023-11-09 09:28:45'),
(23, 'A-001', 'images/ring holder.jpeg', 'Ring Holder HP ', 'RING STAND HP / IRING HOLDER CINCIN HANDPHONE RINGSTAND STANDING HP / RING STAND HOLDER JARI / GANTUNGAN HP', 4, 690.00, 100, 5, '2023-11-08 21:30:14', '2023-11-09 09:30:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_sup` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `telepon` int(11) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_sup`, `nama`, `telepon`, `alamat`) VALUES
(1, 'PT. Iniko Karya Persada', 887954353, 'jawa timur'),
(2, 'PT Mitra Tsalasa Jaya', 876352745, 'Banten'),
(3, 'CV. Jaya Bersama', 879653765, 'Semarang'),
(4, 'PT Surgika Alkesindo', 214253634, 'surabaya'),
(5, 'PT Virtue Capital Indonesia', 9273453, 'Tangerang');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori_produk`
--
ALTER TABLE `kategori_produk`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_produk_kategori` (`id_produk_kategori`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_sup`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori_produk`
--
ALTER TABLE `kategori_produk`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_sup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_sup`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`id_produk_kategori`) REFERENCES `kategori_produk` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
