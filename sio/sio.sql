-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 01, 2022 at 08:58 AM
-- Server version: 5.7.37-0ubuntu0.18.04.1
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sio`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id` int(11) NOT NULL,
  `kd_faktur` varchar(100) DEFAULT NULL,
  `kd_obat` int(11) DEFAULT NULL,
  `stok_obat` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kd_supplier` int(11) DEFAULT NULL,
  `diterima` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id`, `kd_faktur`, `kd_obat`, `stok_obat`, `tanggal`, `kd_supplier`, `diterima`) VALUES
(13, 'INV/1/1/1', 10, 555, '2022-06-01', 19, 1),
(14, 'INV/2/2/2', 18, 22, '2022-07-01', 15, 1);

--
-- Triggers `barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `update_stok_obat` AFTER INSERT ON `barang_masuk` FOR EACH ROW update obat SET stok = stok + new.stok_obat
    where kd_obat = new.kd_obat
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `daftar_obat`
-- (See below for the actual view)
--
CREATE TABLE `daftar_obat` (
`kd_obat` int(100)
,`nama_obat` varchar(50)
,`sediaan` varchar(20)
,`kekuatan` int(20)
,`satuan` varchar(20)
,`stok` int(100)
,`harga` bigint(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `detail_obat`
-- (See below for the actual view)
--
CREATE TABLE `detail_obat` (
`kd_obat` int(100)
,`nama_obat` varchar(50)
,`sediaan` varchar(20)
,`kekuatan` int(20)
,`satuan` varchar(20)
,`stok` int(100)
,`harga` bigint(100)
,`nama_supplier` varchar(100)
,`alamat` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `kd_obat` int(100) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `id_sediaan_obat` int(15) NOT NULL,
  `kekuatan` int(20) NOT NULL,
  `id_satuan_obat` int(15) NOT NULL,
  `stok` int(100) NOT NULL,
  `harga` bigint(100) NOT NULL,
  `kd_supplier` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`kd_obat`, `nama_obat`, `id_sediaan_obat`, `kekuatan`, `id_satuan_obat`, `stok`, `harga`, `kd_supplier`) VALUES
(10, 'Hydromorphone', 11, 8, 2, 578, 25000, 26),
(11, 'Morphine', 1, 10, 4, 17, 50000, 19),
(12, 'Oxycodone', 11, 10, 4, 25, 100000, 17),
(13, 'Pethidine', 2, 50, 2, 12, 70000, 10),
(14, 'Ketolorac', 2, 30, 2, 20, 50000, 28),
(15, 'Pregablin', 3, 75, 4, 50, 50000, 27),
(16, 'paracetamol', 1, 500, 4, 14, 90000, 17),
(17, 'Fentanyl', 5, 25, 1, 10, 100000, 20),
(18, 'Ibuprofen cair', 6, 500, 3, 1832, 90000, 16),
(19, 'ibuprofen', 1, 500, 2, 117, 14000, 30);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `nip` int(11) NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`nip`, `nama_pengguna`, `email`, `password`, `role`) VALUES
(1, 'John', 'john@mail.com', '$2y$10$UuLTgLbhy.8ILCt2nQsOSOFUxdAvXwHcopgSwrEKahEzI8JZ67wFy', 1),
(2, 'Doe', 'doe@mail.com', '$2y$10$PwEkwLhFSM578tS1QaDzi.8MHclpfgNwLd5/X19JON08xNeyIk8dO', 2),
(14, 'yudi', 'yudi@email.com', '$2y$10$55ww4Ad1ydOdRpBYlRHJSOFVZDSfcFpxkD2ba79poTdDxnxBEhg5.', 2),
(15, 'Wahyu', 'wahyu@gmail.com', '$2y$10$PHqB6Wni/Z8j/B/x5HQg/O2ok5fqnMd1MTn/L2GhM.c8JVHvGJqgi', 3),
(16, 'A', 'abc@d.com', '$2y$10$76iYMP9U4Q/EPIBC.C8PCOJXgcC3VPlbmY6amDIfhP6mJFTSIn/5S', 3),
(17, 'abc', 'abc@gmail.com', '12323', 4),
(18, 'Tamu', 'tamu@gmail.com', '$2y$10$AKRVpPsrlP5w13eQDPokueSEOYtENXdzFlyd50IrBauUxnDPvLKIO', 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `riwayat_barang_masuk`
-- (See below for the actual view)
--
CREATE TABLE `riwayat_barang_masuk` (
`tanggal` date
,`kd_faktur` varchar(100)
,`kd_obat` int(100)
,`nama_obat` varchar(50)
,`stok_obat` int(11)
,`nama_supplier` varchar(100)
,`nama_pengguna` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `nama_role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `nama_role`) VALUES
(1, 'super admin'),
(2, 'admin'),
(3, 'basic'),
(4, 'guest');

