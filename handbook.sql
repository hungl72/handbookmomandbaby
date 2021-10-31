-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2021 at 10:26 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `handbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_pass` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_phone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_datecreated` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_datemodifier` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_status` int(1) NOT NULL,
  `account_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDUserGroup` int(1) NOT NULL,
  `reset_pass` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `account_name`, `account_email`, `account_pass`, `account_date`, `account_address`, `account_phone`, `account_datecreated`, `account_datemodifier`, `account_status`, `account_image`, `IDUserGroup`, `reset_pass`) VALUES
(1, 'Gia Hưng', 'giahungnguyenhuu99@gmail.com', 'f5bb0c8de146c67b44babbf4e6584cc0', '2002-06-05', 'Đà Nẵng', '12345678910', '2020-07-03', '2021-06-13', 1, 'ScreenShot_HiddenLynx-847274289200.png', 3, ''),
(2, 'Tường Vy', 'lethituongvi@gmail.com', '25d55ad283aa400af464c76d713c07ad', '2011-08-19', 'Đà Nẵng', '123456789', '2020-07-03', '2021-06-15', 1, 'ba-bau-uong-cafe-1159368312200.jpg', 3, ''),
(15, 'Nam', 'voduynam@gmail.com', '25d55ad283aa400af464c76d713c07ad', '2011-09-01', 'Đà Nẵng', '123456789', '2020-07-03', '2020-07-03', 0, '', 3, ''),
(16, 'Khôi', 'khoi123@gmail.com', '101193d7181cc88340ae5b2b17bba8a1', '2021-05-29', 'Đà Nẵng', '123456789', '2020-07-03', '2021-05-29', 0, 'Gearvn_súng_ (3)-5115506312400.jpg', 2, ''),
(17, 'Admin', 'admin@gmail.com', '25d55ad283aa400af464c76d713c07ad', '1999-05-22', 'Đà Nẵng', '123456789', '2020-07-03', '2020-07-03', 0, '', 1, ''),
(48, 'Tường vy', 'vytuong@gmail.com', '25d55ad283aa400af464c76d713c07ad', '2021-05-08', 'Chưa có', 'Chưa có', '2021-05-08', '2021-05-08', 0, 'Chưa có', 2, ''),
(212, 'abce', 'abde@gmail.com', '25d55ad283aa400af464c76d713c07ad', '2021-06-16', 'Chưa có', 'Chưa có', '2021-06-16', '2021-06-16', 0, 'Chưa có', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Chưa mang thai'),
(2, 'Đang mang thai'),
(3, 'Sau mang thai');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_datecreated` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDAccount` int(11) NOT NULL,
  `NameAccount` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDListnews` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_content`, `comment_datecreated`, `IDAccount`, `NameAccount`, `IDListnews`) VALUES
(264, 's', '17/06/2021', 1, 'Gia Hưng', 13),
(265, 'ád', '17/06/2021', 1, 'Gia Hưng', 13),
(269, 'asdsad', '18/06/2021', 1, 'Gia Hưng', 1);

-- --------------------------------------------------------

--
-- Table structure for table `commentchildren`
--

CREATE TABLE `commentchildren` (
  `comment_children_id` int(11) NOT NULL,
  `comment_children_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_children_datecreated` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDAccount` int(11) NOT NULL,
  `NameAccount` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDListNews` int(11) NOT NULL,
  `IDComment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commentchildren`
--

INSERT INTO `commentchildren` (`comment_children_id`, `comment_children_content`, `comment_children_datecreated`, `IDAccount`, `NameAccount`, `IDListNews`, `IDComment`) VALUES
(384, 'wwe', '17/06/2021', 1, 'Gia Hưng', 13, 265),
(390, 'dfgdfg', '18/06/2021', 2, 'Tường Vy', 13, 264),
(391, 'fghfghfgh', '18/06/2021', 2, 'Tường Vy', 13, 264);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `contact_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDAccount` int(11) NOT NULL,
  `NameAccount` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `contact_title`, `contact_content`, `IDAccount`, `NameAccount`) VALUES
(606, 'hello', 'abc', 1, 'Gia Hưng'),
(607, 'mnbmb', 'jhgjhgjhgh', 1, 'Gia Hưng'),
(608, 'abc', 'asdasd', 1, 'Gia Hưng'),
(609, 'acc', 'dffdgdfg', 1, 'Gia Hưng'),
(610, 'zxczx', 'cxzczxc', 1, 'Gia Hưng'),
(611, 'fsdfsdf', 'sdfsd', 1, 'Gia Hưng'),
(612, 'Giao diện', 'Giao diện tối ưu', 1, 'Gia Hưng'),
(613, 'qqeqe', 'xcvcxv', 1, 'Gia Hưng');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `faq_id` int(11) NOT NULL,
  `faq_question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_feedback` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_userid` int(11) NOT NULL,
  `faq_username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_anonymous` int(1) NOT NULL,
  `faq_state` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`faq_id`, `faq_question`, `faq_feedback`, `faq_userid`, `faq_username`, `faq_anonymous`, `faq_state`) VALUES
