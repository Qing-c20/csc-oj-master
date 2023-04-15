/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : oj

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2023-03-20 08:20:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
                      `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                      `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告标题',
                      `img` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告图',
                      `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告商名字',
                      `create_time` datetime NOT NULL COMMENT '创建时间',
                      `end_time` datetime NOT NULL COMMENT '结束时间',
                      `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '链接地址',
                      `status` tinyint NOT NULL DEFAULT '1' COMMENT '广告位状态',
                      `version` int NOT NULL DEFAULT '0' COMMENT '版本号',
                      `tag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '广告' COMMENT '标签',
                      `rate` tinyint DEFAULT '0' COMMENT '评分',
                      `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '广告类容(富文本)',
                      PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of ad
-- ----------------------------
INSERT INTO `ad` VALUES ('1', '狂码招新', '/profile/upload/2022/07/07/banner1_20220707134957A001.png', '狂码工作室', '2022-07-07 13:50:21', '2022-07-30 00:00:00', null, '1', '1', '123', '4', null);

-- ----------------------------
-- Table structure for app_version
-- ----------------------------
DROP TABLE IF EXISTS `app_version`;
CREATE TABLE `app_version` (
                               `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                               `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用名称',
                               `pre_version` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上一个版本',
                               `version` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本号 eg:1.0.1',
                               `is_updated` tinyint NOT NULL DEFAULT '0' COMMENT '是否有新版本 1-有 0-木有',
                               `comment` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本说明',
                               `down_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '包下载地址',
                               `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                               `username` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上传人姓名',
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of app_version
-- ----------------------------
INSERT INTO `app_version` VALUES ('1', '狂码工作室', '', '1.0.1', '1', '第一版本', 'https://www.baidu.com', '2022-08-11 12:22:40', '甲粒子');
INSERT INTO `app_version` VALUES ('2', '狂码工作室', '1.0.1', '1.0.2', '1', '第二版本', 'null', '2022-08-12 12:24:03', '甲粒子');
INSERT INTO `app_version` VALUES ('3', '狂码工作室', '1.0.2', '1.0.3', '0', '第三版本', 'null', '2022-08-13 12:24:47', '甲粒子');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
                          `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                          `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
                          `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                          `status` tinyint DEFAULT '1' COMMENT '状态 0禁用 1正常',
                          `comment` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '说明',
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', 'https://i.postimg.cc/c46MVdFd/image.webp', '2022-08-18 12:38:27', '1', '社团招新');
INSERT INTO `banner` VALUES ('2', 'https://i.postimg.cc/j5XLjJdB/banner1.png', '2022-08-18 15:13:53', '1', '狂码招新');
INSERT INTO `banner` VALUES ('3', 'https://i.postimg.cc/v8SbQvt5/java.webp', '2022-08-18 15:23:43', '1', 'Java工程师');

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
                        `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                        `author` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
                        `author_id` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者ID',
                        `title` varchar(25) NOT NULL COMMENT '博客名',
                        `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客内容',
                        `create_time` datetime NOT NULL COMMENT '创建时间',
                        `score` decimal(10,0) DEFAULT '0' COMMENT '评分',
                        `status` tinyint NOT NULL DEFAULT '0' COMMENT '审核状态',
                        `reject_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '拒绝原因',
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', '翟彬州', 'admin', '123', '<p>123</p>', '2022-07-04 19:55:58', '123', '2', null);
INSERT INTO `blog` VALUES ('2', '翟彬州', 'admin', '博客', '<p>132</p>', '2022-07-06 14:27:18', '0', '0', null);

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
                        `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                        `k` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键',
                        `v` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '值',
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('1', 'alipay_app_pub_key', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnes4OIlq1oZevtDyDyKftE8PM5MjQt2K/Bl1pOAAtZhuR335ntkzN64DdmnDWxDzD9UUxMB1zy1jaGyChTI07f7O++rgYzY/wU60YZDcvPr4osWZ2XC9HMjVBzGAMbPDo7WV02G9C6u12e8tdpJNjsd+AHi5QyQ1PK2uZNJOrAnalkuqIG5uM2aNd0P1N8B5x1qQ/F/GTnpN/l/f0kxt8ZLIgKE3ZTN8uLQmh0zbi8d4ziyKfvFGadFfpxaNuswyrQ1hkJiDI4jQQExDhoZISKB/aX3p8Pme7DR2qvn9EYz+0KfUn4NYvGO4No6l+xsLs9ntQrPML6TUBNL8c4bfTQIDAQAB');
INSERT INTO `dict` VALUES ('2', 'alipay_app_pri_key', 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCd6zg4iWrWhl6+0PIPIp+0Tw8zkyNC3Yr8GXWk4AC1mG5Hffme2TM3rgN2acNbEPMP1RTEwHXPLWNobIKFMjTt/s776uBjNj/BTrRhkNy8+viixZnZcL0cyNUHMYAxs8OjtZXTYb0Lq7XZ7y12kk2Ox34AeLlDJDU8ra5k0k6sCdqWS6ogbm4zZo13Q/U3wHnHWpD8X8ZOek3+X9/STG3xksiAoTdlM3y4tCaHTNuLx3jOLIp+8UZp0V+nFo26zDKtDWGQmIMjiNBATEOGhkhIoH9pfenw+Z7sNHaq+f0RjP7Qp9Sfg1i8Y7g2jqX7Gwuz2e1Cs8wvpNQE0vxzht9NAgMBAAECggEAIsXr0E86DljyPfRGiNyn7A1InKO2rP+Znh+BDzggD9yr0+RCdh7/rzALJSTu1nup+f+Cnjx+9IrbC+Bw8SF4FDv6mfBDTrVgXpGVGLLMWHSvETCPyxiPG+qBNh9JSih6WO8gObaY6Rv7ZCzNhwF6QIlfDn2G1ekALAdWkm7Y0frU7fydgGHuOr8ozFKlRVwJNiUdErrnsCXHlZwG2IBtZOUG8zDG5UpH6Mf8PfrfukwptHyf5zYl60EFaphYGQXLLl6VtB6VAVXWEMmqd502p/kdN8n6x4b3rjAlSGOdB4Gm2Pe/myBe47ZS4Cl3jTSE11MPyYjl7pBQtGDBev7+4QKBgQDMs9Cwskb5/I1HlD4W/Vj9orkN7K1CZdvvdMjgw6g194WxPYiMUhshxdGDSW4PNiuBISk+Gs5lRMPjRrtSrywHGTwzhaYlFcZHZPEGEUaVV0VBSYdiVchMgpQNnoYxyikjgUxomdaJ35tfxHXKamyS1MQSzyyQXJIQCL9irSVBJQKBgQDFfh4rfc99f26l/ci6F66zAig490CnuVWWqJsD33wcfg/KQCyWmhccJkdc1XiEU42rWT2eh0J9NeN7/jCSh9KMCtqZKN5NPPM0dWTePqJhKPTUIe24heRUE845LYDForON6z32zRqZHCmQ1MtJnBGwWIzQIk3kHJ4EPi8QZ2mxCQKBgQDKbbOdWN9ZjUeFFnMENwtO3yETRQ7dT29ccGfJ5ZKts5YQ/SHQac2M61vR8caV4mLJMqrfUJD0kjkIw0SxcqseZfUjmjIAEHVg2tCCyIi9XG0PMBBizSPjjWmtwitAh4OBKfcOpbsD4w16egRl5DJ0TVWMqDWQmQqUMqJYiZMCxQKBgGqsV5F4UEXiOhrwvKY/un44UQ+MBeFSizdodOqfoUMmmFLPXQYvzwHGb09mgsU++EuwVUc2miRVoj1MLGJJeOFpz29hEso3fMo+CrC8tiqy26NlfCjqMU10sTRTLrYRzth+Uybm3FINUypGtlNZOHi/K7gUf2wSRQvXpsY+hWk5AoGAKKgGPvx7HyxmgGPGdkHC25xF1SqV7+TdPWSQcf1ZTEYnuKmTfhfStBbQv7L83+f8ZHT7VcCDNtruPuS5ZXZSDmmdb9ckQNftO9l+hblz9WlDzZxmM56/OqSKTlUsgvUiUMJIUUj+y948uJXBtjTWn+eTEV4e5RArbqO8PtPeXOM=');
INSERT INTO `dict` VALUES ('3', 'alipay_zfb_pub_key', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAg1M1VkQLK2QlbCE6eGxXeymvVVe6rS1vdJduV20ov27hip4DSFIDjBdJvmj4YajMrwtnYje84VlT0JbhbY+aqRj26CkaYv2+rEK5oBUBjTvNpoKzUi1+MzahlLFXJRnIzCc+VfC1P3A6i6xoOsw/Iox8Ofss3Y2C7uBkcIrzbFTvypwkOJUSkdKQJlE8t5+ttI1JeCU21ED0jqd6xPzE5U9rJnPe9UjM4g7uMyPRoPu5FGhI5IG3qPgjOICSGiOFFFsy+zvNKKYZuBBQkHBESwiWEWZYoHPuL5tPpANekVJ0mD5HruL7QNgKzffLA5R4r7DVWA6cYC/rTBh/p/F3PwIDAQAB');
INSERT INTO `dict` VALUES ('4', 'alipay_web_appid', '2021003131618647');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
                             `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                             `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
                             `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
                             `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
                             `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
                             `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
                             `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
                             `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
                             `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
                             `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
                             `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
                             `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
                             `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
                             `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
                             `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
                             `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                             `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                             `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
                                    `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                    `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
                                    `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
                                    `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
                                    `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
                                    `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
                                    `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
                                    `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
                                    `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
                                    `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
                                    `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
                                    `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
                                    `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
                                    `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
                                    `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
                                    `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
                                    `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
                                    `sort` int DEFAULT NULL COMMENT '排序',
                                    `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                    `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                    PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
                        `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                        `blog_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章ID',
                        `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
                        `author` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
                        `create_time` datetime NOT NULL COMMENT '创建时间',
                        `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '富文本(内容)',
                        `version` int DEFAULT '0' COMMENT '版本号',
                        `status` tinyint NOT NULL COMMENT '发布状态',
                        `image` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '封面图片',
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '123', '123', '213', '2022-07-03 15:52:20', '<h2><strong>3、运行流程</strong></h2><p><strong>左：客户端 右：服务器端</strong></p><p><a href=\"https://nyimapicture.oss-cn-beijing.aliyuncs.com/img/20210420132155.png\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"background-color: initial; color: rgb(3, 102, 214);\"><img src=\"https://nyimapicture.oss-cn-beijing.aliyuncs.com/img/20210420132155.png\"></a></p><p><br></p><h3><strong>组件解释</strong></h3><ul><li>channel 可以理解为数据的通道</li><li>msg 理解为流动的数据，最开始输入是 ByteBuf，但经过 pipeline 中的各个 handler 加工，会变成其它类型对象，最后输出又变成 ByteBuf</li><li>handler 可以理解为数据的处理工序</li><li>工序有多道，<strong>合在一起就是 pipeline（传递途径）</strong>，pipeline 负责发布事件（读、读取完成…）传播给每个 handler， handler 对自己感兴趣的事件进行处理（重写了相应事件处理方法）</li><li class=\"ql-indent-1\">pipeline 中有多个 handler，处理时会依次调用其中的 handler</li><li>handler 分 Inbound 和 Outbound 两类</li><li class=\"ql-indent-2\">Inbound 入站</li><li class=\"ql-indent-1\">Outbound 出站</li><li>eventLoop 可以理解为处理数据的工人</li><li class=\"ql-indent-1\">eventLoop 可以管理多个 channel 的 io 操作，并且一旦 eventLoop 负责了某个 channel，就<strong>会将其与channel进行绑定</strong>，以后该 channel 中的 io 操作都由该 eventLoop 负责</li><li class=\"ql-indent-1\">eventLoop 既可以执行 io 操作，<strong>也可以进行任务处理</strong>，每个 eventLoop 有自己的任务队列，队列里可以堆放多个 channel 的待处理任务，任务分为普通任务、定时任务</li><li class=\"ql-indent-1\">eventLoop 按照 pipeline 顺序，依次按照 handler 的规划（代码）处理数据，可以为每个 handler 指定不同的 eventLoop</li></ul><h1><strong>三、组件</strong></h1><p><br></p>', '0', '1', '/profile/upload/2022/07/06/2_20220706172052A002.jpg');
INSERT INTO `news` VALUES ('2', 'd1b3344f-1c62-4b09-bc54-705ac851524d', '测试2', '测试人员', '2022-07-03 17:41:06', '<h2><strong class=\"ql-size-large\">3、运行流程</strong></h2><p><strong>左：客户端 右：服务器端</strong></p><p><a href=\"https://nyimapicture.oss-cn-beijing.aliyuncs.com/img/20210420132155.png\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(3, 102, 214); background-color: initial;\"><img src=\"https://nyimapicture.oss-cn-beijing.aliyuncs.com/img/20210420132155.png\"></a></p><p><br></p><p><br></p><p><br></p><p><br></p><h3><strong>组件解释</strong></h3><ul><li>channel 可以理解为数据的通道</li><li>msg 理解为流动的数据，最开始输入是 ByteBuf，但经过 pipeline 中的各个 handler 加工，会变成其它类型对象，最后输出又变成 ByteBuf</li><li>handler 可以理解为数据的处理工序</li><li>工序有多道，<strong>合在一起就是 pipeline（传递途径）</strong>，pipeline 负责发布事件（读、读取完成…）传播给每个 handler， handler 对自己感兴趣的事件进行处理（重写了相应事件处理方法）</li><li class=\"ql-indent-1\">pipeline 中有多个 handler，处理时会依次调用其中的 handler</li><li>handler 分 Inbound 和 Outbound 两类</li><li class=\"ql-indent-2\">Inbound 入站</li><li class=\"ql-indent-1\">Outbound 出站</li><li>eventLoop 可以理解为处理数据的工人</li><li class=\"ql-indent-1\">eventLoop 可以管理多个 channel 的 io 操作，并且一旦 eventLoop 负责了某个 channel，就<strong>会将其与channel进行绑定</strong>，以后该 channel 中的 io 操作都由该 eventLoop 负责</li><li class=\"ql-indent-1\">eventLoop 既可以执行 io 操作，<strong>也可以进行任务处理</strong>，每个 eventLoop 有自己的任务队列，队列里可以堆放多个 channel 的待处理任务，任务分为普通任务、定时任务</li><li class=\"ql-indent-1\">eventLoop 按照 pipeline 顺序，依次按照 handler 的规划（代码）处理数据，可以为每个 handler 指定不同的 eventLoop</li></ul><h1><strong>三、组件</strong></h1>', '0', '1', null);
INSERT INTO `news` VALUES ('3', '96964f47-49be-4bdf-ab8d-aed351767ce9', '123', 'hxx', '2022-07-06 15:49:29', '<p>123</p>', '0', '1', null);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
                         `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                         `order_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
                         `user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
                         `payment` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
                         `payment_type` tinyint NOT NULL DEFAULT '0' COMMENT '支付类型 0-无 1-平台 2-支付宝',
                         `status` tinyint NOT NULL DEFAULT '1' COMMENT '支付状态 -0已取消 -1未付款 -2完成付款 -3退款中 4-退款完成 -5交易成功 -6交易关闭',
                         `status_color` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '颜色 0-橙色 1-绿色 -2红色 4-蓝色',
                         `create_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建时间',
                         `pay_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '支付时间',
                         `close_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '交易关闭时间',
                         `end_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '交易完成时间',
                         `subject` varchar(100) DEFAULT NULL COMMENT '支付宝subject',
                         `body` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '支付宝body',
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('32', '1660574911719487011791', '487011791', '1.00', '2', '5', '#00CC00', '2022-08-15 22:48:31', null, '2022-08-15 23:18:31', null, '平台充值', '平台充值');
INSERT INTO `order` VALUES ('34', '1661139683505487011791', '487011791', '1.00', '2', '5', '#00CC00', '2022-08-22 11:41:23', '2022-08-22 11:41:52', '2022-08-22 12:11:23', '2022-08-22 11:41:52', '平台充值', '平台充值');
INSERT INTO `order` VALUES ('54', '1661158472956487011791', '487011791', '1.00', '2', '5', '#00CC00', '2022-08-22 16:54:32', '2022-08-22 16:54:50', '2022-08-22 17:24:32', '2022-08-22 16:54:50', '平台充值', '平台充值');
INSERT INTO `order` VALUES ('55', '1661158955584487011791', '487011791', '1.00', '2', '5', '#00CC00', '2022-08-22 17:02:35', '2022-08-22 17:03:09', '2022-08-22 17:32:35', '2022-08-22 17:03:09', '平台充值', '平台充值');
INSERT INTO `order` VALUES ('60', '1661188247753487011791', '487011791', '2.00', '2', '1', '#FF9900', '2022-08-23 01:10:47', null, '2022-08-23 01:40:47', null, '平台充值', '平台充值');
INSERT INTO `order` VALUES ('62', '1661243827473633224399', '633224399', '100.00', '2', '1', '#FF9900', '2022-08-23 16:37:07', null, '2022-08-23 16:47:07', null, '平台充值', '平台充值');
INSERT INTO `order` VALUES ('63', '1661244704365633224399', '633224399', '1000.00', '2', '1', '#FF9900', '2022-08-23 16:51:44', null, '2022-08-23 17:21:44', null, '平台充值', '平台充值');
INSERT INTO `order` VALUES ('64', '1661342843581633224399', '633224399', '1.00', '2', '1', '#FF9900', '2022-08-24 20:07:23', null, '2022-08-24 20:37:23', null, '平台充值', '平台充值');
INSERT INTO `order` VALUES ('65', '1661442253733633224399', '633224399', '100.00', '2', '1', '#FF9900', '2022-08-25 23:44:13', null, '2022-08-26 00:14:13', null, '平台充值', '平台充值');
INSERT INTO `order` VALUES ('66', '1661502826325633224399', '633224399', '100.00', '2', '1', '#FF9900', '2022-08-26 16:33:46', null, '2022-08-26 17:03:46', null, '平台充值', '平台充值');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
                          `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                          `order_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
                          `user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
                          `payment` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
                          `payment_type` tinyint NOT NULL DEFAULT '0' COMMENT '支付类型 0-无 1-平台 2-支付宝',
                          `status` tinyint NOT NULL DEFAULT '1' COMMENT '支付状态 -0已取消 -1未付款 -2完成付款 -3退款中 4-退款完成 -5交易成功 -6交易关闭',
                          `status_color` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '颜色 0-橙色 1-绿色 -2红色 4-蓝色',
                          `create_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建时间',
                          `pay_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '支付时间',
                          `close_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '交易关闭时间',
                          `end_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '交易完成时间',
                          `subject` varchar(100) DEFAULT NULL COMMENT '支付宝subject',
                          `body` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '支付宝body',
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('32', '1660574911719487011791', '487011791', '1.00', '2', '5', '#00CC00', '2022-08-15 22:48:31', null, '2022-08-15 23:18:31', null, '平台充值', '平台充值');
INSERT INTO `orders` VALUES ('34', '1661139683505487011791', '487011791', '1.00', '2', '5', '#00CC00', '2022-08-22 11:41:23', '2022-08-22 11:41:52', '2022-08-22 12:11:23', '2022-08-22 11:41:52', '平台充值', '平台充值');
INSERT INTO `orders` VALUES ('54', '1661158472956487011791', '487011791', '1.00', '2', '5', '#00CC00', '2022-08-22 16:54:32', '2022-08-22 16:54:50', '2022-08-22 17:24:32', '2022-08-22 16:54:50', '平台充值', '平台充值');
INSERT INTO `orders` VALUES ('55', '1661158955584487011791', '487011791', '1.00', '2', '5', '#00CC00', '2022-08-22 17:02:35', '2022-08-22 17:03:09', '2022-08-22 17:32:35', '2022-08-22 17:03:09', '平台充值', '平台充值');
INSERT INTO `orders` VALUES ('60', '1661188247753487011791', '487011791', '2.00', '2', '1', '#FF9900', '2022-08-23 01:10:47', null, '2022-08-23 01:40:47', null, '平台充值', '平台充值');
INSERT INTO `orders` VALUES ('62', '1661243827473633224399', '633224399', '100.00', '2', '1', '#FF9900', '2022-08-23 16:37:07', null, '2022-08-23 16:47:07', null, '平台充值', '平台充值');
INSERT INTO `orders` VALUES ('63', '1661244704365633224399', '633224399', '1000.00', '2', '1', '#FF9900', '2022-08-23 16:51:44', null, '2022-08-23 17:21:44', null, '平台充值', '平台充值');
INSERT INTO `orders` VALUES ('64', '1661342843581633224399', '633224399', '1.00', '2', '1', '#FF9900', '2022-08-24 20:07:23', null, '2022-08-24 20:37:23', null, '平台充值', '平台充值');
INSERT INTO `orders` VALUES ('65', '1661442253733633224399', '633224399', '100.00', '2', '1', '#FF9900', '2022-08-25 23:44:13', null, '2022-08-26 00:14:13', null, '平台充值', '平台充值');
INSERT INTO `orders` VALUES ('66', '1661502826325633224399', '633224399', '100.00', '2', '1', '#FF9900', '2022-08-26 16:33:46', null, '2022-08-26 17:03:46', null, '平台充值', '平台充值');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
                                      `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                      `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                      `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                      `blob_data` blob COMMENT '存放持久化Trigger对象',
                                      PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
                                      CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
                                  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
                                  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
                                  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
                                      `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                      `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                      `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                      `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
                                      `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
                                      PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
                                      CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
                                       `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                       `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
                                       `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                       `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                       `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
                                       `fired_time` bigint NOT NULL COMMENT '触发的时间',
                                       `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
                                       `priority` int NOT NULL COMMENT '优先级',
                                       `state` varchar(16) NOT NULL COMMENT '状态',
                                       `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
                                       `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
                                       `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
                                       `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
                                       PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
                                    `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                    `job_name` varchar(200) NOT NULL COMMENT '任务名称',
                                    `job_group` varchar(200) NOT NULL COMMENT '任务组名',
                                    `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
                                    `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
                                    `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
                                    `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
                                    `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
                                    `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
                                    `job_data` blob COMMENT '存放持久化job对象',
                                    PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
                              `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                              `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
                              PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
                                            `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                            `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                            PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
                                        `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                        `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
                                        `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
                                        `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
                                        PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
                                        `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                        `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                        `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                        `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
                                        `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
                                        `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
                                        PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
                                        CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
                                         `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                         `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                         `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                         `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
                                         `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
                                         `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
                                         `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
                                         `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
                                         `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
                                         `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
                                         `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
                                         `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
                                         `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
                                         `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
                                         PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
                                         CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
                                 `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
                                 `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
                                 `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
                                 `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
                                 `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
                                 `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
                                 `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
                                 `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
                                 `priority` int DEFAULT NULL COMMENT '优先级',
                                 `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
                                 `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
                                 `start_time` bigint NOT NULL COMMENT '开始时间',
                                 `end_time` bigint DEFAULT NULL COMMENT '结束时间',
                                 `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
                                 `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
                                 `job_data` blob COMMENT '存放持久化job对象',
                                 PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
                                 KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
                                 CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for realname_authentication
-- ----------------------------
DROP TABLE IF EXISTS `realname_authentication`;
CREATE TABLE `realname_authentication` (
                                           `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                           `user_id` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
                                           `studentno` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
                                           `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '认证照片',
                                           `realname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实名',
                                           `card_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证号码',
                                           `status` tinyint(3) unsigned zerofill NOT NULL DEFAULT '000' COMMENT '审核状态',
                                           `reject_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '未通过原因',
                                           `pass_time` datetime NOT NULL COMMENT '通过时间',
                                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of realname_authentication