-- --------------------------------------------------------

--
-- Table structure for table `satuan_obat`
--

CREATE TABLE `satuan_obat` (
  `id` int(15) NOT NULL,
  `satuan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `satuan_obat`
--

INSERT INTO `satuan_obat` (`id`, `satuan`) VALUES
(1, 'mcg/jam'),
(2, 'mg/ml'),
(3, 'ml'),
(4, 'mg'),
(5, '%'),
(6, 'mgg/puff'),
(7, 'IU/ml');

-- --------------------------------------------------------

--
-- Table structure for table `sediaan_obat`
--

CREATE TABLE `sediaan_obat` (
  `id` int(15) NOT NULL,
  `sediaan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sediaan_obat`
--

INSERT INTO `sediaan_obat` (`id`, `sediaan`) VALUES
(1, 'tab'),
(2, 'injeksi'),
(3, 'kapsul'),
(4, 'spray'),
(5, 'patch'),
(6, 'larutan/oral'),
(7, 'ig/gas dalam tabung'),
(8, 'aerosol'),
(9, 'tablet salut selaput'),
(10, 'susp'),
(11, 'tablet lepas lambat');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `kd_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`kd_supplier`, `nama_supplier`, `alamat`) VALUES
(10, 'PT Abbot Indonesia', 'Jakarta'),
(11, 'PT Aditama Raya Farmindo', 'Jawa Timur'),
(12, 'PT Afiat', 'Jawa Barat'),
(13, 'PT Afifarma', 'Jawa Timur'),
(14, 'PT ASTA Medica, Transfarma Medica Indah', 'Jakarta'),
(15, 'PT Bima Mitra Farma', 'Jakarta'),
(16, 'PT Bio Farma', 'Bandung'),
(17, 'PT Bristol Myers Squibb Indonesia Tbk', 'Jakarta'),
(18, 'PT Bromo Pharmaceutical Industries', 'Jakarta'),
(19, 'PT Bufa Aneka', 'Semarang'),
(20, 'PT Aventis', 'Jakarta'),
(26, 'PT. Ciubros Farma', 'Jawa Tengah'),
(27, 'PT. Combined Imperial Pharmaceuticals, Inc (Combiphar)', 'Jawa Barat'),
(28, 'PT. Daewoong Infion', 'Jawa Timur'),
(29, 'PT. Dankos Farma', 'Jakarta'),
(30, 'PT. Darya-Varia Laboratoria Tbk', 'Jawa Barat');

-- --------------------------------------------------------

