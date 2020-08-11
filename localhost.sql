-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 27, 2020 lúc 12:59 AM
-- Phiên bản máy phục vụ: 5.7.24
-- Phiên bản PHP: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlbh`
--
CREATE DATABASE IF NOT EXISTS `qlbh` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `qlbh`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `CatID` int(11) UNSIGNED NOT NULL,
  `CatName` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`CatID`, `CatName`) VALUES
(1, 'Sách'),
(2, 'Điện thoại'),
(3, 'Máy chụp hình'),
(4, 'Quần áo - Giày dép'),
(5, 'Máy tính'),
(6, 'Đồ trang sức'),
(7, 'Khác'),
(22, 'Tai nghe'),
(23, 'Daasasa'),
(24, 'Daasasassss'),
(25, 'teteteette'),
(26, 'wwewewq');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `ID` int(11) UNSIGNED NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` bigint(20) NOT NULL,
  `Amount` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) UNSIGNED NOT NULL,
  `OrderDate` datetime NOT NULL,
  `UserID` int(11) NOT NULL,
  `Total` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `ProID` int(11) UNSIGNED NOT NULL,
  `ProName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TinyDes` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `FullDes` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` int(11) NOT NULL,
  `CatID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`ProID`, `ProName`, `TinyDes`, `FullDes`, `Price`, `CatID`, `Quantity`) VALUES
