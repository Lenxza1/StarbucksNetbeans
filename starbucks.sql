-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2022 at 06:19 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `starbucks`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `idMenu` int(11) NOT NULL,
  `nmMenu` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`idMenu`, `nmMenu`, `harga`, `qty`) VALUES
(1, 'Veranda Blend', 50000, 100),
(2, 'Caffe Mocha', 55000, 100),
(3, 'Caffe Misto', 55000, 100),
(4, 'Cappuccino', 60000, 100),
(5, 'Espresso', 60000, 100),
(6, 'Hot Chocolate', 55000, 100),
(7, 'Chai Tea Latte', 55000, 100),
(8, 'Macha Tea Latte', 60000, 100),
(9, 'Nitro Cold Brew', 50000, 100),
(10, 'Iced Coffee with Milk', 55000, 100);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `idMenu` int(11) NOT NULL,
  `nmMenu` varchar(255) NOT NULL DEFAULT 'Nama Menu',
  `jumlah` int(11) NOT NULL,
  `tglTransaksi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `totalPembayaran` int(11) NOT NULL,
  `status` enum('Selesai','Belum Selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `idMenu`, `nmMenu`, `jumlah`, `tglTransaksi`, `totalPembayaran`, `status`) VALUES
(8, 1, 'Veranda Blend', 1, '2022-10-19 06:13:30', 100000, 'Belum Selesai'),
(9, 1, 'Veranda Blend', 1, '2022-10-19 06:13:35', 100000, 'Belum Selesai'),
(10, 6, 'Hot Chocolate', 1, '2022-10-20 03:58:58', 100000, 'Belum Selesai'),
(11, 4, 'Cappuccino', 1, '2022-10-20 04:14:39', 100000, 'Selesai');

--
-- Triggers `transaksi`
--
DELIMITER $$
CREATE TRIGGER `namaMakanan` BEFORE INSERT ON `transaksi` FOR EACH ROW BEGIN
set new.nmMenu = (select menu.nmMenu from menu where 
new.idMenu = menu.idMenu);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('kasir','pelanggan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level`) VALUES
(1, 'kasir', '123456', 'kasir'),
(2, 'pelanggan', '123456', 'pelanggan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idMenu`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