(110, 'Thời gian mang thai được tính như thế nào hả chuyên gia?', 'Trên lý thuyết, thời gian mang thai kéo dài 9 tháng, hoặc 41 tuần kể từ ngày đầu tiên của kỳ kinh cuối cùng, hoặc 39 tuần kể từ ngày thụ thai nếu bạn biết được chính xác ngày thụ thai.', 1, 'Gia Hưng', 0, 1),
(111, 'Tại sao hai bên vú bị đau?', 'Ngay cả trước khi bạn biết là bạn có thai, hai bên vú của bạn đã bắt đầu to lên. Đó là do ảnh hưởng của sự thay đổi hóc môn trong cơ thể, chuẩn bị cho việc bài tiết sữa sau này. Hai bên vú sẽ trở nên nặng nề, căng lên và rất nhạy cảm. Ngay cả những sự vuốt ve nhẹ nhẹ cũng có thể làm cho bạn đau đớn. Thông thường thì đến cuối tháng thứ ba, hai vú vẫn to nhưng cảm giác căng và đau sẽ đỡ đi.', 15, 'Nam', 0, 1),
(112, 'Có nên siêu âm nhiều lần không chuyên gia ơi?', 'Nếu thai phát triển bình thường thì câu trả lời sẽ là không. Bạn chỉ nên làm siêu âm ba lần là đủ. Trong trường hợp cần thiết thì bác sĩ sẽ tự nói bạn đi siêu âm thêm. Những nghiên cứu mới nhất cho thấy những đứa trẻ được làm siêu âm nhiều lần khi còn trong bụng mẹ có thể có chiều cao thấp hơn trẻ khác.', 15, 'Nam', 1, 1),
(114, 'Bà bầu có thể uống cà phê được khoogn?', 'Không nên sử dụng các chất kích thích trong quá trình mang thai bạn nhé.', 1, 'Gia Hưng', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

CREATE TABLE `favourite` (
  `favourite_id` int(11) NOT NULL,
  `favourite_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favourite_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `favourite_status` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `listnews_id` int(11) NOT NULL,
  `IDAccount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favourite`
--

INSERT INTO `favourite` (`favourite_id`, `favourite_name`, `favourite_image`, `favourite_status`, `menu_id`, `listnews_id`, `IDAccount`) VALUES
(146, 'Giai đoạn thai kỳ: Tháng thứ 6', 'shutterstock_1367314688-7012022286200.jpg', 1, 3, 25, 1),
(147, 'Sự phát triển của trẻ từ 2 - 5 tuổi có gì đặc biệt?', 'bang-chieu-cao-can-nang-tre-2-5-tuoi-1546038274300.png', 1, 6, 13, 2),
(148, 'Bà bầu có được uống cà phê không?', 'ba-bau-uong-ca-phe1-1710965945400.jpg', 1, 3, 1, 2),
(149, 'Bà bầu có được uống cà phê không?', 'ba-bau-uong-ca-phe1-1710965945400.jpg', 1, 3, 1, 1),
(154, 'Sự phát triển của trẻ từ 2 - 5 tuổi có gì đặc biệt?', 'bang-chieu-cao-can-nang-tre-2-5-tuoi-1546038274300.png', 1, 6, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `listnews`
--

CREATE TABLE `listnews` (
  `listnews_id` int(11) NOT NULL,
  `listnews_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `listnews_uploader` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `listnews_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `listnews_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_id` int(11) NOT NULL,
  `listnews_views` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `listnews`
--

INSERT INTO `listnews` (`listnews_id`, `listnews_name`, `listnews_uploader`, `listnews_image`, `date`, `listnews_content`, `menu_id`, `listnews_views`) VALUES
(1, 'Bà bầu có được uống cà phê khônggg?', 'admin', 'ba-bau-uong-cafe-10543962055500.jpg', '2020-08-17', '<p>Phụ nữ mang thai c&oacute; thể hấp thu tới 200mg caffeine mỗi ng&agrave;y. N&oacute;i c&aacute;ch kh&aacute;c, bạn c&oacute; thể uống một cốc rưỡi c&agrave; ph&ecirc; phin hoặc hai cốc c&agrave; ph&ecirc; h&ograve;a tan mỗi ng&agrave;y để l&agrave;m dịu cơn th&egrave;m caffeine. Tuy nhi&ecirc;n, mẹ bầu n&ecirc;n lưu &yacute; rằng việc hạn chế thức uống chứa caffeine trong thai kỳ vẫn l&agrave; điều n&ecirc;n l&agrave;m. Điều g&igrave; sẽ xảy ra nếu b&agrave; bầu uống c&agrave; ph&ecirc; qu&aacute; nhiều? Cơ thể bạn c&oacute; thể dung nạp một lượng caffeine ở mức trung b&igrave;nh mỗi ng&agrave;y. Việc lạm dụng qu&aacute; mức thức uống chứa caffeine sẽ g&acirc;y ra c&aacute;c t&aacute;c dụng phụ bất lợi cho cả bạn v&agrave; em b&eacute;. 1. Ảnh hưởng của caffeine với b&agrave; bầu Caffeine l&agrave; một chất k&iacute;ch th&iacute;ch, nếu ti&ecirc;u thụ qu&aacute; nhiều loại chất n&agrave;y c&oacute; thể l&agrave;m tăng huyết &aacute;p khi mang thai v&agrave; tăng nhịp tim, g&acirc;y lo lắng, mất ngủ hoặc kh&oacute; ngủ. Caffeine cũng được v&iacute; như một loại thuốc lợi tiểu v&agrave; l&agrave;m tăng tần suất đi vệ sinh. Tuy nhi&ecirc;n, hiện tượng n&agrave;y sẽ v&ocirc; t&igrave;nh l&agrave;m cơ thể mất nước Thường xuy&ecirc;n uống c&agrave; ph&ecirc; hoặc thức uống chứa caffeine c&oacute; thể g&acirc;y lệ thuộc. Khi b&agrave; bầu ki&ecirc;ng c&agrave; ph&ecirc; đột ngột, rất c&oacute; thể bạn sẽ gặp c&aacute;c triệu chứng như kh&oacute; chịu, mệt mỏi v&agrave; đau đầu. 2. Ảnh hưởng của caffeine với thai nhi Caffeine cũng c&oacute; thể đi qua nhau thai v&agrave; ảnh hưởng đến c&aacute;c cơ quan đang ph&aacute;t triển trong b&agrave;o thai do b&eacute; kh&ocirc;ng thể xử l&yacute; được loại chất n&agrave;y. B&agrave; bầu uống c&agrave; ph&ecirc; hoặc thức uống chứa nhiều caffeine cũng k&iacute;ch th&iacute;ch thai nhi khiến em b&eacute; hoạt động trong thời gian d&agrave;i. Caffeine cũng sẽ khiến nhịp tim của thai nhi đập nhanh hơn, dẫn đến rối loạn giấc ngủ hoặc nhịp tim kh&ocirc;ng đều.</p>\r\n', 3, 257),
(9, 'Các vấn đề thường gặp sau sinh con', 'admin', '557B07E7-0F2B-41DA-82D2B2DFE94433FA_source-1977654721800.jpg', '2021-03-31', '<p>2. Nguy&ecirc;n nh&acirc;n v&agrave; c&aacute;ch điều trị c&aacute;c vấn đề sau sinh<br />\r\n2.1. Xuất huyết sau sinh<br />\r\nMặc d&ugrave; một số trường hợp chảy m&aacute;u sau sinh l&agrave; b&igrave;nh thường, c&aacute;c trường hợp chảy m&aacute;u nặng hoặc xuất huyết xảy ra chỉ chiếm khoảng 2% c&aacute;c ca sinh, thường l&agrave; sau khi chuyển dạ trong một thời gian d&agrave;i, sinh nhiều lần hoặc tử cung bị nhiễm tr&ugrave;ng.</p>\r\n\r\n<p>Xuất huyết sau sinh l&agrave; nguy&ecirc;n nh&acirc;n phổ biến thứ ba g&acirc;y tử vong cho sản phụ sau khi sinh con, thường xảy ra do tử cung kh&ocirc;ng co b&oacute;p b&igrave;nh thường sau khi nhau thai được đưa ra hoặc do mảnh nhau thai hoặc m&agrave;ng ối vẫn c&ograve;n trong tử cung, cổ tử cung hoặc &acirc;m đạo. Ngay sau khi em b&eacute; v&agrave; nhau thai được đưa ra ngo&agrave;i, bạn sẽ được theo d&otilde;i để đảm bảo tử cung đang co b&oacute;p như b&igrave;nh thường. Nếu chảy m&aacute;u nghi&ecirc;m trọng, b&aacute;c sĩ v&agrave; c&aacute;c nh&acirc;n vi&ecirc;n y tế sẽ xoa b&oacute;p tử cung của bạn để gi&uacute;p n&oacute; hoạt động b&igrave;nh thường, hoặc bạn c&oacute; thể được bổ sung một loại hormone tổng hợp c&oacute; t&ecirc;n l&agrave; oxytocin để gi&uacute;p k&iacute;ch th&iacute;ch c&aacute;c cơn co thắt tử cung. B&ecirc;n cạnh đ&oacute;, b&aacute;c sĩ c&oacute; thể y&ecirc;u cầu thực hiện kiểm tra v&ugrave;ng chậu để t&igrave;m nguy&ecirc;n nh&acirc;n xuất huyết. Nếu mất m&aacute;u qu&aacute; nhiều, sản phụ sẽ được truyền m&aacute;u.</p>\r\n\r\n<p>Nếu xuất huyết xảy ra sau một hoặc hai tuần sau khi sinh, n&oacute; c&oacute; thể được g&acirc;y ra bởi một mảnh nhau thai c&ograve;n s&oacute;t lại trong tử cung. Nếu vậy, c&aacute;c m&ocirc; sẽ được phẫu thuật cắt bỏ.</p>\r\n\r\n<p>2.2. Nhiễm tr&ugrave;ng tử cung<br />\r\nTh&ocirc;ng thường, nhau thai t&aacute;ch ra khỏi th&agrave;nh tử cung trong khi sinh v&agrave; bị tống ra khỏi &acirc;m đạo trong v&ograve;ng 20 ph&uacute;t sau khi sinh. Nếu c&aacute;c mảnh của nhau thai vẫn c&ograve;n trong tử cung, c&oacute; thể dẫn đến t&igrave;nh trạng nhiễm tr&ugrave;ng.</p>\r\n\r\n<p>Nhiễm tr&ugrave;ng t&uacute;i ối (t&uacute;i nước bao quanh em b&eacute;) khi chuyển dạ c&oacute; thể dẫn đến nhiễm tr&ugrave;ng tử cung sau sinh. Triệu chứng bao gồm: sốt cao, nhịp tim đập nhanh ; số lượng bạch cầu tăng bất thường; tử cung to,tức v&agrave; đau; tiết dịch c&oacute; m&ugrave;i h&ocirc;i thường chỉ ra khi nhiễm tr&ugrave;ng tử cung. Khi c&aacute;c m&ocirc; xung quanh tử cung cũng bị nhiễm tr&ugrave;ng, sản phụ c&oacute; cảm thấy đau v&agrave; sốt một c&aacute;ch nghi&ecirc;m trọng. Nhiễm tr&ugrave;ng tử cung thường c&oacute; thể được điều trị bằng ti&ecirc;m thuốc kh&aacute;ng sinh, nhằm ngăn ngừa c&aacute;c biến chứng nguy hiểm tiềm ẩn như sốc do nhiễm tr&ugrave;ng.</p>\r\n', 63, 38),
(13, 'Sự phát triển của trẻ từ 2 - 5 tuổi có gì đặc biệt?', 'admin', 'bang-chieu-cao-can-nang-tre-2-5-tuoi-1546038274300.png', '2021-04-17', '<p><strong>Sự ph&aacute;t triển của trẻ l&agrave; mối quan t&acirc;m h&agrave;ng đầu của ba mẹ, đặc biệt l&agrave; khi con đang trong giai đoạn từ 2 &ndash; 5 tuổi. Đ&acirc;y l&agrave; giai đoạn con y&ecirc;u ph&aacute;t triển rất nhanh v&agrave; rất cần bạn ở b&ecirc;n đấy.</strong></p>\r\n\r\n<p>Khi hiểu r&otilde; sự ph&aacute;t triển của trẻ 2 &ndash; 5 tuổi, ba mẹ sẽ c&oacute; hướng chăm s&oacute;c b&eacute; hợp l&yacute; hơn v&agrave; th&iacute;ch nghi kịp thời với những thay đổi của b&eacute;. H&atilde;y c&ugrave;ng Hello Bacsi t&igrave;m hiểu c&aacute;c b&eacute; trong độ tuổi n&agrave;y sẽ c&oacute; những mốc ph&aacute;t triển n&agrave;o để bạn c&oacute; thể th&uacute;c đẩy sự ph&aacute;t triển n&agrave;y nh&eacute;.</p>\r\n\r\n<h2>Sự ph&aacute;t triển của trẻ từ 2 đến 5 tuổi</h2>\r\n\r\n<p>Trong khoảng thời gian từ 2 đến <a href=\"https://hellobacsi.com/nuoi-day-con/tre-1-5-tuoi/su-phat-trien-cua-tre-5-tuoi/\" target=\"_blank\">5 tuổi</a>, c&aacute;c b&eacute; ph&aacute;t triển rất nhanh về c&aacute;c mặt sau:</p>\r\n\r\n<h3>1. Ph&aacute;t triển thể chất</h3>\r\n\r\n<p>Trong những năm n&agrave;y, b&eacute; sẽ ph&aacute;t triển thể lực v&agrave; chiều cao kh&aacute; nhanh. Bạn c&oacute; thể tham khảo bảng thể hiện sự ph&aacute;t triển chiều cao v&agrave; c&acirc;n nặng của trẻ 2 &ndash; 5 tuổi sau:</p>\r\n\r\n<h3>2. Ph&aacute;t triển nhận thức</h3>\r\n\r\n<p>Trẻ ở độ tuổi từ 2 &ndash; 5 c&oacute; những bước tiến lớn về khả năng suy nghĩ v&agrave; lập luận. Trong những năm n&agrave;y, b&eacute; sẽ học được chữ c&aacute;i, số đếm, m&agrave;u sắc v&agrave; h&igrave;nh khối.</p>\r\n\r\n<h3>3. Ph&aacute;t triển cảm x&uacute;c v&agrave; quan hệ x&atilde; hội</h3>\r\n\r\n<p>Trong độ tuổi từ 2 đến 5, trẻ dần học c&aacute;ch kiểm so&aacute;t cảm x&uacute;c của bản th&acirc;n. Khi c&aacute;n mốc 5 tuổi, b&eacute; sẽ dần hiểu được tầm quan trọng của bạn b&egrave;.</p>\r\n\r\n<h3>4. Ph&aacute;t triển ng&ocirc;n ngữ</h3>\r\n\r\n<p>Hầu hết <a href=\"https://hellobacsi.com/nuoi-day-con/tre-1-5-tuoi/be-2-tuoi-moc-phat-trien-nhu-the-nao/\" target=\"_blank\">trẻ 2 tuổi</a> đ&atilde; c&oacute; thể n&oacute;i &iacute;t nhất 50 từ. Khi được 5 tuổi, b&eacute; c&oacute; thể biết h&agrave;ng ngh&igrave;n từ v&agrave; c&oacute; thể ttr&ograve; chuyện mạch lạc cũng như kể chuyện.</p>\r\n\r\n<h3>5. Ph&aacute;t triển gi&aacute;c quan v&agrave; kỹ năng vận động</h3>\r\n\r\n<p>Khi được 2 tuổi, hầu hết c&aacute;c b&eacute; đều c&oacute; thể bước l&ecirc;n cầu thang từng bậc một, đ&aacute; b&oacute;ng v&agrave; vẽ c&aacute;c n&eacute;t đơn giản. Đến 5 tuổi, hầu hết c&aacute;c b&eacute; c&oacute; thể tự mặc v&agrave; cởi quần &aacute;o cũng như viết một số chữ thường, chữ in hoa v&agrave; biết t&ocirc; m&agrave;u.</p>\r\n\r\n<p>Mỗi trẻ sẽ c&oacute; tốc độ ph&aacute;t triển ri&ecirc;ng v&agrave; đạt được những mốc tr&ecirc;n v&agrave;o thời điểm kh&aacute;c nhau. Cũng c&oacute; thể b&eacute; chậm ph&aacute;t triển ở một kỹ năng nhưng lại ph&aacute;t triển nhanh ở kỹ năng kh&aacute;c.</p>\r\n\r\n<h3>1. Sự ph&aacute;t triển của trẻ 3 tuổi</h3>\r\n\r\n<p>Ở mốc 3 tuổi, hầu hết c&aacute;c b&eacute; sẽ:</p>\r\n\r\n<ul>\r\n	<li>Cao l&ecirc;n v&agrave; tr&ocirc;ng gầy hơn so với những năm ở độ tuổi tập đi. B&eacute; c&oacute; thể sẽ tăng khoảng 2kg v&agrave; cao l&ecirc;n khoảng 7,5cm so với năm b&eacute; 2 tuổi. Tuy nhi&ecirc;n, sự tăng trưởng n&agrave;y l&agrave; rất kh&aacute;c nhau ở mỗi b&eacute;.</li>\r\n	<li>Biết chơi những tr&ograve; đ&oacute;ng vai, hiểu những hướng dẫn đơn giản c&oacute; 3 bước v&agrave; th&iacute;ch c&aacute;c tr&ograve; gh&eacute;p h&igrave;nh đơn giản.</li>\r\n	<li>Biết t&ecirc;n, tuổi v&agrave; giới t&iacute;nh của m&igrave;nh.</li>\r\n	<li>Th&iacute;ch c&oacute; bạn c&ugrave;ng chơi nhưng vẫn kh&ocirc;ng th&iacute;ch chia sẻ đồ chơi.</li>\r\n	<li>Kh&ocirc;ng c&ograve;n b&aacute;m ba mẹ như trước.</li>\r\n	<li>Đ&atilde; c&oacute; thể tự ngồi đi vệ sinh.</li>\r\n	<li>C&oacute; thể nhảy, chạy, leo tr&egrave;o, đạp xe ba b&aacute;nh v&agrave; đ&aacute; b&oacute;ng.</li>\r\n</ul>\r\n\r\n<h3>2. Sự ph&aacute;t triển của trẻ 4 tuổi</h3>\r\n\r\n<p>Ở mốc 4 tuổi, hầu hết c&aacute;c b&eacute; sẽ:</p>\r\n\r\n<ul>\r\n	<li>Tăng khoảng 2kg v&agrave; cao l&ecirc;n khoảng 7,5cm so với năm&nbsp;<a href=\"https://hellobacsi.com/nuoi-day-con/tre-1-5-tuoi/tre-3-tuoi-me-nen-cho-con-an-nhu-the-nao/\" target=\"_blank\">3 tuổi</a>. Tốc độ ph&aacute;t triển n&agrave;y l&agrave; kh&aacute;c nhau ở mỗi b&eacute;.</li>\r\n	<li>C&oacute; thể n&oacute;i t&ecirc;n của m&igrave;nh, x&aacute;c định được một số m&agrave;u cơ bản v&agrave; kết hợp những thứ giống nhau (chẳng hạn như c&oacute; thể gh&eacute;p được một đ&ocirc;i tất).</li>\r\n	<li>Ph&acirc;n biệt được tưởng tượng v&agrave; thực tế.</li>\r\n	<li>C&oacute; thể n&oacute;i c&acirc;u ho&agrave;n chỉnh với &iacute;t nhất 5 hoặc 6 từ, kể chuyện v&agrave; h&aacute;t.</li>\r\n	<li>C&oacute; thể đứng bằng một ch&acirc;n, đi xe ba b&aacute;nh, n&eacute;m b&oacute;ng qu&aacute; đầu, l&ecirc;n xuống cầu thang m&agrave; kh&ocirc;ng cần b&aacute;m v&agrave;o bất cứ thứ g&igrave;.</li>\r\n</ul>\r\n\r\n<h3>3. Sự ph&aacute;t triển của trẻ 5 tuổi</h3>\r\n\r\n<p>Ở mốc 5 tuổi, hầu hết c&aacute;c b&eacute; sẽ:</p>\r\n\r\n<ul>\r\n	<li>Tăng khoảng 2kg v&agrave; cao l&ecirc;n khoảng 4 &ndash; 5cm so với năm&nbsp;<a href=\"https://hellobacsi.com/nuoi-day-con/tre-1-5-tuoi/tre-4-tuoi/\" target=\"_blank\">4 tuổi</a>. Tuy nhi&ecirc;n, tốc độ ph&aacute;t triển n&agrave;y l&agrave; kh&aacute;c nhau ở mỗi b&eacute;.</li>\r\n	<li>Biết địa chỉ của nh&agrave; m&igrave;nh.</li>\r\n	<li>Thuộc hầu hết c&aacute;c chữ c&aacute;i trong bảng chữ c&aacute;i, c&oacute; thể đếm đến 10 v&agrave; hiểu c&aacute;c kh&aacute;i niệm cơ bản về thời gian.</li>\r\n	<li>Muốn l&agrave;m h&agrave;i l&ograve;ng người kh&aacute;c v&agrave; th&iacute;ch c&oacute; bạn b&egrave;. Tuy nhi&ecirc;n, đ&ocirc;i khi những đứa trẻ ở độ tuổi n&agrave;y c&oacute; thể c&oacute; h&agrave;nh vi kh&ocirc;ng tử tế.</li>\r\n	<li>C&oacute; thể duy tr&igrave; cuộc hội thoại v&agrave; sử dụng ngữ ph&aacute;p phức tạp hơn v&iacute; dụ như th&igrave; tương lai.</li>\r\n	<li>C&oacute; thể nhảy l&ograve; c&ograve;, lộn nh&agrave;o v&agrave; nhảy d&acirc;y.</li>\r\n	<li>C&oacute; thể tự mặc v&agrave; cởi quần &aacute;o.</li>\r\n</ul>\r\n', 6, 50),
(25, 'Giai đoạn thai kỳ: Tháng thứ 6', 'admin', 'shutterstock_1367314688-7012022286200.jpg', '2021-06-09', '<p>Tuần 21</p>\r\n\r\n<p>Thai nhi ở tuần thứ 21 c&oacute; trọng lượng khoảng 360gr v&agrave; d&agrave;i khoảng 26.7cm, tương đương với chiều d&agrave;i của một củ c&agrave; rốt. Mẹ sẽ cảm thấy những chuyển động li&ecirc;n hồi như đang tập v&otilde;, đ&aacute;nh trống của b&eacute; trong bụng.</p>\r\n\r\n<p>L&ocirc;ng m&agrave;y, m&iacute; mắt của b&eacute; cũng bắt đầu xuất hiện, xương tai trong của b&eacute; ho&agrave;n thiện gi&uacute;p thai nhi nghe được hầu hết mọi &acirc;m thanh b&ecirc;n ngo&agrave;i tử cung. Nếu mẹ mang bầu b&eacute; g&aacute;i, v&ugrave;ng &acirc;m đạo của b&eacute; cũng sẽ được h&igrave;nh th&agrave;nh trong khoảng thời gian b&eacute; chạm mốc 21 tuần tuổi.</p>\r\n\r\n<p>Tuần 22</p>\r\n\r\n<p>Thai nhi d&agrave;i khoảng 27.8cm v&agrave; nặng 430gr, tương đương với một tr&aacute;i b&iacute; ng&ocirc; d&agrave;i, trong giai đoạn n&agrave;y b&eacute; bắt đầu mang d&aacute;ng dấp một đứa trẻ sơ sinh thu nhỏ, m&ocirc;i, m&iacute; mắt, l&ocirc;ng m&agrave;y c&agrave;ng r&otilde; rệt. Đ&ocirc;i mắt đ&atilde; h&igrave;nh th&agrave;nh nhưng m&agrave;ng mắt vẫn c&ograve;n thiếu sắc tố.</p>\r\n\r\n<p>B&eacute; c&oacute; lớp l&ocirc;ng tơ kh&aacute; tốt tr&ecirc;n cơ thể v&agrave; c&aacute;c nếp nhăn tr&ecirc;n da, nếp nhăn n&agrave;y sẽ giảm dần ở qu&yacute; thứ 3 của thai kỳ, khi b&eacute; t&iacute;ch dần chất b&eacute;o. B&ecirc;n trong bụng tuyến tụy cũng đang ph&aacute;t triển mạnh mẽ.</p>\r\n\r\n<p>Tuần 23</p>\r\n\r\n<p>Ở tuần 23, thai trong bụng mẹ d&agrave;i khoảng 29cm, nặng hơn 500gr, tương đương với k&iacute;ch thước của một tr&aacute;i xo&agrave;i lớn. L&uacute;c n&agrave;y mẹ sẽ thấy b&eacute; đang nh&agrave;o lộn hay vặn m&igrave;nh b&ecirc;n dưới lớp da. Mạch m&aacute;u trong phổi của b&eacute; cũng ph&aacute;t triển để chuẩn bị cho qu&aacute; tr&igrave;nh h&ocirc; hấp ở thế giới b&ecirc;n ngo&agrave;i khi kết th&uacute;c thai kỳ. Mẹ cũng cần lưu &yacute;&nbsp;<a href=\"https://www.meijimom.vn/me-bau-nen-biet-cac-chi-so-do-thai-nhi-de-bo-sung-duong-chat-hop-ly-nhatda-duyet.html\">những chỉ số đo ph&aacute;t triển của thai nhi.</a></p>\r\n\r\n<p>Tai b&eacute; gần như ph&aacute;t triển ho&agrave;n thiện, những &acirc;m thanh lớn sẽ dần trở n&ecirc;n quen thuộc với con gi&uacute;p con kh&ocirc;ng sợ h&atilde;i hay giật m&igrave;nh khi bước ra thế giới b&ecirc;n ngo&agrave;i.</p>\r\n\r\n<p>Tuần 24</p>\r\n\r\n<p>Thời điểm n&agrave;y, b&eacute; c&oacute; chiều d&agrave;i khoảng 30cm, cơ thể b&eacute; vẫn c&ograve;n kh&aacute; nhỏ với đầu to so với th&acirc;n m&igrave;nh. N&atilde;o bộ v&agrave; c&aacute;c nụ vị gi&aacute;c của b&eacute; cũng ph&aacute;t triển nhanh ch&oacute;ng, phổi của con cũng h&igrave;nh th&agrave;nh c&aacute;c nh&aacute;nh h&ocirc; hấp v&agrave; c&aacute;c tế b&agrave;o bắt đầu sinh sản ra chất surfactant gi&uacute;p phổi của con c&oacute; thể phồng l&ecirc;n v&agrave; chứa thật nhiều kh&ocirc;ng kh&iacute; ngay sau khi b&eacute; tiếp x&uacute;c với m&ocirc;i trường b&ecirc;n ngo&agrave;i. Da b&eacute; vẫn c&ograve;n rất mỏng v&agrave; nhạt m&agrave;u.</p>\r\n\r\n<h3>Những thay đổi trong cơ thể mẹ trong giai đoạn thai kỳ th&aacute;ng thứ 6</h3>\r\n\r\n<p>Tuần 21</p>\r\n\r\n<p>Trong khoảng thời gian n&agrave;y, cơ thể mẹ vẫn chưa thực sự qu&aacute; lớn, những cảm gi&aacute;c kh&oacute; chịu trong thời gian đầu thai kỳ sẽ ho&agrave;n to&agrave;n biến mất. Da tiết dầu nhiều hơn, tạo điều kiện cho mụn trứng c&aacute; gh&eacute; thăm.</p>\r\n\r\n<p>C&oacute; nhiều mẹ rơi v&agrave;o t&igrave;nh trạng gi&atilde;n tĩnh mạch, khi em b&eacute; ph&aacute;t triển, &aacute;p lực tăng l&ecirc;n đối với c&aacute;c tĩnh mạch ở ch&acirc;n của mẹ, c&ugrave;ng nồng độ Progesterone tăng cao n&ecirc;n vấn đề chuột r&uacute;t sảy ra với tần suất cao hơn.</p>\r\n\r\n<p>Tuần 22</p>\r\n\r\n<p>C&aacute;c vết rạn da tr&ecirc;n bụng bắt đầu xuất hiện v&agrave; căng ra tạo điều kiện cho thai nhi kh&ocirc;ng ngừng ph&aacute;t triển, những vết rạn n&agrave;y thường c&oacute; m&agrave;u sắc kh&aacute;c nhau từ hồng tới n&acirc;u đậm. B&igrave;nh thường ch&uacute;ng xuất hiện tr&ecirc;n bụng, c&ograve;n c&oacute; thể xuất hiện tr&ecirc;n m&ocirc;ng, đ&ugrave;i, h&ocirc;ng v&agrave; ngực. Đồng thời, n&uacute;m v&uacute; lớn hơn, sẫm hơn, b&agrave;n ch&acirc;n mẹ c&oacute; thể tăng một nửa cỡ gi&agrave;y trở l&ecirc;n.</p>\r\n\r\n<p>Tuần 23</p>\r\n\r\n<p>Mắt c&aacute; ch&acirc;n v&agrave; b&agrave;n ch&acirc;n bắt đầu sưng l&ecirc;n đ&ocirc;i ch&uacute;t, tốc độ lưu th&ocirc;ng m&aacute;u c&oacute; phần chậm chạp ở ch&acirc;n, c&ugrave;ng với những biến đổi trong m&aacute;u c&oacute; thể g&acirc;y ra t&igrave;nh trạng t&iacute;ch nước, đ&acirc;y cũng l&agrave; nguy&ecirc;n nh&acirc;n trực tiếp dẫn tới việc sưng hay c&ograve;n được gọi l&agrave; ph&ugrave; nề. Ở th&aacute;ng thứ 6 mẹ cũng xuất hiện rải r&aacute;c những cơn đau lưng.</p>\r\n\r\n<p>Tuần 24</p>\r\n\r\n<p>Phần tr&ecirc;n tử cung đ&atilde; nh&ocirc; cao qu&aacute; rốn, k&iacute;ch thước tử cung khoảng 21cm l&uacute;c n&agrave;y kh&aacute; lớn, hầu hết từ giai đoạn n&agrave;y c&aacute;c mẹ đều&nbsp;<a href=\"https://www.meijimom.vn/chong-tao-bon-hay-hap-thu-thuc-pham-co-nhieu-chat-xo.html\">bị t&aacute;o b&oacute;n</a>&nbsp;v&igrave; vậy mẹ bầu n&ecirc;n bổ sung chất xơ để giảm chứng t&aacute;o b&oacute;n. Mẹ cũng sẽ bị chứng co thắt Braxton Hicks thường xuy&ecirc;n hơn, những cơn co thắt n&agrave;y khiến cho dạ con của mẹ co cứng lại bất chợt. V&agrave; mẹ n&ecirc;n&nbsp;<a href=\"https://www.meijimom.vn/dinh-duong-va-cac-bua-an-tu-chuan-bi.html\">c&acirc;n bằng bữa ăn khi mang thai để mẹ khoẻ con th&ocirc;ng minh.</a></p>\r\n', 3, 22),
(39, 'Vai trò của dinh dưỡng cho bà bầu 3 tháng đầu', 'admin', 'dinhduongbabau-1385508736500.jpg', '2021-06-15', '<p><em>Dinh dưỡng cho b&agrave; bầu 3 th&aacute;ng đầu rất quan trọng v&igrave; n&oacute; quyết định đến sự h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển to&agrave;n diện của thai nhi. Vậy n&oacute; c&oacute; quan trọng như thế n&agrave;o v&agrave; cần bổ sung những thực phẩm g&igrave;? H&atilde;y đọc b&agrave;i viết sau để t&igrave;m hiểu về vấn đề n&agrave;y!</em></p>\r\n\r\n<p><strong>Vai tr&ograve; của dinh dưỡng cho b&agrave; bầu 3 th&aacute;ng đầu</strong></p>\r\n\r\n<p>Theo c&aacute;c chuy&ecirc;n gia, t&ugrave;y theo sức khỏe của mỗi người m&agrave; trước v&agrave; khi c&oacute; thai mẹ bầu c&oacute; thể tăng từ 10 &ndash; 12kg. Số c&acirc;n nặng n&agrave;y sẽ được ph&acirc;n bổ trong mỗi giai đoạn cụ thể của thai kỳ để c&oacute; thể gi&uacute;p b&eacute; ph&aacute;t triển một c&aacute;ch to&agrave;n diện nhất.</p>\r\n\r\n<p>Ba th&aacute;ng đầu ti&ecirc;n l&agrave; giai đoạn quan trọng nhất để tạo tiền để cho sự ph&aacute;t triển của thai nhi cho n&ecirc;n, chế độ dinh dưỡng l&agrave; v&ocirc; c&ugrave;ng quan trọng. B&agrave; bầu cần theo d&otilde;i s&aacute;t sao chế độ dinh dưỡng trong thời kỳ n&agrave;y.</p>\r\n\r\n<p>Nguồn dinh dưỡng ch&iacute;nh để nu&ocirc;i b&agrave;o thai ch&iacute;nh l&agrave; từ người mẹ v&agrave; n&oacute; phụ thuộc ho&agrave;n to&agrave;n v&agrave;o chế độ ăn m&agrave; b&agrave; bầu dung nạp v&agrave;o cơ thể. Khi được hấp thu v&agrave;o cơ thể, n&oacute; sẽ theo m&aacute;u v&agrave;o để nu&ocirc;i dưỡng thai nhi. Do đ&oacute;, nếu cung cấp đầy đủ c&aacute;c chất dinh dưỡng cần thiết sẽ gi&uacute;p mẹ lu&ocirc;n khỏe mạnh, hạn chế bệnh tật từ đ&oacute; gi&uacute;p b&eacute; ph&aacute;t triển to&agrave;n diện.</p>\r\n\r\n<p>Ba th&aacute;ng đầu ti&ecirc;n cũng l&agrave; giai đoạn thai nhi bắt đầu h&igrave;nh th&agrave;nh c&aacute;c cơ quan như n&atilde;o bộ, tủy sống, tim, phổi. Cho n&ecirc;n, việc bổ sung dinh dưỡng đủ v&agrave; đ&uacute;ng c&agrave;ng quan trọng. Biết rằng, giai đoạn n&agrave;y mẹ bầu bị ngh&eacute;n, kh&oacute; ăn, ăn v&agrave;o l&agrave; n&ocirc;n, nhiều người bị giảm c&acirc;n. Tuy nhi&ecirc;n, c&aacute;c chuy&ecirc;n gia cho biết, b&agrave; bầu cần đặt mục ti&ecirc;u tăng 1 &ndash; 2 c&acirc;n trong giai đoạn n&agrave;y.</p>\r\n', 2, 2),
(40, 'Chế độ dinh dưỡng cho 3 tháng đầu', 'admin', 'dinhduongbabau2-1616977685800.jpg', '2021-06-15', '<p>Ba th&aacute;ng đầu của thai kỳ (hay c&ograve;n gọi l&agrave; tam c&aacute; nguyệt thứ nhất) l&agrave; giai đoạn quan trọng bởi tế b&agrave;o ph&ocirc;i bắt đầu c&oacute; sự ph&acirc;n h&oacute;a v&agrave; h&igrave;nh th&agrave;nh c&aacute;c cơ quan. Giai đoạn n&agrave;y mẹ bầu bị ngh&eacute;n n&ecirc;n việc ăn uống kh&aacute; kh&oacute; khăn.</p>\r\n\r\n<p>Do đ&oacute;, để đảm bảo cung cấp đủ chất dinh dưỡng, mẹ bầu kh&ocirc;ng n&ecirc;n ăn qu&aacute; nhiều nhưng cần đảm bảo đủ. Theo c&aacute;c chuy&ecirc;n gia dinh dưỡng, mỗi ng&agrave;y mẹ bầu ở giai đoạn n&agrave;y n&ecirc;n bổ sung 300calo. Những thực phẩm tốt nhất cho mẹ bầu l&uacute;c n&agrave;y l&agrave;:</p>\r\n\r\n<p><em>Những thực phẩm tốt nhất cho mẹ bầu giai đoạn 3 th&aacute;ng đầu ti&ecirc;n</em></p>\r\n\r\n<p><strong>Thực phẩm gi&agrave;u acid folic</strong></p>\r\n\r\n<p>Acid folic l&agrave; một trong những th&agrave;nh phần v&ocirc; c&ugrave;ng quan trọng v&igrave; n&oacute; quyết định đến sự ph&aacute;t triển của n&atilde;o bộ v&agrave; tủy sống của b&eacute;. Cho n&ecirc;n, ngay từ khi quyết định mang thai mẹ bầu cần chủ động bổ sung th&agrave;nh phần n&agrave;y để hỗ trợ tốt nhất cho qu&aacute; tr&igrave;nh mang thai.</p>\r\n\r\n<p>H&agrave;m lượng acid folic đạt ti&ecirc;u chuẩn cho mẹ bầu mỗi ng&agrave;y l&agrave; 400mg. C&aacute;c thực phẩm gi&agrave;u dưỡng chất n&agrave;y như nước cam, gạo, b&aacute;nh m&igrave;, ngũ cốc, c&aacute;c loại đậu,&hellip;</p>\r\n\r\n<p><strong>Thực phẩm gi&agrave;u sắt</strong></p>\r\n\r\n<p>Sắt l&agrave; l&agrave; nguồn bổ sung tốt nhất cho mẹ bầu giai đoạn ba th&aacute;ng đầu ti&ecirc;n v&igrave; n&oacute; tr&aacute;nh được t&igrave;nh trạng thiếu m&aacute;u cho mẹ bầu. N&oacute; kh&ocirc;ng chỉ gi&uacute;p mẹ mạnh khỏe hơn m&agrave; c&ograve;n gi&uacute;p thai nhi ph&aacute;t triển to&agrave;n diện hơn.</p>\r\n\r\n<p>H&agrave;m lượng sắt cần bổ sung giai đoạn 3 th&aacute;ng đầu ti&ecirc;n l&agrave; 30mg/ ng&agrave;y. C&aacute;c thực phẩm gi&agrave;u sắt gồm đậu phụ, gan động vật, cải b&oacute; x&ocirc;i, ngũ cốc, g&agrave; t&acirc;y. Ngo&agrave;i ra, bổ sung thuốc sắt cũng l&agrave; biện ph&aacute;p được mẹ bầu &aacute;p dụng v&igrave; n&oacute; cho kết quả cao.</p>\r\n\r\n<p><strong>Thực phẩm gi&agrave;u canxi</strong></p>\r\n\r\n<p>Canxi l&agrave; th&agrave;nh phần kh&ocirc;ng thể thiếu đối với b&agrave; bầu trong suốt giai đoạn mang thai, đặc biệt l&agrave; 3 th&aacute;ng đầu ti&ecirc;n. N&oacute; l&agrave; dưỡng chất cần thiết cho sự ph&aacute;t triển của xương. Nếu thiếu canxi, thai nhi c&oacute; thể bị c&ograve;i, chậm ph&aacute;t triển, đồng thời mẹ cũng bị ảnh hưởng.</p>\r\n\r\n<p>H&agrave;m lượng canxi trong 3 th&aacute;ng đầu cần thiết l&agrave; 800mg. C&aacute;c thực phẩm gi&agrave;u th&agrave;nh phần n&agrave;y mẹ bầu c&oacute; thể bổ sung như: sữa v&agrave; c&aacute;c chế phẩm từ sữa, c&aacute;, đậu phụ, ngũ cốc, cải b&oacute; x&ocirc;i, cải xoăn,..</p>\r\n\r\n<p><strong>Thực phẩm gi&agrave;u protein</strong></p>\r\n\r\n<p>Protein c&oacute; vai tr&ograve; quan trọng trong sự h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển của thai nhi. N&oacute; gi&uacute;p cho b&eacute; được ph&aacute;t triển to&agrave;n diện v&agrave; khỏe mạnh.</p>\r\n\r\n<p>Theo c&aacute;c chuy&ecirc;n gia, mỗi ng&agrave;y mẹ bầu cần bổ sung 70gr protein. Th&agrave;nh phần n&agrave;y c&oacute; nhiều trong c&aacute;c loại thực phẩm như: hải sản, s&uacute;p lơ, ch&agrave; l&agrave;, trứng,&hellip;</p>\r\n\r\n<p><strong>Thực phẩm gi&agrave;u DHA</strong></p>\r\n\r\n<p>DHA l&agrave; một loại Omega-3 c&oacute; vai tr&ograve; tăng cường hoạt động của mắt, tr&iacute; n&atilde;o. N&oacute; chiếm đến 20% c&aacute;c th&agrave;nh phần trong n&atilde;o bộ v&agrave; 60% ở v&otilde;ng mạc.</p>\r\n\r\n<p>Chuy&ecirc;n gia dinh dưỡng cho biết, trong giai đoạn đầu của thai k&igrave;, mẹ bầu cần bổ sung 200mg DHA mỗi ng&agrave;y. C&aacute;c thực phẩm gi&agrave;u th&agrave;nh phần n&agrave;y c&oacute; thể kể đến như: c&aacute;, hạt dẻ, l&ograve;ng trắng trứng, s&uacute;p lơ, &oacute;c ch&oacute;,&hellip;</p>\r\n', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_name`, `parent_id`) VALUES
(1, 'Giai đoạn mang thai', 0),
(2, 'Đầu thai kì', 1),
(3, 'Mang thai 3-6 tháng', 1),
(4, 'Giai đoạn chăm sóc trẻ', 0),
(5, 'Chăm sóc trẻ 0-1 tuổi', 4),
(6, 'Chăm sóc trẻ 2-5 tuổi', 4),
(7, 'Thực phẩm', 0),
(8, 'Thực phẩm cho mẹ', 7),
(9, 'Thực phẩm cho bé', 7),
(52, 'Sức khỏe', 0),
(53, 'Thể dục cho bà bầu', 52),
(61, 'Giai đoạn sinh nở', 1),
(62, 'Thư giãn thời kì mang thai', 52),
(63, 'Bệnh thường gặp sau sinh', 52),
(64, 'Bệnh thường gặp ở trẻ', 52),
(65, 'Tin tức', 0),
(66, 'Tin tức phụ nữ', 65),
(67, 'Nuôi dạy trẻ khôn lớn', 65);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `message_sent` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_time_sent` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_account` int(11) NOT NULL,
  `id_expert` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `message_sent`, `message_time_sent`, `name`, `id_account`, `id_expert`) VALUES
