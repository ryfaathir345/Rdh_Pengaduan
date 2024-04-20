-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Apr 2024 pada 12.25
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kaji`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id` int(10) NOT NULL,
  `tgl_pengaduan` datetime NOT NULL,
  `isi_laporan` varchar(1000) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('0','proses','selesai') DEFAULT NULL,
  `petugas_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id`, `tgl_pengaduan`, `isi_laporan`, `foto`, `status`, `petugas_id`) VALUES
(1, '2024-04-20 14:00:06', 'wkwkwkwkw', '6.jpg', 'proses', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id` int(10) NOT NULL,
  `nik` char(16) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL DEFAULT 'no_foto.png',
  `telp` varchar(13) NOT NULL,
  `level` enum('masyarakat','petugas','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id`, `nik`, `nama`, `username`, `password`, `foto`, `telp`, `level`) VALUES
(1, '3573041502060005', 'rdh', 'rdh', '$2y$10$tEYEx6yn/PhiX7RpiEUI7OXeBIcIvGVuFyd7mP5/EjM7CCeummZ2y', '7.jpg', '08993352614', 'admin'),
(2, '122345678911', 'Skyline R34', 'divipard', '$2y$10$hlE6AYSf4ZH.SX1Dy5FwC.yP6CBv2BfWu0Y4F6AwVU092H70dOrZu', 'no_foto.png', '08993352611', 'masyarakat'),
(5, '3573041502060004', 'Nauki', 'nauki', '$2y$10$GzipBcMZ2Dk69iuw5i2VneE2soQUZWTzbYhUrTUa70L7pTZR34XQy', 'no_foto.png', '08993352697', 'masyarakat'),
(7, '3573041502060003', 'ocan', 'ocan', '$2y$10$1mESmhChuruBidqB/9Rab.NNqs682bnnkI.UtqTwcAc/goD7pJ5GO', 'no_foto.png', '12123456', 'masyarakat'),
(8, '1223456789112', 'Skyline R34', 'R34', '$2y$10$X.BuIeAhf0jQZIa66RBkVe9QYtIH0gqk9g6uP8.f2O7jUajQFkmKO', 'no_foto.png', '089933526564', 'admin'),
(10, '3573041502060002', 'Mazda RX 7', 'mazda', '$2y$10$Q6KYhkbXNaHVGRd8mcuNZOkB.lKBQ0ZKdIdUcLt2PD49pTHDsc5Em', 'no_foto.png', '08993352657', 'petugas'),
(13, '1212', '1212', '1212', '$2y$10$tu9/YlJqF643/Pg8/JFJ5.nJA3EdiEBYAt8Cp5eLDvJ0kj9EX8mfe', 'no_foto.png', '1212', 'masyarakat'),
(14, '123456', 'Ocan1', 'ocan1', '$2y$10$cDk5pH..bfgIaaxGlAyJuOwhgtMTYFefUG2ZFAIMR4TaF74IP3j.C', 'no_foto.png', '12345678', 'masyarakat'),
(15, '12234567890', 'Ridho Artamirano', 'admin', '$2y$10$GXonoG9Gath/CxsM7bMwQu1cyxjtt46ARCGGUtJMiGgTdQbixMvKm', 'no_foto.png', '08993352656', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id` int(10) NOT NULL,
  `tgl_tanggapan` datetime NOT NULL,
  `pengaduan_id` int(10) NOT NULL,
  `isi_laporan` varchar(1000) NOT NULL,
  `petugas_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tanggapan`
--

INSERT INTO `tanggapan` (`id`, `tgl_tanggapan`, `pengaduan_id`, `isi_laporan`, `petugas_id`) VALUES
(13, '2024-04-19 21:24:31', 1, 'dsfghj', 15);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpengaduan52247` (`petugas_id`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD UNIQUE KEY `telp` (`telp`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtanggapan340580` (`petugas_id`),
  ADD KEY `FKtanggapan374346` (`pengaduan_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `FKpengaduan52247` FOREIGN KEY (`petugas_id`) REFERENCES `petugas` (`id`);

--
-- Ketidakleluasaan untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD CONSTRAINT `FKtanggapan340580` FOREIGN KEY (`petugas_id`) REFERENCES `petugas` (`id`),
  ADD CONSTRAINT `FKtanggapan374346` FOREIGN KEY (`pengaduan_id`) REFERENCES `pengaduan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