-- ----------------------------
INSERT INTO `realname_authentication` VALUES ('1', '123456', '3120190971238', 'https://img-blog.csdnimg.cn/20190726001751326.jpeg', '翟彬州', '3120190971238', '001', '   ', '2022-07-04 00:00:00');
INSERT INTO `realname_authentication` VALUES ('2', '234892900', '3120190971238', '/profile/upload/2022/07/15/2_20220715113109A001.jpg', '小翟', '511324200207052495', '000', '暂无', '2022-07-15 11:31:10');
INSERT INTO `realname_authentication` VALUES ('3', '428713419', '3120190971227', '/profile/upload/2022/08/17/照片_20220817153210A001.jpg', '贾晋', null, '000', '暂无', '2022-08-17 15:32:10');
INSERT INTO `realname_authentication` VALUES ('5', '487011791', '3120190971242', '/profile/upload/2022/08/19/1660903491153_1627281577500_20220819180526A008.jpg', '王晓东', null, '001', '暂无', '2022-08-19 18:05:26');

-- ----------------------------
-- Table structure for slogan
-- ----------------------------
DROP TABLE IF EXISTS `slogan`;
CREATE TABLE `slogan` (
                          `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                          `slogan_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '宣传短语',
                          `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
                          `modify_time` datetime NOT NULL COMMENT '更新时间',
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of slogan
-- ----------------------------
INSERT INTO `slogan` VALUES ('1', '202207031732100516', '面如霜下雪，吻如雪上霜', '2022-07-03 00:00:00');

-- ----------------------------
-- Table structure for socket_message
-- ----------------------------
DROP TABLE IF EXISTS `socket_message`;
CREATE TABLE `socket_message` (
                                  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                  `message_type` tinyint NOT NULL COMMENT '消息类型',
                                  `user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
                                  `chat_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '聊天对象id',
                                  `message` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '聊天消息',
                                  `send_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送时间',
                                  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否逻辑删除 1-删除 0-未删除',
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of socket_message
-- ----------------------------
INSERT INTO `socket_message` VALUES ('1', '0', '654321', '123456', '你好', '2022-08-10 17:35:23', '1');
INSERT INTO `socket_message` VALUES ('2', '0', '654321', '123456', '你好', '2022-08-10 17:35:23', '1');
INSERT INTO `socket_message` VALUES ('3', '0', '654321', '123456', '你好', '2022-08-10 17:35:23', '1');
INSERT INTO `socket_message` VALUES ('4', '0', '654321', '123456', '你好', '2022-08-10 17:35:23', '1');
INSERT INTO `socket_message` VALUES ('5', '0', '654321', '123456', '你好', '2022-08-10 17:35:23', '1');
INSERT INTO `socket_message` VALUES ('6', '0', '654321', '123456', '你好', '2022-08-10 17:35:23', '1');
INSERT INTO `socket_message` VALUES ('7', '0', '654321', '123456', '你好', '2022-08-10 17:35:23', '1');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
                              `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
                              `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
                              `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
                              `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
                              `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
                              `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-07-01 15:13:04', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-07-01 15:13:04', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-07-01 15:13:04', '', null, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2022-07-01 15:13:04', '', null, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-07-01 15:13:04', 'admin', '2022-07-02 16:41:55', '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
                            `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
                            `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
                            `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
                            `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
                            `order_num` int DEFAULT '0' COMMENT '显示顺序',
                            `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
                            `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
                            `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
                            `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '在线OJ系统', '0', '山春♥', '', '', '0', '0', 'admin', '2022-07-01 15:13:00', 'admin', '2023-03-03 19:59:28');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '西华大学本部', '1', '翟彬州', '15902824254', '3284717596@qq.com', '0', '0', 'admin', '2022-07-01 15:13:00', 'admin', '2022-07-01 15:30:16');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '其他', '2', '某某', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-07-01 15:13:00', 'admin', '2022-07-01 15:30:35');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '管理组', '1', '', '', '', '0', '0', 'admin', '2022-07-01 15:13:00', 'admin', '2023-03-03 20:00:22');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-07-01 15:13:00', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-07-01 15:13:00', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-07-01 15:13:00', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-07-01 15:13:00', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-07-01 15:13:00', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-07-01 15:13:00', '', null);