(213, 'hi', '2021/05/08 01:54:50 AM', 'Nam đẹp gái', 15, 0),
(214, 'có gì không?', '2021/05/08 01:55:05 AM', 'Khôi', 15, 2),
(215, 'không :v', '2021/05/08 01:55:09 AM', 'Nam đẹp gái', 15, 0),
(224, 'alo', '2021/05/08 09:00:52 AM', 'Khôi', 15, 2),
(225, 'nghe', '2021/05/08 09:00:56 AM', 'Nam đẹp gái', 15, 0),
(228, 'chào chuyên gia', '2021/05/08 09:51:28 AM', 'Nam', 15, 0),
(229, 'chào bạn', '2021/05/08 09:51:33 AM', 'Khôi', 15, 2),
(232, 'Chào chuyên gia, mình có vấn đề cần được tư vấn ạ.', '2021/06/16 07:01:20 AM', 'Gia Hưng', 1, 0),
(233, 'Chào bạn, bạn cần mình hỗ trợ gì ', '2021/06/16 07:01:42 AM', 'Khôi', 1, 2),
(234, 'Chào chuyên gia, mình cần hỗ trợ về sản phẩm.', '2021/06/16 08:59:41 AM', 'Gia Hưng', 1, 0),
(235, 'Chào bạn, bạn cần tư vấn cho sản phẩm nào', '2021/06/16 09:00:11 AM', 'Khôi', 1, 2),
(236, 'vui lòng cung cấp thêm thông tin cho mình nhé', '2021/06/16 09:00:18 AM', 'Khôi', 1, 2),
(237, 'cảm ơn bạn', '2021/06/16 09:00:20 AM', 'Khôi', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_introduce` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double NOT NULL,
  `product_views` int(11) NOT NULL,
  `product_datecreated` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_datemodified` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_introduce`, `product_description`, `product_image`, `product_price`, `product_views`, `product_datecreated`, `product_datemodified`, `category_id`) VALUES
(1, 'Máy hút sữa bằng tayyy', '<p>M&aacute;y h&uacute;t sữa được thiết kế dựa tr&ecirc;n sự thoải m&aacute;i v&agrave; dễ d&agrave;ng cho mẹ trong qu&aacute; tr&igrave;nh h&uacute;t sữa. Sanity Intelligent Electric Breast Pump l&agrave; sản phẩm mới nhất của Sanity thuộc tập đo&agrave;n Albert &ndash; Đức, sản phẩm c&oacute; kiểu d&aacute;ng nhỏ gọn, dễ d&agrave;ng v&agrave; tiện lợi sử dụng. Sanity AP-154AE c&oacute; mức gi&aacute; vừa phải, sử dụng nguồn nguy&ecirc;n liệu an to&agrave;n &ndash; được kiểm so&aacute;t chất lượng nghi&ecirc;m ngặt bởi h&atilde;ng sản xuất Albert &ndash; Germany, với nh&agrave; m&aacute;y ch&iacute;nh tại Ba Lan đạt ti&ecirc;u chuẩn Ch&acirc;u &Acirc;u.gg</p>\r\n', '<p>M&aacute;y h&uacute;t sữa điện đơn th&ocirc;ng minh Sanity AP-154AE (Int Electric Breast Pump) M&aacute;y h&uacute;t sữa được thiết kế dựa tr&ecirc;n sự thoải m&aacute;i v&agrave; dễ d&agrave;ng cho mẹ trong qu&aacute; tr&igrave;nh h&uacute;t sữa. Sanity Intelligent Electric Breast Pump l&agrave; sản phẩm mới nhất của Sanity thuộc tập đo&agrave;n Albert &ndash; Đức, sản phẩm c&oacute; kiểu d&aacute;ng nhỏ gọn, dễ d&agrave;ng v&agrave; tiện lợi sử dụng. Sanity AP-154AE c&oacute; mức gi&aacute; vừa phải, sử dụng nguồn nguy&ecirc;n liệu an to&agrave;n &ndash; được kiểm so&aacute;t chất lượng nghi&ecirc;m ngặt bởi h&atilde;ng sản xuất Albert &ndash; Germany, với nh&agrave; m&aacute;y ch&iacute;nh tại Ba Lan đạt ti&ecirc;u chuẩn Ch&acirc;u &Acirc;u. M&aacute;y cung cấp chế độ h&uacute;t sữa tiện lợi v&agrave; trang bị c&ocirc;ng nghệ h&uacute;t &aacute;p suất kh&eacute;p k&iacute;n cho sữa được tiết ra điều đặn, dễ d&agrave;ng hơn. Do m&aacute;y được thiết kế đơn giản n&ecirc;n bạn chỉ cần &ldquo;ấn một n&uacute;t&rdquo; t&ugrave;y biến tăng giảm l&agrave; bạn c&oacute; thể sử dụng được ngay, kh&ocirc;ng cần c&agrave;i đặt phức tạp như c&aacute;c m&aacute;y kh&aacute;c. &ndash; M&aacute;y h&uacute;t sữa hoạt động bằng nguồn điện th&ocirc;ng qua Adapter v&agrave; pin rời (Pin dự ph&ograve;ng) n&ecirc;n tr&aacute;nh được t&igrave;nh trạng bị chảy pin hoặc ph&ugrave; nắp m&aacute;y.Nếu bạn l&agrave; một trong những mẹ kh&ocirc;ng quan t&acirc;m đến sữa c&ocirc;ng thức trong bữa ăn của b&eacute;, v&agrave; bạn muốn nu&ocirc;i con bằng sữa mẹ đơn thuần th&igrave; việc lựa chọn cho m&igrave;nh một chiếc m&aacute;y h&uacute;t sữa bằng điện l&agrave; điều rất cần thiết. C&aacute;c m&aacute;y h&uacute;t sữa Sanity lu&ocirc;n mang lại hiểu quả cao nhất, v&igrave; bạn sẽ kh&ocirc;ng cần phải sử dụng b&agrave;n tay của m&igrave;nh trong khi qu&aacute; tr&igrave;nh h&uacute;t sữa vẫn diễn ra. Về c&ocirc;ng nghệ: v&igrave; sao được đặt t&ecirc;n l&agrave; &ldquo;Intelligent Electric Breast Pump&rdquo;? Nghĩa l&agrave; &ldquo;M&aacute;y h&uacute;t sữa điện Th&ocirc;ng minh&rdquo; đ&oacute; l&agrave; c&ocirc;ng nghệ bơm &amp; tạo ch&acirc;n kh&ocirc;ng được m&ocirc; phỏng theo qu&aacute; tr&igrave;nh b&uacute; sữa mẹ tự nhi&ecirc;n của trẻ, c&ocirc;ng nghệ bơm v&agrave; lớp silicon gi&uacute;p hoạt động &ecirc;m &aacute;i nhất, kh&ocirc;ng g&acirc;y đau v&agrave; chiết xuất sữa tự nhi&ecirc;n.</p>\r\n', 'ba-bau-uong-cafe-10866696952400.jpg', 456, 357, '18-04-2021', '16-06-2021', 1),
(2, 'Son môi không chì', '<p>&quot;&nbsp;Son thỏi l&igrave;&nbsp;huyền thoại&quot;&nbsp;MAC matte lipstick đa trở th&agrave;nh một trong những d&ograve;ng son nổi tiếng nhất thế giới v&agrave; l&agrave; item must - have của c&aacute;c t&iacute;n đồ son m&ocirc;i.</p>\r\n\r\n<p><strong>Ưu điểm nổi bật</strong></p>\r\n\r\n<p>- Độ l&ecirc;n m&agrave;u SI&Ecirc;U CHUẨN, chất son mềm mịn, hương thơm vani dịu nhẹ, đặc trưng c&ugrave;ng khả năng giữ m&agrave;u si&ecirc;u l&acirc;u nhưng kh&ocirc;ng hề g&acirc;y kh&ocirc; m&ocirc;i như c&aacute;c d&ograve;ng son kh&aacute;c.</p>\r\n\r\n<p>- Với Mac Lipstick, khu&ocirc;n mặt của bạn sẽ bừng s&aacute;ng v&agrave; nổi bật hơn</p>\r\n', '<p>Son MAC Powder Kiss Lipstick Devoted To Chili&nbsp;vẫn giữ nguy&ecirc;n d&aacute;ng h&igrave;nh vi&ecirc;n đạn &ldquo;trứ danh&rdquo; từng g&acirc;y &ldquo;x&ocirc;n xao&rdquo; tr&ecirc;n thị trường son m&ocirc;i của nh&agrave; Mac.&nbsp;Với sắc son đỏ gạch đầy hứa hẹn,&nbsp;son MAC Devoted To Chili&nbsp;mang đến cho c&aacute;c c&ocirc; n&agrave;ng một diện mạo cuốn h&uacute;t, c&aacute; t&iacute;nh trong những buổi tiệc t&ugrave;ng sự kiện cuối năm. Với sắc&nbsp;son MAC Devoted To Chili m&agrave;u đỏ gạch&nbsp;n&agrave;y bạn c&oacute; thể kết hợp với rất nhiều kiểu make up kh&aacute;c nhau, mang đến những h&igrave;nh ảnh mới mẻ v&agrave; lạ mắt hơn bao giờ hết.</p>\r\n\r\n<p>Mac vẫn lu&ocirc;n l&agrave; &ldquo;tượng đ&agrave;i&rdquo; trong l&ograve;ng những c&ocirc; g&aacute;i y&ecirc;u c&aacute;i đẹp v&agrave; sự tinh tế của thương hiệu n&agrave;y. Ngo&agrave;i những sắc son hot hit đ&atilde; g&acirc;y đ&igrave;nh đ&aacute;m trong nhiều bộ sưu tập trước đ&acirc;y th&igrave;&nbsp;Mac Matte Marrakesh 646&nbsp;như chị em ruột thịt của &ldquo;Mac Chili&rdquo; cũng đang g&acirc;y b&atilde;o gi&oacute; trong thị trường l&agrave;m đẹp.&nbsp;Mac Matte Marrakesh 646&nbsp;l&agrave; m&agrave;u son được h&ograve;a trộn giữa đỏ &ndash; cam &ndash; n&acirc;u với tỷ lệ ph&ugrave; hợp để tạo n&ecirc;n m&agrave;u son đỏ gạch thi&ecirc;n về tone cam, trầm, ấm. Sắc son c&oacute; độ đậm vừa phải nhưng kh&ocirc;ng hề bị dừ m&agrave; vẫn giữ lại được n&eacute;t rạng ngời, rực rỡ v&agrave; tươi tắn.&nbsp;Marrakesh v&ocirc; c&ugrave;ng t&ocirc;n da, thời thượng để gi&uacute;p n&agrave;ng biến tấu trong mọi phong c&aacute;ch. Son rất t&ocirc;n da d&ugrave; l&agrave; n&agrave;ng da trắng hay c&ocirc; g&aacute;i da ngăm, ngo&agrave;i ra c&ograve;n kh&ocirc;ng hề l&agrave;m xỉn men răng n&ecirc;n cực dễ sử dụng hằng ng&agrave;y.&nbsp;</p>\r\n\r\n<p>Son Mac Lady Danger&nbsp;thuộc d&ograve;ng&nbsp;Matte, l&agrave; d&ograve;ng son l&igrave; l&acirc;u tr&ocirc;i, chất son mượt, m&agrave;u sắc hot v&ocirc; c&ugrave;ng.&nbsp;Mac&nbsp;Lady Danger&nbsp;hot nhất của&nbsp;Mac,&nbsp;v&igrave; m&agrave;u l&ecirc;n tuyệt đẹp, c&oacute; đỏ nhức nhối lại c&oacute; cam rực rỡ n&ecirc;n&nbsp;Lady Danger&nbsp;ph&ugrave; hợp với mọi t&ocirc;ng m&agrave;u da, l&agrave;m bừng s&aacute;ng cả khu&ocirc;n mặt bạn v&agrave; tất nhi&ecirc;n, bạn sẽ l&agrave; một c&ocirc; g&aacute;i rất rất quyến rũ mang đầy vẻ trẻ trung.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'son-moi-khong-chi-tot-nhat-hien-nay-1-2147132274500.jpg', 1200000, 157, '18-04-2021', '15-06-2021', 1),
(3, 'Nước Hoa Thayers', '<p>Nước Hoa Hồng Kh&ocirc;ng Cồn Hương Hoa Hồng Thayers Witch Hazel Rose Petal thuộc về thương hiệu Thayers - h&atilde;ng mỹ phẩm c&oacute; lịch sử l&acirc;u đời tại Mỹ. Toner Thayers l&agrave; sản phẩm cực k&igrave; dịu nhẹ, được chiết xuất ho&agrave;n to&agrave;n từ nguồn nguy&ecirc;n liệu thi&ecirc;n nhi&ecirc;n như nước hoa hồng, chiết xuất c&acirc;y phỉ, l&ocirc; hội v&agrave; vitamin E. Toner gi&uacute;p đem lại cho bạn m&ocirc;̣t làn da m&ecirc;̀m mại, mịn màng m&agrave; kh&ocirc;ng lo bị k&iacute;ch ứng. Toner với m&ugrave;i hương hoa hồng thư th&aacute;i.</p>\r\n', '<p><strong>Th&agrave;nh phần v&agrave; c&ocirc;ng dụng:</strong><br />\r\n- Nước Hoa Hồng Kh&ocirc;ng Cồn Thayers sở hữu c&ocirc;ng thức độc quyền Witch Hazel chiết xuất từ vỏ c&acirc;y phỉ (kh&ocirc;ng phải chưng cất), c&oacute; thuộc t&iacute;nh l&agrave;m se da, h&uacute;t bỏ lượng dầu thừa trong lỗ ch&acirc;n l&ocirc;ng, giảm sưng đỏ, hạn chế mụn trứng c&aacute; m&agrave; kh&ocirc;ng l&agrave;m kh&ocirc; da), nha đam và vitamin E, hỗ trợ cho cả da nhạy cảm, v&agrave; da đang c&oacute; vết thương hở.<br />\r\n- Cung cấp độ ẩm cần thiết tức th&igrave; cho da gi&uacute;p se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng<br />\r\n- Kh&aacute;ng vi&ecirc;m hiệu quả cho da mụn, ngăn ngừa v&agrave; hỗ trợ điều trị mụn ẩn, mụn vi&ecirc;m sưng.<br />\r\n- Mang lại cảm gi&aacute;c thư gi&atilde;n v&agrave; phục hồi sức sống cho l&agrave;n da mệt mỏi.<br />\r\n- Được thiết kế ph&ugrave; hợp với l&agrave;n da nhạy cảm nhất, nước c&acirc;n bằng l&agrave;m dịu nhẹ đi những v&ugrave;ng da bị k&iacute;ch ứng, sợi b&atilde; nhờn v&agrave; l&agrave;m mềm da hiệu quả.<br />\r\n- Gi&uacute;p phục hồi v&agrave; sửa chữa tổn thương tr&ecirc;n bề mặt v&agrave; cung cấp độ ẩm cần thiết cho l&agrave;n da nhạy cảm.</p>\r\n\r\n<p><strong>Đối tượng sử dụng:</strong><br />\r\nToner Thayers th&iacute;ch hợp chăm s&oacute;c da h&agrave;ng ng&agrave;y d&agrave;nh cho tất cả c&aacute;c loại da.<br />\r\n<strong>Hướng dẫn sử dụng:</strong><br />\r\n- D&ugrave;ng như một bước toner l&agrave;m sạch thứ hai trong c&aacute;c bước skin care hằng ng&agrave;y. Sử dụng cả ng&agrave;y để l&agrave;m m&aacute;t v&agrave; cấp ẩm cho da.<br />\r\n- C&oacute; thể sử dụng cho mặt v&agrave; bất kỳ vị tr&iacute; n&agrave;o tr&ecirc;n cơ thể.<br />\r\n- C&oacute; thể sử dụng sau khi trang điểm.</p>\r\n\r\n<p>D&ugrave;ng b&ocirc;ng tẩy trang đ&atilde; thấm ướt nước hoa hồng thoa đều l&ecirc;n mặt để giữ ẩm v&agrave; mềm mịn da</p>\r\n\r\n<p>Th&agrave;nh phần</p>\r\n\r\n<p>Purified Water, Certified Organic Witch Hazel Ext Blend ( Hamamelis Virginiana Extract (Witch Hazel *), Aloe Barbadensis Leaf Juice (Filet of Aloe Vera*)), Glycerin, Phenoxyethanol, Rosa Centifolia (Rose) Flower Water, Fragrance (Natural Rose), Citri</p>\r\n\r\n<p>Điều kiện bảo quản</p>\r\n\r\n<p>Nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t. Tr&aacute;nh &aacute;nh nắng trực tiếp, nơi c&oacute; nhiệt độ cao hoặc ẩm ướt. Đậy nắp k&iacute;n sau khi sử dụng.</p>\r\n', 'bo-toner-tri-mun-danh-cho-ba-bau-cuu-canh-cho-chi-em-phu-nu-hinh-anh-2-2159551857000.jpg', 1500000, 163, '18-04-2021', '15-06-2021', 2),
(13, 'Sữa bột Morinaga', '<p><a href=\"https://www.kidsplaza.vn/sua-morinaga.html\"><strong>Sữa Morinaga</strong></a>&nbsp;số 3 Kodomil l&agrave; sữa được nhập khẩu nguy&ecirc;n bao b&igrave; từ Nhật Bản, d&agrave;nh cho trẻ tr&ecirc;n tuổi, gi&agrave;u dưỡng chất gi&uacute;p trẻ ph&aacute;t triển to&agrave;n diện với một hệ ti&ecirc;u h&oacute;a khỏe mạnh. Đ&acirc;y l&agrave; sự lựa chọn tốt nhất cho c&aacute;c b&eacute; trong giai đoạn v&agrave;ng cần đ&aacute;p ứng đầy đủ dưỡng chất để học hỏi, th&ocirc;ng minh v&agrave; khỏe mạng hơn.</p>\r\n', '<p>M&aacute;y h&uacute;t sữa điện đơn th&ocirc;ng minh Sanity AP-154AE (Int Electric Breast Pump) M&aacute;y h&uacute;t sữa được thiết kế dựa tr&ecirc;n sự thoải m&aacute;i v&agrave; dễ d&agrave;ng cho mẹ trong qu&aacute; tr&igrave;nh h&uacute;t sữa. Sanity Intelligent Electric Breast Pump l&agrave; sản phẩm mới nhất của Sanity thuộc tập đo&agrave;n Albert &ndash; Đức, sản phẩm c&oacute; kiểu d&aacute;ng nhỏ gọn, dễ d&agrave;ng v&agrave; tiện lợi sử dụng. Sanity AP-154AE c&oacute; mức gi&aacute; vừa phải, sử dụng nguồn nguy&ecirc;n liệu an to&agrave;n &ndash; được kiểm so&aacute;t chất lượng nghi&ecirc;m ngặt bởi h&atilde;ng sản xuất Albert &ndash; Germany, với nh&agrave; m&aacute;y ch&iacute;nh tại Ba Lan đạt ti&ecirc;u chuẩn Ch&acirc;u &Acirc;u. M&aacute;y cung cấp chế độ h&uacute;t sữa tiện lợi v&agrave; trang bị c&ocirc;ng nghệ h&uacute;t &aacute;p suất kh&eacute;p k&iacute;n cho sữa được tiết ra điều đặn, dễ d&agrave;ng hơn. Do m&aacute;y được thiết kế đơn giản n&ecirc;n bạn chỉ cần &ldquo;ấn một n&uacute;t&rdquo; t&ugrave;y biến tăng giảm l&agrave; bạn c&oacute; thể sử dụng được ngay, kh&ocirc;ng cần c&agrave;i đặt phức tạp như c&aacute;c m&aacute;y kh&aacute;c. &ndash; M&aacute;y h&uacute;t sữa hoạt động bằng nguồn điện th&ocirc;ng qua Adapter v&agrave; pin rời (Pin dự ph&ograve;ng) n&ecirc;n tr&aacute;nh được t&igrave;nh trạng bị chảy pin hoặc ph&ugrave; nắp m&aacute;y.Nếu bạn l&agrave; một trong những mẹ kh&ocirc;ng quan t&acirc;m đến sữa c&ocirc;ng thức trong bữa ăn của b&eacute;, v&agrave; bạn muốn nu&ocirc;i con bằng sữa mẹ đơn thuần th&igrave; việc lựa chọn cho m&igrave;nh một chiếc m&aacute;y h&uacute;t sữa bằng điện l&agrave; điều rất cần thiết. C&aacute;c m&aacute;y h&uacute;t sữa Sanity lu&ocirc;n mang lại hiểu quả cao nhất, v&igrave; bạn sẽ kh&ocirc;ng cần phải sử dụng b&agrave;n tay của m&igrave;nh trong khi qu&aacute; tr&igrave;nh h&uacute;t sữa vẫn diễn ra. Về c&ocirc;ng nghệ: v&igrave; sao được đặt t&ecirc;n l&agrave; &ldquo;Intelligent Electric Breast Pump&rdquo;? Nghĩa l&agrave; &ldquo;M&aacute;y h&uacute;t sữa điện Th&ocirc;ng minh&rdquo; đ&oacute; l&agrave; c&ocirc;ng nghệ bơm &amp; tạo ch&acirc;n kh&ocirc;ng được m&ocirc; phỏng theo qu&aacute; tr&igrave;nh b&uacute; sữa mẹ tự nhi&ecirc;n của trẻ, c&ocirc;ng nghệ bơm v&agrave; lớp silicon gi&uacute;p hoạt động &ecirc;m &aacute;i nhất, kh&ocirc;ng g&acirc;y đau v&agrave; chiết xuất sữa tự nhi&ecirc;n.</p>\r\n', 'sua-morinaga-1-320g-2169328372300.jpg', 530000, 135, '18-04-2021', '09-06-2021', 3),
(31, 'abc', '<p>qưeqwe</p>\r\n', '<p>&aacute;dasd</p>\r\n', 'dinhduongbabau-10806897790400.jpg', 12345, 1, '16-06-2021', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `stars`
--

CREATE TABLE `stars` (
  `star_id` int(11) NOT NULL,
  `star_average` float NOT NULL,
  `star_temporary` float NOT NULL,
  `count` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stars`
--

INSERT INTO `stars` (`star_id`, `star_average`, `star_temporary`, `count`, `product_id`) VALUES
(15, 5, 5, 2, 1),
(16, 4, 8, 3, 1),
(17, 1, 1, 2, 2),
(18, 2.5, 5, 3, 2),
(19, 1, 1, 2, 3),
(20, 2.25, 4.5, 3, 3),
(21, 5, 5, 2, 13),
(22, 4, 8, 3, 13),
(23, 3, 9, 4, 1),
(24, 3.5, 14, 5, 1),
(25, 3, 15, 6, 1),
(26, 2.66667, 16, 7, 1),
(27, 2.35714, 16.5, 8, 1),
(28, 3, 9, 4, 13),
(29, 3.5, 14, 5, 13),
(30, 2.6875, 21.5, 9, 1),
(31, 2.94444, 26.5, 10, 1),
(32, 3.15, 31.5, 11, 1),
(33, 3.33333, 10, 4, 2),
(36, 2.95455, 32.5, 12, 1),
(37, 3.08333, 37, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `usergroup`
--

CREATE TABLE `usergroup` (
  `usergroup_id` int(1) NOT NULL,
  `usergroup_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usergroup`
--

INSERT INTO `usergroup` (`usergroup_id`, `usergroup_name`) VALUES
(1, 'admin'),
(2, 'expert'),
(3, 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `account_email` (`account_email`),
  ADD KEY `IDUserGroup` (`IDUserGroup`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `IDAccount` (`IDAccount`),
  ADD KEY `IDNews` (`IDListnews`);

--
-- Indexes for table `commentchildren`
--
ALTER TABLE `commentchildren`
  ADD PRIMARY KEY (`comment_children_id`),
  ADD KEY `IDComment` (`IDComment`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `IDAccount` (`IDAccount`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`faq_id`),
  ADD KEY `faq_userid` (`faq_userid`);

--
-- Indexes for table `favourite`
--
ALTER TABLE `favourite`
  ADD PRIMARY KEY (`favourite_id`),
  ADD KEY `listnews_id` (`listnews_id`),
  ADD KEY `IDAccount` (`IDAccount`);

--
-- Indexes for table `listnews`
--
ALTER TABLE `listnews`
  ADD PRIMARY KEY (`listnews_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`),
  ADD UNIQUE KEY `menu_name` (`menu_name`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `id_account` (`id_account`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `stars`
--
ALTER TABLE `stars`
  ADD PRIMARY KEY (`star_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `usergroup`
--
ALTER TABLE `usergroup`
  ADD PRIMARY KEY (`usergroup_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;

--
-- AUTO_INCREMENT for table `commentchildren`
--
ALTER TABLE `commentchildren`
  MODIFY `comment_children_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=395;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=614;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `faq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `favourite`
--
ALTER TABLE `favourite`
  MODIFY `favourite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `listnews`
--
ALTER TABLE `listnews`
  MODIFY `listnews_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `stars`
--
ALTER TABLE `stars`
  MODIFY `star_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `usergroup`
--
ALTER TABLE `usergroup`
  MODIFY `usergroup_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`IDUserGroup`) REFERENCES `usergroup` (`usergroup_id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`IDAccount`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`IDListnews`) REFERENCES `listnews` (`listnews_id`) ON DELETE CASCADE;

--
-- Constraints for table `commentchildren`
--
ALTER TABLE `commentchildren`
  ADD CONSTRAINT `commentchildren_ibfk_1` FOREIGN KEY (`IDComment`) REFERENCES `comment` (`comment_id`) ON DELETE CASCADE;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `IDAccount` FOREIGN KEY (`IDAccount`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `faq_ibfk_1` FOREIGN KEY (`faq_userid`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `favourite`
--
ALTER TABLE `favourite`
  ADD CONSTRAINT `favourite_ibfk_2` FOREIGN KEY (`IDAccount`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `favourite_ibfk_3` FOREIGN KEY (`listnews_id`) REFERENCES `listnews` (`listnews_id`) ON DELETE CASCADE;

--
-- Constraints for table `listnews`
--
ALTER TABLE `listnews`
  ADD CONSTRAINT `listnews_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`id_account`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `stars`
--
ALTER TABLE `stars`
  ADD CONSTRAINT `stars_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
