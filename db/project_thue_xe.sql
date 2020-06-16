/*
 Navicat Premium Data Transfer

 Source Server         : khanh
 Source Server Type    : MySQL
 Source Server Version : 100132
 Source Host           : localhost:3306
 Source Schema         : project_thue_xe

 Target Server Type    : MySQL
 Target Server Version : 100132
 File Encoding         : 65001

 Date: 24/07/2018 09:30:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_album
-- ----------------------------
DROP TABLE IF EXISTS `tb_album`;
CREATE TABLE `tb_album`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_anh` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `caption` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ngay_dang` date NOT NULL,
  `id_cong_ty` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_cong_ty`(`id_cong_ty`) USING BTREE,
  CONSTRAINT `tb_album_ibfk_1` FOREIGN KEY (`id_cong_ty`) REFERENCES `tb_cong_ty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_bai_viet
-- ----------------------------
DROP TABLE IF EXISTS `tb_bai_viet`;
CREATE TABLE `tb_bai_viet`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_bv` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `noi_dung` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hinh_anh` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ngay_dang` date NOT NULL,
  `trang_thai` int(11) NOT NULL DEFAULT 0,
  `luot_xem` int(11) NOT NULL DEFAULT 0,
  `id_nguoi_kiem_duyet` int(11) NULL DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_cong_ty` int(11) NOT NULL,
  `tom_tat` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_nguoi_kiem_duyet`(`id_nguoi_kiem_duyet`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  INDEX `id_cong_ty`(`id_cong_ty`) USING BTREE,
  CONSTRAINT `tb_bai_viet_ibfk_1` FOREIGN KEY (`id_nguoi_kiem_duyet`) REFERENCES `tb_user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_bai_viet_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_bai_viet_ibfk_3` FOREIGN KEY (`id_cong_ty`) REFERENCES `tb_cong_ty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_bai_viet
-- ----------------------------
INSERT INTO `tb_bai_viet` VALUES (1, 'Toyota gây thất vọng với Supra 2019', 'Từ những gì mà A90 thể hiện trong cuộc thi leo núi tại sự kiện Anh Quốc, có thể thấy dòng xe này có khả năng vận hành khá kém cỏi hoặc Toyota đã cố tình giấu bài để chờ ngày ra mắt Supra hoàn chỉnh (cuối năm nay hoặc đầu năm sau). Xe vào cua khá chậm và tốc độ cũng chưa thật sự ấn tượng so với những gì mà fan kỳ vọng. Dù vậy, động cơ 6 xy-lanh thẳng hàng vẫn cho ra những âm thanh ấn tượng thoát ra từ ống xả.', 'public\\assets\\img\\rollroyce1.jpg', '2018-07-08', 1, 20, 3, 3, 1, 'Từ những gì mà A90 thể hiện trong cuộc thi leo núi tại sự kiện Anh Quốc, có thể thấy dòng xe này có khả năng vận hành khá kém cỏi hoặc Toyota đã cố tình giấu bài để chờ ngày ra mắt Supra hoàn chỉnh (c');
INSERT INTO `tb_bai_viet` VALUES (2, 'Vì sao Mercedes-Benz An Du là đối tác hàng đầu của các khách sạn và khu nghỉ dưỡng 5 sao tại Việt Nam?', 'Mercedes-Benz An Du là đại lý phân phối dòng xe Mercedes-Benz tại Việt Nam với 23 năm kinh nghiệm. Sở hữu nhiều Showroom tại Hà Nội, Hải Phòng, Đà Nẵng… An Du được biết đến là nhà cung cấp dòng xe Đức với giá hợp lý, hậu mãi xuất sắc cùng chế độ bảo hành chu đáo.\r\n\r\nVừa qua, Mercedes-Benz An Du tiến hành 2 đợt giao xe cho khách hàng JW Marriott và resort 5 sao Laguna Lăng Cô. Số xe này góp thêm vào con số hơn 100 xe mỗi năm được bàn giao cho các khách sạn, khu nghỉ dưỡng hàng đầu cả nước. Không chỉ kinh doanh xe mới, công ty còn cung cấp dịch vụ cho thuê xe cao cấp ngắn và dài hạn. Điều này biến Mercedes-Benz An Du trở thành nhà phân phối hàng đầu trong thị trường xe đưa đón cao cấp cho khách sạn và khu nghỉ dưỡng 5 sao.', 'public\\assets\\img\\xe-1.jpg', '2018-07-23', 1, 50, 3, 3, 1, 'Từ những gì mà A90 thể hiện trong cuộc thi leo núi tại sự kiện Anh Quốc, có thể thấy dòng xe này có khả năng vận hành khá kém cỏi hoặc Toyota đã cố tình giấu bài để chờ ngày ra mắt Supra hoàn chỉnh (c');
INSERT INTO `tb_bai_viet` VALUES (3, 'Tin tức Cập nhật 07:33 AM, Thứ sáu Ngày 13, Tháng 7, 2018 A+ A A- Kiểu đọc sách\r\nBentley Mulsanne W.O Edition - Xe siêu sang mừng sinh nhật trăm tuổi', 'W.O Edition được Bentley phát triển để tỏ lòng tôn kính mẫu xe cá nhân mà nhà sáng lập thương hiệu Walter Owen Bentley từng sử dụng (cụm chữ cái W.O cũng lấy từ đây). Chỉ có đúng 100 chiếc Mulsanne W.O Edition được sản xuất bởi phân nhánh tùy biến xe của Bentley là Mulliner và sử dụng rất nhiều chi tiết độc đáo từng xuất hiện trên chiếc 1930 8 Litre Grand Tourer mà ông Bentley từng sử dụng.', 'public\\assets\\img\\xe-23.jpg', '2018-07-14', 1, 70, 3, 3, 1, 'Từ những gì mà A90 thể hiện trong cuộc thi leo núi tại sự kiện Anh Quốc, có thể thấy dòng xe này có khả năng vận hành khá kém cỏi hoặc Toyota đã cố tình giấu bài để chờ ngày ra mắt Supra hoàn chỉnh (c');
INSERT INTO `tb_bai_viet` VALUES (4, 'Bentley Mulsanne W.O Edition - Xe siêu sang mừng sinh nhật trăm tuổi', 'Phiên bản đặc biệt Mulsanne W.O Edition vừa được Bentley giới thiệu tại Festival tốc độ Goodwood để kỷ niệm sớm sinh nhật 100 năm thương hiệu.', 'public\\assets\\img\\xe-28.jpg', '2018-07-08', 1, 80, 3, 3, 1, 'Từ những gì mà A90 thể hiện trong cuộc thi leo núi tại sự kiện Anh Quốc, có thể thấy dòng xe này có khả năng vận hành khá kém cỏi hoặc Toyota đã cố tình giấu bài để chờ ngày ra mắt Supra hoàn chỉnh (c');
INSERT INTO `tb_bai_viet` VALUES (5, 'Ra mắt Range Rover Sport 2019 - Bình cũ rượu mới', 'Thế hệ Range Rover Sport thứ 2 đã trình làng được 4 năm và trong bối cảnh phân khúc SUV hạng sang cỡ trung đang ngày một chật chội, Land Rover cần làm gì đó để cải thiện tính cạnh tranh của con bài chiến thuật của mình.', 'public\\assets\\img\\xe-29.jpg', '2018-06-12', 0, 90, 3, 3, 1, 'Từ những gì mà A90 thể hiện trong cuộc thi leo núi tại sự kiện Anh Quốc, có thể thấy dòng xe này có khả năng vận hành khá kém cỏi hoặc Toyota đã cố tình giấu bài để chờ ngày ra mắt Supra hoàn chỉnh (c');
INSERT INTO `tb_bai_viet` VALUES (6, 'Chạy 2 năm hơn 3 vạn km, Toyota Prado TXL vẫn bán được giá trên 2 tỷ đồng', 'So với thời điểm mua mới, chiếc Toyota Land Cruiser Prado này chỉ lỗ khoảng 200 triệu đồng và phần chi phí lăn bánh.', 'public\\assets\\img\\xe-30.jpg', '0000-00-00', 0, 50, 3, 3, 7, 'Từ những gì mà A90 thể hiện trong cuộc thi leo núi tại sự kiện Anh Quốc, có thể thấy dòng xe này có khả năng vận hành khá kém cỏi hoặc Toyota đã cố tình giấu bài để chờ ngày ra mắt Supra hoàn chỉnh (c');
INSERT INTO `tb_bai_viet` VALUES (7, 'Toyota Camry 2019 bắt đầu chạy thử tại Thái Lan', 'Với việc Toyota Camry thế hệ thứ 8 đang dần được thương hiệu Nhật mang đến nhiều thị trường hơn, chỉ còn là vấn đề thời gian trước khi dòng sedan bán chạy hàng đầu này xuất hiện tại Đông Nam Á.', 'public\\assets\\img\\xe-31.jpg', '0000-00-00', 0, 25, 3, 3, 9, 'Từ những gì mà A90 thể hiện trong cuộc thi leo núi tại sự kiện Anh Quốc, có thể thấy dòng xe này có khả năng vận hành khá kém cỏi hoặc Toyota đã cố tình giấu bài để chờ ngày ra mắt Supra hoàn chỉnh (c');
INSERT INTO `tb_bai_viet` VALUES (8, 'Tạm biệt Tata Nano - Mẫu ô tô rẻ nhất thế giới', 'Dòng xe giá rẻ của tập đoàn Ấn Độ Tata Motors đã bị ngưng sản xuất.\r\n\r\nDòng xe giá rẻ của tập đoàn Ấn Độ Tata Motors đã bị ngưng sản xuất.\r\n\r\nDòng xe giá rẻ của tập đoàn Ấn Độ Tata Motors đã bị ngưng sản xuất.\r\n\r\n', 'public\\assets\\img\\xe-31.jpg', '0000-00-00', 0, 30, 3, 3, 1, 'Từ những gì mà A90 thể hiện trong cuộc thi leo núi tại sự kiện Anh Quốc, có thể thấy dòng xe này có khả năng vận hành khá kém cỏi hoặc Toyota đã cố tình giấu bài để chờ ngày ra mắt Supra hoàn chỉnh (c');
INSERT INTO `tb_bai_viet` VALUES (9, 'Dừng xe ở bên đường, đại gia bị trộm đập kính xe lấy trộm gần 3 tỷ đồng', 'Vừa rút tiền từ 2 ngân hàng, vị đại gia bỏ tiền trên xe rồi đi tới 1 công ty thì bị trộm đập kính xe lấy đi gần 3 tỷ đồng.', 'public\\assets\\img\\xe-33.jpg', '0000-00-00', 0, 0, 7, 7, 3, 'Từ những gì mà A90 thể hiện trong cuộc thi leo núi tại sự kiện Anh Quốc, có thể thấy dòng xe này có khả năng vận hành khá kém cỏi hoặc Toyota đã cố tình giấu bài để chờ ngày ra mắt Supra hoàn chỉnh (c');
INSERT INTO `tb_bai_viet` VALUES (10, 'Lộ thêm nhiều ảnh chi tiết Cayenne Coupe - SUV đỉnh cao nhất của Porsche', 'Chiếc SUV mới nhất và dự kiến cao cấp nhất của Porsche được phát hiện đang nghỉ chân tại một trạm xăng ở Đức.', 'public\\assets\\img\\xe-29.jpg', '0000-00-00', 0, 0, 7, 7, 9, 'Từ những gì mà A90 thể hiện trong cuộc thi leo núi tại sự kiện Anh Quốc, có thể thấy dòng xe này có khả năng vận hành khá kém cỏi hoặc Toyota đã cố tình giấu bài để chờ ngày ra mắt Supra hoàn chỉnh (c');

-- ----------------------------
-- Table structure for tb_banner_cong_ty
-- ----------------------------
DROP TABLE IF EXISTS `tb_banner_cong_ty`;
CREATE TABLE `tb_banner_cong_ty`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_banner` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `trang_thai` int(11) NOT NULL DEFAULT 0,
  `id_cong_ty` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `link_banner_small` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_cong_ty`(`id_cong_ty`) USING BTREE,
  CONSTRAINT `tb_banner_cong_ty_ibfk_1` FOREIGN KEY (`id_cong_ty`) REFERENCES `tb_cong_ty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_banner_index
-- ----------------------------
DROP TABLE IF EXISTS `tb_banner_index`;
CREATE TABLE `tb_banner_index`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_banner` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `link_banner_small` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `trang_thai` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_banner_index
-- ----------------------------
INSERT INTO `tb_banner_index` VALUES (1, 'public\\data1\\images\\banner-index\\banner1.jpg', 'public\\data1\\tooltips\\tooltip-index\\banner1.jpg', 1, 'Nhiều mẫu xe mới');
INSERT INTO `tb_banner_index` VALUES (2, 'public\\data1\\images\\banner-index\\banner2.jpg', 'public\\data1\\tooltips\\tooltip-index\\banner2.jpg', 1, 'Chất lượng dịch vụ tốt');
INSERT INTO `tb_banner_index` VALUES (3, 'public\\data1\\images\\banner-index\\banner3.jpg', 'public\\data1\\tooltips\\tooltip-index\\banner3.jpg', 1, 'Khách hàng là thượng đế');
INSERT INTO `tb_banner_index` VALUES (4, 'public\\data1\\images\\banner-index\\banner4.jpg', 'public\\data1\\tooltips\\tooltip-index\\banner4.jpg', 1, 'Thân thiện với môi trường');

-- ----------------------------
-- Table structure for tb_binh_luan_cong_ty
-- ----------------------------
DROP TABLE IF EXISTS `tb_binh_luan_cong_ty`;
CREATE TABLE `tb_binh_luan_cong_ty`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noi_dung` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ngay_gio_binh_luan` datetime NOT NULL,
  `chuc_vu` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `id_cong_ty` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_cong_ty`(`id_cong_ty`) USING BTREE,
  INDEX `tb_binh_luan_cong_ty_ibfk_2`(`id_user`) USING BTREE,
  CONSTRAINT `tb_binh_luan_cong_ty_ibfk_1` FOREIGN KEY (`id_cong_ty`) REFERENCES `tb_cong_ty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_binh_luan_cong_ty_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_binh_luan_cong_ty
-- ----------------------------
INSERT INTO `tb_binh_luan_cong_ty` VALUES (0, 'hai huoc\n', '2018-07-18 20:20:37', NULL, 1, 1);
INSERT INTO `tb_binh_luan_cong_ty` VALUES (1, 'Xe đẹp quá', '2018-07-14 19:55:07', NULL, 1, 4);
INSERT INTO `tb_binh_luan_cong_ty` VALUES (2, 'Cảm ơn công ty mình đã thuê được xe', '2018-07-02 20:07:24', NULL, 1, 1);
INSERT INTO `tb_binh_luan_cong_ty` VALUES (3, 'Mình đang cần tìm xe với mức giá < 2.000.000đ', '2018-07-05 20:09:00', NULL, 1, 2);
INSERT INTO `tb_binh_luan_cong_ty` VALUES (5, 'Cho mình hỏi xe RollRoyce có màu đỏ không vậy?', '2018-07-01 20:09:26', NULL, 2, 8);
INSERT INTO `tb_binh_luan_cong_ty` VALUES (135, 'có bạn ơi', '2018-07-18 21:10:20', NULL, 2, 1);
INSERT INTO `tb_binh_luan_cong_ty` VALUES (136, 'công ty này tốt nè', '2018-07-18 21:14:39', NULL, 1, 1);
INSERT INTO `tb_binh_luan_cong_ty` VALUES (137, 'nhin t comment ne', '2018-07-19 17:00:44', NULL, 1, 2);
INSERT INTO `tb_binh_luan_cong_ty` VALUES (138, 'comment 2\n', '2018-07-19 17:07:17', NULL, 1, 2);
INSERT INTO `tb_binh_luan_cong_ty` VALUES (139, '3', '2018-07-19 17:08:12', NULL, 1, 2);
INSERT INTO `tb_binh_luan_cong_ty` VALUES (140, '4', '2018-07-19 17:09:26', NULL, 1, 2);
INSERT INTO `tb_binh_luan_cong_ty` VALUES (141, '5', '2018-07-19 17:12:26', NULL, 1, 2);
INSERT INTO `tb_binh_luan_cong_ty` VALUES (142, '6', '2018-07-19 17:16:16', NULL, 1, 2);
INSERT INTO `tb_binh_luan_cong_ty` VALUES (143, 'huhu', '2018-07-20 18:08:18', NULL, 1, 2);
INSERT INTO `tb_binh_luan_cong_ty` VALUES (144, '12', '2018-07-21 20:39:32', NULL, 1, 1);
INSERT INTO `tb_binh_luan_cong_ty` VALUES (145, '123123', '2018-07-21 20:41:56', NULL, 1, 1);

-- ----------------------------
-- Table structure for tb_binh_luan_xe
-- ----------------------------
DROP TABLE IF EXISTS `tb_binh_luan_xe`;
CREATE TABLE `tb_binh_luan_xe`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noi_dung` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ngay_gio_binh_luan` datetime NOT NULL,
  `id_xe` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_xe`(`id_xe`) USING BTREE,
  INDEX `tb_binh_luan_xe_ibfk_2`(`id_user`) USING BTREE,
  CONSTRAINT `tb_binh_luan_xe_ibfk_1` FOREIGN KEY (`id_xe`) REFERENCES `tb_xe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_binh_luan_xe_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_binh_luan_xe
-- ----------------------------
INSERT INTO `tb_binh_luan_xe` VALUES (1, 'Giá thuê hợp lí', '2018-07-13 10:19:00', 1, 5);
INSERT INTO `tb_binh_luan_xe` VALUES (2, 'Giá cả thương lượng được không:))', '2018-07-04 10:19:53', 2, 4);
INSERT INTO `tb_binh_luan_xe` VALUES (3, 'Xe chạy rất  tốt, công ty rất uy tín', '2018-07-10 23:21:13', 3, 6);
INSERT INTO `tb_binh_luan_xe` VALUES (4, 'thương lượn giá trên hợp đồng được không', '2018-07-04 10:22:05', 4, 5);
INSERT INTO `tb_binh_luan_xe` VALUES (6, 'thương lượn giá trên hợp đồng được không', '0000-00-00 00:00:00', 20, 5);
INSERT INTO `tb_binh_luan_xe` VALUES (7, 'công ty này rất uy tín nha các bạn', '0000-00-00 00:00:00', 46, 6);
INSERT INTO `tb_binh_luan_xe` VALUES (8, 'thương lượn giá trên hợp đồng được không', '0000-00-00 00:00:00', 27, 5);
INSERT INTO `tb_binh_luan_xe` VALUES (9, 'Giá cả thương lượng được không:))', '0000-00-00 00:00:00', 17, 4);
INSERT INTO `tb_binh_luan_xe` VALUES (11, 'ngon', '2018-07-21 20:57:02', 1, 1);
INSERT INTO `tb_binh_luan_xe` VALUES (12, 'ê', '2018-07-21 20:57:15', 1, 1);
INSERT INTO `tb_binh_luan_xe` VALUES (13, '123', '2018-07-21 21:05:17', 1, 1);
INSERT INTO `tb_binh_luan_xe` VALUES (14, 'bình luận 1', '2018-07-22 17:16:09', 71, 1);
INSERT INTO `tb_binh_luan_xe` VALUES (15, 'bình luận 2', '2018-07-22 17:19:34', 71, 1);
INSERT INTO `tb_binh_luan_xe` VALUES (16, 'bình luận 3', '2018-07-22 17:20:31', 71, 1);
INSERT INTO `tb_binh_luan_xe` VALUES (17, 'dep', '2018-07-23 15:28:59', 23, 2);
INSERT INTO `tb_binh_luan_xe` VALUES (18, 'dep', '2018-07-23 15:28:59', 23, 2);
INSERT INTO `tb_binh_luan_xe` VALUES (19, 'dep', '2018-07-23 15:28:59', 23, 2);
INSERT INTO `tb_binh_luan_xe` VALUES (20, 'dep', '2018-07-23 15:28:59', 23, 2);
INSERT INTO `tb_binh_luan_xe` VALUES (21, 'dep', '2018-07-23 15:28:59', 23, 2);
INSERT INTO `tb_binh_luan_xe` VALUES (22, 'xau', '2018-07-23 15:29:38', 23, 2);

-- ----------------------------
-- Table structure for tb_chuc_nang
-- ----------------------------
DROP TABLE IF EXISTS `tb_chuc_nang`;
CREATE TABLE `tb_chuc_nang`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_chuc_nang` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `link_chuc_nang` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_cong_ty
-- ----------------------------
DROP TABLE IF EXISTS `tb_cong_ty`;
CREATE TABLE `tb_cong_ty`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_cong_ty` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ten_dai_dien` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sdt_nguoi_dai_dien` char(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sdt_cong_ty` char(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `logo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `so_lan_giao_dich_thanh_cong` int(11) NOT NULL DEFAULT 0,
  `gioi_thieu` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `id_tai_khoan` int(11) NOT NULL,
  `id_phuong` int(11) NOT NULL,
  `id_quan` int(11) NOT NULL,
  `id_tinh` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  INDEX `id_tai_khoan`(`id_tai_khoan`) USING BTREE,
  INDEX `id_phuong`(`id_phuong`) USING BTREE,
  INDEX `id_quan`(`id_quan`) USING BTREE,
  INDEX `id_tinh`(`id_tinh`) USING BTREE,
  CONSTRAINT `tb_cong_ty_ibfk_1` FOREIGN KEY (`id_tai_khoan`) REFERENCES `tb_user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_cong_ty_ibfk_2` FOREIGN KEY (`id_phuong`) REFERENCES `tb_phuong` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_cong_ty_ibfk_3` FOREIGN KEY (`id_quan`) REFERENCES `tb_quan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_cong_ty_ibfk_4` FOREIGN KEY (`id_tinh`) REFERENCES `tb_tinh` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_cong_ty
-- ----------------------------
INSERT INTO `tb_cong_ty` VALUES (1, 'Công ty A', 'Nguyễn Văn A', '0123456786', '13245676', 'congtyA@gmail.com', 'public\\assets\\img\\logo\\logo.png', 100, 'Công ty ô tô Toyota Việt Nam (TMV) được thành lập vào tháng 9 năm 1995, là liên doanh với số vốn đầu tư ban đầu là 89,6 triệu USD từ Tập đoàn Toyota Nhật Bản (70%), Tổng công ty Máy Động Lực và Máy Nông Nghiệp - VEAM (20%) và Công ty TNHH KUO Singapore (10%).', 1, 1, 1, 1);
INSERT INTO `tb_cong_ty` VALUES (2, 'Công ty Điện máy anh dũng', 'Nguyễn Công Dũng', '01676594189', '092938181', 'dienmayanhdung@gmail.com', '/../project-xe/public/assets/img/logo/1f11464b8c52be12a3d3b5ae1f220112.png', 90, 'Công ty ô tô Toyota Việt Nam (TMV) được thành lập vào tháng 9 năm 1995, là liên doanh với số vốn đầu tư ban đầu là 89,6 triệu USD từ Tập đoàn Toyota Nhật Bản (70%), Tổng công ty Máy Động Lực và Máy Nông Nghiệp - VEAM (20%) và Công ty TNHH KUO Singapore (10%).', 2, 1, 1, 1);
INSERT INTO `tb_cong_ty` VALUES (3, 'Công ty thuê xe anh nam', 'Nguyễn Quốc Nam', '01676594289', '09126668888', 'thuexeanam@gmail.com', 'public\\assets\\img\\logo\\logo3.png', 80, 'Công ty ô tô Toyota Việt Nam (TMV) được thành lập vào tháng 9 năm 1995, là liên doanh với số vốn đầu tư ban đầu là 89,6 triệu USD từ Tập đoàn Toyota Nhật Bản (70%), Tổng công ty Máy Động Lực và Máy Nông Nghiệp - VEAM (20%) và Công ty TNHH KUO Singapore (10%).', 9, 1, 1, 1);
INSERT INTO `tb_cong_ty` VALUES (4, 'Công ty xe cao cấp A', 'Nguyễn Việt Hùng', '01676594289', '019283847368', 'xecaocap@gmail.com', 'public\\assets\\img\\logo\\logo4.png', 70, 'Công ty ô tô Toyota Việt Nam (TMV) được thành lập vào tháng 9 năm 1995, là liên doanh với số vốn đầu tư ban đầu là 89,6 triệu USD từ Tập đoàn Toyota Nhật Bản (70%), Tổng công ty Máy Động Lực và Máy Nông Nghiệp - VEAM (20%) và Công ty TNHH KUO Singapore (10%).', 10, 1, 1, 1);
INSERT INTO `tb_cong_ty` VALUES (6, 'Công ty đám cưới Công Vinh', 'Đặng Công Vinh', '01676594289', '09126668888', 'damcuoicongvinh@gmail.com', 'public\\assets\\img\\logo\\logo2.png', 0, 'Công ty ô tô Toyota Việt Nam (TMV) được thành lập vào tháng 9 năm 1995, là liên doanh với số vốn đầu tư ban đầu là 89,6 triệu USD từ Tập đoàn Toyota Nhật Bản (70%), Tổng công ty Máy Động Lực và Máy Nông Nghiệp - VEAM (20%) và Công ty TNHH KUO Singapore (10%).', 9, 3, 1, 1);
INSERT INTO `tb_cong_ty` VALUES (7, 'Công ty TNHH Quốc Nam', 'Nguyễn Quốc Nam', '01676594289', '09126668888', 'quocnam@gmail.com', 'public\\assets\\img\\logo\\logo2.png', 0, 'Công ty ô tô Toyota Việt Nam (TMV) được thành lập vào tháng 9 năm 1995, là liên doanh với số vốn đầu tư ban đầu là 89,6 triệu USD từ Tập đoàn Toyota Nhật Bản (70%), Tổng công ty Máy Động Lực và Máy Nông Nghiệp - VEAM (20%) và Công ty TNHH KUO Singapore (10%).', 10, 4, 1, 1);
INSERT INTO `tb_cong_ty` VALUES (8, 'Công ty du lịch anh Khánh', 'Nguyễn Trọng Khánh', '01676594289', '09126668888', 'anhkhanh@gmial.com', 'public\\assets\\img\\logo\\logo2.png', 0, 'Công ty ô tô Toyota Việt Nam (TMV) được thành lập vào tháng 9 năm 1995, là liên doanh với số vốn đầu tư ban đầu là 89,6 triệu USD từ Tập đoàn Toyota Nhật Bản (70%), Tổng công ty Máy Động Lực và Máy Nông Nghiệp - VEAM (20%) và Công ty TNHH KUO Singapore (10%).', 9, 5, 1, 1);
INSERT INTO `tb_cong_ty` VALUES (9, 'Công ty Điện máy anh dũng', 'Nguyễn Công Dũng', '01676594189', '092938181', 'anhbin@gmail.com', '/../project-xe/public/assets/img/logo/1f11464b8c52be12a3d3b5ae1f220112.png', 0, 'Công ty ô tô Toyota Việt Nam (TMV) được thành lập vào tháng 9 năm 1995, là liên doanh với số vốn đầu tư ban đầu là 89,6 triệu USD từ Tập đoàn Toyota Nhật Bản (70%), Tổng công ty Máy Động Lực và Máy Nông Nghiệp - VEAM (20%) và Công ty TNHH KUO Singapore (10%).', 2, 4, 1, 1);
INSERT INTO `tb_cong_ty` VALUES (10, 'Công ty xe Bình Phước', 'Nguyễn Hồng Quân', '01676594289', '09126668888', 'anhquan@gmail.com', 'public\\assets\\img\\logo\\logo2.png', 0, 'Công ty ô tô Toyota Việt Nam (TMV) được thành lập vào tháng 9 năm 1995, là liên doanh với số vốn đầu tư ban đầu là 89,6 triệu USD từ Tập đoàn Toyota Nhật Bản (70%), Tổng công ty Máy Động Lực và Máy Nông Nghiệp - VEAM (20%) và Công ty TNHH KUO Singapore (10%).', 9, 1, 1, 1);

-- ----------------------------
-- Table structure for tb_gallery
-- ----------------------------
DROP TABLE IF EXISTS `tb_gallery`;
CREATE TABLE `tb_gallery`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_anh` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_xe` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_xe`(`id_xe`) USING BTREE,
  CONSTRAINT `tb_gallery_ibfk_1` FOREIGN KEY (`id_xe`) REFERENCES `tb_xe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_gallery
-- ----------------------------
INSERT INTO `tb_gallery` VALUES (1, 'public\\assets\\img\\xe-1.jpg', 1);
INSERT INTO `tb_gallery` VALUES (2, 'public\\assets\\img\\xe-2.jpg', 1);
INSERT INTO `tb_gallery` VALUES (3, 'public\\assets\\img\\xe-3.jpg', 1);
INSERT INTO `tb_gallery` VALUES (4, 'public\\assets\\img\\xe-30.jpg', 1);
INSERT INTO `tb_gallery` VALUES (5, 'public\\assets\\img\\xe-5.jpg', 1);
INSERT INTO `tb_gallery` VALUES (6, 'public\\assets\\img\\xe-6.jpg', 2);
INSERT INTO `tb_gallery` VALUES (7, 'public\\assets\\img\\xe-7.jpg', 2);
INSERT INTO `tb_gallery` VALUES (8, 'public\\assets\\img\\xe-8.jpg', 2);
INSERT INTO `tb_gallery` VALUES (9, 'public\\assets\\img\\xe-9.jpg', 2);

-- ----------------------------
-- Table structure for tb_lien_he_thue_xe
-- ----------------------------
DROP TABLE IF EXISTS `tb_lien_he_thue_xe`;
CREATE TABLE `tb_lien_he_thue_xe`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ngay_gui` date NOT NULL,
  `noi_dung` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `trang_thai` int(11) NOT NULL DEFAULT 0,
  `id_cong_ty` int(11) NOT NULL,
  `id_xe` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_cong_ty`(`id_cong_ty`) USING BTREE,
  INDEX `id_xe`(`id_xe`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  CONSTRAINT `tb_lien_he_thue_xe_ibfk_1` FOREIGN KEY (`id_cong_ty`) REFERENCES `tb_cong_ty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_lien_he_thue_xe_ibfk_2` FOREIGN KEY (`id_xe`) REFERENCES `tb_xe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_lien_he_thue_xe_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_lien_he_thue_xe
-- ----------------------------
INSERT INTO `tb_lien_he_thue_xe` VALUES (4, '2018-07-14', 'Thuê xe 3', 1, 2, 1, 3);
INSERT INTO `tb_lien_he_thue_xe` VALUES (5, '2018-07-02', 'Toi muon thue xe nay', 1, 2, 4, 7);
INSERT INTO `tb_lien_he_thue_xe` VALUES (6, '2018-07-21', 'toi muon thue xe nay', 1, 1, 2, 1);
INSERT INTO `tb_lien_he_thue_xe` VALUES (7, '2018-07-21', '', 1, 1, 6, 1);

-- ----------------------------
-- Table structure for tb_nha_san_xuat
-- ----------------------------
DROP TABLE IF EXISTS `tb_nha_san_xuat`;
CREATE TABLE `tb_nha_san_xuat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_nsx` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_nha_san_xuat
-- ----------------------------
INSERT INTO `tb_nha_san_xuat` VALUES (1, 'Roll Royce');
INSERT INTO `tb_nha_san_xuat` VALUES (2, 'Mercedez');
INSERT INTO `tb_nha_san_xuat` VALUES (3, 'Toyota');
INSERT INTO `tb_nha_san_xuat` VALUES (4, 'Abarth');
INSERT INTO `tb_nha_san_xuat` VALUES (5, 'Alfa Romeo');
INSERT INTO `tb_nha_san_xuat` VALUES (6, 'Aston Martin');
INSERT INTO `tb_nha_san_xuat` VALUES (7, 'Audi');
INSERT INTO `tb_nha_san_xuat` VALUES (8, 'Bentley');
INSERT INTO `tb_nha_san_xuat` VALUES (9, 'BMW');
INSERT INTO `tb_nha_san_xuat` VALUES (10, 'Bugatti ');
INSERT INTO `tb_nha_san_xuat` VALUES (11, 'Cadillac');
INSERT INTO `tb_nha_san_xuat` VALUES (12, 'Caterham');
INSERT INTO `tb_nha_san_xuat` VALUES (13, 'Chevrolet');
INSERT INTO `tb_nha_san_xuat` VALUES (14, 'Chrysler');
INSERT INTO `tb_nha_san_xuat` VALUES (15, 'Citroen');
INSERT INTO `tb_nha_san_xuat` VALUES (16, 'Dacia');
INSERT INTO `tb_nha_san_xuat` VALUES (17, 'Ferrari');
INSERT INTO `tb_nha_san_xuat` VALUES (18, 'Fiat');
INSERT INTO `tb_nha_san_xuat` VALUES (19, 'Ford');
INSERT INTO `tb_nha_san_xuat` VALUES (20, 'Honda');
INSERT INTO `tb_nha_san_xuat` VALUES (21, 'Hyundai');
INSERT INTO `tb_nha_san_xuat` VALUES (22, 'Infiniti');
INSERT INTO `tb_nha_san_xuat` VALUES (23, 'Jaguar');
INSERT INTO `tb_nha_san_xuat` VALUES (24, 'Jeep');
INSERT INTO `tb_nha_san_xuat` VALUES (25, 'Kia ');
INSERT INTO `tb_nha_san_xuat` VALUES (26, 'Lamborghini');
INSERT INTO `tb_nha_san_xuat` VALUES (27, 'Land Rover');
INSERT INTO `tb_nha_san_xuat` VALUES (28, 'Lexus');
INSERT INTO `tb_nha_san_xuat` VALUES (29, 'Lotus');
INSERT INTO `tb_nha_san_xuat` VALUES (30, 'Maserati');
INSERT INTO `tb_nha_san_xuat` VALUES (31, 'Mazda');
INSERT INTO `tb_nha_san_xuat` VALUES (32, 'Mclaren');
INSERT INTO `tb_nha_san_xuat` VALUES (33, 'Mercedes-Benz');
INSERT INTO `tb_nha_san_xuat` VALUES (34, 'MG');
INSERT INTO `tb_nha_san_xuat` VALUES (35, 'Mini');
INSERT INTO `tb_nha_san_xuat` VALUES (36, 'Mitsubishi');
INSERT INTO `tb_nha_san_xuat` VALUES (37, 'Morgan');
INSERT INTO `tb_nha_san_xuat` VALUES (38, 'Nissan');
INSERT INTO `tb_nha_san_xuat` VALUES (39, 'Noble');
INSERT INTO `tb_nha_san_xuat` VALUES (40, 'Pagani');
INSERT INTO `tb_nha_san_xuat` VALUES (41, 'Peugeot');
INSERT INTO `tb_nha_san_xuat` VALUES (42, 'Porsche');
INSERT INTO `tb_nha_san_xuat` VALUES (43, 'Radical');
INSERT INTO `tb_nha_san_xuat` VALUES (44, 'Renault');
INSERT INTO `tb_nha_san_xuat` VALUES (45, 'Rolls-Royce');
INSERT INTO `tb_nha_san_xuat` VALUES (46, 'Saab');
INSERT INTO `tb_nha_san_xuat` VALUES (47, 'Seat');
INSERT INTO `tb_nha_san_xuat` VALUES (48, 'Skoda');
INSERT INTO `tb_nha_san_xuat` VALUES (49, 'Smart');
INSERT INTO `tb_nha_san_xuat` VALUES (50, 'SsangYong');
INSERT INTO `tb_nha_san_xuat` VALUES (51, 'Subaru');
INSERT INTO `tb_nha_san_xuat` VALUES (52, 'Suzuki');
INSERT INTO `tb_nha_san_xuat` VALUES (53, 'Tesla');
INSERT INTO `tb_nha_san_xuat` VALUES (54, 'Toyota');
INSERT INTO `tb_nha_san_xuat` VALUES (55, 'Vauxhall');
INSERT INTO `tb_nha_san_xuat` VALUES (56, 'Volkswagen');
INSERT INTO `tb_nha_san_xuat` VALUES (57, 'Volvo ');
INSERT INTO `tb_nha_san_xuat` VALUES (58, 'Zenos');

-- ----------------------------
-- Table structure for tb_nhom_tai_khoan
-- ----------------------------
DROP TABLE IF EXISTS `tb_nhom_tai_khoan`;
CREATE TABLE `tb_nhom_tai_khoan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_nhom` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_nhom_tai_khoan
-- ----------------------------
INSERT INTO `tb_nhom_tai_khoan` VALUES (1, 'Admin');
INSERT INTO `tb_nhom_tai_khoan` VALUES (2, 'Công ty');
INSERT INTO `tb_nhom_tai_khoan` VALUES (3, 'Người kiểm duyệt');
INSERT INTO `tb_nhom_tai_khoan` VALUES (4, 'Khách hàng');

-- ----------------------------
-- Table structure for tb_phan_quyen
-- ----------------------------
DROP TABLE IF EXISTS `tb_phan_quyen`;
CREATE TABLE `tb_phan_quyen`  (
  `id_ntk` int(11) NOT NULL,
  `id_chuc_nang` int(11) NOT NULL,
  `trang_thai` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_ntk`, `id_chuc_nang`) USING BTREE,
  INDEX `id_chuc_nang`(`id_chuc_nang`) USING BTREE,
  CONSTRAINT `tb_phan_quyen_ibfk_1` FOREIGN KEY (`id_ntk`) REFERENCES `tb_nhom_tai_khoan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_phan_quyen_ibfk_2` FOREIGN KEY (`id_chuc_nang`) REFERENCES `tb_chuc_nang` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_phuong
-- ----------------------------
DROP TABLE IF EXISTS `tb_phuong`;
CREATE TABLE `tb_phuong`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_phuong` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_quan` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_phuong
-- ----------------------------
INSERT INTO `tb_phuong` VALUES (1, 'Phường Nhật Tân', 1);
INSERT INTO `tb_phuong` VALUES (2, 'Phường Phú Thượng', 1);
INSERT INTO `tb_phuong` VALUES (3, 'Phường Quảng An', 1);
INSERT INTO `tb_phuong` VALUES (4, 'Phường Tứ Liên', 1);
INSERT INTO `tb_phuong` VALUES (5, 'Phường Xuân La', 1);
INSERT INTO `tb_phuong` VALUES (6, 'Phường Yên Phụ', 1);
INSERT INTO `tb_phuong` VALUES (7, 'Phường Bưởi', 1);
INSERT INTO `tb_phuong` VALUES (8, 'Phường Thụy Khuê', 1);
INSERT INTO `tb_phuong` VALUES (9, 'Phường Phúc Xá', 2);
INSERT INTO `tb_phuong` VALUES (10, 'Phường Trúc Bạch', 2);
INSERT INTO `tb_phuong` VALUES (11, 'Phường Vĩnh Phúc', 2);
INSERT INTO `tb_phuong` VALUES (12, 'Phường Cống Vị', 2);
INSERT INTO `tb_phuong` VALUES (13, 'Phường Liễu Giai', 2);
INSERT INTO `tb_phuong` VALUES (14, 'Phường Nguyễn Trung Trực', 2);
INSERT INTO `tb_phuong` VALUES (15, 'Phường Quán Thánh', 2);
INSERT INTO `tb_phuong` VALUES (16, 'Phường Ngọc Hà', 2);
INSERT INTO `tb_phuong` VALUES (17, 'Phường Điện Biên', 2);
INSERT INTO `tb_phuong` VALUES (18, 'Phường Đội Cấn', 2);
INSERT INTO `tb_phuong` VALUES (19, 'Phường Ngọc Khánh', 2);
INSERT INTO `tb_phuong` VALUES (20, 'Phường Kim Mã', 2);
INSERT INTO `tb_phuong` VALUES (21, 'Phường Giảng Võ', 2);
INSERT INTO `tb_phuong` VALUES (22, 'Phường Thành Công', 2);
INSERT INTO `tb_phuong` VALUES (23, 'Phường Nghĩa Đô', 3);
INSERT INTO `tb_phuong` VALUES (24, 'Phường Nghĩa Tân', 3);
INSERT INTO `tb_phuong` VALUES (25, 'Phường Mai Dịch', 3);
INSERT INTO `tb_phuong` VALUES (26, 'Phường Dịch Vọng', 3);
INSERT INTO `tb_phuong` VALUES (27, 'Phường Dịch Vọng Hậu', 3);
INSERT INTO `tb_phuong` VALUES (28, 'Phường Quan Hoa', 3);
INSERT INTO `tb_phuong` VALUES (29, 'Phường Yên Hoà', 3);
INSERT INTO `tb_phuong` VALUES (30, 'Phường Trung Hoà', 3);
INSERT INTO `tb_phuong` VALUES (32, 'Phường Phúc Tân', 4);
INSERT INTO `tb_phuong` VALUES (33, 'Phường Đồng Xuân', 4);
INSERT INTO `tb_phuong` VALUES (34, 'Phường Hàng Mã', 4);
INSERT INTO `tb_phuong` VALUES (35, 'Phường Hàng Buồm', 4);
INSERT INTO `tb_phuong` VALUES (36, 'Phường Hàng Đào', 4);
INSERT INTO `tb_phuong` VALUES (37, 'Phường Hàng Bồ', 4);
INSERT INTO `tb_phuong` VALUES (38, 'Phường Cửa Đông', 4);
INSERT INTO `tb_phuong` VALUES (39, 'Phường Lý Thái Tổ', 4);
INSERT INTO `tb_phuong` VALUES (40, 'Phường Hàng Bạc', 4);
INSERT INTO `tb_phuong` VALUES (41, 'Phường Hàng Gai', 4);
INSERT INTO `tb_phuong` VALUES (42, 'Phường Chương Dương Độ', 4);
INSERT INTO `tb_phuong` VALUES (43, 'Phường Hàng Trống', 4);
INSERT INTO `tb_phuong` VALUES (44, 'Phường Cửa Nam', 4);
INSERT INTO `tb_phuong` VALUES (45, 'Phường Hàng Bông', 4);
INSERT INTO `tb_phuong` VALUES (46, 'Phường Tràng Tiền', 4);
INSERT INTO `tb_phuong` VALUES (47, 'Phường Trần Hưng Đạo', 4);
INSERT INTO `tb_phuong` VALUES (48, 'Phường Phan Chu Trinh', 4);
INSERT INTO `tb_phuong` VALUES (49, 'Phường Hàng Bài', 4);
INSERT INTO `tb_phuong` VALUES (50, 'Phường Nguyễn Du', 5);
INSERT INTO `tb_phuong` VALUES (51, 'Phường Bạch Đằng', 5);
INSERT INTO `tb_phuong` VALUES (52, 'Phường Phạm Đình Hổ', 5);
INSERT INTO `tb_phuong` VALUES (53, 'Phường Bùi Thị Xuân', 5);
INSERT INTO `tb_phuong` VALUES (54, 'Phường Ngô Thì Nhậm', 5);
INSERT INTO `tb_phuong` VALUES (55, 'Phường Lê Đại Hành', 5);
INSERT INTO `tb_phuong` VALUES (56, 'Phường Đồng Nhân', 5);
INSERT INTO `tb_phuong` VALUES (57, 'Phường Phố Huế', 5);
INSERT INTO `tb_phuong` VALUES (58, 'Phường Đống Mác', 5);
INSERT INTO `tb_phuong` VALUES (59, 'Phường Thanh Lương', 5);
INSERT INTO `tb_phuong` VALUES (60, 'Phường Thanh Nhàn', 5);
INSERT INTO `tb_phuong` VALUES (61, 'Phường Cầu Dền', 5);
INSERT INTO `tb_phuong` VALUES (62, 'Phường Bách Khoa', 5);
INSERT INTO `tb_phuong` VALUES (63, 'Phường Đồng Tâm', 5);
INSERT INTO `tb_phuong` VALUES (64, 'Phường Vĩnh Tuy', 5);
INSERT INTO `tb_phuong` VALUES (65, 'Phường Bạch Mai', 5);
INSERT INTO `tb_phuong` VALUES (66, 'Phường Quỳnh Mai', 5);
INSERT INTO `tb_phuong` VALUES (67, 'Phường Quỳnh Lôi', 5);
INSERT INTO `tb_phuong` VALUES (68, 'Phường Minh Khai', 5);
INSERT INTO `tb_phuong` VALUES (69, 'Phường Trương Định', 5);
INSERT INTO `tb_phuong` VALUES (70, 'Phường Cát Linh', 6);
INSERT INTO `tb_phuong` VALUES (71, 'Phường Văn Miếu', 6);
INSERT INTO `tb_phuong` VALUES (72, 'Phường Quốc Tử Giám', 6);
INSERT INTO `tb_phuong` VALUES (73, 'Phường Láng Thượng', 6);
INSERT INTO `tb_phuong` VALUES (74, 'Phường Ô Chợ Dừa', 6);
INSERT INTO `tb_phuong` VALUES (75, 'Phường Văn Chương', 6);
INSERT INTO `tb_phuong` VALUES (76, 'Phường Hàng Bột', 6);
INSERT INTO `tb_phuong` VALUES (77, 'Phường Láng Hạ', 6);
INSERT INTO `tb_phuong` VALUES (78, 'Phường Khâm Thiên', 6);
INSERT INTO `tb_phuong` VALUES (79, 'Phường Thổ Quan', 6);
INSERT INTO `tb_phuong` VALUES (80, 'Phường Nam Đồng', 6);
INSERT INTO `tb_phuong` VALUES (81, 'Phường Trung Phụng', 6);
INSERT INTO `tb_phuong` VALUES (82, 'Phường Quang Trung', 6);
INSERT INTO `tb_phuong` VALUES (83, 'Phường Trung Liệt', 6);
INSERT INTO `tb_phuong` VALUES (84, 'Phường Phương Liên', 6);
INSERT INTO `tb_phuong` VALUES (85, 'Phường Thịnh Quang', 6);
INSERT INTO `tb_phuong` VALUES (86, 'Phường Trung Tự', 6);
INSERT INTO `tb_phuong` VALUES (87, 'Phường Kim Liên', 6);
INSERT INTO `tb_phuong` VALUES (88, 'Phường Phương Mai', 6);
INSERT INTO `tb_phuong` VALUES (89, 'Phường Ngã Tư Sở', 6);
INSERT INTO `tb_phuong` VALUES (90, 'Phường Khương Thượng', 6);
INSERT INTO `tb_phuong` VALUES (91, 'Phường Nhân Chính', 7);
INSERT INTO `tb_phuong` VALUES (92, 'Phường Thượng Đình', 7);
INSERT INTO `tb_phuong` VALUES (93, 'Phường Khương Trung', 7);
INSERT INTO `tb_phuong` VALUES (94, 'Phường Khương Mai', 7);
INSERT INTO `tb_phuong` VALUES (95, 'Phường Thanh Xuân Trung', 7);
INSERT INTO `tb_phuong` VALUES (96, 'Phường Phương Liệt', 7);
INSERT INTO `tb_phuong` VALUES (97, 'Phường Hạ Đình', 7);
INSERT INTO `tb_phuong` VALUES (98, 'Phường Khương Đình', 7);
INSERT INTO `tb_phuong` VALUES (99, 'Phường Thanh Xuân Bắc', 7);
INSERT INTO `tb_phuong` VALUES (100, 'Phường Thanh Xuân Nam', 7);
INSERT INTO `tb_phuong` VALUES (101, 'Phường Kim Giang', 7);
INSERT INTO `tb_phuong` VALUES (102, 'Phường Thanh Trì', 8);
INSERT INTO `tb_phuong` VALUES (103, 'Phường Vĩnh Hưng', 8);
INSERT INTO `tb_phuong` VALUES (104, 'Phường Định Công', 8);
INSERT INTO `tb_phuong` VALUES (105, 'Phường Mai Động', 8);
INSERT INTO `tb_phuong` VALUES (106, 'Phường Tương Mai', 8);
INSERT INTO `tb_phuong` VALUES (107, 'Phường Đại Kim', 8);
INSERT INTO `tb_phuong` VALUES (108, 'Phường Tân Mai', 8);
INSERT INTO `tb_phuong` VALUES (109, 'Phường Hoàng Văn Thụ', 8);
INSERT INTO `tb_phuong` VALUES (110, 'Phường Giáp Bát', 8);
INSERT INTO `tb_phuong` VALUES (111, 'Phường Lĩnh Nam', 8);
INSERT INTO `tb_phuong` VALUES (112, 'Phường Thịnh Liệt', 8);
INSERT INTO `tb_phuong` VALUES (113, 'Phường Trần Phú', 8);
INSERT INTO `tb_phuong` VALUES (114, 'Phường Hoàng Liệt', 8);
INSERT INTO `tb_phuong` VALUES (115, 'Phường Yên Sở', 8);
INSERT INTO `tb_phuong` VALUES (116, 'Phường Thượng Thanh', 9);
INSERT INTO `tb_phuong` VALUES (117, 'Phường Ngọc Thụy', 9);
INSERT INTO `tb_phuong` VALUES (118, 'Phường Giang Biên', 9);
INSERT INTO `tb_phuong` VALUES (119, 'Phường Đức Giang', 9);
INSERT INTO `tb_phuong` VALUES (120, 'Phường Việt Hưng', 9);
INSERT INTO `tb_phuong` VALUES (121, 'Phường Gia Thụy', 9);
INSERT INTO `tb_phuong` VALUES (122, 'Phường Ngọc Lâm', 9);
INSERT INTO `tb_phuong` VALUES (123, 'Phường Phúc Lợi', 9);
INSERT INTO `tb_phuong` VALUES (124, 'Phường Bồ Đề', 9);
INSERT INTO `tb_phuong` VALUES (125, 'Phường Sài Đồng', 9);
INSERT INTO `tb_phuong` VALUES (126, 'Phường Long Biên', 9);
INSERT INTO `tb_phuong` VALUES (127, 'Phường Thạch Bàn', 9);
INSERT INTO `tb_phuong` VALUES (128, 'Phường Phúc Đồng', 9);
INSERT INTO `tb_phuong` VALUES (129, 'Phường Cự Khối', 9);

-- ----------------------------
-- Table structure for tb_quan
-- ----------------------------
DROP TABLE IF EXISTS `tb_quan`;
CREATE TABLE `tb_quan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_quan` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_quan
-- ----------------------------
INSERT INTO `tb_quan` VALUES (1, 'Quận Tây Hồ');
INSERT INTO `tb_quan` VALUES (2, 'Quận Ba Đình');
INSERT INTO `tb_quan` VALUES (3, 'Quận Cầu Giấy');
INSERT INTO `tb_quan` VALUES (4, 'Quận Hoàn Kiếm');
INSERT INTO `tb_quan` VALUES (5, 'Quận Hai Bà Trưng');
INSERT INTO `tb_quan` VALUES (6, 'Quận Đống Đa');
INSERT INTO `tb_quan` VALUES (7, 'Quận Thanh Xuân');
INSERT INTO `tb_quan` VALUES (8, 'Quận Hoàng Mai');
INSERT INTO `tb_quan` VALUES (9, 'Quận Long Biên');

-- ----------------------------
-- Table structure for tb_reply_cong_ty
-- ----------------------------
DROP TABLE IF EXISTS `tb_reply_cong_ty`;
CREATE TABLE `tb_reply_cong_ty`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noi_dung_reply` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `chuc_vu_reply` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `id_user_reply` int(11) NOT NULL,
  `ngay_dang` date NOT NULL,
  `id_comment` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_user`(`id_user_reply`) USING BTREE,
  INDEX `tb_reply_cong_ty_ibfk_3`(`id_comment`) USING BTREE,
  CONSTRAINT `tb_reply_cong_ty_ibfk_1` FOREIGN KEY (`id_user_reply`) REFERENCES `tb_user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_reply_cong_ty_ibfk_3` FOREIGN KEY (`id_comment`) REFERENCES `tb_binh_luan_cong_ty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_reply_cong_ty
-- ----------------------------
INSERT INTO `tb_reply_cong_ty` VALUES (3, 'Cảm ơn bạn!!!', 'Quản trị viên', 10, '2018-07-08', 1);
INSERT INTO `tb_reply_cong_ty` VALUES (4, 'Công ty này tốt lắm á bạn', NULL, 9, '2018-07-11', 5);
INSERT INTO `tb_reply_cong_ty` VALUES (5, 'Nice car', NULL, 8, '2018-07-09', 1);
INSERT INTO `tb_reply_cong_ty` VALUES (40, 'thật không vậy', NULL, 1, '2018-07-18', 135);
INSERT INTO `tb_reply_cong_ty` VALUES (41, 'tra loi ne', NULL, 2, '2018-07-19', 136);
INSERT INTO `tb_reply_cong_ty` VALUES (42, 'hehe', NULL, 2, '2018-07-19', 141);
INSERT INTO `tb_reply_cong_ty` VALUES (43, 'hehe', NULL, 2, '2018-07-20', 142);
INSERT INTO `tb_reply_cong_ty` VALUES (44, 'nhạt thế', NULL, 2, '2018-07-20', 143);
INSERT INTO `tb_reply_cong_ty` VALUES (45, 'không có đâu bạn', NULL, 2, '2018-07-20', 3);
INSERT INTO `tb_reply_cong_ty` VALUES (46, '142141', NULL, 1, '2018-07-21', 144);

-- ----------------------------
-- Table structure for tb_reply_xe
-- ----------------------------
DROP TABLE IF EXISTS `tb_reply_xe`;
CREATE TABLE `tb_reply_xe`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noi_dung_reply` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_user_reply` int(11) NOT NULL,
  `id_comment` int(11) NOT NULL,
  `ngay_dang` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_user`(`id_user_reply`) USING BTREE,
  INDEX `id_xe`(`id_comment`) USING BTREE,
  CONSTRAINT `tb_reply_xe_ibfk_1` FOREIGN KEY (`id_user_reply`) REFERENCES `tb_user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_reply_xe_ibfk_2` FOREIGN KEY (`id_comment`) REFERENCES `tb_binh_luan_xe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_reply_xe
-- ----------------------------
INSERT INTO `tb_reply_xe` VALUES (1, '123', 1, 12, '2018-07-21');
INSERT INTO `tb_reply_xe` VALUES (2, '456', 1, 13, '2018-07-21');
INSERT INTO `tb_reply_xe` VALUES (3, 'được nhé', 1, 2, '2018-07-21');
INSERT INTO `tb_reply_xe` VALUES (4, '123', 1, 16, '2018-07-22');

-- ----------------------------
-- Table structure for tb_the_loai_xe
-- ----------------------------
DROP TABLE IF EXISTS `tb_the_loai_xe`;
CREATE TABLE `tb_the_loai_xe`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_the_loai_xe
-- ----------------------------
INSERT INTO `tb_the_loai_xe` VALUES (1, 'Xe du lịch');
INSERT INTO `tb_the_loai_xe` VALUES (2, 'Xe cưới hỏi');
INSERT INTO `tb_the_loai_xe` VALUES (3, 'Xe Du Lịch ');
INSERT INTO `tb_the_loai_xe` VALUES (4, 'Xe Lễ Hội ');
INSERT INTO `tb_the_loai_xe` VALUES (5, 'Xe Bán Tải ');
INSERT INTO `tb_the_loai_xe` VALUES (6, 'Xe Đưa Đón Nhân Viên ');
INSERT INTO `tb_the_loai_xe` VALUES (7, 'Xe Đưa Đón Sân Bay ');
INSERT INTO `tb_the_loai_xe` VALUES (8, 'Xe Tháng ');
INSERT INTO `tb_the_loai_xe` VALUES (9, 'Xe Du Lịch Cao Cấp');

-- ----------------------------
-- Table structure for tb_tinh
-- ----------------------------
DROP TABLE IF EXISTS `tb_tinh`;
CREATE TABLE `tb_tinh`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_tinh` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_tinh
-- ----------------------------
INSERT INTO `tb_tinh` VALUES (1, 'Hà Nội');
INSERT INTO `tb_tinh` VALUES (2, 'Huế');
INSERT INTO `tb_tinh` VALUES (3, 'Thanh Hóa');
INSERT INTO `tb_tinh` VALUES (4, 'An Giang');
INSERT INTO `tb_tinh` VALUES (5, 'Bà Rịa - Vũng Tàu');
INSERT INTO `tb_tinh` VALUES (6, 'Bắc Giang');
INSERT INTO `tb_tinh` VALUES (7, 'Bắc Kạn');
INSERT INTO `tb_tinh` VALUES (8, 'Bạc Liêu');
INSERT INTO `tb_tinh` VALUES (9, 'Bắc Ninh');
INSERT INTO `tb_tinh` VALUES (10, 'Bến Tre');
INSERT INTO `tb_tinh` VALUES (11, 'Bình Định');
INSERT INTO `tb_tinh` VALUES (12, 'Bình Dương');
INSERT INTO `tb_tinh` VALUES (13, 'Bình Phước');
INSERT INTO `tb_tinh` VALUES (14, 'Bình Thuận');
INSERT INTO `tb_tinh` VALUES (15, 'Cà Mau');
INSERT INTO `tb_tinh` VALUES (16, 'Cao Bằng');
INSERT INTO `tb_tinh` VALUES (17, 'Đắk Lắk');
INSERT INTO `tb_tinh` VALUES (18, 'Đắk Nông');
INSERT INTO `tb_tinh` VALUES (19, 'Điện Biên');
INSERT INTO `tb_tinh` VALUES (20, 'Đồng Nai');
INSERT INTO `tb_tinh` VALUES (21, 'Đồng Tháp');
INSERT INTO `tb_tinh` VALUES (22, 'Gia Lai');
INSERT INTO `tb_tinh` VALUES (23, 'Hà Giang');
INSERT INTO `tb_tinh` VALUES (24, 'Hà Tĩnh');
INSERT INTO `tb_tinh` VALUES (25, 'Hải Dương');
INSERT INTO `tb_tinh` VALUES (26, 'Hậu Giang');
INSERT INTO `tb_tinh` VALUES (27, 'Hòa Bình');
INSERT INTO `tb_tinh` VALUES (28, 'Hưng Yên');
INSERT INTO `tb_tinh` VALUES (29, 'Khánh Hòa');
INSERT INTO `tb_tinh` VALUES (30, 'Kiên Giang');
INSERT INTO `tb_tinh` VALUES (31, 'Kon Tum');
INSERT INTO `tb_tinh` VALUES (32, 'Lai Châu');
INSERT INTO `tb_tinh` VALUES (33, 'Lâm Đồng');
INSERT INTO `tb_tinh` VALUES (34, 'Lạng Sơn');
INSERT INTO `tb_tinh` VALUES (35, 'Lào Cai');
INSERT INTO `tb_tinh` VALUES (36, 'Long An');
INSERT INTO `tb_tinh` VALUES (37, 'Nam Định');
INSERT INTO `tb_tinh` VALUES (38, 'Nghệ An');
INSERT INTO `tb_tinh` VALUES (39, 'Ninh Bình');
INSERT INTO `tb_tinh` VALUES (40, 'Ninh Thuận');
INSERT INTO `tb_tinh` VALUES (41, 'Phú Thọ');
INSERT INTO `tb_tinh` VALUES (42, 'Quảng Bình');
INSERT INTO `tb_tinh` VALUES (43, 'Quảng Ngãi');
INSERT INTO `tb_tinh` VALUES (44, 'Quảng Ninh');
INSERT INTO `tb_tinh` VALUES (45, 'Quảng Trị');
INSERT INTO `tb_tinh` VALUES (46, 'Sóc Trăng');
INSERT INTO `tb_tinh` VALUES (47, 'Sơn La');
INSERT INTO `tb_tinh` VALUES (48, 'Tây Ninh');
INSERT INTO `tb_tinh` VALUES (49, 'Thái Bình');
INSERT INTO `tb_tinh` VALUES (50, 'Thái Nguyên');
INSERT INTO `tb_tinh` VALUES (51, 'Thanh Hóa');
INSERT INTO `tb_tinh` VALUES (52, 'Thừa Thiên Huế');
INSERT INTO `tb_tinh` VALUES (53, 'Tiền Giang');
INSERT INTO `tb_tinh` VALUES (54, 'Trà Vinh');
INSERT INTO `tb_tinh` VALUES (55, 'Tuyên Quang');
INSERT INTO `tb_tinh` VALUES (56, 'Vĩnh Long');
INSERT INTO `tb_tinh` VALUES (57, 'Vĩnh Phúc');
INSERT INTO `tb_tinh` VALUES (58, 'Yên Bái');
INSERT INTO `tb_tinh` VALUES (59, 'Phú Yên');
INSERT INTO `tb_tinh` VALUES (60, 'Đà Nẵng');
INSERT INTO `tb_tinh` VALUES (61, 'Hải Phòng');
INSERT INTO `tb_tinh` VALUES (62, 'Hà Nội');
INSERT INTO `tb_tinh` VALUES (63, 'TP HCM');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `ten_dang_nhap` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `passwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ho_ten` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `dia_chi` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `so_dien_thoai` char(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gioi_tinh` int(11) NULL DEFAULT 0,
  `cong_viec` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `avatar` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `nhom_tai_khoan_id` int(11) NOT NULL,
  PRIMARY KEY (`id_user`) USING BTREE,
  UNIQUE INDEX `ten_dang_nhap`(`ten_dang_nhap`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  INDEX `nhom_tai_khoan_id`(`nhom_tai_khoan_id`) USING BTREE,
  CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`nhom_tai_khoan_id`) REFERENCES `tb_nhom_tai_khoan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'khanhdaik', '123456', 'Nguyễn Trọng Khánh', 'Hà Nội', '01686378847', 'khanhdaik134@gmail.com', 0, 'Sinh viên', 'public/assets/img/gallery/anh3.jpg', 1);
INSERT INTO `tb_user` VALUES (2, 'abc123', '456789', 'Phan Văn A', 'Hà Nội', '01234567897', 'abc123@gmail.com', 0, 'Cán bộ', 'public/assets/img/gallery/anh4.jpg', 2);
INSERT INTO `tb_user` VALUES (3, 'taikhoan456', '123456', 'Nguyễn Thị B', 'Huế', '01234564879', 'lua@gmail.com', 1, 'Tự do', 'public/assets/img/gallery/anh5.jpg', 3);
INSERT INTO `tb_user` VALUES (4, 'nguyenquocnam', '123456', 'nguyenquocnam', 'Hà Nội', '01686378847', 'namnguyen@gmail.com', 0, 'Sinh Viên', 'public/assets/img/gallery/anh6.jpg', 4);
INSERT INTO `tb_user` VALUES (5, 'hoangtrungcong', '123456', 'Hoàng Trung Công', 'Hà Nội', '016765942889', 'conghoang@gmail.com', 0, 'Sinh Viên', 'public/assets/img/gallery/anh7.jpg', 4);
INSERT INTO `tb_user` VALUES (6, 'phamconganh', '123456', 'Phạm Công Anh', 'Hà Nội', '016765934289', 'conganh@gmail.com', 0, 'Sinh Viên', 'public/assets/img/gallery/anh8.jpg', 4);
INSERT INTO `tb_user` VALUES (7, 'dangconghung', '123456', 'Đặng Công Hùng ', 'Uông Bí', '01676594289', 'anhhung@gmail.com', 0, 'Tự do', 'public/assets/img/gallery/anh9.jpg', 3);
INSERT INTO `tb_user` VALUES (8, 'nguyenlan', '123456', 'Nguyễn Thị Lan', 'Tiên Yên', '01676594289', 'lannguyen@gmail.com', 1, 'Sinh viên', 'public/assets/img/gallery/anh10.jpg', 1);
INSERT INTO `tb_user` VALUES (9, 'nguyentuan', '123456', 'Nguyễn Anh Tuấn', 'Hạ Long', '01676594289', 'anhtuan@gmail.com', 1, 'Tự do', 'public/assets/img/gallery/anh11.jpg', 2);
INSERT INTO `tb_user` VALUES (10, 'ngochuyen', '123456', 'Nguyễn Ngọc Huyền', 'Đông Triều', '01676594289', 'huyennguyen@gmail.com', 1, 'Sinh viên', 'public/assets/img/gallery/anh12.jpg', 2);

-- ----------------------------
-- Table structure for tb_xe
-- ----------------------------
DROP TABLE IF EXISTS `tb_xe`;
CREATE TABLE `tb_xe`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_xe` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mau_xe` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `so_ghe` int(11) NOT NULL,
  `van_toc` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `doi_xe` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bien_so` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `hinh_anh` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `loai_xe` int(11) NULL DEFAULT NULL,
  `trang_thai_hien_thi` int(11) NOT NULL DEFAULT 0,
  `so_lan_thue` int(11) NOT NULL DEFAULT 0,
  `id_nsx` int(11) NOT NULL,
  `id_cong_ty` int(11) NOT NULL,
  `gioi_thieu_xe` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `gia_thue_cu` int(11) NOT NULL,
  `gia_thue_moi` int(11) NULL DEFAULT NULL,
  `trang_thai` int(11) NOT NULL DEFAULT 0,
  `ngay_them` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `loai_xe`(`loai_xe`) USING BTREE,
  INDEX `id_nsx`(`id_nsx`) USING BTREE,
  INDEX `id_cong_ty`(`id_cong_ty`) USING BTREE,
  CONSTRAINT `tb_xe_ibfk_1` FOREIGN KEY (`loai_xe`) REFERENCES `tb_the_loai_xe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_xe_ibfk_2` FOREIGN KEY (`id_nsx`) REFERENCES `tb_nha_san_xuat` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_xe_ibfk_3` FOREIGN KEY (`id_cong_ty`) REFERENCES `tb_cong_ty` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_xe
-- ----------------------------
INSERT INTO `tb_xe` VALUES (1, 'Roll Royce Ghost', 'đen', 4, '128km/h', '2017-2018', '123456', 'public\\assets\\img\\rollroyce1.jpg', 1, 1, 10, 1, 1, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.                                                                                                ', 2000000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (2, 'Lamborghini Mucielago LP640', 'xám', 4, '130km/h', '2016-2017', '134564', '/../project-xe/public/assets/img/wallhaven-676514.jpg', 2, 1, 20, 2, 1, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', 3000000, 2000000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (3, ' Rolls-Royce Phantom Coupe ', 'xám', 5, '182km/h', '2017-2018', '123456', 'public\\assets\\img\\xe-23.jpg', 8, 1, 30, 4, 1, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 3000000, 1000000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (4, 'Rolls-Royce Ghost EWB ', 'đỏ thẫm', 5, '200km/h', '2015-1018', '123456', 'public\\assets\\img\\xe-28.jpg', 3, 1, 40, 1, 1, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 2000000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (5, 'Audi TT S-Line', 'xám', 0, '200km/h', '2017-2018', '123456', 'public\\assets\\img\\xe-29.jpg', 2, 1, 50, 5, 1, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (6, 'Audi TT', 'xám', 0, '200km/h', '2017-2018', '134564', '/../project-xe/public/assets/img/xedoisong_sieu_xe_supercar_lamborghini_terzo_millennio_concept_2017_h1_mryu.jpg', 2, 1, 60, 5, 1, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.                                                                ', 1000000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (7, ' Rolls-Royce Wraith ', 'xanh dương', 4, '300km/h', '2017-2018', '123456', 'public\\assets\\img\\xe-31.jpg', 4, 1, 70, 1, 1, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 2500000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (8, 'Rolls-Royce Phantom ', 'đen', 4, '100km/h', '2017-2018', '123456', 'public\\assets\\img\\xe-32.jpg', 1, 1, 35, 1, 1, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 3500000, 2000000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (9, 'Rolls-Royce Phantom EWB', 'nâu', 5, '300km/h', '2017-2018', '123456', 'public\\assets\\img\\xe-33.jpg', 4, 1, 15, 1, 1, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 2500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (11, 'Audi Q7', 'đỏ', 5, '200km/h', '2017-2018', '123456', 'public\\assets\\img\\xe-35.jpg', 3, 1, 21, 7, 1, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 3500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (12, 'Audi Q5', 'đen', 4, '200km/h', '2017-2018', '123456', 'public\\assets\\img\\xe-23.jpg', 4, 1, 85, 7, 1, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 3000000, 1000000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (13, 'Audi Q3', 'xanh dương', 4, '300km/h', '2017-2018', '123456', 'public\\assets\\img\\xe-28.jpg', 5, 1, 14, 7, 1, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 2000000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (14, 'Ford EcoSport', 'đen', 5, '182km/h', '2017-2018', '134564', 'public\\assets\\img\\xe-29.jpg', 1, 1, 13, 19, 1, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (15, ' Ford Everest', 'xám', 5, '300km/h', '2017-2018', '123456', 'public\\assets\\img\\xe-30.jpg', 2, 1, 25, 19, 2, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1000000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (16, ' Ford Explorer', 'đen', 6, '300km/h', '2017-2018', '123456', 'public\\assets\\img\\xe-31.jpg', 3, 1, 31, 19, 2, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 2500000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (17, ' Ford Fiesta', 'đỏ', 3, '182km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-32.jpg', 5, 1, 36, 19, 2, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 3500000, 2000000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (18, ' Ford Focus', 'xanh dương', 4, '300km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-33.jpg', 2, 1, 75, 19, 2, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 2500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (19, ' Ford Ranger', 'đỏ', 5, '300km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-34.jpg', 4, 1, 12, 19, 2, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 3000000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (20, ' Ford Transit', 'đen', 6, '300km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-35.jpg', 3, 1, 21, 19, 2, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 3500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (21, 'BMW 320i', 'đỏ', 7, '182km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-23.jpg', 6, 1, 26, 9, 2, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 3000000, 1000000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (22, 'BMW 320i High', 'xám', 3, '300km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-28.jpg', 7, 1, 27, 9, 2, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 2000000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (23, 'BMW 320i GT', 'đen', 2, '300km/h', '2016-2017', '123456', '/../project-xe/public/assets/img/BMW-320i-GT-2017-VN (3).jpg', 2, 1, 31, 9, 2, '<div style=\"color: rgb(0, 0, 0); font-family: Tahoma; font-size: 13.3333px; text-align: justify;\">\r\n<div style=\"text-align: center;\"><br />\r\n<span style=\"color:rgb(153, 51, 0)\"><span style=\"color:rgb(51, 51, 51)\"><strong>BMW 320I ĐẲNG CẤP VƯỢT TRỘI - LỰA CHỌN TỐI ƯU</strong></span></span></div>\r\n\r\n<ul>\r\n	<li>Chiếc xe với thiết kế thể thao, mạnh mẽ, l&ocirc;i cuốn, đầy c&aacute; t&iacute;nh</li>\r\n	<li><span style=\"font-family:times new roman,times; font-size:medium\">Gran Turismo l&agrave; thuật ngữ mi&ecirc;u tả một chiếc xe với khả năng vận h&agrave;nh linh hoạt tr&ecirc;n nhiều địa h&igrave;nh</span></li>\r\n	<li><span style=\"font-family:times new roman,times; font-size:medium\">Kh&ocirc;ng gian nội thất sang trọng, đẳng cấp, rộng v&agrave; tiện nghi</span></li>\r\n</ul>\r\n\r\n<div style=\"text-align: center;\"><em><img alt=\"\" src=\"http://giaxebmw.com/upload//BMW-320i-GT-2017-VN%20(3).jpg\" style=\"border:0px; width:100%\" /><br />\r\nThiết kế kiểu d&aacute;ng coupe mang lại d&aacute;ng vẻ l&ocirc;i cuốn tr&ecirc;n BMW 320i GT</em><br />\r\n&nbsp;</div>\r\n<span style=\"color:rgb(51, 51, 51)\">&nbsp;</span></div>\r\n\r\n<div style=\"color: rgb(0, 0, 0); font-family: Tahoma; font-size: 13.3333px; text-align: center;\"><span style=\"color:rgb(51, 51, 51)\"><strong>THIẾT KẾ NGOẠI THẤT TR&Ecirc;N BMW 320I GRAN TURISMO</strong><br />\r\n<em>Sứ mệnh của n&oacute; được sinh ra để chinh phục mọi thử th&aacute;ch được đặt ra. Một chiếc xe mang đến nhiều c&acirc;u chuyện đ&aacute;ng kể từ thiết kế cuốn h&uacute;t, kh&ocirc;ng gian nội thất sang trọng v&agrave; đẳng cấp, khả năng vận h&agrave;nh linh hoạt...</em><br />\r\n<strong><img alt=\"\" src=\"http://giaxebmw.com/upload//BMW-320i-GT-2017-VN%20(7).jpg\" style=\"border:0px; width:48%\" />&nbsp;&nbsp;<img alt=\"\" src=\"http://giaxebmw.com/upload//BMW-320i-GT-2017-VN%20(9).jpg\" style=\"border:0px; width:48%\" /></strong></span></div>\r\n\r\n<div style=\"text-align: center;\"><span style=\"font-family:tahoma; font-size:13.3333px\"><span style=\"font-family:times new roman,times; font-size:medium\"><em>Đ&egrave;n trước v&agrave; đ&egrave;n sau sắc n&eacute;t v&agrave; đặc trưng tr&ecirc;n BMW 320i GT</em></span></span></div>\r\n\r\n<div style=\"text-align: center;\"><span style=\"font-family:tahoma; font-size:13.3333px\"><span style=\"font-family:times new roman,times; font-size:medium\">Ngoại h&igrave;nh&nbsp;</span><strong>BMW 320i Gran Turismo</strong><span style=\"font-family:times new roman,times; font-size:medium\">&nbsp;ho&agrave;n to&agrave;n mới to&aacute;t l&ecirc;n n&eacute;t đẹp c&oacute; thể lay động cảm quan của những người xung quanh. Tr&ecirc;n những con đường n&oacute; lướt qua, BMW 320i Gran Turismo để lại những ấn tượng độc đ&aacute;o bởi một diện mạo đặc trưng kh&ocirc;ng thể nhầm lẫn, với một định nghĩa mới về khả năng vận h&agrave;nh ưu việt.<br />\r\n<img alt=\"\" src=\"http://giaxebmw.com/upload//330i-gt-coupe(1).jpg\" style=\"border:0px; width:100%\" /></span><br />\r\n<em>Ngang xe BMW 320i Gran Turismo mới</em><br />\r\n<span style=\"font-family:times new roman,times; font-size:medium\">Tất cả những yếu tố đ&oacute; tạo n&ecirc;n sức thuyết phục, cho ph&eacute;p chiếc&nbsp;</span><strong>320i Gran Turismo</strong><span style=\"font-family:times new roman,times; font-size:medium\">&nbsp;mới trở th&agrave;nh một phương tiện di chuyển sang trọng, thanh lịch cho những doanh nh&acirc;n th&agrave;nh đạt, v&agrave; một chiếc xe du lịch, năng động, đầy tiện nghi. Những c&aacute; t&iacute;nh đặc trưng của thương hiệu BMW thể hiện r&otilde; n&eacute;t ở d&ograve;ng xe n&agrave;y: thiết kế 4 cửa kh&ocirc;ng khung, mui xe vuốt xuống nhẹ về ph&iacute;a sau theo phong c&aacute;ch coupe, cửa (cốp) sau với k&iacute;ch thước lớn, c&oacute; thể đ&oacute;ng &amp; mở tự động gi&uacute;p khẳng định c&aacute; t&iacute;nh tiện dụng r&otilde; rệt cho&nbsp;</span><strong>BMW 320i Gran Turismo</strong><span style=\"font-family:times new roman,times; font-size:medium\">.<br />\r\n<img alt=\"\" src=\"http://giaxebmw.com/upload//BMW-320i-GT-2017-VN%20(8).jpg\" style=\"border:0px; width:48%\" />&nbsp;&nbsp;<img alt=\"\" src=\"http://giaxebmw.com/upload//BMW-320i-GT-2017-VN%20(12).jpg\" style=\"border:0px; width:48%\" /></span></span></div>\r\n\r\n<div style=\"color: rgb(0, 0, 0); font-family: Tahoma; font-size: 13.3333px; text-align: center;\"><span style=\"color:rgb(51, 51, 51)\"><em>Bộ m&acirc;m thể thao mạnh mẽ v&agrave; c&oacute;p sau rộng rai</em></span><br />\r\n<span style=\"font-size:small\">Đ&atilde; c&oacute; nhiều &yacute; kiến kh&aacute;ch h&agrave;ng phẩn hồi về n&eacute;t quyến rũ kh&ocirc;ng thể cưỡng lại được với vẻ thiết kế ấn tượng tr&ecirc;n BMW 320i Gran Turismo!</span></div>\r\n\r\n<div style=\"text-align: center;\"><br />\r\n<span style=\"font-family:tahoma; font-size:13.3333px\"><strong><span style=\"font-size:13.3333px\">THIẾT KẾ NỘI THẤT TR&Ecirc;N BMW 320I GRAN TURISMO</span></strong></span></div>\r\n\r\n<div style=\"text-align: center;\"><span style=\"font-family:tahoma; font-size:13.3333px\"><strong><span style=\"font-size:13.3333px\"><img alt=\"\" src=\"http://giaxebmw.com/upload//BMW-320i-GT-2017-VN%20(5).jpg\" style=\"border:0px; width:100%\" /></span></strong><br />\r\n<em><span style=\"font-size:13.3333px\">Nội thất tr&ecirc;n BMW 320i Gran Turismo phi&ecirc;n bản</span></em></span></div>\r\n\r\n<div style=\"text-align: center;\"><span style=\"font-family:tahoma; font-size:13.3333px\"><em><span style=\"font-size:13.3333px\"><img alt=\"\" src=\"http://giaxebmw.com/upload//bmw-328i-gt-noi-that.jpg\" style=\"border:0px; height:250px; width:687px\" /></span></em><br />\r\n<em><span style=\"font-size:13.3333px\">Nội thất b&ecirc;n trong BMW 320i Gran Turismo<br />\r\n<img alt=\"\" src=\"http://giaxebmw.com/upload//design_interieur_04.jpg\" style=\"border:0px; height:250px; width:687px\" /></span></em><br />\r\n<em><span style=\"font-size:13.3333px\">H&agrave;ng ghế sau v&ocirc; c&ugrave;ng rộng v&agrave; thiết kế linh hoạt<br />\r\n<img alt=\"\" src=\"http://giaxebmw.com/upload//bmw-328i-gt-gap-ghe.jpg\" style=\"border:0px; height:250px; width:687px\" /></span></em><br />\r\n<em><span style=\"font-size:13.3333px\">Ghế sau gấp phẳng th&agrave;nh kh&ocirc;ng gian mở ấn tượng<br />\r\n<img alt=\"\" src=\"http://giaxebmw.com/upload//bmw-328i-gt-khoang-sau.jpg\" style=\"border:0px; height:250px; width:687px\" /></span></em><br />\r\n<em><span style=\"font-size:13.3333px\">Cốp sau mở rộng l&ecirc;n ph&iacute;a tr&ecirc;n</span></em></span></div>\r\n\r\n<div style=\"text-align: center;\"><span style=\"font-family:tahoma; font-size:13.3333px\"><strong><span style=\"font-size:13.3333px\">CẢM GI&Aacute;C L&Aacute;I &Ecirc;M &Aacute;I V&Agrave; LINH HOẠT</span></strong></span></div>\r\n\r\n<p><span style=\"font-family:tahoma; font-size:13.3333px\"><em><span style=\"font-size:13.3333px\">Nhờ sở hữu một khung gầm chắc chắn với vật liệu mới nhẹ, khoảng s&aacute;ng gầm xe cao, kh&ocirc;ng gian người l&aacute;i rộng v&agrave; thoải m&aacute;i, b&aacute;nh sau thiết kế đặc biệt, động cơ Twinturbo, hộp số 8 cấp... tạo n&ecirc;n cảm gi&aacute;c l&aacute;i mạnh mẽ, thể thao, linh hoạt, &ecirc;m &aacute;i cho mỗi chuyến h&agrave;nh tr&igrave;nh cả bạn c&ugrave;ng người th&acirc;n.</span></em></span></p>\r\n\r\n<div style=\"text-align: center;\"><span style=\"font-family:tahoma; font-size:13.3333px\"><em><span style=\"font-size:13.3333px\"><img alt=\"\" src=\"http://giaxebmw.com/upload//active_rear_spoiler.jpg\" style=\"border:0px; height:250px; width:687px\" /></span></em><br />\r\n<em>C&aacute;nh gi&oacute; ph&iacute;a sau tối ưu h&oacute;a d&ograve;ng kh&iacute; ph&iacute;a sau xe khi xe di chuyển với tốc độ cao, để đảm bảo độ b&aacute;m đường tốt nhất v&agrave; cảm gi&aacute;c l&aacute;i năng động.<br />\r\n<img alt=\"\" src=\"http://giaxebmw.com/upload//twin_turbo_petrol_engine.jpg\" style=\"border:0px; height:250px; width:687px\" /><br />\r\n<span style=\"font-size:13.3333px\">Động cơ Turbo mạnh mẽ v&agrave; tiết kiệm nhi&ecirc;n liệu<br />\r\n<img alt=\"\" src=\"http://giaxebmw.com/upload//bmw_lines_design_luxery_05.jpg\" style=\"border:0px; height:250px; width:687px\" /></span></em><br />\r\n<em><span style=\"font-size:13.3333px\">Thiết kế hốc gi&oacute; ấn tượng v&agrave; kh&iacute; động học<br />\r\n<img alt=\"\" src=\"http://giaxebmw.com/upload//start_stop_01.jpg\" style=\"border:0px; height:250px; width:687px\" /></span></em><br />\r\n<em>Chức năng Auto Start Stop đảm bảo rằng nhi&ecirc;n liệu chỉ được sử dụng một khi xe di chuyển.</em></span></div>\r\n', 1500000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (24, 'BMW 320i GT Medium', 'đen', 5, '182km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-30.jpg', 7, 1, 16, 9, 2, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1000000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (25, 'BMW 320i GT High', 'đỏ', 6, '300km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-31.jpg', 8, 1, 19, 9, 2, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 2500000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (26, 'BMW 420i Convertible', 'xanh dương', 5, '200km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-32.jpg', 7, 1, 5, 9, 2, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 3500000, 2000000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (27, 'BMW 420i Gran Coupe', 'đen', 4, '200km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-33.jpg', 9, 1, 6, 9, 2, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 2500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (28, 'BMW 430i Convertible', 'xám', 3, '200km/h', '2017-2018', '123456', 'public\\assets\\img\\xe-34.jpg', 3, 1, 7, 9, 2, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 3000000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (29, 'BMW 430i Gran Coupe', 'đen', 4, '200km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-35.jpg', 2, 1, 8, 9, 3, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 3500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (30, 'Bmw 520i', 'đỏ', 5, '200km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-23.jpg', 5, 1, 22, 9, 3, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 3000000, 1000000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (31, 'Bmw 528i GT', 'đen', 4, '300km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-28.jpg', 6, 1, 23, 9, 3, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 2000000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (32, 'Bmw 528i GT High', 'xám', 3, '182km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-29.jpg', 5, 1, 4, 9, 3, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (33, 'Bmw 640i Grand Coupe', 'đen', 5, '300km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-30.jpg', 2, 1, 24, 9, 3, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1000000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (34, 'BMW 730Li', 'đỏ', 6, '182km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-31.jpg', 7, 1, 26, 9, 3, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 2500000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (35, 'BMW 740Li', 'xanh dương', 3, '300km/h', '2017-2018', '123456', 'public\\assets\\img\\xe-32.jpg', 5, 1, 35, 9, 3, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 3500000, 2000000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (36, 'BMW 750Li', 'đen', 4, '182km/h', '2017-2018', '123456', 'public\\assets\\img\\xe-33.jpg', 6, 1, 39, 9, 3, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 2500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (37, 'BMW X3 sDrive20i', 'xám', 5, '300km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-34.jpg', 7, 1, 50, 9, 3, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 3000000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (38, 'BMW X4 xDrive20i', 'đen', 4, '182km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-35.jpg', 2, 1, 52, 9, 3, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 3500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (39, 'BMW X5 xDrive35i', 'đen', 3, '300km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-23.jpg', 7, 1, 45, 9, 3, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 3000000, 1000000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (40, 'BMW X6 xDrive35i', 'xanh dương', 4, '300km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-28.jpg', 8, 1, 46, 9, 3, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 2000000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (41, 'BMW X6 xDrive35i Pure', 'xám', 0, '182km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-29.jpg', 9, 1, 47, 9, 3, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (42, 'BMW M2 Coupe', 'đen', 0, '300km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-30.jpg', 5, 1, 48, 9, 3, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1000000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (43, 'BMW M4 Coupe', 'đen', 0, '182km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-31.jpg', 7, 1, 49, 9, 4, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 2500000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (44, 'BMW M4 Convertible', 'cam', 0, '300km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-32.jpg', 7, 1, 50, 9, 4, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 3500000, 2000000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (45, 'BMW I8', 'cam', 0, '182km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-33.jpg', 8, 1, 51, 9, 4, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 2500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (46, 'Audi A3', 'xám', 0, '182km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-34.jpg', 4, 1, 53, 7, 4, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 3000000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (47, 'Audi A4', 'cam', 0, '182km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-35.jpg', 5, 1, 54, 7, 4, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 3500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (48, 'Audi A5 Sportback', 'xanh dương', 0, '300km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-23.jpg', 4, 1, 25, 7, 4, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 3000000, 1000000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (49, 'Audi A6', 'cam', 0, '182km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-28.jpg', 7, 1, 29, 7, 4, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 2000000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (50, 'Audi A7', 'xám', 0, '300km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-29.jpg', 8, 1, 28, 7, 4, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1500000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (51, 'Audi A8L', 'cam', 0, '300km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-30.jpg', 4, 1, 24, 7, 4, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 1000000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (52, 'Audi Q2', 'xám', 0, '182km/h', '2016-2017', '123456', 'public\\assets\\img\\xe-31.jpg', 2, 1, 11, 7, 4, 'Không chỉ dừng ở đó, chiếc Rolls-Royce Wraith Coupe 2020 còn được khoác lên dàn áo cảnh sát UAE nổi bật. Cảnh sát tại Tiểu vương quốc Ả rập thống nhất vẫn luôn nổi tiếng với những chiếc siêu xe hàng đầu thế giới.', 2500000, 1500000, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (69, 'Lamborghini Mucielago LP670', 'trắng', 4, '128km/h', '', '123456', '/../project-xe/public/assets/img/lambor.jpg', 1, 0, 0, 26, 1, '<p>Giới thiệu xe</p>\r\n', 0, 1213456, 0, '0000-00-00');
INSERT INTO `tb_xe` VALUES (71, 'Innova', 'nâu xám', 4, '150km/h', '', '123456', '/../project-xe/public/assets/img/db11volantegallery1.jpg', 7, 0, 0, 3, 1, '<table align=\"center\" class=\"picture\" style=\"-webkit-font-smoothing:antialiased; background-attachment:initial; background-clip:initial; background-image:initial; background-origin:initial; background-position:initial; background-repeat:initial; background-size:initial; border-collapse:collapse; border-spacing:0px; border:0px; box-sizing:border-box; color:rgb(85, 85, 85); font-family:sans-serif; font-size:14px; line-height:20px; margin:14px 0px; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:660px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:baseline\">\r\n			<div class=\"photoset-item\" style=\"box-sizing: border-box; text-rendering: geometricPrecision; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; text-size-adjust: 100%;\"><img alt=\"Sieu xe Lamborghini Huracan gay an tuong voi thiet ke quai di hinh anh 3\" src=\"https://znews-photo-td.zadn.vn/w1024/Uploaded/rik_rdcvcvwt_wc/2018_07_18/2017lamborghinihuracanlp61045.jpg\" style=\"background:transparent; border:0px; box-sizing:border-box; display:block; height:371px; margin:0px; max-width:100%; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:659.556px\" /><a class=\"btnSlideshow\" href=\"https://news.zing.vn/sieu-xe-lamborghini-huracan-gay-an-tuong-voi-thiet-ke-quai-di-post861467.html#slideshow\" style=\"box-sizing: border-box; text-rendering: geometricPrecision; margin: 0px; padding: 0px; vertical-align: baseline; background: rgba(0, 0, 0, 0.3); text-decoration-line: none; color: rgb(85, 85, 85); position: absolute; top: 0px; right: 0px; width: 30px; height: 30px; overflow: hidden; display: block;\">Ph&oacute;ng to</a></div>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:baseline\">Ở phương diện n&agrave;o đ&oacute;, phần sau của Hurac&aacute;n LP 610-4 tr&ocirc;ng như một t&aacute;c phẩm nghệ thuật m&aacute;y m&oacute;c, to&aacute;t l&ecirc;n vẻ đẹp của&nbsp;<a class=\"topic normal autolink\" href=\"https://news.zing.vn/lamborghini-tieu-diem.html\" style=\"box-sizing: border-box; text-rendering: geometricPrecision; margin: 0px; padding: 0px; vertical-align: baseline; background: transparent; text-decoration-line: none; color: rgb(85, 85, 85); border-bottom: 1px solid rgb(51, 51, 51);\" title=\"Tin tức Lamborghini\">Lamborghini</a>&nbsp;d&agrave;nh cho tay chơi thực thụ. Xe sử dụng bộ la-zăng ADV5.2 M.V2 CS t&ugrave;y chỉnh c&agrave;ng tăng th&ecirc;m vẻ hầm hố.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"center\" class=\"picture\" style=\"-webkit-font-smoothing:antialiased; background-attachment:initial; background-clip:initial; background-image:initial; background-origin:initial; background-position:initial; background-repeat:initial; background-size:initial; border-collapse:collapse; border-spacing:0px; border:0px; box-sizing:border-box; color:rgb(85, 85, 85); font-family:sans-serif; font-size:14px; line-height:20px; margin:14px 0px; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:660px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:baseline\">\r\n			<div class=\"photoset-item\" style=\"box-sizing: border-box; text-rendering: geometricPrecision; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; text-size-adjust: 100%;\"><img alt=\"Sieu xe Lamborghini Huracan gay an tuong voi thiet ke quai di hinh anh 4\" src=\"https://znews-photo-td.zadn.vn/w1024/Uploaded/rik_rdcvcvwt_wc/2018_07_18/2017lamborghinihuracanlp61044.jpg\" style=\"background:transparent; border:0px; box-sizing:border-box; display:block; height:371px; margin:0px; max-width:100%; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:659.556px\" /></div>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:baseline\">G&oacute;i độ TR3 Performance mang tới sức mạnh động cơ V10 dung t&iacute;ch 5.2L, sản sinh c&ocirc;ng suất tr&ecirc;n 850 m&atilde; lực nhờ hệ thống tăng &aacute;p k&eacute;p. Phần đầu xe l&agrave; hệ thống l&agrave;m m&aacute;t bằng chất lỏng v&agrave; ngăn lạnh gi&uacute;p hạ nhiệt động cơ v&agrave; tăng hiệu suất hoạt động.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"center\" class=\"picture\" style=\"-webkit-font-smoothing:antialiased; background-attachment:initial; background-clip:initial; background-image:initial; background-origin:initial; background-position:initial; background-repeat:initial; background-size:initial; border-collapse:collapse; border-spacing:0px; border:0px; box-sizing:border-box; color:rgb(85, 85, 85); font-family:sans-serif; font-size:14px; line-height:20px; margin:14px 0px; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:660px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:baseline\">\r\n			<div class=\"photoset-item\" style=\"box-sizing: border-box; text-rendering: geometricPrecision; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; text-size-adjust: 100%;\"><img alt=\"Sieu xe Lamborghini Huracan gay an tuong voi thiet ke quai di hinh anh 5\" src=\"https://znews-photo-td.zadn.vn/w1024/Uploaded/rik_rdcvcvwt_wc/2018_07_18/2017lamborghinihuracanlp61046.jpg\" style=\"background:transparent; border:0px; box-sizing:border-box; display:block; height:371px; margin:0px; max-width:100%; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:659.556px\" /></div>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:baseline\">Lamborghini Hurac&aacute;n 850 m&atilde; lực l&agrave; minh chứng r&otilde; n&eacute;t rất cho g&oacute;i độ TR3 Performance, gồm rất nhiều t&ugrave;y chỉnh theo y&ecirc;u cầu kh&aacute;ch h&agrave;ng nhằm tạo ra cỗ xe độc đ&aacute;o, c&oacute; một kh&ocirc;ng hai.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"center\" class=\"picture\" style=\"-webkit-font-smoothing:antialiased; background-attachment:initial; background-clip:initial; background-image:initial; background-origin:initial; background-position:initial; background-repeat:initial; background-size:initial; border-collapse:collapse; border-spacing:0px; border:0px; box-sizing:border-box; color:rgb(85, 85, 85); font-family:sans-serif; font-size:14px; line-height:20px; margin:14px 0px; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:660px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:baseline\">\r\n			<div class=\"photoset-item\" style=\"box-sizing: border-box; text-rendering: geometricPrecision; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; text-size-adjust: 100%;\"><img alt=\"Sieu xe Lamborghini Huracan gay an tuong voi thiet ke quai di hinh anh 6\" src=\"https://znews-photo-td.zadn.vn/w1024/Uploaded/rik_rdcvcvwt_wc/2018_07_18/huracanlp610horsepower.jpg\" style=\"background:transparent; border:0px; box-sizing:border-box; display:block; height:440px; margin:0px; max-width:100%; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:659.633px\" /></div>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:baseline\">Hurac&aacute;n LP 610-4 bỏ cản sau chủ yếu khoe vẻ đẹp m&aacute;y m&oacute;c b&ecirc;n trong hơn l&agrave; giảm trọng lượng xe. Trong khi hầu hết nh&agrave; sản xuất che k&iacute;n khối động cơ b&ecirc;n trong bằng c&aacute;c tấm nhựa m&agrave;u x&aacute;m, Lamborghini kh&ocirc;ng ngần ngại ph&ocirc; diễn ra ngo&agrave;i.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table align=\"center\" class=\"picture\" style=\"-webkit-font-smoothing:antialiased; background-attachment:initial; background-clip:initial; background-image:initial; background-origin:initial; background-position:initial; background-repeat:initial; background-size:initial; border-collapse:collapse; border-spacing:0px; border:0px; box-sizing:border-box; color:rgb(85, 85, 85); font-family:sans-serif; font-size:14px; line-height:20px; margin:14px 0px; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:660px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:baseline\">\r\n			<div class=\"photoset-item\" style=\"box-sizing: border-box; text-rendering: geometricPrecision; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent; text-size-adjust: 100%;\"><img alt=\"Sieu xe Lamborghini Huracan gay an tuong voi thiet ke quai di hinh anh 7\" src=\"https://znews-photo-td.zadn.vn/w1024/Uploaded/rik_rdcvcvwt_wc/2018_07_18/2017lamborghinihuracanlp61046_1.jpg\" style=\"background:transparent; border:0px; box-sizing:border-box; display:block; height:371px; margin:0px; max-width:100%; outline:0px; padding:0px; text-rendering:geometricPrecision; text-size-adjust:100%; vertical-align:baseline; width:659.556px\" /></div>\r\n\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:baseline\">Tại Mỹ, một chiếc Hurac&aacute;n LP 610-4 đời 2017 c&oacute; gi&aacute; b&aacute;n trung b&igrave;nh từ 233.000 &ndash; 325.000 USD. Với g&oacute;i độ TR3 Performance, chắc chắn mức gi&aacute; của xe sẽ cao hơn nhiều.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 50000, 0, '0000-00-00');

SET FOREIGN_KEY_CHECKS = 1;