(9, 'Bông tai nạm hạt rubby', 'Trẻ trung và quý phái', '<UL>    <LI>Tên sản phẩm: Bông tai nạm hạt rubby</LI>    <LI>Đóng nhãn hiệu: Torrini</LI>    <LI>Nguồn gốc, xuất xứ: Italy</LI>    <LI>Hình thức thanh toán: L/C T/T M/T CASH</LI>    <LI>Thời gian giao hàng: trong vòng 3 ngày kể từ ngày mua</LI>    <LI>Chất lượng/chứng chỉ: od</LI></UL>', 2400000, 6, 43),
(39, 'Iphone 11 ', '39203920', '302930293', 2000000, 2, 23),
(11, 'Dây chuyền ánh bạc', 'Kiểu dáng mới lạ', '<UL>\r\n    <LI>Chất liệu chính: Bạc</LI>\r\n    <LI>Màu sắc: Bạc</LI>\r\n    <LI>Chất lượng: Mới</LI>\r\n    <LI>Phí vận chuyển: Liên hệ</LI>\r\n    <LI>Giá bán có thể thay đổi tùy theo trọng lượng và giá vàng của từng thời điểm.</LI>\r\n</UL>\r\n', 250000, 6, 88),
(36, 'Samsung Galaxy Note 10 Plus', 'sadsjdlkad', 'dsakldkjadjk', 30000000, 2, 30),
(38, 'Lập trình hướng đối tượng', '230230239', '32902903', 300000, 1, 30),
(13, 'Đầm dạ hội Xinh Xinh', 'Đơn giản nhưng quý phái', '<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>\r\n<UL>\r\n    <LI>Nét cắt táo bạo ở ngực giúp bạn gái thêm phần quyến rũ, ngay cả khi không có trang&nbsp; sức nào trên người.</LI>\r\n    <LI>Đầm hai dây thật điệu đà với nơ xinh trước ngực nhưng trông bạn vẫn toát lên vẻ tinh nghịch và bụi bặm nhờ thiết kế đầm bí độc đáo cùng sắc màu sẫm.</LI>\r\n    <LI>Hãng sản xuất: NEM</LI>\r\n    <LI>Kích cỡ : Tất cả các kích cỡ</LI>\r\n    <LI>Kiểu dáng : Quây/Ống</LI>\r\n    <LI>Chất liệu : Satin</LI>\r\n    <LI>Màu : đen, đỏ</LI>\r\n    <LI>Xuất xứ : Việt Nam</LI>\r\n</UL>\r\n', 2600000, 4, 92),
(14, 'Đầm dạ hội NEM', 'Táo bạo và quyến rũ', '<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>\r\n<UL>\r\n    <LI>Nét cắt táo bạo ở ngực giúp bạn gái thêm phần quyến rũ, ngay cả khi không có trang&nbsp; sức nào trên người.</LI>\r\n    <LI>Đầm hai dây thật điệu đà với nơ xinh trước ngực nhưng trông bạn vẫn toát lên vẻ tinh nghịch và bụi bặm nhờ thiết kế đầm bí độc đáo cùng sắc màu sẫm.</LI>\r\n    <LI>Hãng sản xuất: NEM</LI>\r\n    <LI>Kích cỡ : Tất cả các kích cỡ</LI>\r\n    <LI>Kiểu dáng : Quây/Ống</LI>\r\n    <LI>Chất liệu : Satin</LI>\r\n    <LI>Màu : đen, đỏ</LI>\r\n    <LI>Xuất xứ : Việt Nam</LI>\r\n</UL>\r\n', 1200000, 4, 0),
(15, 'Dây chuyền đá quý', 'Kết hợp vàng trắng và đá quý', '<UL>\r\n    <LI>Kiểu sản phẩm: Dây chuyền</LI>\r\n    <LI>Chất liệu: Vàng trắng 14K và đá quý, nguyên liệu và công nghệ Italy...</LI>\r\n    <LI>Trọng lượng chất liệu: 1.1 Chỉ </LI>\r\n</UL>\r\n', 1925000, 6, 22),
(16, 'Nokia N72', 'Sành điệu cùng N72', '<UL>\r\n    <LI>Camera mega pixel : 2 mega pixel</LI>\r\n    <LI>Bộ nhớ trong : 16 - 31 mb</LI>\r\n    <LI>Chức năng : quay phim, ghi âm, nghe đài FM</LI>\r\n    <LI>Hỗ trợ: Bluetooth, thẻ nhớ nài, nhạc MP3 &lt;br/&gt;</LI>\r\n    <LI>Trọng lượng (g) : 124g</LI>\r\n    <LI>Kích thước (mm) : 109 x 53 x 21.8 mm</LI>\r\n    <LI>Ngôn ngữ : Có tiếng việt</LI>\r\n    <LI>Hệ điều hành: Symbian OS 8.1</LI>\r\n</UL>\r\n', 3200000, 2, 81),
(17, 'Mặt dây chuyền Ruby', 'Toả sáng cùng Ruby', '<UL>\r\n    <LI>Kiểu sản phẩm:&nbsp; Mặt dây</LI>\r\n    <LI>Chất liệu: Vàng trắng 14K, nguyên liệu và công nghệ Italy...</LI>\r\n    <LI>Trọng lượng chất liệu: 0.32 Chỉ</LI>\r\n</UL>\r\n', 1820000, 6, 33),
(18, '1/2 Carat Pink Sapphire Silver', 'Created Pink Sapphire', '<UL>\r\n    <LI>Brand Name: Ice.com</LI>\r\n    <LI>Material Type: sterling-silver, created-sapphire, diamond</LI>\r\n    <LI>Gem Type: created-sapphire, Diamond</LI>\r\n    <LI>Minimum total gem weight: 14.47 carats</LI>\r\n    <LI>Total metal weight: 15 Grams</LI>\r\n    <LI>Number of stones: 28</LI>\r\n    <LI>Created-sapphire Information</LI>\r\n    <LI>Minimum color: Not Available</LI>\r\n</UL>\r\n', 3400000, 6, 10),
(19, 'Netaya', 'Dây chuyền vàng trắng', '<UL>\r\n    <LI>Kiểu sản phẩm:&nbsp; Dây chuyền</LI>\r\n    <LI>Chất liệu: Vàng tây 18K, nguyên liệu và công nghệ Italy...</LI>\r\n    <LI>Trọng lượng chất liệu: 1 Chỉ</LI>\r\n</UL>\r\n', 1820000, 6, 17),
(20, 'Giày nam GN16', 'Êm - đẹp - bề', '<UL>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>\r\n    <LI>Giá: 300 000 VNĐ</LI>\r\n</UL>\r\n', 540000, 4, 0),
(21, 'G3.370A', 'Đen bóng, sang trọng', '<UL>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>\r\n</UL>\r\n', 300000, 4, 74),
(22, 'Giày nữ GN1', 'Kiểu dáng thanh thoát', '<UL>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>\r\n</UL>\r\n', 290000, 4, 30),
(23, 'NV002', 'Kiểu dáng độc đáo', '<P><STRONG>Thông tin sản phẩm</STRONG></P>\r\n<UL>\r\n    <LI>Mã sản phẩm: NV002</LI>\r\n    <LI>Trọng lượng: 2 chỉ</LI>\r\n    <LI>Vật liệu chính: Vàng 24K</LI>\r\n</UL>\r\n', 3600000, 6, 5),
(24, 'NV009', 'Sáng chói - mới lạ', '<P><STRONG>Thông tin sản phẩm</STRONG></P>\r\n<UL>\r\n    <LI>Mã sản phẩm: NV005</LI>\r\n    <LI>Trọng lượng: 1 cây</LI>\r\n    <LI>Vật liệu chính: Vàng 24K</LI>\r\n</UL>\r\n', 14900000, 6, 22),
(25, 'CK010', 'Độc đáo, sang trọng', '<UL>\r\n    <LI>Kiểu dáng nam tính và độc đáo, những thiết kế dưới đây đáp ứng được mọi yêu cần khó tính nhất của người sở hữu.</LI>\r\n    <LI>Những hạt kim cương sẽ giúp người đeo nó tăng thêm phần sành điệu</LI>\r\n    <LI>Không chỉ có kiểu dáng truyền thống chỉ có một hạt kim cương ở giữa, các nhà thiết kế đã tạo những những chiếc nhẫn vô cùng độc đáo và tinh tế.</LI>\r\n    <LI>Tuy nhiên, giá của đồ trang sức này thì chỉ có dân chơi mới có thể kham được</LI>\r\n</UL>\r\n', 2147483647, 6, 52),
(26, 'CK009', 'Nữ tính - đầy quí phái', '<UL>\r\n    <LI>Để sở hữu một chiếc nhẫn kim cương lấp lánh trên tay, bạn phải là người chịu chi và sành điệu.</LI>\r\n    <LI>Với sự kết hợp khéo léo và độc đáo giữa kim cương và Saphia, Ruby... những chiếc nhẫn càng trở nên giá trị</LI>\r\n    <LI>Nhà sản xuất: Torrini</LI>\r\n</UL>\r\n<P>Cái này rất phù hợp cho bạn khi tặng nàng</P>\r\n', 1850000000, 6, 11),
(27, 'CK007', 'Sự kết hợp khéo léo, độc đáo', '<UL>\r\n    <LI>Để sở hữu một chiếc nhẫn kim cương lấp lánh trên tay, bạn phải là người chịu chi và sành điệu.</LI>\r\n    <LI>Với sự kết hợp khéo léo và độc đáo giữa kim cương và Saphia, Ruby... những chiếc nhẫn càng trở nên giá trị</LI>\r\n    <LI>Nhà sản xuất: Torrini</LI>\r\n</UL>\r\n<P>Cái này rất phù hợp cho bạn khi tặng nàng</P>\r\n', 2147483647, 6, 28),
(28, 'CK005', 'Tinh xảo - sang trọng', '<UL>\r\n    <LI>Kim cương luôn là đồ trang sức thể hiện đẳng cấp của người sử dụng.</LI>\r\n    <LI>Không phải nói nhiều về những kiểu nhẫn dưới đây, chỉ có thể gói gọn trong cụm từ: tinh xảo và sang trọng</LI>\r\n    <LI>Thông tin nhà sản xuất: Torrini</LI>\r\n    <LI>Thông tin chi tiết: Cái này rất phù hợp cho bạn khi tặng nàng</LI>\r\n</UL>\r\n', 1800000000, 6, 29),
(29, 'NV01TT', 'Tinh tế đến không ngờ', '<UL>\r\n    <LI>Tinh xảo và sang trọng</LI>\r\n    <LI>Thông tin nhà sản xuất: Torrini</LI>\r\n    <LI>Không chỉ có kiểu dáng truyền thống chỉ có một hạt kim cương ở giữa, các nhà thiết kế đã tạo những những chiếc nhẫn vô cùng độc đáo và tinh tế.</LI>\r\n    <LI>Tuy nhiên, giá của đồ trang sức này thì chỉ có dân chơi mới có thể kham được</LI>\r\n</UL>\r\n', 500000000, 6, 49),
(30, 'Motorola W377', 'Nữ tính - trẻ trung', '<UL>\r\n    <LI>General: 2G Network, GSM 900 / 1800 / 1900</LI>\r\n    <LI>Size:&nbsp; 99 x 45 x 18.6 mm, 73 cc</LI>\r\n    <LI>Weight: 95 g</LI>\r\n    <LI>Display: type TFT, 65K colors</LI>\r\n    <LI>Size: 128 x 160 pixels, 28 x 35 mm</LI>\r\n</UL>\r\n', 2400000, 2, 0),
(31, 'Lập trình Web', 'ewewqewqe', 'qweqweqweqweqwe', 300000, 1, 20),
(32, 'Iphone SE ', 'RAM 6gb', 'CARD VIP', 30000000, 2, 50),
(33, 'Xiaomi Mi Mix 3', 'RAM 3gb', 'dsodksodasdq', 8000000, 2, 20),
(34, 'Laptop Gaming Asus', ' dasjdosakjdksladj', 'dlasdjaskdsad', 30000000, 5, 30);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userrefreshtokenext`
--

CREATE TABLE `userrefreshtokenext` (
  `ID` int(11) NOT NULL,
  `refreshToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rdt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `f_ID` int(11) NOT NULL,
  `f_Username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `f_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_DOB` date NOT NULL,
  `f_Permission` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CatID`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProID`);

--
-- Chỉ mục cho bảng `userrefreshtokenext`
--
ALTER TABLE `userrefreshtokenext`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`f_ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `CatID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `ProID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `f_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Cơ sở dữ liệu: `qltt`
--
CREATE DATABASE IF NOT EXISTS `qltt` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `qltt`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `CID` int(11) UNSIGNED NOT NULL,
  `CName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Xoa` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`CID`, `CName`, `Xoa`) VALUES
(1, 'Xã hội', 0),
(2, 'Thế giới', 0),
(3, 'Văn hóa ', 0),
(4, 'Kinh tế', 0),
(5, 'Giáo dục', 0),
(6, 'Thể thao', 0),
(7, 'Giải trí', 0),
(8, 'Pháp luật', 0),
(9, 'Công nghệ', 0),
(10, 'Khoa học', 0),
(11, 'Đời sống', 0),
(12, 'Xe cộ', 0),
(13, 'Nhà đất', 0),
(14, 'dsdsadsdsssssss', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `PostID` int(11) NOT NULL,
  `PostTitle` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `CID` int(11) NOT NULL,
  `SCID` int(11) DEFAULT NULL,
  `UID` int(11) NOT NULL,
  `TimePost` datetime NOT NULL,
  `SumContent` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `source` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `linksource` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `view` bigint(20) NOT NULL,
  `Duyet` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`PostID`, `PostTitle`, `CID`, `SCID`, `UID`, `TimePost`, `SumContent`, `Content`, `source`, `linksource`, `view`, `Duyet`) VALUES
(4, 'Ô tô biến dạng, 3 người thương vong sau tai nạn', 1, 2, 1, '2020-07-24 14:52:01', 'TPO - Ít nhất 1 người tử vong, 2 người nguy kịch trên chiếc xe ô tô 7 chỗ bị biến dạng.', '<p>Đến 8h s&aacute;ng nay (24/7), C&ocirc;ng an TP Thuận An (B&igrave;nh Dương) c&ugrave;ng c&aacute;c đơn vị nghiệp vụ c&oacute; li&ecirc;n quan đ&atilde; ho&agrave;n tất c&ocirc;ng t&aacute;c kh&aacute;m nghiệm hiện trường vụ tai nạn nghi&ecirc;m trọng khiến 1 người chết, 2 người nguy kịch.</p>\r\n<p><a class=\"photo\" href=\"https://image3.tienphong.vn/cw665/Uploaded/2020/pcwvokpq/2020_07_24/tp_tai_nan_2_nzdq.jpg\" data-desc=\"Hiện trường vụ tai nạn\" data-index=\"0\"><img class=\"cms-photo\" src=\"https://image3.tienphong.vn/cw665/Uploaded/2020/pcwvokpq/2020_07_24/tp_tai_nan_2_nzdq.jpg\" alt=\"&Ocirc; t&ocirc; 7 chỗ biến dạng, 3 người thương vong sau tai nạn - ảnh 1\" width=\"600\" data-photo-original-src=\"https://image3.tienphong.vn/Uploaded/2020/pcwvokpq/2020_07_24/tp_tai_nan_2_nzdq.jpg\" data-desc=\"Hiện trường vụ tai nạn\" /></a></p>\r\n<div>\r\n<div class=\"article-photo inlinephoto\"><span class=\"fig\">&nbsp;Hiện trường vụ tai nạn</span></div>\r\n</div>\r\n<p>Trước đ&oacute;, v&agrave;o rạng s&aacute;ng c&ugrave;ng ng&agrave;y, người d&acirc;n hai b&ecirc;n đường ĐT743, phường B&igrave;nh Ho&agrave;, TP Thuận An, tỉnh B&igrave;nh Dương nghe tiếng động lớn n&ecirc;n ra ngo&agrave;i kiểm tra th&igrave; ph&aacute;t hiện &ocirc; t&ocirc; 7 chỗ mang BKS: 51F &ndash; 177.37 nằm tr&ecirc;n vỉa h&egrave;, hư hỏng nặng.</p>\r\n<div id=\"sas_44269_container\">\r\n<div id=\"sas_44269\"></div>\r\n</div>\r\n<p>V&agrave;o thời điểm n&agrave;y, tr&ecirc;n &ocirc; t&ocirc; c&oacute; 3 người trong đ&oacute; c&oacute; 1 nạn nh&acirc;n đ&atilde; tử vong, 2 người c&ograve;n lại bị thương nặng. Sự việc nhanh ch&oacute;ng được tr&igrave;nh b&aacute;o l&ecirc;n cơ quan c&ocirc;ng an.</p>\r\n<div>\r\n<div class=\"article-photo inlinephoto\"><a class=\"photo\" href=\"https://image3.tienphong.vn/cw665/Uploaded/2020/pcwvokpq/2020_07_24/tp_tai_nan_idhv.jpg\" data-desc=\"&Ocirc; t&ocirc; biến dạng sau tai nạn\" data-index=\"1\"><img class=\"cms-photo\" src=\"https://image3.tienphong.vn/cw665/Uploaded/2020/pcwvokpq/2020_07_24/tp_tai_nan_idhv.jpg\" alt=\"&Ocirc; t&ocirc; 7 chỗ biến dạng, 3 người thương vong sau tai nạn - ảnh 2\" width=\"600\" data-photo-original-src=\"https://image3.tienphong.vn/Uploaded/2020/pcwvokpq/2020_07_24/tp_tai_nan_idhv.jpg\" data-desc=\"&Ocirc; t&ocirc; biến dạng sau tai nạn\" /></a><span class=\"fig\">&nbsp;&Ocirc; t&ocirc; biến dạng sau tai nạn</span></div>\r\n</div>\r\n<p>Ghi nhận tại hiện trường, xe 7 chỗ nằm gọn tr&ecirc;n vỉa h&egrave; biến dạng, hư hỏng nặng phần đầu. Nhiều c&acirc;y xanh b&ecirc;n đường bị t&ocirc;ng đổ. Bước đầu, cơ quan chức năng nhận định rất c&oacute; thể &ocirc; t&ocirc; mất l&aacute;i tự g&acirc;y tai nạn.</p>\r\n<p>Nạn nh&acirc;n tử vong được x&aacute;c định l&agrave; L.V.N. (SN 1982, ngụ B&igrave;nh Dương).</p>\r\n<p>Nguy&ecirc;n nh&acirc;n dẫn đến tai nạn đang được tiếp tục điều tra l&agrave;m r&otilde;.</p>', 'Tienphong.vn', 'https://www.tienphong.vn/', 22, 1),
(5, 'Con đường gốm sứ từ An Dương đến cầu Nhật Tân: Triệu viên gốm ghép nên tình yêu Hà Nội', 3, 4, 1, '2020-07-24 14:54:22', 'VHO-  Thông tin UBND TP Hà Nội thống nhất chủ trương về việc triển khai con đường gốm sứ đoạn từ cửa khẩu An Dương đến cầu Nhật Tân theo chiều dài lịch sử Thăng Long - Hà Nội đã mang đến sự thích thú, tò mò với những người sống và gắn bó với mảnh đất Thủ đô.', '<div class=\"in_article_image \">\r\n<div class=\" no_text\"><img src=\"http://baovanhoa.vn/Portals/0/EasyDNNNews/thumbs/31856/55140%E1%BA%A2nh-minhhoa.jpg\" alt=\"\" /></div>\r\n</div>\r\n<p>&nbsp;</p>\r\n<p><strong>Một đoạn tr&ecirc;n Con đường gốm sứ</strong></p>\r\n<p>Những n&eacute;t chấm ph&aacute; về mảnh đất, con người v&agrave; truyền thống văn h&oacute;a Thăng Long - H&agrave; Nội sẽ tiếp tục được khắc họa tr&ecirc;n những mảnh tường gh&eacute;p nối từ triệu triệu vi&ecirc;n gốm nhỏ. Họa sĩ Nguyễn Thu Thủy, t&aacute;c giả c&ocirc;ng tr&igrave;nh nghệ thuật Con đường gốm sứ ven s&ocirc;ng Hồng bật m&iacute;, nhiều nghệ sĩ đang mong chờ cơ hội để tiếp tục hiện thực h&oacute;a &yacute; tưởng về t&igrave;nh y&ecirc;u H&agrave; Nội.</p>\r\n<p><strong>- Họa sĩ Nguyễn Thu Thủy:&nbsp;</strong>Chủ tịch UBND TP H&agrave; Nội Nguyễn Đức Chung vừa chủ tr&igrave; cuộc họp về thiết kế Con đường gốm sứ H&agrave; Nội. Người đứng đầu ch&iacute;nh quyền th&agrave;nh phố đ&atilde; thống nhất chủ trương triển khai Con đường gốm sứ H&agrave; Nội đoạn từ cửa khẩu An Dương đến cầu Nhật T&acirc;n, theo hướng tuyến từ An Dương đến cầu Nhật T&acirc;n. Sở VHTT được giao chủ tr&igrave;, mời c&aacute;c nh&agrave; đi&ecirc;u khắc, hội họa, kiến tr&uacute;c sư,... th&agrave;nh lập Hội đồng nghi&ecirc;n cứu đề xuất &yacute; tưởng, chất liệu, l&ecirc;n phương &aacute;n tổng thể về Con đường gốm sứ H&agrave; Nội theo chiều d&agrave;i lịch sử Thăng Long - H&agrave; Nội.</p>\r\n<p><strong><em>L&agrave; t&aacute;c giả c&ocirc;ng tr&igrave;nh nghệ thuật Con đường gốm sứ ven s&ocirc;ng Hồng, m&oacute;n qu&agrave; kỷ niệm 1000 năm Thăng Long - H&agrave; Nội v&agrave; được tổ chức Kỷ lục Guinness c&ocirc;ng nhận l&agrave; bức tranh gốm d&agrave;i nhất thế giới, cảm x&uacute;c của chị khi đ&oacute;n nhận th&ocirc;ng tin H&agrave; Nội sẽ tiếp tục triển khai Con đường gốm sứ từ An Dương đến cầu Nhật T&acirc;n như thế n&agrave;o?</em></strong></p>\r\n<p><strong>-&nbsp;</strong>T&ocirc;i rất vui mừng. V&igrave; sau nhiều nỗ lực, TP H&agrave; Nội đ&atilde; chấp thuận chủ trương để c&aacute;c nghệ sĩ tiếp tục chung tay l&agrave;m n&ecirc;n những t&aacute;c phẩm l&agrave;m đẹp cho kh&ocirc;ng gian nghệ thuật c&ocirc;ng cộng của Thủ đ&ocirc;. Chắc rằng con đường gốm sứ từ An Dương đến cầu Nhật T&acirc;n sẽ tạo n&ecirc;n những dấu ấn đẹp về văn h&oacute;a, lịch sử, nghệ thuật của H&agrave; Nội, như những g&igrave; m&agrave;&nbsp;<em>Con đường gốm sứ ven s&ocirc;ng Hồng&nbsp;</em>đ&atilde; để lại trong t&acirc;m tr&iacute; của người d&acirc;n Thủ đ&ocirc; v&agrave; bạn b&egrave; quốc tế những năm qua.</p>\r\n<p><strong><em>Một đoạn tranh gốm sứ bị ph&aacute; dỡ hồi th&aacute;ng 6.2020 c&oacute; được kh&ocirc;i phục c&ugrave;ng với con đường gốm sứ mới n&agrave;y hay kh&ocirc;ng, thưa họa sĩ?</em></strong></p>\r\n<p>- Th&ocirc;ng b&aacute;o của UBND TP. H&agrave; Nội cũng cho biết, c&aacute;c đoạn tranh cũ đ&atilde; thực hiện của Con đường gốm sứ được giao cho Sở VHTT x&acirc;y dựng kế hoạch duy tu v&agrave; tiếp nhận, lưu trữ hồ sơ. Về đoạn tranh gồm 300 m&eacute;t chiều d&agrave;i v&agrave; 689 m2 tường gốm sứ bị buộc phải ph&aacute; bỏ để phục vụ việc triển khai thi c&ocirc;ng dự &aacute;n x&acirc;y dựng cầu vượt tại n&uacute;t giao An Dương - đường Thanh Ni&ecirc;n, mặc d&ugrave; rất đ&aacute;ng tiếc nhưng cũng phải thấy rằng đ&acirc;y l&agrave; vấn đề bất khả kh&aacute;ng. UBND TP. H&agrave; Nội đ&atilde; c&oacute; chủ trương sau khi ho&agrave;n th&agrave;nh x&acirc;y dựng xong tường chắn đ&ecirc; b&ecirc; t&ocirc;ng cốt th&eacute;p sẽ tiếp tục c&oacute; kế hoạch gắn tranh gốm sứ l&ecirc;n mặt tường mới. Chiều d&agrave;i tường b&ecirc; t&ocirc;ng cốt th&eacute;p l&agrave; rất lớn v&agrave; vẫn sẽ tiếp tục duy tr&igrave;, ph&aacute;t triển con đường gốm sứ ng&agrave;y c&agrave;ng đẹp hơn, xứng đ&aacute;ng l&agrave; một biểu tượng v&agrave; l&agrave; n&eacute;t đẹp văn h&oacute;a độc đ&aacute;o của Thủ đ&ocirc; H&agrave; Nội.</p>\r\n<p>&nbsp;</p>\r\n<div class=\"in_article_image \">\r\n<div class=\" no_text\"><img src=\"http://baovanhoa.vn/Portals/0/EasyDNNNews/thumbs/31856/55139%E1%BA%A3nh-minh-h%E1%BB%8Da-Con-%C4%91%C6%B0%E1%BB%9Dng-g%E1%BB%91m-s%E1%BB%A9.jpg\" alt=\"\" /></div>\r\n</div>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;<strong>Con đường gốm sứ lu&ocirc;n l&agrave; &ldquo;điểm nhấn&rdquo; của nhiếp ảnh</strong></p>\r\n<p><strong><em>C&oacute; &yacute; kiến cho rằng c&oacute; thể sử dụng c&aacute;c chất liệu kh&aacute;c tr&ecirc;n con đường từ An Dương đến cầu Nhật T&acirc;n, kh&ocirc;ng nhất thiết chỉ l&agrave; gốm sứ? L&agrave; t&aacute;c giả của nhiều t&aacute;c phẩm c&ocirc;ng tr&igrave;nh gốm sứ nghệ thuật ho&agrave;nh tr&aacute;ng, chị c&oacute; suy nghĩ g&igrave;?</em></strong></p>\r\n<p>- Đ&uacute;ng l&agrave; trước đ&oacute; đ&atilde; c&oacute; nhiều &yacute; kiến cho rằng c&oacute; thể sử dụng những chất liệu kh&aacute;c như đồng, đ&aacute;... tr&ecirc;n con đường nghệ thuật n&agrave;y. Tuy nhi&ecirc;n, với kinh nghiệm hơn 10 năm gắn b&oacute; với c&aacute;c c&ocirc;ng tr&igrave;nh nghệ thuật c&ocirc;ng cộng l&agrave;m từ chất liệu gốm sứ như&nbsp;<em>Con đường gốm sứ ven s&ocirc;ng Hồng</em>, l&aacute; quốc kỳ Việt Nam tr&ecirc;n đảo Trường Sa Lớn, bức tranh gốm&nbsp;<em>M&ugrave;a xu&acirc;n H&agrave; Nội</em>, bức tranh gốm kỷ niệm 40 năm k&yacute; kết Hiệp định Paris chấm dứt chiến tranh ở Việt Nam tại ph&ograve;ng kh&aacute;nh tiết lớn của T&ograve;a thị ch&iacute;nh TP Choisy le Roi..., t&ocirc;i thấy rằng gốm l&agrave; chất liệu mang t&iacute;nh chất bền vững, c&oacute; thể bền bỉ trải qua mưa nắng, dễ d&agrave;ng sửa chữa, khắc phục khi bị xuống cấp, hỏng h&oacute;c.</p>\r\n<p>Mặt kh&aacute;c, trải qua lịch sử, gốm sứ l&agrave; chất liệu gắn b&oacute; với d&ograve;ng chảy xuy&ecirc;n suốt của văn h&oacute;a Thăng Long- H&agrave; Nội, từ những địa tầng văn h&oacute;a được khai quật s&acirc;u dưới l&ograve;ng đất cũng đ&atilde; ph&aacute;t hiện nhiều di vật gi&aacute; trị, với những men ngọc, men lam, hoa n&acirc;u... qua c&aacute;c triều đại trong lịch sử cho đến h&ocirc;m nay. D&ograve;ng chảy văn h&oacute;a xuy&ecirc;n suốt của mảnh đất ng&agrave;n năm Thăng Long- H&agrave; Nội cũng một phần quan trọng được lưu giữ qua những họa tiết, hoa văn tr&ecirc;n chất liệu gốm sứ. Bởi thế, nh&oacute;m nghệ sĩ đương đại mong muốn tiếp tục được thể hiện t&igrave;nh y&ecirc;u với Thủ đ&ocirc; qua chất liệu gốm sứ nghệ thuật, từ triệu vi&ecirc;n gốm nhỏ để gh&eacute;p n&ecirc;n t&igrave;nh y&ecirc;u H&agrave; Nội.</p>\r\n<p><strong>&nbsp;<em>&ldquo;Đề b&agrave;i&rdquo; về Con đường gốm sứ H&agrave; Nội theo chiều d&agrave;i lịch sử Thăng Long - H&agrave; Nội c&oacute; khơi gợi &yacute; tưởng g&igrave; đối với những nghệ sĩ đ&atilde; c&oacute; kinh nghiệm thực hiện c&aacute;c c&ocirc;ng tr&igrave;nh nghệ thuật gốm ngo&agrave;i trời?</em></strong></p>\r\n<p>- Nằm tr&ecirc;n tuyến đường từ s&acirc;n bay Nội B&agrave;i v&agrave;o nội đ&ocirc;, trục tường đ&ecirc; mới x&acirc;y n&agrave;y nằm trọn tr&ecirc;n tuyến đường từ cầu Nhật T&acirc;n v&agrave;o trung t&acirc;m Th&agrave;nh phố. Để Con đường gốm sứ thực sự trở th&agrave;nh một t&aacute;c phẩm nghệ thuật mang &yacute; nghĩa s&aacute;ng tạo đặc sắc của H&agrave; Nội, ch&uacute;ng t&ocirc;i mong muốn được hiện thực h&oacute;a những &yacute; tưởng tiếp theo về văn h&oacute;a, lịch sử Thăng Long- H&agrave; Nội, chẳng hạn như đoạn tranh gốm mang t&iacute;nh biểu tượng về h&igrave;nh ảnh H&agrave; Nội với th&ocirc;ng điệp&nbsp;<em>H&agrave; Nội - Th&agrave;nh phố v&igrave; H&ograve;a b&igrave;nh&nbsp;</em>v&agrave;&nbsp;<em>H&agrave; Nội - Th&agrave;nh phố S&aacute;ng tạo;&nbsp;</em>đoạn tranh&nbsp;<em>H&agrave; Nội tr&ecirc;n bản đồ Di sản Việt Nam -&nbsp;</em>t&aacute;i hiện c&aacute;c di sản văn h&oacute;a vật thể, phi vật thể v&agrave; di sản thi&ecirc;n nhi&ecirc;n của Việt Nam được UNESCO vinh danh l&agrave; di sản thế giới;&nbsp;<em>H&agrave; Nội xưa v&agrave; nay</em>, khắc họa n&eacute;t đẹp truyền thống v&agrave; hiện đại của H&agrave; Nội trong cảnh quan, kiến tr&uacute;c v&agrave; thời trang; tranh gốm thiếu nhi&nbsp;<em>Những ước mơ H&agrave; Nội</em>;&nbsp;<em>H&agrave; Nội với bạn b&egrave; quốc tế</em>...</p>\r\n<p>Đặc biệt, trong trường đoạn tranh gốm&nbsp;<em>H&agrave; Nội với bạn b&egrave; quốc tế</em>, h&igrave;nh ảnh xuất hiện l&agrave; đoạn tranh gốm Phố cổ B&ugrave;i Xu&acirc;n Ph&aacute;i nh&acirc;n kỷ niệm 100 năm ng&agrave;y sinh danh họa (1920-2020), cũng l&agrave; sự b&ugrave; đắp lại đoạn tranh gốm Phố cổ B&ugrave;i Xu&acirc;n Ph&aacute;i đ&atilde; bị ph&aacute; dỡ để mở rộng đường. Đoạn tranh&nbsp;<em>H&agrave; Nội - Th&agrave;nh phố S&aacute;ng tạo&nbsp;</em>dự kiến thể hiện n&eacute;t đẹp s&aacute;ng tạo ti&ecirc;u biểu của H&agrave; Nội như hệ thống c&acirc;y xanh được bảo tồn v&agrave; ph&aacute;t triển tạo n&ecirc;n cảnh quan đẹp, th&acirc;n thiện với m&ocirc;i trường, c&aacute;c di sản kiến tr&uacute;c truyền thống được bảo tồn, c&aacute;c khu đ&ocirc; thị mới văn minh được x&acirc;y dựng, c&aacute;c nghề thủ c&ocirc;ng mỹ nghệ phong ph&uacute; được lưu giữ, đời sống s&ocirc;i động c&ugrave;ng c&aacute;c loại h&igrave;nh nghệ thuật như &acirc;m nhạc, mỹ thuật, s&acirc;n khấu, điện ảnh vốn c&oacute; truyền thống l&acirc;u đời tại H&agrave; Nội, nay c&agrave;ng ph&aacute;t triển với những n&eacute;t s&aacute;ng tạo mới...</p>', 'Báo văn hóa ', 'http://baovanhoa.vn/', 2, 1),
(6, 'Công nhận huyện Gia Viễn (Ninh Bình) đạt chuẩn NTM', 4, 7, 1, '2020-07-24 14:57:33', '(Chinhphu.vn) – Thủ tướng Chính phủ vừa quyết định công nhận huyện Gia Viễn, tỉnh Ninh Bình đạt chuẩn nông thôn mới năm 2020.', '<table class=\"picBox\" align=\"left\">\r\n<tbody>\r\n<tr>\r\n<td><img src=\"http://baochinhphu.vn/Uploaded/tranthithom/2020_07_23/ntm_gia_vien%20(1).jpg\" alt=\"\" width=\"250\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"desc\">Diện mạo huyện Gia Viễn thay đổi từng ng&agrave;y</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Thủ tướng Ch&iacute;nh phủ giao UBND tỉnh Ninh B&igrave;nh c&oacute; tr&aacute;ch nhiệm c&ocirc;ng bố v&agrave; khen thưởng theo quy định; chỉ đạo huyện Gia Viễn tiếp tục duy tr&igrave; v&agrave; n&acirc;ng cao chất lượng c&aacute;c ti&ecirc;u ch&iacute;, ch&uacute; trọng ti&ecirc;u ch&iacute; về sản xuất v&agrave; m&ocirc;i trường để bảo đảm t&iacute;nh bền vững trong x&acirc;y dựng n&ocirc;ng th&ocirc;n mới.</p>\r\n<p>Để đạt được mục ti&ecirc;u đạt chuẩn n&ocirc;ng th&ocirc;n mới năm 2020, những năm qua, Huyện ủy Gia Viễn đ&atilde; tổ chức tốt việc nghi&ecirc;n cứu, qu&aacute;n triệt c&aacute;c văn bản chỉ đạo của trung ương, của tỉnh, về x&acirc;y dựng n&ocirc;ng th&ocirc;n mới bền vững v&agrave; ph&aacute;t triển; tuy&ecirc;n truyền s&acirc;u rộng tới c&aacute;c ng&agrave;nh, c&aacute;c cấp, c&aacute;n bộ, đảng vi&ecirc;n v&agrave; c&aacute;c tầng lớp nh&acirc;n d&acirc;n về mục ti&ecirc;u, nội dung, y&ecirc;u cầu của chương tr&igrave;nh; tr&aacute;ch nhiệm, quyền lợi của người d&acirc;n trong x&acirc;y dựng n&ocirc;ng th&ocirc;n mới.</p>\r\n<p>Sau hơn 10 năm triển khai thực hiện phong tr&agrave;o x&acirc;y dựng n&ocirc;ng th&ocirc;n mới, hiện tại 20/20 x&atilde; tr&ecirc;n địa b&agrave;n huyện Gia Viễn (Ninh B&igrave;nh) đ&atilde; đạt chuẩn n&ocirc;ng th&ocirc;n mới.</p>\r\n<p>Sau 10 năm, tổng nguồn vốn huyện đ&atilde; huy động để thực hiện phong tr&agrave;o x&acirc;y dựng n&ocirc;ng th&ocirc;n mới l&agrave; 6.206 tỷ đồng, trong đ&oacute; vốn từ cộng đồng d&acirc;n cư gần 2.396 tỷ đồng, chiếm tỷ lệ 38,5%.</p>\r\n<p>Với nguồn kinh ph&iacute; n&agrave;y, huyện đ&atilde; tập trung x&acirc;y dựng kết cấu hạ tầng kinh tế - x&atilde; hội từng bước hiện đại nhằm phục vụ tốt cho sản xuất v&agrave; đời sống d&acirc;n sinh. Huyện đ&atilde; l&agrave;m mới 2.358 tuyến đường với tổng chiều d&agrave;i gần 197 km; ki&ecirc;n cố h&oacute;a 105 tuyến k&ecirc;nh mương (d&agrave;i 94 km), x&acirc;y mới v&agrave; n&acirc;ng cấp 16 trạm bơm; lắp đặt th&ecirc;m 161 trạm biến &aacute;p, l&agrave;m mới, n&acirc;ng cấp 161 km đường d&acirc;y điện trung - hạ thế, đảm bảo 100% số x&atilde; c&oacute; hệ thống điện đạt chuẩn, 100% số hộ được sử dụng điện; đầu tư cơ sở hạ tầng ho&agrave;n chỉnh, hệ thống trường học c&aacute;c cấp; x&acirc;y mới, cải tạo, n&acirc;ng cấp 158 nh&agrave; văn h&oacute;a th&ocirc;n, x&oacute;m, 20 s&acirc;n thể thao v&agrave; nh&agrave; văn h&oacute;a x&atilde;&hellip;</p>\r\n<p>B&ecirc;n cạnh việc đầu tư x&acirc;y dựng cơ sở hạ tầng, Gia Viễn cũng quan t&acirc;m triển khai nhiệm vụ n&acirc;ng cao chất lượng đời sống của nh&acirc;n d&acirc;n. Để tập trung ph&aacute;t triển kinh tế, Gia Viễn đ&atilde; chủ động đưa ra những giải ph&aacute;p nhằm thu h&uacute;t đầu tư. Huyện đ&atilde; tạo điều kiện thuận lợi cho c&aacute;c doanh nghiệp, cơ sở sản xuất, kinh doanh tr&ecirc;n địa b&agrave;n. Nhờ vậy đ&atilde; g&oacute;p phần giải quyết việc l&agrave;m cho 3.450 lao động tr&ecirc;n địa b&agrave;n, với mức thu nhập b&igrave;nh qu&acirc;n từ 3 - 5,5 triệu đồng/người/th&aacute;ng. Ri&ecirc;ng năm 2019, mức thu nhập b&igrave;nh qu&acirc;n to&agrave;n huyện đạt 45,1 triệu đồng/người.</p>\r\n<p>Song song với đ&oacute;, c&ocirc;ng t&aacute;c dồn điền, đổi thửa, chỉnh trang đồng ruộng gắn với x&acirc;y dựng n&ocirc;ng th&ocirc;n mới v&agrave; cấp giấy chứng nhận quyền sử dụng đất sau dồn điền, đổi thửa tiếp tục được huyện tập trung chỉ đạo.</p>\r\n<p>B&ecirc;n cạnh đ&oacute;, Gia Viễn cũng ch&uacute; trọng tới chuyển đổi diện t&iacute;ch trồng l&uacute;a k&eacute;m hiệu quả sang nu&ocirc;i trồng thủy sản. Từ lợi thế về nguồn nước, huyện đ&atilde; đẩy mạnh c&aacute;c m&ocirc; h&igrave;nh nu&ocirc;i c&aacute; tr&ecirc;n ruộng trũng, nu&ocirc;i trong ao đất v&agrave; b&aacute;n c&ocirc;ng nghiệp. Ước t&iacute;nh tổng sản lượng ng&agrave;nh thủy sản của huyện đạt tr&ecirc;n 5.000 tấn với gi&aacute; trị gần 149 tỷ đồng. Hiện tại 20/20 x&atilde; tr&ecirc;n địa b&agrave;n huyện Gia Viễn (Ninh B&igrave;nh) đ&atilde; đạt chuẩn n&ocirc;ng th&ocirc;n mới.</p>\r\n<p>C&oacute; thể thấy, bằng sự v&agrave;o cuộc hăng h&aacute;i của cấp ủy, ch&iacute;nh quyền địa phương cũng như sự đồng thuận của nh&acirc;n d&acirc;n, phong tr&agrave;o x&acirc;y dựng n&ocirc;ng th&ocirc;n mới ở huyện Gia Viễn đ&atilde; gặt h&aacute;i được những th&agrave;nh tựu quan trọng.</p>', 'Báo chính phủ', 'http://baochinhphu.vn/', 9, 1),
(7, 'Đắk Lắk tạo nhóm chỉ đạo chống dịch bệnh bạch hầu trên Zalo', 1, 1, 1, '2020-07-25 10:26:16', 'Nhóm Zalo “Bạch hầu - Sốt xuất huyết” được thành lập nhằm nắm bắt thông tin kịp thời để triển khai công tác phòng, chống dịch trên địa bàn tỉnh Đắk Lắk.', '<p>Sở Y tế tỉnh&nbsp;<a class=\"topic location autolink quickview\" href=\"https://zingnews.vn/tieu-diem/dak-lak.html\">Đắk Lắk</a>&nbsp;vừa ban h&agrave;nh văn bản về việc tạo nh&oacute;m c&aacute;c th&agrave;nh vi&ecirc;n Ban Chỉ đạo ph&ograve;ng, chống dịch bệnh Bạch hầu, Sốt xuất huyết tr&ecirc;n&nbsp;<a class=\"topic company autolink quickview\" href=\"https://zingnews.vn/tieu-diem/zalo.html\">Zalo</a>. Cổng th&ocirc;ng tin điện tử tỉnh Đắk Lắk cho biết, nh&oacute;m Zalo n&agrave;y c&oacute; t&ecirc;n &ldquo;Bạch hầu - Sốt xuất huyết&rdquo;.</p>\r\n<p>C&aacute;c th&agrave;nh vi&ecirc;n Ban chỉ đạo tham gia v&agrave;o nh&oacute;m Zalo n&agrave;y để cập nhật th&ocirc;ng tin, triển khai c&ocirc;ng t&aacute;c ph&ograve;ng, chống dịch bệnh nguy hiểm ở người theo nhiệm vụ được ph&acirc;n c&ocirc;ng tại Quyết định số 862 ng&agrave;y 24/4/2020 của UBND tỉnh Đắk Lắk.</p>\r\n<p>Ph&ograve;ng Kế hoạch - Nghiệp vụ Y chịu tr&aacute;ch nhiệm cập nhật c&aacute;c văn bản chỉ đạo, điều h&agrave;nh, c&aacute;c hướng dẫn của Trung ương, địa phương về việc triển khai c&ocirc;ng t&aacute;c ph&ograve;ng, chống dịch bệnh nguy hiểm ở người l&ecirc;n nh&oacute;m.</p>\r\n<p>Trung t&acirc;m Kiểm so&aacute;t bệnh tật thường xuy&ecirc;n cập nhật t&igrave;nh h&igrave;nh, diễn biến dịch bệnh cũng như c&ocirc;ng t&aacute;c ph&ograve;ng, chống dịch bệnh nguy hiểm ở người tr&ecirc;n địa b&agrave;n tỉnh; cập nhật hướng dẫn, cung cấp c&aacute;c th&ocirc;ng điệp truyền th&ocirc;ng, pan&ocirc;, tờ rơi... l&ecirc;n nh&oacute;m Zalo.</p>\r\n<p>C&aacute;c cơ quan, đơn vị trực thuộc triển khai. C&aacute;n bộ, c&ocirc;ng chức, vi&ecirc;n chức v&agrave; người lao động thường xuy&ecirc;n theo d&otilde;i, kịp thời th&ocirc;ng tin, b&aacute;o c&aacute;o, xử l&yacute; t&igrave;nh h&igrave;nh dịch bệnh tr&ecirc;n địa b&agrave;n quản l&yacute;.</p>\r\n<table class=\"picture\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td class=\"pic\"><img title=\"Bạch hầu ảnh 1\" src=\"https://znews-photo.zadn.vn/w660/Uploaded/squfcgmv/2020_07_20/anh_1.jpg\" alt=\"Bach hau anh 1\" data-bind-event=\"true\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"pCaption caption\">\r\n<p>Zalo Đội Cảnh s&aacute;t Giao th&ocirc;ng CAH Cư Kuin (Đắk Lắk) khuyến c&aacute;o người d&acirc;n hạn chế đi qua khu vực c&oacute; ca bệnh bạch hầu.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Hiện, t&agrave;i khoản Zalo C&ocirc;ng an c&aacute;c x&atilde;, huyện tại Đắk Lắk cũng đ&atilde; đưa ra c&aacute;c th&ocirc;ng tin cảnh b&aacute;o về dịch bệnh. Chẳng hạn ng&agrave;y 17/7, Zalo Đội Cảnh s&aacute;t Giao th&ocirc;ng CAH Cư Kuin khuyến c&aacute;o người d&acirc;n hạn chế di chuyển qua đường tỉnh lộ 10 để tr&aacute;nh nguy cơ l&acirc;y nhiễm bệnh bạch hầu. Trước đ&oacute; 1 ng&agrave;y, Trung t&acirc;m Y tế huyện Cư Kuin đ&atilde; x&eacute;t nghiệm v&agrave; x&aacute;c nhận 1 ca dương t&iacute;nh trong khu vực.</p>\r\n<table class=\"picture\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td class=\"pic\"><img title=\"Bạch hầu ảnh 2\" src=\"https://znews-photo.zadn.vn/w660/Uploaded/squfcgmv/2020_07_20/bachhau_00066_zing.jpg\" alt=\"Bach hau anh 2\" data-bind-event=\"true\" data-title=\"Bạch hầu ảnh 2\" /></td>\r\n</tr>\r\n<tr>\r\n<td class=\"pCaption caption\">\r\n<p>Ti&ecirc;m ngừa bạch hầu ở Trạm y tế x&atilde; B&ocirc;ng Krang. Ảnh:&nbsp;<em>Phạm Ng&ocirc;n.</em></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Dịch bệnh bạch hầu đang c&oacute; diễn biến phức tạp khi cơ quan y tế li&ecirc;n tiếp ph&aacute;t hiện nhiều trường hợp mắc bệnh tại Đắk Lắk, Đắk N&ocirc;ng, Kon Tum, Gia Lai. Đ&aacute;ng ch&uacute; &yacute;, dịch bệnh lần n&agrave;y l&acirc;y cho mọi độ tuổi thay v&igrave; thường gặp ở trẻ em. 90% số người mắc bệnh đều tr&ecirc;n 7 tuổi.</p>\r\n<p>Quyền Bộ trưởng Y tế Nguyễn Thanh Long khẳng định sẽ tập trung hết sức ph&ograve;ng chống bệnh bạch hầu như đ&atilde; cố gắng ph&ograve;ng chống dịch Covid-19. Bộ Y tế sẽ triển khai ti&ecirc;m chủng vắc xin cho 4,7 triệu người tại 4 tỉnh T&acirc;y Nguy&ecirc;n để ph&ograve;ng bệnh. Đ&acirc;y l&agrave; kế hoạch chống dịch bạch hầu c&oacute; quy m&ocirc; lớn từ trước đến nay nhằm bảo đảm &iacute;t nhất 90% người từ 2 th&aacute;ng tuổi đến 40 tuổi được sử dụng vắc xin chứa th&agrave;nh phần bạch hầu.</p>', 'Zing.vn', 'https://zingnews.vn/', 8, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subcategories`
--