INSERT INTO `sys_dept` VALUES ('200', '101', '0,100,101', '多媒体部门', '6', '翟彬州', '15902824254', null, '0', '2', 'admin', '2022-07-01 15:31:27', '', null);
INSERT INTO `sys_dept` VALUES ('201', '101', '0,100,101', '学术研究部门', '7', null, null, null, '0', '2', 'admin', '2022-07-01 15:31:57', '', null);
INSERT INTO `sys_dept` VALUES ('202', '100', '0,100', '前端部门', '1', null, null, null, '0', '2', 'admin', '2022-07-06 16:01:46', '', null);
INSERT INTO `sys_dept` VALUES ('203', '101', '0,100,101', '前端部门', '1', null, null, null, '0', '2', 'admin', '2022-07-06 16:02:26', '', null);
INSERT INTO `sys_dept` VALUES ('204', '101', '0,100,101', '后端部门', '2', null, null, null, '0', '2', 'admin', '2022-07-06 16:02:43', '', null);
INSERT INTO `sys_dept` VALUES ('205', '101', '0,100,101', '大前端部门', '1', null, null, null, '0', '2', 'admin', '2022-07-06 16:03:00', '', null);
INSERT INTO `sys_dept` VALUES ('206', '101', '0,100,101', '全栈部门', '0', null, null, null, '0', '2', 'admin', '2022-07-06 16:03:13', '', null);
INSERT INTO `sys_dept` VALUES ('207', '101', '0,100,101', '电竞俱乐部', '8', null, null, null, '0', '2', 'admin', '2022-07-06 16:04:10', '', null);
INSERT INTO `sys_dept` VALUES ('208', '101', '0,100,101', '文化传媒部门', '0', null, null, null, '0', '2', 'admin', '2022-07-07 16:28:47', '', null);
INSERT INTO `sys_dept` VALUES ('209', '101', '0,100,101', '老师组', '2', null, null, null, '0', '0', 'admin', '2023-03-03 20:00:55', '', null);
INSERT INTO `sys_dept` VALUES ('210', '101', '0,100,101', '学生组', '2', null, null, null, '0', '0', 'admin', '2023-03-03 20:01:15', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
                                 `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
                                 `dict_sort` int DEFAULT '0' COMMENT '字典排序',
                                 `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
                                 `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
                                 `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
                                 `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
                                 `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
                                 `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
                                 `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-07-01 15:13:03', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-07-01 15:13:03', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-07-01 15:13:03', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-07-01 15:13:03', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-07-01 15:13:03', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-07-01 15:13:03', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-07-01 15:13:03', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-07-01 15:13:03', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-07-01 15:13:03', '', null, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
                                 `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
                                 `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
                                 `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
                                 `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`dict_id`),
                                 UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2022-07-01 15:13:03', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2022-07-01 15:13:03', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2022-07-01 15:13:03', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2022-07-01 15:13:03', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2022-07-01 15:13:03', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2022-07-01 15:13:03', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2022-07-01 15:13:03', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2022-07-01 15:13:03', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2022-07-01 15:13:03', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2022-07-01 15:13:03', '', null, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
                           `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
                           `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
                           `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
                           `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
                           `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
                           `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
                           `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
                           `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
                           `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                           `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                           `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                           `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                           `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
                           PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-07-01 15:13:04', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-07-01 15:13:04', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-07-01 15:13:04', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
                               `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
                               `job_name` varchar(64) NOT NULL COMMENT '任务名称',
                               `job_group` varchar(64) NOT NULL COMMENT '任务组名',
                               `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
                               `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
                               `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
                               `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
                               `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                               PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
                                  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
                                  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
                                  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
                                  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
                                  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
                                  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
                                  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
                                  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
                                  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
                                  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-01 15:22:40');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-07-01 15:43:12');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-11-05 14:29:58');
INSERT INTO `sys_logininfor` VALUES ('205', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-03 18:17:06');
INSERT INTO `sys_logininfor` VALUES ('206', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-03 19:53:44');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
                            `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
                            `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
                            `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
                            `order_num` int DEFAULT '0' COMMENT '显示顺序',
                            `path` varchar(200) DEFAULT '' COMMENT '路由地址',
                            `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
                            `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
                            `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
                            `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
                            `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
                            `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
                            `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
                            `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
                            `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT '' COMMENT '备注',
                            PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2022-07-01 15:13:02', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', 'monitor', null, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2022-07-01 15:13:02', '', null, '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '', '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2022-07-01 15:13:02', '', null, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-07-01 15:13:02', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-07-01 15:13:02', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-07-01 15:13:02', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-07-01 15:13:02', '', null, '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-07-01 15:13:02', '', null, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-07-01 15:13:02', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-07-01 15:13:02', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-07-01 15:13:02', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2022-07-01 15:13:02', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-07-01 15:13:02', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-07-01 15:13:02', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-07-01 15:13:02', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-07-01 15:13:02', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-07-01 15:13:02', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '缓存列表', '2', '6', 'cacheList', 'monitor/cache/list', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2022-07-01 15:13:02', '', null, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES ('115', '表单构建', '3', '1', 'build', 'tool/build/index', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-07-01 15:13:02', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('116', '代码生成', '3', '2', 'gen', 'tool/gen/index', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-07-01 15:13:02', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('117', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-07-01 15:13:02', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-07-01 15:13:02', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-07-01 15:13:02', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '日志导出', '500', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '登录查询', '501', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录删除', '501', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '日志导出', '501', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '在线查询', '109', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '批量强退', '109', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '单条强退', '109', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '任务查询', '110', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '任务新增', '110', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务修改', '110', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务删除', '110', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '状态修改', '110', '5', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '任务导出', '110', '7', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '生成查询', '115', '1', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成修改', '115', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成删除', '115', '3', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '导入代码', '115', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '预览代码', '115', '4', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '生成代码', '115', '5', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-07-01 15:13:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('2000', '平台管理', '0', '5', '/kmappmanage', null, null, '1', '0', 'M', '0', '0', '', 'list', 'admin', '2022-07-02 15:17:07', 'admin', '2022-11-05 14:23:33', '');
INSERT INTO `sys_menu` VALUES ('2001', '用户管理', '2000', '1', 'usermanage', 'kmappmanage/usermanage/index', null, '1', '0', 'C', '0', '0', 'kmappmanage:usermanage:list', 'peoples', 'admin', '2022-07-02 15:26:17', 'admin', '2022-07-02 15:49:54', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('2002', '用户管理查询', '2001', '1', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:usermanage:query', '#', 'admin', '2022-07-02 15:26:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('2003', '用户管理新增', '2001', '2', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:usermanage:add', '#', 'admin', '2022-07-02 15:26:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('2004', '用户管理修改', '2001', '3', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:usermanage:edit', '#', 'admin', '2022-07-02 15:26:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '用户管理删除', '2001', '4', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:usermanage:remove', '#', 'admin', '2022-07-02 15:26:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '用户管理导出', '2001', '5', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:usermanage:export', '#', 'admin', '2022-07-02 15:26:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('2013', '新闻管理', '2000', '1', 'news', 'kmappmanage/news/index', null, '1', '0', 'C', '0', '0', 'kmappmanage:news:list', 'documentation', 'admin', '2022-07-03 15:40:09', 'admin', '2023-03-03 19:56:29', '狂码新闻菜单');
INSERT INTO `sys_menu` VALUES ('2014', '狂码新闻查询', '2013', '1', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:news:query', '#', 'admin', '2022-07-03 15:40:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('2015', '狂码新闻新增', '2013', '2', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:news:add', '#', 'admin', '2022-07-03 15:40:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '狂码新闻修改', '2013', '3', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:news:edit', '#', 'admin', '2022-07-03 15:40:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('2017', '狂码新闻删除', '2013', '4', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:news:remove', '#', 'admin', '2022-07-03 15:40:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '狂码新闻导出', '2013', '5', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:news:export', '#', 'admin', '2022-07-03 15:40:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('2031', '博客管理', '2000', '1', 'blog', 'kmappmanage/blog/index', null, '1', '0', 'C', '0', '0', 'kmappmanage:blog:list', 'log', 'admin', '2022-07-04 16:13:10', 'admin', '2022-07-04 16:16:44', '博客管理菜单');
INSERT INTO `sys_menu` VALUES ('2032', '博客管理查询', '2031', '1', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:blog:query', '#', 'admin', '2022-07-04 16:13:10', '', null, '');
INSERT INTO `sys_menu` VALUES ('2033', '博客管理新增', '2031', '2', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:blog:add', '#', 'admin', '2022-07-04 16:13:10', '', null, '');
INSERT INTO `sys_menu` VALUES ('2034', '博客管理修改', '2031', '3', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:blog:edit', '#', 'admin', '2022-07-04 16:13:10', '', null, '');
INSERT INTO `sys_menu` VALUES ('2035', '博客管理删除', '2031', '4', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:blog:remove', '#', 'admin', '2022-07-04 16:13:10', '', null, '');
INSERT INTO `sys_menu` VALUES ('2036', '博客管理导出', '2031', '5', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:blog:export', '#', 'admin', '2022-07-04 16:13:10', '', null, '');
INSERT INTO `sys_menu` VALUES ('2037', '我的博客', '2000', '1', 'myblog', 'kmappmanage/blog/myblog', null, '1', '0', 'C', '0', '0', 'kmappmanage:blog:list', 'edit', 'admin', '2022-07-04 17:14:48', 'admin', '2022-07-04 17:22:37', '');
INSERT INTO `sys_menu` VALUES ('2038', '广告管理', '2000', '1', 'ad', 'kmappmanage/ad/index', null, '1', '0', 'C', '0', '0', 'kmappmanage:ad:list', 'clipboard', 'admin', '2022-07-07 13:04:36', 'admin', '2022-07-07 13:07:55', '广告管理菜单');
INSERT INTO `sys_menu` VALUES ('2039', '广告管理查询', '2038', '1', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:ad:query', '#', 'admin', '2022-07-07 13:04:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('2040', '广告管理新增', '2038', '2', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:ad:add', '#', 'admin', '2022-07-07 13:04:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('2041', '广告管理修改', '2038', '3', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:ad:edit', '#', 'admin', '2022-07-07 13:04:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('2042', '广告管理删除', '2038', '4', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:ad:remove', '#', 'admin', '2022-07-07 13:04:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('2043', '广告管理导出', '2038', '5', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:ad:export', '#', 'admin', '2022-07-07 13:04:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('2056', '字典管理', '2000', '1', 'dict', 'kmappmanage/dict/index', null, '1', '0', 'C', '0', '0', 'kmappmanage:dict:list', 'dict', 'admin', '2022-07-30 08:26:28', 'admin', '2022-07-30 08:28:12', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('2057', '字典管理查询', '2056', '1', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:dict:query', '#', 'admin', '2022-07-30 08:26:28', '', null, '');
INSERT INTO `sys_menu` VALUES ('2058', '字典管理新增', '2056', '2', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:dict:add', '#', 'admin', '2022-07-30 08:26:28', '', null, '');
INSERT INTO `sys_menu` VALUES ('2059', '字典管理修改', '2056', '3', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:dict:edit', '#', 'admin', '2022-07-30 08:26:28', '', null, '');
INSERT INTO `sys_menu` VALUES ('2060', '字典管理删除', '2056', '4', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:dict:remove', '#', 'admin', '2022-07-30 08:26:28', '', null, '');
INSERT INTO `sys_menu` VALUES ('2061', '字典管理导出', '2056', '5', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:dict:export', '#', 'admin', '2022-07-30 08:26:28', '', null, '');
INSERT INTO `sys_menu` VALUES ('2062', '应用订单', '2000', '1', 'order', 'kmappmanage/order/index', null, '1', '0', 'C', '0', '0', 'kmappmanage:order:list', 'edit', 'admin', '2022-07-30 09:28:04', 'admin', '2022-07-30 09:30:11', '应用订单菜单');
INSERT INTO `sys_menu` VALUES ('2063', '应用订单查询', '2062', '1', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:order:query', '#', 'admin', '2022-07-30 09:28:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2064', '应用订单新增', '2062', '2', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:order:add', '#', 'admin', '2022-07-30 09:28:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2065', '应用订单修改', '2062', '3', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:order:edit', '#', 'admin', '2022-07-30 09:28:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2066', '应用订单删除', '2062', '4', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:order:remove', '#', 'admin', '2022-07-30 09:28:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2067', '应用订单导出', '2062', '5', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:order:export', '#', 'admin', '2022-07-30 09:28:04', '', null, '');
INSERT INTO `sys_menu` VALUES ('2074', '用户收入', '2000', '1', 'income', 'kmappmanage/income/index', null, '1', '0', 'C', '0', '0', 'kmappmanage:income:list', 'list', 'admin', '2022-08-02 22:46:51', 'admin', '2022-08-02 22:59:48', '用户收入菜单');
INSERT INTO `sys_menu` VALUES ('2075', '用户收入查询', '2074', '1', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:income:query', '#', 'admin', '2022-08-02 22:46:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2076', '用户收入新增', '2074', '2', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:income:add', '#', 'admin', '2022-08-02 22:46:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2077', '用户收入修改', '2074', '3', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:income:edit', '#', 'admin', '2022-08-02 22:46:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2078', '用户收入删除', '2074', '4', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:income:remove', '#', 'admin', '2022-08-02 22:46:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2079', '用户收入导出', '2074', '5', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:income:export', '#', 'admin', '2022-08-02 22:46:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2080', '用户支出', '2000', '1', 'expenditure', 'kmappmanage/expenditure/index', null, '1', '0', 'C', '0', '0', 'kmappmanage:expenditure:list', 'money', 'admin', '2022-08-02 22:48:35', 'admin', '2022-08-02 23:00:17', '用户支出菜单');
INSERT INTO `sys_menu` VALUES ('2081', '用户支出查询', '2080', '1', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:expenditure:query', '#', 'admin', '2022-08-02 22:48:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('2082', '用户支出新增', '2080', '2', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:expenditure:add', '#', 'admin', '2022-08-02 22:48:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('2083', '用户支出修改', '2080', '3', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:expenditure:edit', '#', 'admin', '2022-08-02 22:48:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('2084', '用户支出删除', '2080', '4', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:expenditure:remove', '#', 'admin', '2022-08-02 22:48:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('2085', '用户支出导出', '2080', '5', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:expenditure:export', '#', 'admin', '2022-08-02 22:48:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('2086', '应用版本', '2000', '1', 'appversion', 'kmappmanage/appversion/index', null, '1', '0', 'C', '0', '0', 'kmappmanage:appversion:list', 'system', 'admin', '2022-08-11 10:29:10', 'admin', '2022-08-11 10:33:02', '应用版本菜单');
INSERT INTO `sys_menu` VALUES ('2087', '应用版本查询', '2086', '1', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:appversion:query', '#', 'admin', '2022-08-11 10:29:10', '', null, '');
INSERT INTO `sys_menu` VALUES ('2088', '应用版本新增', '2086', '2', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:appversion:add', '#', 'admin', '2022-08-11 10:29:10', '', null, '');
INSERT INTO `sys_menu` VALUES ('2089', '应用版本修改', '2086', '3', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:appversion:edit', '#', 'admin', '2022-08-11 10:29:10', '', null, '');
INSERT INTO `sys_menu` VALUES ('2090', '应用版本删除', '2086', '4', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:appversion:remove', '#', 'admin', '2022-08-11 10:29:10', '', null, '');
INSERT INTO `sys_menu` VALUES ('2091', '应用版本导出', '2086', '5', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:appversion:export', '#', 'admin', '2022-08-11 10:29:10', '', null, '');
INSERT INTO `sys_menu` VALUES ('2092', 'banner', '2000', '1', 'kmbanner', 'kmappmanage/kmbanner/index', null, '1', '0', 'C', '0', '0', 'kmappmanage:kmbanner:list', 'post', 'admin', '2022-08-18 12:01:35', 'admin', '2023-03-03 19:54:59', '狂码banner菜单');
INSERT INTO `sys_menu` VALUES ('2093', '狂码banner查询', '2092', '1', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:kmbanner:query', '#', 'admin', '2022-08-18 12:01:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('2094', '狂码banner新增', '2092', '2', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:kmbanner:add', '#', 'admin', '2022-08-18 12:01:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('2095', '狂码banner修改', '2092', '3', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:kmbanner:edit', '#', 'admin', '2022-08-18 12:01:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('2096', '狂码banner删除', '2092', '4', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:kmbanner:remove', '#', 'admin', '2022-08-18 12:01:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('2097', '狂码banner导出', '2092', '5', '#', '', null, '1', '0', 'F', '0', '0', 'kmappmanage:kmbanner:export', '#', 'admin', '2022-08-18 12:01:35', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
                              `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
                              `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
                              `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
                              `notice_content` longblob COMMENT '公告内容',
                              `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
                              `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(255) DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
                                `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
                                `title` varchar(50) DEFAULT '' COMMENT '模块标题',
                                `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
                                `method` varchar(100) DEFAULT '' COMMENT '方法名称',
                                `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
                                `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
                                `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
                                `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
                                `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
                                `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
                                `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
                                `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
                                `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
                                `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
                                `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
                                `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
                                PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('193', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-07-02 15:17:07\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"平台管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"/kmappmanage\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:23:33');
INSERT INTO `sys_oper_log` VALUES ('194', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2012', '127.0.0.1', '内网IP', '{menuId=2012}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:23:47');
INSERT INTO `sys_oper_log` VALUES ('195', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2008', '127.0.0.1', '内网IP', '{menuId=2008}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:23:52');
INSERT INTO `sys_oper_log` VALUES ('196', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2009', '127.0.0.1', '内网IP', '{menuId=2009}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:23:55');
INSERT INTO `sys_oper_log` VALUES ('197', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2010', '127.0.0.1', '内网IP', '{menuId=2010}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:23:58');
INSERT INTO `sys_oper_log` VALUES ('198', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2011', '127.0.0.1', '内网IP', '{menuId=2011}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:24:00');
INSERT INTO `sys_oper_log` VALUES ('199', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2007', '127.0.0.1', '内网IP', '{menuId=2007}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:24:03');
INSERT INTO `sys_oper_log` VALUES ('200', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2045', '127.0.0.1', '内网IP', '{menuId=2045}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:24:21');
INSERT INTO `sys_oper_log` VALUES ('201', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2046', '127.0.0.1', '内网IP', '{menuId=2046}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:24:24');
INSERT INTO `sys_oper_log` VALUES ('202', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2047', '127.0.0.1', '内网IP', '{menuId=2047}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:24:27');
INSERT INTO `sys_oper_log` VALUES ('203', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2048', '127.0.0.1', '内网IP', '{menuId=2048}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:24:29');
INSERT INTO `sys_oper_log` VALUES ('204', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2049', '127.0.0.1', '内网IP', '{menuId=2049}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:24:31');
INSERT INTO `sys_oper_log` VALUES ('205', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2044', '127.0.0.1', '内网IP', '{menuId=2044}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:24:35');
INSERT INTO `sys_oper_log` VALUES ('206', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2051', '127.0.0.1', '内网IP', '{menuId=2051}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:24:40');
INSERT INTO `sys_oper_log` VALUES ('207', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2052', '127.0.0.1', '内网IP', '{menuId=2052}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:24:42');
INSERT INTO `sys_oper_log` VALUES ('208', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2053', '127.0.0.1', '内网IP', '{menuId=2053}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:24:45');
INSERT INTO `sys_oper_log` VALUES ('209', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2054', '127.0.0.1', '内网IP', '{menuId=2054}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:24:47');
INSERT INTO `sys_oper_log` VALUES ('210', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2055', '127.0.0.1', '内网IP', '{menuId=2055}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:24:49');
INSERT INTO `sys_oper_log` VALUES ('211', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2050', '127.0.0.1', '内网IP', '{menuId=2050}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:24:52');
INSERT INTO `sys_oper_log` VALUES ('212', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2069', '127.0.0.1', '内网IP', '{menuId=2069}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:25:01');
INSERT INTO `sys_oper_log` VALUES ('213', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2070', '127.0.0.1', '内网IP', '{menuId=2070}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:25:04');
INSERT INTO `sys_oper_log` VALUES ('214', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2071', '127.0.0.1', '内网IP', '{menuId=2071}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:25:07');
INSERT INTO `sys_oper_log` VALUES ('215', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2072', '127.0.0.1', '内网IP', '{menuId=2072}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:25:09');
INSERT INTO `sys_oper_log` VALUES ('216', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2073', '127.0.0.1', '内网IP', '{menuId=2073}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:25:11');
INSERT INTO `sys_oper_log` VALUES ('217', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2099', '127.0.0.1', '内网IP', '{menuId=2099}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:25:24');
INSERT INTO `sys_oper_log` VALUES ('218', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2100', '127.0.0.1', '内网IP', '{menuId=2100}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:25:27');
INSERT INTO `sys_oper_log` VALUES ('219', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2101', '127.0.0.1', '内网IP', '{menuId=2101}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:25:30');
INSERT INTO `sys_oper_log` VALUES ('220', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2102', '127.0.0.1', '内网IP', '{menuId=2102}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:25:33');
INSERT INTO `sys_oper_log` VALUES ('221', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2103', '127.0.0.1', '内网IP', '{menuId=2103}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:25:37');
INSERT INTO `sys_oper_log` VALUES ('222', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2098', '127.0.0.1', '内网IP', '{menuId=2098}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 14:25:39');
INSERT INTO `sys_oper_log` VALUES ('223', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2013', '127.0.0.1', '内网IP', '{menuId=2013}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2023-03-03 19:54:18');
INSERT INTO `sys_oper_log` VALUES ('224', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2014', '127.0.0.1', '内网IP', '{menuId=2014}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2023-03-03 19:54:23');
INSERT INTO `sys_oper_log` VALUES ('225', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2018', '127.0.0.1', '内网IP', '{menuId=2018}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2023-03-03 19:54:29');
INSERT INTO `sys_oper_log` VALUES ('226', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2013', '127.0.0.1', '内网IP', '{menuId=2013}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2023-03-03 19:54:38');
INSERT INTO `sys_oper_log` VALUES ('227', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2068', '127.0.0.1', '内网IP', '{menuId=2068}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:54:46');
INSERT INTO `sys_oper_log` VALUES ('228', '菜单管理', '2', 'cn.oj.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"kmappmanage/kmbanner/index\",\"createTime\":\"2022-08-18 12:01:35\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2092,\"menuName\":\"banner\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"kmbanner\",\"perms\":\"kmappmanage:kmbanner:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:54:59');
INSERT INTO `sys_oper_log` VALUES ('229', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2080', '127.0.0.1', '内网IP', '{menuId=2080}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2023-03-03 19:55:02');
INSERT INTO `sys_oper_log` VALUES ('230', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2030', '127.0.0.1', '内网IP', '{menuId=2030}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:55:32');
INSERT INTO `sys_oper_log` VALUES ('231', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2029', '127.0.0.1', '内网IP', '{menuId=2029}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:55:35');
INSERT INTO `sys_oper_log` VALUES ('232', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2028', '127.0.0.1', '内网IP', '{menuId=2028}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:55:37');
INSERT INTO `sys_oper_log` VALUES ('233', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2027', '127.0.0.1', '内网IP', '{menuId=2027}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:55:40');
INSERT INTO `sys_oper_log` VALUES ('234', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2026', '127.0.0.1', '内网IP', '{menuId=2026}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:55:43');
INSERT INTO `sys_oper_log` VALUES ('235', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2025', '127.0.0.1', '内网IP', '{menuId=2025}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:55:50');
INSERT INTO `sys_oper_log` VALUES ('236', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2024', '127.0.0.1', '内网IP', '{menuId=2024}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:55:57');
INSERT INTO `sys_oper_log` VALUES ('237', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2023', '127.0.0.1', '内网IP', '{menuId=2023}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:56:00');
INSERT INTO `sys_oper_log` VALUES ('238', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2022', '127.0.0.1', '内网IP', '{menuId=2022}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:56:02');
INSERT INTO `sys_oper_log` VALUES ('239', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2021', '127.0.0.1', '内网IP', '{menuId=2021}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:56:05');
INSERT INTO `sys_oper_log` VALUES ('240', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2020', '127.0.0.1', '内网IP', '{menuId=2020}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:56:07');
INSERT INTO `sys_oper_log` VALUES ('241', '菜单管理', '3', 'cn.oj.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/2019', '127.0.0.1', '内网IP', '{menuId=2019}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:56:11');
INSERT INTO `sys_oper_log` VALUES ('242', '菜单管理', '2', 'cn.oj.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"kmappmanage/news/index\",\"createTime\":\"2022-07-03 15:40:09\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"新闻管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"news\",\"perms\":\"kmappmanage:news:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:56:29');
INSERT INTO `sys_oper_log` VALUES ('243', '用户管理', '2', 'cn.oj.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-07-01 15:13:01\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"\",\"loginDate\":\"2023-03-03 19:53:45\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"小山春❤\",\"params\":{},\"password\":\"\",\"phonenumber\":\"\",\"postIds\":[1],\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":\"1\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', null, '1', '不允许操作超级管理员用户', '2023-03-03 19:57:49');
INSERT INTO `sys_oper_log` VALUES ('244', '用户管理', '2', 'cn.oj.web.controller.system.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-07-01 15:13:01\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"\",\"loginDate\":\"2023-03-03 19:53:45\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"小山春❤\",\"params\":{},\"password\":\"\",\"phonenumber\":\"\",\"postIds\":[1],\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":\"1\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', null, '1', '不允许操作超级管理员用户', '2023-03-03 19:57:52');
INSERT INTO `sys_oper_log` VALUES ('245', '部门管理', '2', 'cn.oj.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-07-01 15:13:00\",\"delFlag\":\"0\",\"deptId\":100,\"deptName\":\"在线OJ系统\",\"email\":\"\",\"leader\":\"山春♥\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:59:28');
INSERT INTO `sys_oper_log` VALUES ('246', '部门管理', '3', 'cn.oj.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/207', '127.0.0.1', '内网IP', '{deptId=207}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:59:38');
INSERT INTO `sys_oper_log` VALUES ('247', '部门管理', '3', 'cn.oj.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/201', '127.0.0.1', '内网IP', '{deptId=201}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:59:41');
INSERT INTO `sys_oper_log` VALUES ('248', '部门管理', '3', 'cn.oj.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/200', '127.0.0.1', '内网IP', '{deptId=200}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:59:43');
INSERT INTO `sys_oper_log` VALUES ('249', '部门管理', '3', 'cn.oj.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/107', '127.0.0.1', '内网IP', '{deptId=107}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:59:45');
INSERT INTO `sys_oper_log` VALUES ('250', '部门管理', '3', 'cn.oj.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/106', '127.0.0.1', '内网IP', '{deptId=106}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:59:47');
INSERT INTO `sys_oper_log` VALUES ('251', '部门管理', '3', 'cn.oj.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/105', '127.0.0.1', '内网IP', '{deptId=105}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:59:49');
INSERT INTO `sys_oper_log` VALUES ('252', '部门管理', '3', 'cn.oj.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/204', '127.0.0.1', '内网IP', '{deptId=204}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:59:51');
INSERT INTO `sys_oper_log` VALUES ('253', '部门管理', '3', 'cn.oj.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/104', '127.0.0.1', '内网IP', '{deptId=104}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:59:54');
INSERT INTO `sys_oper_log` VALUES ('254', '部门管理', '3', 'cn.oj.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/205', '127.0.0.1', '内网IP', '{deptId=205}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:59:56');
INSERT INTO `sys_oper_log` VALUES ('255', '部门管理', '3', 'cn.oj.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/203', '127.0.0.1', '内网IP', '{deptId=203}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 19:59:58');
INSERT INTO `sys_oper_log` VALUES ('256', '部门管理', '3', 'cn.oj.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/103', '127.0.0.1', '内网IP', '{deptId=103}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', '0', null, '2023-03-03 20:00:00');
INSERT INTO `sys_oper_log` VALUES ('257', '部门管理', '3', 'cn.oj.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/208', '127.0.0.1', '内网IP', '{deptId=208}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 20:00:05');
INSERT INTO `sys_oper_log` VALUES ('258', '部门管理', '3', 'cn.oj.web.controller.system.SysDeptController.remove()', 'DELETE', '1', 'admin', null, '/system/dept/103', '127.0.0.1', '内网IP', '{deptId=103}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', '0', null, '2023-03-03 20:00:06');
INSERT INTO `sys_oper_log` VALUES ('259', '部门管理', '2', 'cn.oj.web.controller.system.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-07-01 15:13:00\",\"delFlag\":\"0\",\"deptId\":103,\"deptName\":\"管理组\",\"email\":\"\",\"leader\":\"\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 20:00:22');
INSERT INTO `sys_oper_log` VALUES ('260', '部门管理', '1', 'cn.oj.web.controller.system.SysDeptController.add()', 'POST', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"老师组\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 20:00:55');
INSERT INTO `sys_oper_log` VALUES ('261', '部门管理', '1', 'cn.oj.web.controller.system.SysDeptController.add()', 'POST', '1', 'admin', null, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"学生组\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 20:01:15');
INSERT INTO `sys_oper_log` VALUES ('262', '个人信息', '2', 'cn.oj.web.controller.system.SysProfileController.updateProfile()', 'PUT', '1', 'admin', null, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-07-01 15:13:01\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"2285096803@qq.com\",\"loginDate\":\"2023-03-03 18:17:06\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"山春♥\",\"params\":{},\"phonenumber\":\"15082795191\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":\"1\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2023-03-03 20:03:07');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
                            `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
                            `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
                            `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
                            `post_sort` int NOT NULL COMMENT '显示顺序',
                            `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2022-07-01 15:13:01', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2022-07-01 15:13:01', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2022-07-01 15:13:01', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '优秀成员', '5', '0', 'admin', '2022-07-01 15:13:01', 'admin', '2022-07-01 15:33:39', '');
INSERT INTO `sys_post` VALUES ('5', 'group', '组长', '4', '0', 'admin', '2022-07-01 15:33:25', '', null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
                            `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
                            `role_name` varchar(30) NOT NULL COMMENT '角色名称',
                            `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
                            `role_sort` int NOT NULL COMMENT '显示顺序',
                            `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
                            `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
                            `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
                            `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2022-07-01 15:13:02', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2022-07-01 15:13:02', 'admin', '2022-07-06 15:41:42', '普通角色');
INSERT INTO `sys_role` VALUES ('100', '组长', 'group', '0', '1', '1', '1', '0', '0', '黄xx', '2022-07-06 15:19:09', '', null, null);
INSERT INTO `sys_role` VALUES ('101', '前端部长', 'uiadmin', '0', '2', '1', '1', '0', '0', 'admin', '2022-07-06 16:08:32', '', '2022-07-06 16:08:48', '前端部长');
INSERT INTO `sys_role` VALUES ('102', '前端工程师', 'uiengineer', '0', '2', '1', '1', '0', '0', 'admin', '2022-07-06 16:10:26', 'admin', '2022-07-06 16:11:43', '前端工程师');
INSERT INTO `sys_role` VALUES ('103', '后端部长', 'backadmin', '0', '2', '1', '1', '0', '0', 'admin', '2022-07-06 16:13:50', '', '2022-07-06 16:14:02', '后端部长');
INSERT INTO `sys_role` VALUES ('104', '后端工程师', 'backengineer', '0', '2', '1', '1', '0', '0', 'admin', '2022-07-06 16:14:55', '', '2022-07-06 16:15:13', '后端工程师');
INSERT INTO `sys_role` VALUES ('105', '多媒体部长', 'videoadmin', '0', '2', '1', '1', '0', '0', 'admin', '2022-07-06 16:16:25', '', '2022-07-06 16:16:54', '多媒体部长');
INSERT INTO `sys_role` VALUES ('106', '多媒体成员', 'videopeople', '0', '2', '1', '1', '0', '0', 'admin', '2022-07-06 16:18:27', '', '2022-07-06 16:18:36', '多媒体成员');
INSERT INTO `sys_role` VALUES ('107', '学术部长', 'academicadmin', '0', '2', '1', '1', '0', '0', 'admin', '2022-07-06 16:19:38', '', '2022-07-06 16:19:48', '学术部长');
INSERT INTO `sys_role` VALUES ('108', '学术研究员', 'academicpeople', '0', '1', '1', '1', '0', '0', 'admin', '2022-07-06 16:20:31', '', null, '学术研究员');
INSERT INTO `sys_role` VALUES ('109', '电竞管理员', 'LOLadmin', '0', '2', '1', '1', '0', '0', 'admin', '2022-07-06 16:21:10', '', '2022-07-06 16:21:20', '电竞管理员');
INSERT INTO `sys_role` VALUES ('110', '狂码电竞选手', 'kmLOLpeople', '0', '2', '1', '1', '0', '0', 'admin', '2022-07-06 16:22:02', '', '2022-07-06 16:22:19', '狂码电竞选手');
INSERT INTO `sys_role` VALUES ('111', '文化部长', 'artadmin', '0', '2', '1', '1', '0', '0', 'admin', '2022-07-07 16:30:09', '', '2022-07-07 16:30:50', '文化部长');
INSERT INTO `sys_role` VALUES ('112', '文艺工作者', 'artist', '0', '2', '1', '1', '0', '0', 'admin', '2022-07-07 16:31:39', '', '2022-07-07 16:31:55', '文艺工作者');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
                                 `role_id` bigint NOT NULL COMMENT '角色ID',
                                 `dept_id` bigint NOT NULL COMMENT '部门ID',
                                 PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '201');
INSERT INTO `sys_role_dept` VALUES ('101', '100');
INSERT INTO `sys_role_dept` VALUES ('101', '101');
INSERT INTO `sys_role_dept` VALUES ('101', '203');
INSERT INTO `sys_role_dept` VALUES ('102', '100');
INSERT INTO `sys_role_dept` VALUES ('102', '101');
INSERT INTO `sys_role_dept` VALUES ('102', '203');
INSERT INTO `sys_role_dept` VALUES ('103', '100');
INSERT INTO `sys_role_dept` VALUES ('103', '101');
INSERT INTO `sys_role_dept` VALUES ('103', '204');
INSERT INTO `sys_role_dept` VALUES ('104', '100');
INSERT INTO `sys_role_dept` VALUES ('104', '101');
INSERT INTO `sys_role_dept` VALUES ('104', '204');
INSERT INTO `sys_role_dept` VALUES ('105', '100');
INSERT INTO `sys_role_dept` VALUES ('105', '101');
INSERT INTO `sys_role_dept` VALUES ('105', '200');
INSERT INTO `sys_role_dept` VALUES ('106', '100');
INSERT INTO `sys_role_dept` VALUES ('106', '101');
INSERT INTO `sys_role_dept` VALUES ('106', '200');
INSERT INTO `sys_role_dept` VALUES ('107', '100');
INSERT INTO `sys_role_dept` VALUES ('107', '101');
INSERT INTO `sys_role_dept` VALUES ('107', '201');
INSERT INTO `sys_role_dept` VALUES ('109', '100');
INSERT INTO `sys_role_dept` VALUES ('109', '101');
INSERT INTO `sys_role_dept` VALUES ('109', '207');
INSERT INTO `sys_role_dept` VALUES ('110', '100');
INSERT INTO `sys_role_dept` VALUES ('110', '101');
INSERT INTO `sys_role_dept` VALUES ('110', '207');
INSERT INTO `sys_role_dept` VALUES ('111', '100');
INSERT INTO `sys_role_dept` VALUES ('111', '101');
INSERT INTO `sys_role_dept` VALUES ('111', '208');
INSERT INTO `sys_role_dept` VALUES ('112', '100');
INSERT INTO `sys_role_dept` VALUES ('112', '101');
INSERT INTO `sys_role_dept` VALUES ('112', '208');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
                                 `role_id` bigint NOT NULL COMMENT '角色ID',
                                 `menu_id` bigint NOT NULL COMMENT '菜单ID',
                                 PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '116');
INSERT INTO `sys_role_menu` VALUES ('2', '117');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '2000');
INSERT INTO `sys_role_menu` VALUES ('2', '2013');
INSERT INTO `sys_role_menu` VALUES ('2', '2014');
INSERT INTO `sys_role_menu` VALUES ('2', '2015');
INSERT INTO `sys_role_menu` VALUES ('2', '2016');
INSERT INTO `sys_role_menu` VALUES ('2', '2017');
INSERT INTO `sys_role_menu` VALUES ('2', '2018');
INSERT INTO `sys_role_menu` VALUES ('2', '2037');
INSERT INTO `sys_role_menu` VALUES ('100', '2000');
INSERT INTO `sys_role_menu` VALUES ('100', '2037');
INSERT INTO `sys_role_menu` VALUES ('101', '1');
INSERT INTO `sys_role_menu` VALUES ('101', '100');
INSERT INTO `sys_role_menu` VALUES ('101', '107');
INSERT INTO `sys_role_menu` VALUES ('101', '1000');
INSERT INTO `sys_role_menu` VALUES ('101', '1001');
INSERT INTO `sys_role_menu` VALUES ('101', '1002');
INSERT INTO `sys_role_menu` VALUES ('101', '1003');
INSERT INTO `sys_role_menu` VALUES ('101', '1004');
INSERT INTO `sys_role_menu` VALUES ('101', '1005');
INSERT INTO `sys_role_menu` VALUES ('101', '1006');
INSERT INTO `sys_role_menu` VALUES ('101', '1035');
INSERT INTO `sys_role_menu` VALUES ('101', '1036');
INSERT INTO `sys_role_menu` VALUES ('101', '1037');
INSERT INTO `sys_role_menu` VALUES ('101', '1038');
INSERT INTO `sys_role_menu` VALUES ('101', '2000');
INSERT INTO `sys_role_menu` VALUES ('101', '2037');
INSERT INTO `sys_role_menu` VALUES ('102', '1');
INSERT INTO `sys_role_menu` VALUES ('102', '3');
INSERT INTO `sys_role_menu` VALUES ('102', '100');
INSERT INTO `sys_role_menu` VALUES ('102', '107');
INSERT INTO `sys_role_menu` VALUES ('102', '117');
INSERT INTO `sys_role_menu` VALUES ('102', '1000');
INSERT INTO `sys_role_menu` VALUES ('102', '1035');
INSERT INTO `sys_role_menu` VALUES ('102', '1036');
INSERT INTO `sys_role_menu` VALUES ('102', '1037');
INSERT INTO `sys_role_menu` VALUES ('102', '1038');
INSERT INTO `sys_role_menu` VALUES ('102', '2000');
INSERT INTO `sys_role_menu` VALUES ('102', '2037');
INSERT INTO `sys_role_menu` VALUES ('103', '1');
INSERT INTO `sys_role_menu` VALUES ('103', '3');
INSERT INTO `sys_role_menu` VALUES ('103', '100');
INSERT INTO `sys_role_menu` VALUES ('103', '107');
INSERT INTO `sys_role_menu` VALUES ('103', '117');
INSERT INTO `sys_role_menu` VALUES ('103', '1000');
INSERT INTO `sys_role_menu` VALUES ('103', '1001');
INSERT INTO `sys_role_menu` VALUES ('103', '1002');
INSERT INTO `sys_role_menu` VALUES ('103', '1003');
INSERT INTO `sys_role_menu` VALUES ('103', '1004');
INSERT INTO `sys_role_menu` VALUES ('103', '1005');
INSERT INTO `sys_role_menu` VALUES ('103', '1006');
INSERT INTO `sys_role_menu` VALUES ('103', '1035');
INSERT INTO `sys_role_menu` VALUES ('103', '1036');
INSERT INTO `sys_role_menu` VALUES ('103', '1037');
INSERT INTO `sys_role_menu` VALUES ('103', '1038');
INSERT INTO `sys_role_menu` VALUES ('103', '2000');
INSERT INTO `sys_role_menu` VALUES ('103', '2037');
INSERT INTO `sys_role_menu` VALUES ('104', '1');
INSERT INTO `sys_role_menu` VALUES ('104', '3');
INSERT INTO `sys_role_menu` VALUES ('104', '100');
INSERT INTO `sys_role_menu` VALUES ('104', '117');
INSERT INTO `sys_role_menu` VALUES ('104', '1000');
INSERT INTO `sys_role_menu` VALUES ('104', '2000');
INSERT INTO `sys_role_menu` VALUES ('104', '2037');
INSERT INTO `sys_role_menu` VALUES ('105', '1');
INSERT INTO `sys_role_menu` VALUES ('105', '3');
INSERT INTO `sys_role_menu` VALUES ('105', '100');
INSERT INTO `sys_role_menu` VALUES ('105', '117');
INSERT INTO `sys_role_menu` VALUES ('105', '1000');
INSERT INTO `sys_role_menu` VALUES ('105', '1001');
INSERT INTO `sys_role_menu` VALUES ('105', '1002');
INSERT INTO `sys_role_menu` VALUES ('105', '1003');
INSERT INTO `sys_role_menu` VALUES ('105', '1004');
INSERT INTO `sys_role_menu` VALUES ('105', '1005');
INSERT INTO `sys_role_menu` VALUES ('105', '1006');
INSERT INTO `sys_role_menu` VALUES ('105', '2000');
INSERT INTO `sys_role_menu` VALUES ('105', '2037');
INSERT INTO `sys_role_menu` VALUES ('106', '1');
INSERT INTO `sys_role_menu` VALUES ('106', '3');
INSERT INTO `sys_role_menu` VALUES ('106', '100');
INSERT INTO `sys_role_menu` VALUES ('106', '117');
INSERT INTO `sys_role_menu` VALUES ('106', '1000');
INSERT INTO `sys_role_menu` VALUES ('106', '2000');
INSERT INTO `sys_role_menu` VALUES ('106', '2037');
INSERT INTO `sys_role_menu` VALUES ('107', '1');
INSERT INTO `sys_role_menu` VALUES ('107', '3');
INSERT INTO `sys_role_menu` VALUES ('107', '100');
INSERT INTO `sys_role_menu` VALUES ('107', '117');
INSERT INTO `sys_role_menu` VALUES ('107', '1000');
INSERT INTO `sys_role_menu` VALUES ('107', '1001');
INSERT INTO `sys_role_menu` VALUES ('107', '1002');
INSERT INTO `sys_role_menu` VALUES ('107', '1003');
INSERT INTO `sys_role_menu` VALUES ('107', '1004');
INSERT INTO `sys_role_menu` VALUES ('107', '1005');
INSERT INTO `sys_role_menu` VALUES ('107', '1006');
INSERT INTO `sys_role_menu` VALUES ('107', '2000');
INSERT INTO `sys_role_menu` VALUES ('107', '2037');
INSERT INTO `sys_role_menu` VALUES ('108', '1');
INSERT INTO `sys_role_menu` VALUES ('108', '3');
INSERT INTO `sys_role_menu` VALUES ('108', '100');
INSERT INTO `sys_role_menu` VALUES ('108', '117');
INSERT INTO `sys_role_menu` VALUES ('108', '1000');
INSERT INTO `sys_role_menu` VALUES ('108', '2000');
INSERT INTO `sys_role_menu` VALUES ('108', '2037');
INSERT INTO `sys_role_menu` VALUES ('109', '1');
INSERT INTO `sys_role_menu` VALUES ('109', '100');
INSERT INTO `sys_role_menu` VALUES ('109', '1000');
INSERT INTO `sys_role_menu` VALUES ('109', '1001');
INSERT INTO `sys_role_menu` VALUES ('109', '1002');
INSERT INTO `sys_role_menu` VALUES ('109', '1003');
INSERT INTO `sys_role_menu` VALUES ('109', '1004');
INSERT INTO `sys_role_menu` VALUES ('109', '1005');
INSERT INTO `sys_role_menu` VALUES ('109', '1006');
INSERT INTO `sys_role_menu` VALUES ('110', '1');
INSERT INTO `sys_role_menu` VALUES ('110', '3');
INSERT INTO `sys_role_menu` VALUES ('110', '100');
INSERT INTO `sys_role_menu` VALUES ('110', '117');
INSERT INTO `sys_role_menu` VALUES ('110', '1000');
INSERT INTO `sys_role_menu` VALUES ('110', '2000');
INSERT INTO `sys_role_menu` VALUES ('110', '2037');
INSERT INTO `sys_role_menu` VALUES ('111', '1');
INSERT INTO `sys_role_menu` VALUES ('111', '3');
INSERT INTO `sys_role_menu` VALUES ('111', '100');
INSERT INTO `sys_role_menu` VALUES ('111', '115');
INSERT INTO `sys_role_menu` VALUES ('111', '117');
INSERT INTO `sys_role_menu` VALUES ('111', '1000');
INSERT INTO `sys_role_menu` VALUES ('111', '1001');
INSERT INTO `sys_role_menu` VALUES ('111', '1002');
INSERT INTO `sys_role_menu` VALUES ('111', '1003');
INSERT INTO `sys_role_menu` VALUES ('111', '1004');
INSERT INTO `sys_role_menu` VALUES ('111', '1005');
INSERT INTO `sys_role_menu` VALUES ('111', '1006');
INSERT INTO `sys_role_menu` VALUES ('111', '1054');
INSERT INTO `sys_role_menu` VALUES ('111', '1055');
INSERT INTO `sys_role_menu` VALUES ('111', '1056');
INSERT INTO `sys_role_menu` VALUES ('111', '1057');
INSERT INTO `sys_role_menu` VALUES ('111', '1058');
INSERT INTO `sys_role_menu` VALUES ('111', '1059');
INSERT INTO `sys_role_menu` VALUES ('111', '2000');
INSERT INTO `sys_role_menu` VALUES ('111', '2037');
INSERT INTO `sys_role_menu` VALUES ('112', '1');
INSERT INTO `sys_role_menu` VALUES ('112', '3');
INSERT INTO `sys_role_menu` VALUES ('112', '100');
INSERT INTO `sys_role_menu` VALUES ('112', '115');
INSERT INTO `sys_role_menu` VALUES ('112', '117');
INSERT INTO `sys_role_menu` VALUES ('112', '1000');
INSERT INTO `sys_role_menu` VALUES ('112', '1054');
INSERT INTO `sys_role_menu` VALUES ('112', '1055');
INSERT INTO `sys_role_menu` VALUES ('112', '1056');
INSERT INTO `sys_role_menu` VALUES ('112', '1057');
INSERT INTO `sys_role_menu` VALUES ('112', '1058');
INSERT INTO `sys_role_menu` VALUES ('112', '1059');
INSERT INTO `sys_role_menu` VALUES ('112', '2000');
INSERT INTO `sys_role_menu` VALUES ('112', '2037');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
                            `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                            `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
                            `user_name` varchar(30) NOT NULL COMMENT '用户账号',
                            `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
                            `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
                            `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
                            `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
                            `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
                            `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
                            `password` varchar(100) DEFAULT '' COMMENT '密码',
                            `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
                            `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '山春♥', '00', '2285096803@qq.com', '15082795191', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-03-03 18:17:06', 'admin', '2022-07-01 15:13:01', '', '2023-03-03 20:03:07', '管理员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
                                 `user_id` bigint NOT NULL COMMENT '用户ID',
                                 `post_id` bigint NOT NULL COMMENT '岗位ID',
                                 PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('100', '4');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
                                 `user_id` bigint NOT NULL COMMENT '用户ID',
                                 `role_id` bigint NOT NULL COMMENT '角色ID',
                                 PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('100', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
                        `id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
                        `user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
                        `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
                        `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
                        `gender` tinyint NOT NULL DEFAULT '0' COMMENT '性别',
                        `status` int NOT NULL DEFAULT '1' COMMENT '账号状态',
                        `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
                        `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
                        `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号密码',
                        `pay_password` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '支付密码',
                        `autograph` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'ta还什么都没留下' COMMENT '签名',
                        `authentication` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '平台认证',
                        `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '实名',
                        `balance` decimal(10,0) DEFAULT '0' COMMENT '余额',
                        `invitation_count` int DEFAULT '0' COMMENT '邀请人数',
                        `invitation_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邀请人userId',
                        `studentno` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '学号',
                        `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
                        `create_time` datetime NOT NULL COMMENT '创建时间',
                        `ban_time` datetime DEFAULT NULL COMMENT '封禁时间',
                        `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证号',
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', '633224399', '2285096803@qq.com', '15902824254', '1', '1', 'null', '狂码宝贝lkkrdq', '$2a$10$EHZXu9.63zmM1UvPM8SHyOKZu7W.meV5TUsIGl2S8vMWGWZEHpXJG', '$2a$10$9EABvYBn3dwsEbo20LG3ReD/IUv9zyIJYnq0cb3ACbpFOnpwRNphi', 'ta还什么都没留下', '', null, '300', '0', null, null, null, '2022-07-31 22:54:53', null, null);
INSERT INTO `user` VALUES ('4', '487011791', '3151900988@qq.com', '17628061245', '1', '1', 'null', '狂码宝贝vu4eI0', '$2a$10$LMjiBkqDPxbyK4ft1/sgjOohrzVInhugklaucwJIndwdlXwCHziti', '', 'ta还什么都没留下', '', null, '1', '0', null, null, null, '2022-08-13 19:19:51', null, null);
INSERT INTO `user` VALUES ('5', '998877665', 'guccihere@outlook.com', '13350964483', '1', '1', 'null', 'GUCCI', '$2a$10$EHZXu9.63zmM1UvPM8SHyOKZu7W.meV5TUsIGl2S8vMWGWZEHpXJG', '', 'ta还什么都没留下', '2|2|2|', '贾晋', '0', '0', null, null, null, '2022-08-15 18:07:16', null, null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
                         `id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
                         `user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
                         `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
                         `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
                         `gender` tinyint NOT NULL DEFAULT '0' COMMENT '性别',
                         `status` int NOT NULL DEFAULT '1' COMMENT '账号状态',
                         `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
                         `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
                         `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号密码',
                         `pay_password` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '支付密码',
                         `autograph` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'ta还什么都没留下' COMMENT '签名',
                         `authentication` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '平台认证',
                         `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '实名',
                         `balance` decimal(10,0) DEFAULT '0' COMMENT '余额',
                         `invitation_count` int DEFAULT '0' COMMENT '邀请人数',
                         `invitation_user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邀请人userId',
                         `studentno` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '学号',
                         `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
                         `create_time` datetime NOT NULL COMMENT '创建时间',
                         `ban_time` datetime DEFAULT NULL COMMENT '封禁时间',
                         `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证号',
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('3', '633224399', '2285096803@qq.com', '15902824254', '1', '1', 'null', '狂码宝贝lkkrdq', '$2a$10$EHZXu9.63zmM1UvPM8SHyOKZu7W.meV5TUsIGl2S8vMWGWZEHpXJG', '$2a$10$9EABvYBn3dwsEbo20LG3ReD/IUv9zyIJYnq0cb3ACbpFOnpwRNphi', 'ta还什么都没留下', '', null, '300', '0', null, null, null, '2022-07-31 22:54:53', null, null);
INSERT INTO `users` VALUES ('4', '487011791', '3151900988@qq.com', '17628061245', '1', '1', 'null', '狂码宝贝vu4eI0', '$2a$10$LMjiBkqDPxbyK4ft1/sgjOohrzVInhugklaucwJIndwdlXwCHziti', '', 'ta还什么都没留下', '', null, '1', '0', null, null, null, '2022-08-13 19:19:51', null, null);
INSERT INTO `users` VALUES ('5', '998877665', 'guccihere@outlook.com', '13350964483', '1', '1', 'null', 'GUCCI', '$2a$10$EHZXu9.63zmM1UvPM8SHyOKZu7W.meV5TUsIGl2S8vMWGWZEHpXJG', '', 'ta还什么都没留下', '2|2|2|', '贾晋', '0', '0', null, null, null, '2022-08-15 18:07:16', null, null);

-- ----------------------------
-- Table structure for user_expenditure
-- ----------------------------
DROP TABLE IF EXISTS `user_expenditure`;
CREATE TABLE `user_expenditure` (
                                    `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                    `user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户Id',
                                    `amount` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '支出金额',
                                    `comment` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '说明',
                                    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                    `color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '金额显示颜色',
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_expenditure
-- ----------------------------
INSERT INTO `user_expenditure` VALUES ('1', '633224399', '100', '预约支出', '2022-08-03 16:16:13', '#00CC00');

-- ----------------------------
-- Table structure for user_income
-- ----------------------------
DROP TABLE IF EXISTS `user_income`;
CREATE TABLE `user_income` (
                               `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                               `user_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
                               `amount` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '收入金额',
                               `comment` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收入说明',
                               `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                               `color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '金额显示颜色',
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_income
-- ----------------------------
INSERT INTO `user_income` VALUES ('1', '633224399', '100', '预约退还', '2022-08-02 23:01:11', '#00CC00');
INSERT INTO `user_income` VALUES ('2', '487011791', '100', '预约退还', '2022-08-20 15:10:00', '#00CC00');
INSERT INTO `user_income` VALUES ('3', '633224399', '75', '接单收入', '2022-08-20 15:18:58', '#00CC00');
INSERT INTO `user_income` VALUES ('4', '633224399', '75', '接单收入', '2022-08-22 10:30:34', '#00CC00');
INSERT INTO `user_income` VALUES ('5', '633224399', '75', '接单收入', '2022-08-25 21:23:50', '#00CC00');
INSERT INTO `user_income` VALUES ('6', '633224399', '240', '接单收入', '2022-08-25 21:26:30', '#00CC00');
INSERT INTO `user_income` VALUES ('7', '487011791', '75', '接单收入', '2022-08-25 21:32:44', '#00CC00');
INSERT INTO `user_income` VALUES ('8', '633224399', '240', '接单收入', '2022-08-25 21:33:20', '#00CC00');
INSERT INTO `user_income` VALUES ('9', '633224399', '240', '接单收入', '2022-08-25 22:01:16', '#00CC00');
INSERT INTO `user_income` VALUES ('10', '633224399', '240', '接单收入', '2022-08-25 22:06:34', '#00CC00');
