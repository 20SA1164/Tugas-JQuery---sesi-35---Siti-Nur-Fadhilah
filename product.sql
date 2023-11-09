-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Nov 2023 pada 10.07
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

INSERT INTO `produk` (`id`, `gambar`, `nama_produk`, `deskripsi`, `id_produk_kategori`, `harga`, `stok`, `id_supplier`, `created_at`, `updated_at`) VALUES
(15, 'images/sepak-bola.jpg', 'Bola ', 'Bola Sepak Lapangan Produk Original Kualitas premium', 3, 100000.00, 30, 4, '2023-11-08 08:48:05', '2023-11-08 08:48:05'),
(16, 'images/ring holder.jpeg', 'Ring Holder Hp', 'RING STAND HP / IRING HOLDER CINCIN HANDPHONE RINGSTAND STANDING HP / RING STAND HOLDER JARI / GANTUNGAN HP', 4, 1000.00, 100, 2, '2023-11-08 08:48:05', '2023-11-08 09:01:16'),
(44, 'images/mois skintific.jpeg', 'Moisturizer Skintific', 'Diformulasikan menggunakan teknologi 5X Ceramides yang meniru struktur skin barrier kita, moisturizer ini menggunakan 5 tipe Ceramide yang memiliki fungsi berbeda untuk menjaga kesehatan kulit (Ceramide NP, Ceramide AP, Ceramide NS, Ceramide AS, Ceramide EOP) ● Kandungan Ceramides dapat memperbaiki skin barrier, melembabkan kulit serta menenangkan sel kulit yang rusak ● Dilengkapi juga dengan kandungan lain seperti Hyaluronic Acid, Centella Asiatica, dan Marine Collagen untuk menghidrasi kulit secara mendalam ● Memiliki tekstur seperti gel yang sangat ringan pada kulit, moisturizer ini menyimpan banyak kandungan air sehingga dapat digunakan untuk semua tipe kulit wajah karena sifatnya yang cepat menyerap, tidak berminyak, tidak lengket, dan terdapat efek cooling sensation yang menyegarkan kulit', 1, 160000.00, 30, 3, '2023-11-08 08:48:05', '2023-11-08 08:48:05'),
(45, 'images/volli.png', 'Bola Voli', 'Bola Volley MIKASA MV 2200 SUPER GOLD memiliki kualitas yang baik. Pantulan yang dihasilkan oleh bola voli ini juga maksimal. Untuk produk yang asli bahan dari bola voli ini adalah kulit karakter empuk sehingga tidak keras / sakit di tangan. Ringan dan kulit bola tidak mudah terkelupas sehingga tahan lama.', 3, 180000.00, 20, 3, '2023-11-08 08:48:05', '2023-11-08 08:58:16'),
(46, 'images/serum the originote.jpeg', 'Serum The Originote', 'Hyalu C Serum bermanfaat mencerahkan kulit kusam, menjaga kelembapan wajah dan merawat peremajaan kulit.', 1, 40000.00, 60, 5, '2023-11-08 08:48:05', '2023-11-08 09:01:32'),
(47, 'images/fresh care.jpg', 'Fresh Care ', 'FRESHCARE ROLL ON MINYAK ANGIN STRONG (HOT) 10 ML adalah minyak angin yang digunakan untuk membantu meredakan perut kembung, pusing, masuk angin dan mabuk perjalanan.', 2, 23000.00, 100, 3, '2023-11-08 08:48:05', '2023-11-08 08:48:05'),
(48, 'images/20073495_1.jpg', 'Fruit Tea', 'Minuman teh rasa stroberi dan anggur dengan sensasi dingin. Dibuat dengan daun teh pilihan dan sari buah. Minuman teh yang praktis untuk menghilangkan haus dan menyegarkan harimu.', 6, 4000.00, 1000, 2, '2023-11-07 21:03:50', '2023-11-08 09:03:50'),
(49, 'images/tic tac.png', 'Tic Tac', 'Dua Kelinci snack pilus tic tac rasa sapi panggang. Cara Penyimpanan : Simpan dilemari pendingin agar lebih lezat.', 5, 10000.00, 80, 4, '2023-11-07 21:05:33', '2023-11-08 09:05:33');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

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