CREATE TABLE `subcategories` (
  `SCID` int(11) UNSIGNED NOT NULL,
  `SCName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CID` int(11) DEFAULT NULL,
  `Del` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subcategories`
--

INSERT INTO `subcategories` (`SCID`, `SCName`, `CID`, `Del`) VALUES
(1, 'Thời sự', 1, 0),
(2, 'Giao thông', 1, 0),
(3, 'Môi trường - Khí hậu', 1, 0),
(4, 'Nghệ thuật', 3, 0),
(5, 'Ẩm thực', 3, 0),
(6, 'Du lịch', 3, 0),
(7, 'Lao động - Việc làm', 4, 0),
(8, 'Tài chính', 4, 0),
(9, 'Chứng khoán', 4, 0),
(10, 'Kinh Doanh', 4, 0),
(11, 'Học bổng - Du lịch', 5, 0),
(12, 'Đào tạo - Thi cử', 5, 0),
(13, 'Bóng đá quốc tế', 6, 0),
(14, 'Bóng đá Việt Nam', 6, 0),
(15, 'Quần vợt', 6, 0),
(16, 'Âm nhạc', 7, 0),
(17, 'Thời trang', 7, 0),
(18, 'Điện ảnh - Truyền hình', 7, 0),
(19, 'An ninh - Trật tự', 8, 0),
(20, 'Hình sự - Dân sự', 8, 0),
(21, 'CNTT - Viễn thông', 9, 0),
(22, 'Thiết bị - Phần cứng', 9, 0),
(23, 'Dinh dưỡng - Làm đẹp', 11, 0),
(24, 'Tình yêu - Hôn nhân', 11, 0),
(25, 'Sức khỏe - Y tế', 11, 0),
(26, 'Quản lý - Quy hoạch', 13, 0),
(27, 'Không gian - Kiến trúc', 13, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Password_hash` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Fullname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DayOfBirth` datetime DEFAULT NULL,
  `HSD` int(11) DEFAULT '0',
  `Permission` int(1) NOT NULL DEFAULT '0',
  `Del` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`UserID`, `UserName`, `Password_hash`, `Phone`, `Email`, `Fullname`, `Address`, `DayOfBirth`, `HSD`, `Permission`, `Del`) VALUES
(1, 'admin', '$2a$08$hijjmPf.vEwLRWlLB6vReOxMEt23ukRGmcUW3XPTnXyoQg/k3hkgS', '0335148544', 'quoctan342@gmail.com', 'Trần Quốc Tân', 'Bình Thuận', '1999-08-05 00:00:00', 0, 3, 0),
(2, 'quoctan342', '$2a$08$7nttUvlyGpDDRfdpjkvxMewI9BkxPx372wtwfJVfiq4bWqwmYKL3O', '0928037610', 'teetrangtreo@gmail.com', 'Tran Quoc Tan', 'sdsadsdasa', '2222-02-22 00:00:00', 0, 0, 0),
(3, 'teeseven', '$2a$08$XEq753kC874SoldqhNZ75.9EXG6MeH2pDllIkACunOJEBin8cOQXe', '03351485442', 'tetetet@gmail.com', 'Trần Quốc Tân', 'teeseventeeseventeeseventeeseventeeseven', '0222-02-22 00:00:00', 0, 0, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CID`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`PostID`);

--
-- Chỉ mục cho bảng `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`SCID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `CID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `PostID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `SCID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
