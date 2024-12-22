-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 22 Ara 2024, 21:22:29
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `petrolsatissistemi`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `anarezerv`
--

CREATE TABLE `anarezerv` (
  `RezervID` int(11) NOT NULL,
  `YakitTuru` varchar(50) NOT NULL,
  `Miktar` decimal(10,2) NOT NULL DEFAULT 0.00,
  `MinimumSeviye` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `firmalar`
--

CREATE TABLE `firmalar` (
  `FirmaID` int(11) NOT NULL,
  `FirmaAdi` varchar(100) NOT NULL,
  `Telefon` varchar(15) DEFAULT NULL,
  `SubeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personeller`
--

CREATE TABLE `personeller` (
  `PersonelID` int(11) NOT NULL,
  `Adi` varchar(50) NOT NULL,
  `Soyadi` varchar(50) NOT NULL,
  `Gorev` varchar(100) DEFAULT NULL,
  `SubeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pompalar`
--

CREATE TABLE `pompalar` (
  `PompaID` int(11) NOT NULL,
  `PompaAdi` varchar(50) NOT NULL,
  `YakitTuru` varchar(50) NOT NULL,
  `SubeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `subeler`
--

CREATE TABLE `subeler` (
  `SubeID` int(11) NOT NULL,
  `SubeAdi` varchar(100) NOT NULL,
  `Adres` varchar(255) DEFAULT NULL,
  `Telefon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yakittalepleri`
--

CREATE TABLE `yakittalepleri` (
  `TaleplerID` int(11) NOT NULL,
  `YakitTuru` varchar(50) NOT NULL,
  `Miktar` decimal(10,2) NOT NULL,
  `SubeID` int(11) DEFAULT NULL,
  `Tarih` date NOT NULL,
  `Durum` enum('Beklemede','Onaylandı','Reddedildi') DEFAULT 'Beklemede'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `anarezerv`
--
ALTER TABLE `anarezerv`
  ADD PRIMARY KEY (`RezervID`);

--
-- Tablo için indeksler `firmalar`
--
ALTER TABLE `firmalar`
  ADD PRIMARY KEY (`FirmaID`),
  ADD KEY `SubeID` (`SubeID`);

--
-- Tablo için indeksler `personeller`
--
ALTER TABLE `personeller`
  ADD PRIMARY KEY (`PersonelID`),
  ADD KEY `SubeID` (`SubeID`);

--
-- Tablo için indeksler `pompalar`
--
ALTER TABLE `pompalar`
  ADD PRIMARY KEY (`PompaID`),
  ADD KEY `SubeID` (`SubeID`);

--
-- Tablo için indeksler `subeler`
--
ALTER TABLE `subeler`
  ADD PRIMARY KEY (`SubeID`);

--
-- Tablo için indeksler `yakittalepleri`
--
ALTER TABLE `yakittalepleri`
  ADD PRIMARY KEY (`TaleplerID`),
  ADD KEY `SubeID` (`SubeID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `anarezerv`
--
ALTER TABLE `anarezerv`
  MODIFY `RezervID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `firmalar`
--
ALTER TABLE `firmalar`
  MODIFY `FirmaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `personeller`
--
ALTER TABLE `personeller`
  MODIFY `PersonelID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `pompalar`
--
ALTER TABLE `pompalar`
  MODIFY `PompaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `subeler`
--
ALTER TABLE `subeler`
  MODIFY `SubeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `yakittalepleri`
--
ALTER TABLE `yakittalepleri`
  MODIFY `TaleplerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `firmalar`
--
ALTER TABLE `firmalar`
  ADD CONSTRAINT `firmalar_ibfk_1` FOREIGN KEY (`SubeID`) REFERENCES `subeler` (`SubeID`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `personeller`
--
ALTER TABLE `personeller`
  ADD CONSTRAINT `personeller_ibfk_1` FOREIGN KEY (`SubeID`) REFERENCES `subeler` (`SubeID`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `pompalar`
--
ALTER TABLE `pompalar`
  ADD CONSTRAINT `pompalar_ibfk_1` FOREIGN KEY (`SubeID`) REFERENCES `subeler` (`SubeID`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `yakittalepleri`
--
ALTER TABLE `yakittalepleri`
  ADD CONSTRAINT `yakittalepleri_ibfk_1` FOREIGN KEY (`SubeID`) REFERENCES `subeler` (`SubeID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