--
-- Structure for view `daftar_obat`
--
DROP TABLE IF EXISTS `daftar_obat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `daftar_obat`  AS SELECT `obat`.`kd_obat` AS `kd_obat`, `obat`.`nama_obat` AS `nama_obat`, `sediaan_obat`.`sediaan` AS `sediaan`, `obat`.`kekuatan` AS `kekuatan`, `satuan_obat`.`satuan` AS `satuan`, `obat`.`stok` AS `stok`, `obat`.`harga` AS `harga` FROM ((`obat` join `sediaan_obat` on((`sediaan_obat`.`id` = `obat`.`id_sediaan_obat`))) join `satuan_obat` on((`satuan_obat`.`id` = `obat`.`id_satuan_obat`))) ;

-- --------------------------------------------------------

--
-- Structure for view `detail_obat`
--
DROP TABLE IF EXISTS `detail_obat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_obat`  AS SELECT `obat`.`kd_obat` AS `kd_obat`, `obat`.`nama_obat` AS `nama_obat`, `sediaan_obat`.`sediaan` AS `sediaan`, `obat`.`kekuatan` AS `kekuatan`, `satuan_obat`.`satuan` AS `satuan`, `obat`.`stok` AS `stok`, `obat`.`harga` AS `harga`, `supplier`.`nama_supplier` AS `nama_supplier`, `supplier`.`alamat` AS `alamat` FROM (((`obat` join `sediaan_obat` on((`sediaan_obat`.`id` = `obat`.`id_sediaan_obat`))) join `satuan_obat` on((`satuan_obat`.`id` = `obat`.`id_satuan_obat`))) join `supplier` on((`supplier`.`kd_supplier` = `obat`.`kd_supplier`))) ;

-- --------------------------------------------------------

--
-- Structure for view `riwayat_barang_masuk`
--
DROP TABLE IF EXISTS `riwayat_barang_masuk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `riwayat_barang_masuk`  AS SELECT `barang_masuk`.`tanggal` AS `tanggal`, `barang_masuk`.`kd_faktur` AS `kd_faktur`, `obat`.`kd_obat` AS `kd_obat`, `obat`.`nama_obat` AS `nama_obat`, `barang_masuk`.`stok_obat` AS `stok_obat`, `supplier`.`nama_supplier` AS `nama_supplier`, `pengguna`.`nama_pengguna` AS `nama_pengguna` FROM (((`barang_masuk` join `obat` on((`obat`.`kd_obat` = `barang_masuk`.`kd_obat`))) join `supplier` on((`supplier`.`kd_supplier` = `barang_masuk`.`kd_supplier`))) join `pengguna` on((`pengguna`.`nip` = `barang_masuk`.`diterima`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kd_obat` (`kd_obat`),
  ADD KEY `kd_supplier` (`kd_supplier`),
  ADD KEY `diterima` (`diterima`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`kd_obat`),
  ADD KEY `id_sediaan_obat` (`id_sediaan_obat`),
  ADD KEY `id_satuan_obat` (`id_satuan_obat`),
  ADD KEY `kd_supplier` (`kd_supplier`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `satuan_obat`
--
ALTER TABLE `satuan_obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sediaan_obat`
--
ALTER TABLE `sediaan_obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`kd_supplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `kd_obat` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `nip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `satuan_obat`
--
ALTER TABLE `satuan_obat`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sediaan_obat`
--
ALTER TABLE `sediaan_obat`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `kd_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`kd_obat`) REFERENCES `obat` (`kd_obat`),
  ADD CONSTRAINT `barang_masuk_ibfk_2` FOREIGN KEY (`kd_supplier`) REFERENCES `supplier` (`kd_supplier`),
  ADD CONSTRAINT `barang_masuk_ibfk_3` FOREIGN KEY (`diterima`) REFERENCES `pengguna` (`nip`);

--
-- Constraints for table `obat`
--
ALTER TABLE `obat`
  ADD CONSTRAINT `obat_ibfk_1` FOREIGN KEY (`id_sediaan_obat`) REFERENCES `sediaan_obat` (`id`),
  ADD CONSTRAINT `obat_ibfk_2` FOREIGN KEY (`id_satuan_obat`) REFERENCES `satuan_obat` (`id`),
  ADD CONSTRAINT `obat_ibfk_3` FOREIGN KEY (`kd_supplier`) REFERENCES `supplier` (`kd_supplier`);

--
-- Constraints for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
