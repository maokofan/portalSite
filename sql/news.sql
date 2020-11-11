/*
 Navicat MySQL Data Transfer

 Source Server         : HomeCentosMysqlRroot
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : fanfanyy.cn:3336
 Source Schema         : zytm_news

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 12/11/2020 00:33:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_articleannex
-- ----------------------------
DROP TABLE IF EXISTS `t_articleannex`;
CREATE TABLE `t_articleannex`  (
  `articleid` bigint(0) NOT NULL COMMENT '文章编号',
  `fid` bigint(0) NOT NULL COMMENT '文件编号',
  PRIMARY KEY (`articleid`, `fid`) USING BTREE,
  INDEX `article_key`(`articleid`) USING BTREE COMMENT '文件索引'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `articleid` bigint(0) NOT NULL COMMENT '分享文章id',
  `articletype` tinyint(0) NULL DEFAULT NULL COMMENT '文章类型 0:新闻 1:通告 2:分享',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论人:匿名',
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电脑ip',
  `publishdate` datetime(0) NOT NULL COMMENT '发布日期',
  `reviewstatus` tinyint(0) NULL DEFAULT NULL COMMENT '审核状态',
  `reviewer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reviewdate` datetime(0) NULL DEFAULT NULL,
  `reviewComment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notRiview` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (3, 6644398954261778432, 6, '测试评论', '匿名', '192.168.0.101', '2020-11-11 15:18:28', 0, NULL, NULL, NULL, 0);
INSERT INTO `t_comment` VALUES (4, 6644398954261778432, 6, '测试评论222', '匿名', '192.168.0.101', '2020-11-11 15:18:36', 1, '测试审核用户', '2020-11-11 15:18:50', '审核通过', 1);

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file`  (
  `fid` bigint(0) NOT NULL COMMENT '文件id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `type` tinyint(0) NULL DEFAULT NULL COMMENT '0:文档 1:图片',
  `uploadtime` datetime(0) NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `fname_key`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_file
-- ----------------------------
INSERT INTO `t_file` VALUES (0, 'news_img_default.png', '/static/news/news_img_default.png', 1, '2020-03-30 15:38:50');
INSERT INTO `t_file` VALUES (1, 'honour_avatar.png', '/static/news/honour_avatar.png', 1, '2020-03-30 15:37:51');
INSERT INTO `t_file` VALUES (6726072205731434496, 'timg.jpg', '/static/2020/23/11/da6418c46fef42c08915b3fa8059d788.jpg', 0, '2020-11-11 15:42:17');

-- ----------------------------
-- Table structure for t_honour
-- ----------------------------
DROP TABLE IF EXISTS `t_honour`;
CREATE TABLE `t_honour`  (
  `id` bigint(0) UNSIGNED NOT NULL COMMENT '荣誉id',
  `imageid` bigint(0) NULL DEFAULT NULL COMMENT '荣誉图片，若无则默认\r\n',
  `pepole` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '荣誉人物 username',
  `honortitle` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '荣誉称号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事迹标题',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事迹内容',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布人',
  `publishdate` datetime(0) NOT NULL COMMENT '发布时间',
  `pageview` bigint(0) NULL DEFAULT 0 COMMENT '浏览次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title_Key`(`title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '荣誉中亚' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_knowledgeshare
-- ----------------------------
DROP TABLE IF EXISTS `t_knowledgeshare`;
CREATE TABLE `t_knowledgeshare`  (
  `id` bigint(0) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publishdate` datetime(0) NOT NULL,
  `reviewstatus` tinyint(0) NULL DEFAULT 0 COMMENT '0:未通过 1：通过',
  `reviewer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reviewdate` datetime(0) NULL DEFAULT NULL,
  `reviewComment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `goodnum` int(0) NULL DEFAULT 0 COMMENT '点赞数',
  `badnum` int(0) NULL DEFAULT 0 COMMENT '点差数',
  `pageview` bigint(0) NULL DEFAULT NULL,
  `notRiview` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title_Key`(`title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_knowledgeshare
-- ----------------------------
INSERT INTO `t_knowledgeshare` VALUES (6644398954261778432, '职场中五个人对你最重要', '第一个，导师，教练。他教给你实用的技巧、一定的工作经验，虽不是知识，但它可以给你指明方向。这个人可能是你的上司、前辈、学长。第二个，陪练，同路人，任何人的成长都', '<p class=\"MsoNormal\" align=\"left\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;text-align:left;text-indent:24.0pt;line-height:16.5pt;mso-pagination:widow-orphan\"><b><span style=\"font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体;mso-font-kerning:\n0pt\">第一个</span></b><span style=\"font-size:12.0pt;font-family:宋体;mso-bidi-font-family:\n宋体;mso-font-kerning:0pt\">，导师，教练。他教给你实用的技巧、一定的工作经验，虽不是知识，但它可以给你指明方向。这个人可能是你的上司、前辈、学长。<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;text-align:left;text-indent:24.0pt;line-height:16.5pt;mso-pagination:widow-orphan\"><b><span style=\"font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体;mso-font-kerning:\n0pt\">第二个</span></b><span style=\"font-size:12.0pt;font-family:宋体;mso-bidi-font-family:\n宋体;mso-font-kerning:0pt\">，陪练，同路人，任何人的成长都不是学出来的，而是学而习，习而成习惯练出来的。这个练的过程，是一个很苦的过程，是一系列简单动作的重复重复再重复，由量变成质变的过程。在这个过程中，一个人很难坚持下来，这时你需要一个同路人。他可以是和你有共同兴趣，共同目标</span><span style=\"font-family: 宋体; font-size: 12pt; text-indent: 24pt;\">的朋友，最好是你生命中所爱的人。</span></p><p class=\"MsoNormal\" align=\"left\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;text-align:left;text-indent:24.0pt;line-height:16.5pt;mso-pagination:widow-orphan\"><b><span style=\"font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体;mso-font-kerning:\n0pt\">第三个</span></b><span style=\"font-size:12.0pt;font-family:宋体;mso-bidi-font-family:\n宋体;mso-font-kerning:0pt\">，榜样。他是你人生的标杆。在你一生中，在不同阶段，会有不同的标杆，你向他学习，受他鼓舞，一步一步向他靠拢。最重要的是那个你看得到摸得着的人，你知道，不需要通过机遇，只需要通过努力就可以达到的榜样。<span lang=\"EN-US\"><o:p></o:p></span></span></p><p class=\"MsoNormal\" align=\"left\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;text-align:left;line-height:16.5pt;mso-pagination:widow-orphan\"><b><span lang=\"EN-US\" style=\"font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体;\nmso-font-kerning:0pt\"><span>&nbsp;&nbsp;&nbsp; </span></span></b><b><span style=\"font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体;mso-font-kerning:\n0pt\">第四个</span></b><span style=\"font-size:12.0pt;font-family:宋体;mso-bidi-font-family:\n宋体;mso-font-kerning:0pt\">，敌人，看不起你的人，拒绝过你的人。人不到绝境是不会有斗志的，你要证明他是错的，他会给你真正的动力。<span lang=\"EN-US\"><o:p></o:p></span></span></p><p>\n\n<!--[if !mso]>\n<style>\nv\\:* {behavior:url(#default#VML);}\no\\:* {behavior:url(#default#VML);}\nw\\:* {behavior:url(#default#VML);}\n.shape {behavior:url(#default#VML);}\n</style>\n<![endif]--><!--[if gte mso 9]><xml>\n <o:OfficeDocumentSettings>\n  <o:TargetScreenSize>800x600</o:TargetScreenSize>\n </o:OfficeDocumentSettings>\n</xml><![endif]-->\n\n\n<!--[if gte mso 9]><xml>\n <w:WordDocument>\n  <w:View>Normal</w:View>\n  <w:Zoom>0</w:Zoom>\n  <w:TrackMoves/>\n  <w:TrackFormatting/>\n  <w:PunctuationKerning/>\n  <w:DrawingGridVerticalSpacing>7.8 磅</w:DrawingGridVerticalSpacing>\n  <w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>\n  <w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>\n  <w:ValidateAgainstSchemas/>\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\n  <w:DoNotPromoteQF/>\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\n  <w:LidThemeAsian>ZH-CN</w:LidThemeAsian>\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\n  <w:Compatibility>\n   <w:SpaceForUL/>\n   <w:BalanceSingleByteDoubleByteWidth/>\n   <w:DoNotLeaveBackslashAlone/>\n   <w:ULTrailSpace/>\n   <w:DoNotExpandShiftReturn/>\n   <w:AdjustLineHeightInTable/>\n   <w:BreakWrappedTables/>\n   <w:SnapToGridInCell/>\n   <w:WrapTextWithPunct/>\n   <w:UseAsianBreakRules/>\n   <w:DontGrowAutofit/>\n   <w:SplitPgBreakAndParaMark/>\n   <w:EnableOpenTypeKerning/>\n   <w:DontFlipMirrorIndents/>\n   <w:OverrideTableStyleHps/>\n   <w:UseFELayout/>\n  </w:Compatibility>\n  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>\n  <m:mathPr>\n   <m:mathFont m:val=\"Cambria Math\"/>\n   <m:brkBin m:val=\"before\"/>\n   <m:brkBinSub m:val=\"&#45;-\"/>\n   <m:smallFrac m:val=\"off\"/>\n   <m:dispDef/>\n   <m:lMargin m:val=\"0\"/>\n   <m:rMargin m:val=\"0\"/>\n   <m:defJc m:val=\"centerGroup\"/>\n   <m:wrapIndent m:val=\"1440\"/>\n   <m:intLim m:val=\"subSup\"/>\n   <m:naryLim m:val=\"undOvr\"/>\n  </m:mathPr></w:WordDocument>\n</xml><![endif]--><!--[if gte mso 9]><xml>\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"true\"\n  DefSemiHidden=\"true\" DefQFormat=\"false\" DefPriority=\"99\"\n  LatentStyleCount=\"267\">\n  <w:LsdException Locked=\"false\" Priority=\"0\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Normal\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"heading 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 7\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 8\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 9\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 7\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 8\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 9\"/>\n  <w:LsdException Locked=\"false\" Priority=\"35\" QFormat=\"true\" Name=\"caption\"/>\n  <w:LsdException Locked=\"false\" Priority=\"10\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Title\"/>\n  <w:LsdException Locked=\"false\" Priority=\"0\" Name=\"Default Paragraph Font\"/>\n  <w:LsdException Locked=\"false\" Priority=\"11\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtitle\"/>\n  <w:LsdException Locked=\"false\" Priority=\"22\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Strong\"/>\n  <w:LsdException Locked=\"false\" Priority=\"20\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Emphasis\"/>\n  <w:LsdException Locked=\"false\" Priority=\"59\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Table Grid\"/>\n  <w:LsdException Locked=\"false\" UnhideWhenUsed=\"false\" Name=\"Placeholder Text\"/>\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"No Spacing\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 1\"/>\n  <w:LsdException Locked=\"false\" UnhideWhenUsed=\"false\" Name=\"Revision\"/>\n  <w:LsdException Locked=\"false\" Priority=\"34\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"List Paragraph\"/>\n  <w:LsdException Locked=\"false\" Priority=\"29\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Quote\"/>\n  <w:LsdException Locked=\"false\" Priority=\"30\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Quote\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"19\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtle Emphasis\"/>\n  <w:LsdException Locked=\"false\" Priority=\"21\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Emphasis\"/>\n  <w:LsdException Locked=\"false\" Priority=\"31\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtle Reference\"/>\n  <w:LsdException Locked=\"false\" Priority=\"32\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Reference\"/>\n  <w:LsdException Locked=\"false\" Priority=\"33\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Book Title\"/>\n  <w:LsdException Locked=\"false\" Priority=\"37\" Name=\"Bibliography\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" QFormat=\"true\" Name=\"TOC Heading\"/>\n </w:LatentStyles>\n</xml><![endif]-->\n<style>\n<!--\n /* Font Definitions */\n @font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:\"\\@宋体\";\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n /* Style Definitions */\n p.MsoNormal, li.MsoNormal, div.MsoNormal\n	{mso-style-unhide:no;\n	mso-style-qformat:yes;\n	mso-style-parent:\"\";\n	margin:0cm;\n	margin-bottom:.0001pt;\n	text-align:justify;\n	text-justify:inter-ideograph;\n	mso-pagination:none;\n	font-size:10.5pt;\n	mso-bidi-font-size:12.0pt;\n	font-family:\"Times New Roman\",\"serif\";\n	mso-fareast-font-family:宋体;\n	mso-font-kerning:1.0pt;}\n.MsoChpDefault\n	{mso-style-type:export-only;\n	mso-default-props:yes;\n	font-size:10.0pt;\n	mso-ansi-font-size:10.0pt;\n	mso-bidi-font-size:10.0pt;\n	mso-ascii-font-family:\"Times New Roman\";\n	mso-fareast-font-family:宋体;\n	mso-hansi-font-family:\"Times New Roman\";\n	mso-font-kerning:0pt;}\n /* Page Definitions */\n @page\n	{mso-page-border-surround-header:no;\n	mso-page-border-surround-footer:no;}\n@page WordSection1\n	{size:612.0pt 792.0pt;\n	margin:72.0pt 90.0pt 72.0pt 90.0pt;\n	mso-header-margin:36.0pt;\n	mso-footer-margin:36.0pt;\n	mso-paper-source:0;}\ndiv.WordSection1\n	{page:WordSection1;}\n-->\n</style>\n<!--[if gte mso 10]>\n<style>\n /* Style Definitions */\n table.MsoNormalTable\n	{mso-style-name:普通表格;\n	mso-tstyle-rowband-size:0;\n	mso-tstyle-colband-size:0;\n	mso-style-noshow:yes;\n	mso-style-priority:99;\n	mso-style-parent:\"\";\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\n	mso-para-margin:0cm;\n	mso-para-margin-bottom:.0001pt;\n	mso-pagination:widow-orphan;\n	font-size:10.0pt;\n	font-family:\"Times New Roman\",\"serif\";}\n</style>\n<![endif]-->\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n</p><p class=\"MsoNormal\" align=\"left\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;text-align:left;text-indent:24.0pt;line-height:16.5pt;mso-pagination:widow-orphan\"><b><span style=\"font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体;mso-font-kerning:\n0pt\">第五个</span></b><span style=\"font-size:12.0pt;font-family:宋体;mso-bidi-font-family:\n宋体;mso-font-kerning:0pt\">，最重要的人是你自己。这个世界上，失败的人除了天分太差之外，只有以下几点：懒，方向不对，方法不对，没有坚持。如果你自己做不到，就不要怪别人。</span></p>', 'admin', '2020-03-31 06:41:56', 1, '超级管理员', '2020-03-31 06:45:36', '审核通过', 11, 9, 20, 1);
INSERT INTO `t_knowledgeshare` VALUES (6644399698662658048, '忧患与安乐', '前两天看报，有幅颇有意思的图片：一只小老鼠雄赳赳地站在一只肥硕的猫身上，一幅耀武扬威的模样。图下配文：无法无天。 　在讥笑那只没用的猫的同时，我不禁思考，自古老', '<p class=\"MsoNormal\" align=\"left\" style=\"text-align:left;text-indent:18.0pt;\nmso-char-indent-count:2.0;line-height:21.6pt;mso-pagination:widow-orphan\"><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;mso-font-kerning:0pt\">前两天看报，有幅颇有意思的图片：一只小老鼠雄赳赳地站在一只肥硕的猫身上，一幅耀武扬威的模样。图下配文：无法无天。</span><span arial\",\"sans-serif\";mso-font-kerning:0pt\'=\"\"> </span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;mso-font-kerning:0pt\">　</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"left\" style=\"text-align:left;text-indent:18.0pt;\nmso-char-indent-count:2.0;line-height:21.6pt;mso-pagination:widow-orphan\"><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;mso-font-kerning:0pt\">在讥笑那只没用的猫的同时，我不禁思考，自古老鼠就是怕猫的，那只老鼠有了何等本事，胆敢如此欺负猫呢？</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"left\" style=\"text-align:left;text-indent:18.0pt;\nmso-char-indent-count:2.0;line-height:21.6pt;mso-pagination:widow-orphan\"><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;mso-font-kerning:0pt\">无独有偶，据说一家动物园，为了取悦游人，把一只活蹦乱跳的小牛犊放入圈养老虎的场地里，想让游人欣赏老虎吞噬牛犊的精彩场面。牛犊因为害怕，本能地发出叫声，并不断地抖动身体，出乎意料的是，老虎竟不敢靠近，双方僵持了一会，老虎竟然摇着尾巴走开了。</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"left\" style=\"text-align:left;text-indent:18.0pt;\nmso-char-indent-count:2.0;line-height:21.6pt;mso-pagination:widow-orphan\"><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;mso-font-kerning:0pt\">那平日里被诩为百兽之王的老虎，又怎会被一只小小的牛犊震慑了呢？</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"left\" style=\"text-align:left;text-indent:18.0pt;\nmso-char-indent-count:2.0;line-height:21.6pt;mso-pagination:widow-orphan\"><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;mso-font-kerning:0pt\">这匪夷所思的现象的确偶然，但在这偶然当中也揭示着一个必然的规律。这就是孟子的古训：</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\">“</span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:\nArial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;mso-font-kerning:\n0pt\">生于忧患，死于安乐</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;\" mso-font-kerning:0pt\'=\"\">”</span><span style=\"font-size:9.0pt;font-family:宋体;\nmso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:\nArial;mso-font-kerning:0pt\">。</span><span lang=\"EN-US\" style=\"font-size:9.0pt;\nfont-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-font-kerning:0pt\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"left\" style=\"text-align:left;text-indent:18.0pt;\nmso-char-indent-count:2.0;line-height:21.6pt;mso-pagination:widow-orphan\"><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;mso-font-kerning:0pt\">翻开中国历史的画卷，各个朝代的亡国之君，大多与居安忘危、堕落丧志、淫逸奢靡有关；历代的伟人、成功者，又无不抱着居安思危的思想，励精图治，发愤图强。</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"left\" style=\"text-align:left;text-indent:18.0pt;\nmso-char-indent-count:2.0;line-height:21.6pt;mso-pagination:widow-orphan\"><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;mso-font-kerning:0pt\">秦王嬴政，叱咤风云，统一中国，自称</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\">“</span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:\nArial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;mso-font-kerning:\n0pt\">始皇帝</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;\" mso-font-kerning:0pt\'=\"\">”</span><span style=\"font-size:9.0pt;font-family:宋体;\nmso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:\nArial;mso-font-kerning:0pt\">，幻想帝业永传。但不出两代，他的儿子胡亥就沉湎安乐，昏庸透顶，失信于民，使</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\">“</span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:\nArial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;mso-font-kerning:\n0pt\">千古一帝</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;\" mso-font-kerning:0pt\'=\"\">”</span><span style=\"font-size:9.0pt;font-family:宋体;\nmso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:\nArial;mso-font-kerning:0pt\">留下的政权毁于一旦。隋王朝也只是维持了两代，便因朝政腐败、奢华无度而迅速垮台。刘备，这位白手起家、赤手空拳打造一个独立王国的枭雄，他穷困潦倒时，投靠荆州的刘表，却未被重用。某日入厕，刘备发现大腿内侧长出赘肉来，想到自己以前骑马奔驰，根本没有赘肉，而投奔刘表后连骑马的机会都没了。他决然地放弃了在刘表手下安稳度日，选择去开创自己艰辛的事业。唐太宗李世民所以能开创</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\">“</span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:\nArial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;mso-font-kerning:\n0pt\">贞观之治</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;\" mso-font-kerning:0pt\'=\"\">”</span><span style=\"font-size:9.0pt;font-family:宋体;\nmso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:\nArial;mso-font-kerning:0pt\">的业绩，与他</span><span lang=\"EN-US\" style=\"font-size:\n9.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-font-kerning:0pt\">“</span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;mso-font-kerning:0pt\">安不忘危，治不忘乱，虽知今日无事，也须思其始终</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\">”</span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:\nArial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;mso-font-kerning:\n0pt\">的忧患意识不无关系</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;\" mso-font-kerning:0pt\'=\"\">……<o:p></o:p></span></p><p class=\"MsoNormal\" align=\"left\" style=\"text-align:left;text-indent:18.0pt;\nmso-char-indent-count:2.0;line-height:21.6pt;mso-pagination:widow-orphan\"><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\">“</span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:\nArial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;mso-font-kerning:\n0pt\">祸兮，福之所倚；福兮，祸之所伏。</span><span lang=\"EN-US\" style=\"font-size:9.0pt;font-family:\n&quot;Arial&quot;,&quot;sans-serif&quot;;mso-font-kerning:0pt\">”</span><span style=\"font-size:9.0pt;\nfont-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;mso-font-kerning:0pt\">王朝的兴衰，人物的成败，都彰显了忧患意识的重要性，历史和生命都需要源源不断的压力，只有在压力下才能迸发出动力，生命之树才能常青。安逸指数愈高，愈危险。安逸的环境使人斗志涣散，自满自足，维持稳定不变的工作模式，拒绝改变现状，忽略外在环境的变化。</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"left\" style=\"text-align:left;text-indent:18.0pt;\nmso-char-indent-count:2.0;line-height:21.6pt;mso-pagination:widow-orphan\"><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;mso-font-kerning:0pt\">昔日里一些呼风唤雨、形如托拉斯的中资企业，随着中国加入</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\">WTO</span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:\nArial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;mso-font-kerning:\n0pt\">，也必须接受</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;\" mso-font-kerning:0pt\'=\"\">“</span><span style=\"font-size:9.0pt;font-family:宋体;\nmso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:\nArial;mso-font-kerning:0pt\">国际化</span><span lang=\"EN-US\" style=\"font-size:9.0pt;\nfont-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-font-kerning:0pt\">”</span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;mso-font-kerning:0pt\">的考验。什么是</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\">“</span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:\nArial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;mso-font-kerning:\n0pt\">国际化</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;\" mso-font-kerning:0pt\'=\"\">”</span><span style=\"font-size:9.0pt;font-family:宋体;\nmso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:\nArial;mso-font-kerning:0pt\">？我听到过一个很生动的比喻，这就是柏林墙的倒下和</span><span lang=\"EN-US\" arial\",\"sans-serif\";mso-font-kerning:0pt\'=\"\">3W</span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;mso-font-kerning:0pt\">（互联网）的兴起。柏林墙的倒下标志着冷战的结束，互联网的兴起标志着沟通无限。时代发展的脚步已不允许我们再固步自封，沉湎于自己缔造的温柔乡。以前在国内处于垄断地位的电信业和银行业，随着外资企业的进入，只有不断改善经营水平和服务态度，才能在激烈的竞争中占领市场。</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;mso-font-kerning:0pt\">在市场经济条件下，以前计划经济的包办代替已不复存在，企业只能根据市场环境去竞争，谋得生存和发展。如果某些企业还保持以前那种事事依靠政府去指导、包办的思想，缺乏激活自身的力量，就会被市场所淘汰，被人们所遗忘。</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"left\" style=\"text-align:left;text-indent:18.0pt;\nmso-char-indent-count:2.0;line-height:21.6pt;mso-pagination:widow-orphan\"><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\">“</span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:\nArial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;mso-font-kerning:\n0pt\">地方保护主义</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;\" mso-font-kerning:0pt\'=\"\">”</span><span style=\"font-size:9.0pt;font-family:宋体;\nmso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:\nArial;mso-font-kerning:0pt\">也是个很要命的问题。很多地方的政府为了增加税收，为了眼前短暂的利益，从而杜绝外面商品的进入。表面上看是保护了当地的企业，殊不知这正诠释了一叶障目不见泰山、只见树木不见森林的偏狭。一直处在养尊处优的地位，使企业丧失了感应市场的能力和竞争意识，滋长了企业的惰性，久而久之，企业就成了一个抵抗力极低的病人，稍感风寒，就会病入膏肓。</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"left\" style=\"text-align:left;text-indent:18.0pt;\nmso-char-indent-count:2.0;line-height:21.6pt;mso-pagination:widow-orphan\"><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;mso-font-kerning:0pt\">在美国阿拉斯加的一个自然保护区，为保护鹿不被狼吃掉，人们赶跑了所有的狼。不料，在和平安宁环境中的鹿不再狂奔，体质明显下降，不久便有许多鹿病死。人们只得再把狼</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\">“</span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:\nArial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;mso-font-kerning:\n0pt\">请</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;\" mso-font-kerning:0pt\'=\"\">”</span><span style=\"font-size:9.0pt;font-family:宋体;\nmso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:\nArial;mso-font-kerning:0pt\">回来。不久，鹿又生机焕发充满活力了；原产于欧洲北海的沙丁鱼捕捞后很难存活，当地渔民想了个绝招：在舱里放几条凶猛的鲇鱼。这样一来，沙丁鱼在鲇鱼的追赶下，始终处于紧张游动的状态，反而延长了寿命。</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\"><o:p></o:p></span></p><p align=\"left\">\n<!--[if gte mso 9]><xml>\n <o:OfficeDocumentSettings>\n  <o:TargetScreenSize>800x600</o:TargetScreenSize>\n </o:OfficeDocumentSettings>\n</xml><![endif]-->\n\n\n<!--[if gte mso 9]><xml>\n <w:WordDocument>\n  <w:View>Normal</w:View>\n  <w:Zoom>0</w:Zoom>\n  <w:TrackMoves/>\n  <w:TrackFormatting/>\n  <w:PunctuationKerning/>\n  <w:DrawingGridVerticalSpacing>7.8 磅</w:DrawingGridVerticalSpacing>\n  <w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>\n  <w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>\n  <w:ValidateAgainstSchemas/>\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\n  <w:DoNotPromoteQF/>\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\n  <w:LidThemeAsian>ZH-CN</w:LidThemeAsian>\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\n  <w:Compatibility>\n   <w:SpaceForUL/>\n   <w:BalanceSingleByteDoubleByteWidth/>\n   <w:DoNotLeaveBackslashAlone/>\n   <w:ULTrailSpace/>\n   <w:DoNotExpandShiftReturn/>\n   <w:AdjustLineHeightInTable/>\n   <w:BreakWrappedTables/>\n   <w:SnapToGridInCell/>\n   <w:WrapTextWithPunct/>\n   <w:UseAsianBreakRules/>\n   <w:DontGrowAutofit/>\n   <w:SplitPgBreakAndParaMark/>\n   <w:EnableOpenTypeKerning/>\n   <w:DontFlipMirrorIndents/>\n   <w:OverrideTableStyleHps/>\n   <w:UseFELayout/>\n  </w:Compatibility>\n  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>\n  <m:mathPr>\n   <m:mathFont m:val=\"Cambria Math\"/>\n   <m:brkBin m:val=\"before\"/>\n   <m:brkBinSub m:val=\"&#45;-\"/>\n   <m:smallFrac m:val=\"off\"/>\n   <m:dispDef/>\n   <m:lMargin m:val=\"0\"/>\n   <m:rMargin m:val=\"0\"/>\n   <m:defJc m:val=\"centerGroup\"/>\n   <m:wrapIndent m:val=\"1440\"/>\n   <m:intLim m:val=\"subSup\"/>\n   <m:naryLim m:val=\"undOvr\"/>\n  </m:mathPr></w:WordDocument>\n</xml><![endif]--><!--[if gte mso 9]><xml>\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"true\"\n  DefSemiHidden=\"true\" DefQFormat=\"false\" DefPriority=\"99\"\n  LatentStyleCount=\"267\">\n  <w:LsdException Locked=\"false\" Priority=\"0\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Normal\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"heading 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 7\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 8\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 9\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 7\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 8\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 9\"/>\n  <w:LsdException Locked=\"false\" Priority=\"35\" QFormat=\"true\" Name=\"caption\"/>\n  <w:LsdException Locked=\"false\" Priority=\"10\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Title\"/>\n  <w:LsdException Locked=\"false\" Priority=\"0\" Name=\"Default Paragraph Font\"/>\n  <w:LsdException Locked=\"false\" Priority=\"11\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtitle\"/>\n  <w:LsdException Locked=\"false\" Priority=\"22\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Strong\"/>\n  <w:LsdException Locked=\"false\" Priority=\"20\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Emphasis\"/>\n  <w:LsdException Locked=\"false\" Priority=\"59\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Table Grid\"/>\n  <w:LsdException Locked=\"false\" UnhideWhenUsed=\"false\" Name=\"Placeholder Text\"/>\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"No Spacing\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 1\"/>\n  <w:LsdException Locked=\"false\" UnhideWhenUsed=\"false\" Name=\"Revision\"/>\n  <w:LsdException Locked=\"false\" Priority=\"34\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"List Paragraph\"/>\n  <w:LsdException Locked=\"false\" Priority=\"29\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Quote\"/>\n  <w:LsdException Locked=\"false\" Priority=\"30\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Quote\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"19\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtle Emphasis\"/>\n  <w:LsdException Locked=\"false\" Priority=\"21\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Emphasis\"/>\n  <w:LsdException Locked=\"false\" Priority=\"31\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtle Reference\"/>\n  <w:LsdException Locked=\"false\" Priority=\"32\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Reference\"/>\n  <w:LsdException Locked=\"false\" Priority=\"33\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Book Title\"/>\n  <w:LsdException Locked=\"false\" Priority=\"37\" Name=\"Bibliography\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" QFormat=\"true\" Name=\"TOC Heading\"/>\n </w:LatentStyles>\n</xml><![endif]-->\n<style>\n<!--\n /* Font Definitions */\n @font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:\"\\@宋体\";\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n /* Style Definitions */\n p.MsoNormal, li.MsoNormal, div.MsoNormal\n	{mso-style-unhide:no;\n	mso-style-qformat:yes;\n	mso-style-parent:\"\";\n	margin:0cm;\n	margin-bottom:.0001pt;\n	text-align:justify;\n	text-justify:inter-ideograph;\n	mso-pagination:none;\n	font-size:10.5pt;\n	mso-bidi-font-size:12.0pt;\n	font-family:\"Times New Roman\",\"serif\";\n	mso-fareast-font-family:宋体;\n	mso-font-kerning:1.0pt;}\n.MsoChpDefault\n	{mso-style-type:export-only;\n	mso-default-props:yes;\n	font-size:10.0pt;\n	mso-ansi-font-size:10.0pt;\n	mso-bidi-font-size:10.0pt;\n	mso-ascii-font-family:\"Times New Roman\";\n	mso-fareast-font-family:宋体;\n	mso-hansi-font-family:\"Times New Roman\";\n	mso-font-kerning:0pt;}\n /* Page Definitions */\n @page\n	{mso-page-border-surround-header:no;\n	mso-page-border-surround-footer:no;}\n@page WordSection1\n	{size:612.0pt 792.0pt;\n	margin:72.0pt 90.0pt 72.0pt 90.0pt;\n	mso-header-margin:36.0pt;\n	mso-footer-margin:36.0pt;\n	mso-paper-source:0;}\ndiv.WordSection1\n	{page:WordSection1;}\n-->\n</style>\n<!--[if gte mso 10]>\n<style>\n /* Style Definitions */\n table.MsoNormalTable\n	{mso-style-name:普通表格;\n	mso-tstyle-rowband-size:0;\n	mso-tstyle-colband-size:0;\n	mso-style-noshow:yes;\n	mso-style-priority:99;\n	mso-style-parent:\"\";\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\n	mso-para-margin:0cm;\n	mso-para-margin-bottom:.0001pt;\n	mso-pagination:widow-orphan;\n	font-size:10.0pt;\n	font-family:\"Times New Roman\",\"serif\";}\n</style>\n<![endif]-->\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n</p><p class=\"MsoNormal\" align=\"left\" style=\"text-align:left;text-indent:18.0pt;\nmso-char-indent-count:2.0;line-height:21.6pt;mso-pagination:widow-orphan\"><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;mso-font-kerning:0pt\">看来，如今我们是需要</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\">“</span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:\nArial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;mso-font-kerning:\n0pt\">狼</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;\" mso-font-kerning:0pt\'=\"\">”</span><span style=\"font-size:9.0pt;font-family:宋体;\nmso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:\nArial;mso-font-kerning:0pt\">和</span><span lang=\"EN-US\" style=\"font-size:9.0pt;\nfont-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-font-kerning:0pt\">“</span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;mso-font-kerning:0pt\">鲇鱼</span><span lang=\"EN-USArial&quot;,&quot;sans-serif&quot;;mso-font-kerning:\" 0pt\'=\"\">”</span><span style=\"font-size:9.0pt;font-family:宋体;mso-ascii-font-family:\nArial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;mso-font-kerning:\n0pt\">的，我们不但不该排斥他们，而且应该夹道欢迎，用我们的激情和智慧去迎接各式各样的挑战！</span><span lang=\"EN-US\" arial\",\"sans-serif\";mso-font-kerning:0pt\'=\"\"><o:p></o:p></span></p>', 'admin', '2020-03-31 06:44:54', 1, '超级管理员', '2020-03-31 06:47:49', '审核通过', 15, 8, 29, 1);

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news`  (
  `id` bigint(0) UNSIGNED NOT NULL COMMENT '新闻id',
  `imageid` bigint(0) NULL DEFAULT NULL COMMENT '新闻轮播图片',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `ntid` bigint(0) NOT NULL COMMENT '新闻类型id',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '概要',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `publishdate` datetime(0) NOT NULL COMMENT '发布时间',
  `reviewstatus` tinyint(0) NOT NULL DEFAULT 0 COMMENT '0:未通过 1：通过',
  `reviewer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '审核人',
  `reviewdate` datetime(0) NULL DEFAULT NULL COMMENT '审核通过时间',
  `reviewComment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `pageview` bigint(0) NOT NULL DEFAULT 0 COMMENT '浏览次数',
  `notRiview` tinyint(1) NULL DEFAULT 0 COMMENT '0:未审核过 1:审核操作过',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title_Key`(`title`) USING BTREE,
  INDEX `pulishdate_Key`(`publishdate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES (6644397669244473344, 0, '先客户之忧而忧', 3, '<p>出于市场的需要，公司采取了一项很有效的策略－－产品差异性策略，采用满足用户需求、提供用户需要的服务等满足客户，拉开了与竞争对手的差距，增加了竞争的有效性。但是，现在有些产品为了尽可能满足用户需求，往往在产品版本中不断添加新的功能，而产品有一个稳定期，可能在产品还没有稳定或者刚刚稳定时，又要添加一些功能，从而造成一个“稳定→添加功能→不稳定→稳定”的循环，造成产品的不稳定性。<br> <br>而且，在设计产品特性的时候，我们的产品往往不以稳定、有效满足各项标准中最基本的功能为目的，而是以产品的功能数量、性能为指标，造成在产品编码、测试中也形成同样的导向。<br> <br>在产品的开发过程中，开发人员有一个优先级序列；而在产品的应用中，用户也有一个优先级序列。（下面优先级序列根据产品不同可能有出入，但根据多个产品的工作过程，以及和用户的多次交流，基本应该是这样。）<br> <br>公司产品的优先级列表：正确性、性能优良、新功能、结构和工艺、可操作性／可维护性、稳定性、安全性、可扩展性。<br> <br>用户的优先级列表：正确性、稳定性、性能优良、可操作性／可维护性、可扩展性、安全性、新功能、结构和工艺。<br> <br>用户要的是在正确、稳定、高性能基础上的新需求，而我们是以先提供新需求甚于系统的稳定性。<br> <br> <br>由此可见，当我们提出“关注客户需求，实现客户梦想是我们不懈的追求”时，很多时候我们不懈追求的不是客户的真正需求，更确切地说，是客户表面上的我们理解有偏差的需求，而非客户内心深处真正的需求。没有一个客户会关注新功能甚于稳定性的，一个频频出问题、又不容易定位解决问题的产品，即使功能再强大，也满足不了客户“低运营成本、高可靠性”的电信级运营要求，因为一旦设备失效，哪怕是几分钟，也会造成巨大的损失。<br> <br>由于产品是需求导向的，同时按照优先级列表，从而引发“稳定→添加功能→不稳定→稳定”循环，以市场迫切为理由，而忽视了真正的需求。<br> <br>记得刚接触ＩＰＤ时，ＩＢＭ顾问说了一句话让我茅塞顿开：“华为公司没有时间一次把产品做好，却有时间一次又一次地重复做一个产品。”在以前产品规划和开发中，的确如此。也许有市场需求的不完善和技术上的不成熟。但是，在许多领域中我们已经有基本完善的久经考验的市场需求，有完整的标准体系，有成熟的技术，可是产品依然如此。为什么？<br> <br>重要一点在于我们是在做程序，还是做产品。<br> <br>做程序，讲究的是实现功能，提供可维护性，同时是比较长时间的设计、编码、测试、维护；<br> <br>而做产品，讲究的是在提供稳定功能的前提下的市场行为，市场不管你功能是怎么实现的，只要有利润、有份额，产品就是好产品，即使你用的是１００年前的技术！<br> <br>本来产品和程序并不是割裂的，产品需要程序来实现，程序成为产品才是真正的程序（就我们的工作而言）。但由于产品总体规划的不统一，造成多个产品间重叠代码很多，出现“程序和产品的一种畸形的割裂：一种产品内有一种程序，而相同功能的同种程序在不同产品内有不同的一块代码，出现了一种产品一块代码，一块代码一种产品”的现象。诸侯割据、各自为政还说不上，但重复投入、重复劳动比比皆是；公司内部产品配合脱节，甚至不断出现内部竞争产品，让产品开发无所适从。<br> <br> <br>思考这些问题的背后，其本质是人、技术、流程的问题，而归根结底是人的问题。现在反观各个项目组实际开发过程，发现问题的所在，有人是态度问题，有人是技术问题。<br> <br>就态度问题而言，有新员工刚来时，积极性很高；但一年左右时积极性下降，主管需要引导，看到实力和机会，需要激励和鞭策。从国际角度看，公司只是一个中小公司，离跨国大公司有很长的路要走，每个人都充满了机会。同时公司为每个人提供了技术、管理两条道路，根据自己的个人发展规划，可以自由选择。<br> <br>就技术问题而言，产品规划上，产品开发列表需要按照客户真正的需求调整，从“公司产品的优先级列表”转换到“用户的优先级列表”，从松散（甚至是内部竞争）关系转换到紧密合作，最大限度地团结公司所有的力量“关注客户需求，实现客户梦想”；产品开发上，最大限度地和用户需求保持一致；同时可以从ＱＡ处获取经验数据，包括缺陷密度等，从而可以知道我们产品的真实情况，而不被没有问题的表象所蒙蔽；同时可以通过缺陷预防等经典问题，发现问题，提高水平。还有就是积极安排查错任务，举行一些走读检视活动，通过这些活动，老员工将自己的经验传递给新员工，提高群体的水平。同时进行一些需求控制、版本控制，在保证产品质量的前提下，再提升产品的功能。<br> <br>而在这些活动中，可以结合ＩＰＤ－ＣＭＭ，不断提出新的行之有效的新流程，或者完善原有流程中不完善、不具体的地方，使得这些活动成为标准的过程，在以后的开发过程中发挥作用。<br> <br>只有我们站在客户的角度进行开发，“先客户之忧而忧，后客户之乐而乐”，我们也才能够说我们是在真正关注、满足客户的需求。</p>', '出于市场的需要，公司采取了一项很有效的策略－－产品差异性策略，采用满足用户需求、提供用户需要的服务等满足客户，拉开了与竞争对手的差距，增加了竞争的有效性。但是，', '罗玲敏', '2020-03-31 06:36:50', 1, '超级管理员', '2020-03-31 06:37:08', '审核通过', 9, 1);
INSERT INTO `t_news` VALUES (6644398354107207680, 0, '联想的45条成功经验', 3, '<p class=\"MsoNormal\" align=\"left\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;text-align:left;line-height:18.0pt;mso-pagination:widow-orphan;mso-outline-level:\n3;background:#F4F4FD\"><b><span lang=\"EN-US\" style=\"font-size:16.5pt;font-family:\n宋体;mso-bidi-font-family:宋体;mso-font-kerning:0pt\"><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></span></b></p><p class=\"MsoNormal\" align=\"left\" style=\"mso-margin-top-alt:auto;mso-margin-bottom-alt:\nauto;text-align:left;line-height:18.0pt;mso-pagination:widow-orphan;background:\n#F4F4FD\"><span lang=\"EN-US\" style=\"font-size:9.0pt;font-family:宋体;mso-bidi-font-family:\n宋体;color:#3A3A3A;mso-font-kerning:0pt\"><script>\nvar referrer = document.referrer;\nif (referrer) {\n	seksearch(referrer) ;\n}\nfunction seksearch(referer){\n    var url = \"/ajaxWelcomeInfo.jspa\";\n      \n    	var pars = \"referer=\" + encodeURIComponent(referer)+\"&forumID=900006&threadID=934518\" ;\n    	var myAjax = new Ajax.Request(url, {method:\'post\',parameters: pars, onComplete: updateSEBox});\n	 	\n}\nfunction updateSEBox(lsXmlHttp) {\n	setTimeout(function(){ \n		var resp = lsXmlHttp.responseText;\n		if(resp!=null&&resp!=\"\"){\n			document.getElementById(\"search_engine_box\").innerHTML= resp;\n			document.getElementById(\"search_engine_box\").style.display=\"block\";\n		}\n	},500);		\n}\n</script></span><span lang=\"EN-US\" style=\"mso-bidi-font-size:10.5pt;font-family:\n宋体;mso-bidi-font-family:宋体;mso-font-kerning:0pt\">&nbsp;&nbsp;&nbsp; (1)</span><span style=\"mso-bidi-font-size:10.5pt;font-family:宋体;mso-bidi-font-family:宋体;\nmso-font-kerning:0pt\">利用传统<span lang=\"EN-US\"><a href=\"http://www.ceconlinebbs.com/LT/%D6%C6%B6%C8.HTM\" target=\"_blank\"><span lang=\"EN-US\" style=\"mso-bidi-font-size:12.0pt;color:#000066;text-decoration:none;\ntext-underline:none\"><span lang=\"EN-US\">制度</span></span></a></span>中的资源，营造一条新兴之路。在新旧制度犬牙交错的环境中，找到一个反抗旧制度但又不立即与其分裂的方法。充分利用两者的长处<span lang=\"EN-US\">——</span>旧制度的稳定和新制度的机会，而又避免两者的短处<span lang=\"EN-US\">——</span>旧制度的僵死和新制度的风险。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (2)</span>做出一条光彩夺目的项链来。有的人像一颗珍珠，有的人不是珍珠，不能像珍珠一样闪闪发光，但他是一条线，能把那些珍珠串起。<span lang=\"EN-US\"><a href=\"http://www.ceconlinebbs.com/LT/%C6%F3%D2%B5.HTM\" target=\"_blank\"><span lang=\"EN-US\" style=\"mso-bidi-font-size:12.0pt;color:#000066;\ntext-decoration:none;text-underline:none\"><span lang=\"EN-US\">企业</span></span></a></span>的领导者必须知道自己的价值所在<span lang=\"EN-US\">——</span>你是那条线。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (3)</span>在商品的买卖之间有一种东西，能唤醒人们的梦想和激情。一些优秀的人被训练成商人，并且开始以商业准则来衡量自己的行为，这没有什么不好。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (4)</span>真正的尊严是不怕被别人践踏的。让自己的利益、自尊和身家性命时刻处在风险之中，是一件有意义的事。它促使一个人坚忍、挺拔和斗志昂扬，并且顽强地保持一种既崇高又有实效的道德水准。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (5)“</span>定战略<span lang=\"EN-US\">”</span>始终是治理<span lang=\"EN-US\"><a href=\"http://www.ceconlinebbs.com/LT/%B9%AB%CB%BE.HTM\" target=\"_blank\"><span lang=\"EN-US\" style=\"mso-bidi-font-size:12.0pt;color:#000066;\ntext-decoration:none;text-underline:none\"><span lang=\"EN-US\">公司</span></span></a></span>的第一要旨。在这里没有一劳永逸，即使是那些最棒的战略也会因时而变。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (6)</span>把国家的大潮流用好用足。利用<span lang=\"EN-US\">“</span>天时<span lang=\"EN-US\">”</span>和<span lang=\"EN-US\">“</span>地利<span lang=\"EN-US\">”</span>去实现公司的市场计划。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (7)</span>了解世界正在发生什么事。优秀的管理者都是胸怀大局的人。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (8)</span>实用主义的处世方式和远见卓识一样重要。杰出的企业家都是信念坚定的人，同时又是超级机会主义者。处理公司内外的纷争，所凭据的常常不是原则，而是常情，不是个人的得失，而是公司的利益。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (9)</span>斗智不斗勇。这世道的许多事情并不在于一时一事的秉公周正，而在于维系大局的平衡，所以既然不能<span lang=\"EN-US\">“</span>智取<span lang=\"EN-US\">”</span>，那就认罚。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (10)</span>谨慎行事，同时敢于铤而走险。每逢需要豁出命来放手一搏的时刻，绝对不能踌躇不前。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (11)</span>绝不轻言放弃。把<span lang=\"EN-US\">5%</span>的希望变成<span lang=\"EN-US\">100%</span>的现实，是<span lang=\"EN-US\"><a href=\"http://www.ceconlinebbs.com/LT/%C1%AA%CF%EB.HTM\" target=\"_blank\"><span lang=\"EN-US\" style=\"mso-bidi-font-size:12.0pt;color:#000066;text-decoration:none;\ntext-underline:none\"><span lang=\"EN-US\">联想</span></span></a></span>的管理哲学中最令人激动的部分之一。与其说这是管理，倒不如说这是信念。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (12)</span>办公司就是办人。一支队伍比一个产品更重要，所以必须带出一支队伍来，公司才能长久。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (13)</span>选拔继任者是<span lang=\"EN-US\">“</span>最艰难的工程<span lang=\"EN-US\">”</span>，必须早做打算。一个公司如同一个人的肌体，如果不能吐故纳新，也就必然失去生机。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp; (14)</span>把权力和利益交给那些真正承担责任的人。这是激发一个人的潜在能力最有效的办法。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (15)</span>绝对不能以<span lang=\"EN-US\">“</span>和稀泥<span lang=\"EN-US\">”</span>的方式处理人事之间的纠葛。一个机构的领导者中一旦出现嫌隙而又不能迅速弥合，就会让属下不由自主地划线站队，各自确定爱憎以及寻找靠山，进而使整个公司不能避免派系的侵害。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (16)</span>永远只做自己能力所及、而又有利可图的事。一个卓越的经理有足够的智慧辨别什么是自己能做的，什么是自己不能做的，什么东西虽然很好，但不是现在做，而是在将来的某一个时间做。知道自己不能做什么常常比知道自己能够做什么还要难，越是伟大的人就越是如此。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (17)</span>经理人员特别善于在政府官员面前推销公司，就像销售人员特别善于在用户面前推销产品一样。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (18)</span>抢在产业的起飞阶段进入市场。这是商场制胜的奥秘之一。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (19)</span>一项产品即使在设计方面完美无缺，也不能算是最后的<span lang=\"EN-US\"><a href=\"http://www.ceconlinebbs.com/LT/%B3%C9%B9%A6.HTM\" target=\"_blank\"><span lang=\"EN-US\" style=\"mso-bidi-font-size:12.0pt;color:#000066;text-decoration:none;\ntext-underline:none\"><span lang=\"EN-US\">成功</span></span></a></span>。因为生产一台机器和生产<span lang=\"EN-US\">100</span>万台机器之间的区别，绝不仅仅在于数量，它将导致整个生产的组织和流程发生根本变化。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (20)</span>一项产品的启动，需要贯通整个组织的链条。在拥有正确的战略方向、成熟的技术和足够的资本之后，决定胜负的关键之役常常取决于一个小组甚至一个人。只要一个环节出了错，就会满盘皆输。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (21)</span>最好的东西不一定是用户所需要的，只有最适合用户的东西才是最好的。市场的选择和实验室里的选择是完全不同的两回事。在实验室里可以不遗余力地追求完美，但是在市场上，用户不在乎你的技术是否完美，他们只关注自己的需要。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (22)</span>让亿万普通人认识到自己的需要。最佳的广告策略不是推销产品，甚至也不是推广形象，而是在企业利益和客户需求之间，找到一个最好的结合点。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (23)</span>向消费者献上最好的产品，再加上诚实、微笑、循循善诱和百般奉承。商业的权力和资本已经无法驱使民众为己所用，普通百姓口袋里的钱成了推动国家经济发展的最重要的力量。没有任何一种力量能够强迫老百姓购买他们不愿意买的东西。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (24)</span>不要只把眼睛盯着有钱有势的人。普通人的需求往往能带来至关重要的转折点。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (25)</span>每做成一笔生意，就交到一个朋友。不仅要让自己赚钱，而且还要让客户赢，让代理商赚钱。生意做得越多，朋友也越多，做生意的机会也就越多。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (26)</span>技术当然是推动企业前进的力量，但若仅仅凭借技术，那就一事无成。因为任何技术都是短命的，真正使公司生生不息的，是创新技术和把技术推向市场的能力。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (27)</span>每个人都需要得到认可。精神的认可和物质的认可，都是不能缺少的。即使是那些最有才华、超凡脱俗的人，也在乎别人说什么。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (28)</span>相信人的本性中具有追求利益的特征。一种好的利益格局，能够让人们把这种追求与职业的责任感结合在一起。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (29)</span>员工的收入体系永远都是治理公司的一个支点。成功的战略是将这一连串支点连成线，建立一条坦途。否则一切会议、号召、战略目标都将成为例行公事，毫无生气。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (30)</span>找到一条途径，以法律和道德都能认可的方式来确认员工的利益。这需要智慧，还需要足够的耐心。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (31)</span>管理的要旨在于，让每个员工都清楚在什么时间什么地点做什么事情。每项业务活动之间既不能有空白也不能有重叠，当然更不能有冲突。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (32)</span>理解和掌握媒体。媒体与企业就像一对各怀心事的恩怨夫妻：企业借助媒体的力量营造声势，媒体则无论情势顺逆都能从中渔利。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (33)</span>不要在意舆论的褒贬。当公司成功的时候，它容易成为一部分人的攻击目标。当公司受挫的时候，它又容易成为另一部分人的攻击目标。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (34)</span>你在为自己争取活路的同时，也必须让别人活。那种只顾自己痛快不管别人死活的做法，必然会遭到顽强的反击，其中的关键点首先不是法律，而是常情。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp; (35)</span>最好的财务制度具有一种<span lang=\"EN-US\">“</span>预警的能力<span lang=\"EN-US\">”</span>，能让公司的每一个人都以更确定的方式感受到责任和压力。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (36)</span>投资者喜欢诚实的企业管理者。大多数管理者都会奉行<span lang=\"EN-US\">“</span>家丑不外扬<span lang=\"EN-US\">”</span>的原则。这是为了公司利益，还和个人品格有关。但事实证明，公司从诚实中得到的好处，总是比人们想像得要多。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (37)</span>善于学习。杰出的人常常会犯同一个错误：过分关注让自己成功的领域，而对新兴的事务反应迟钝。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (38)</span>掌握资本的特性<span lang=\"EN-US\">——</span>小钱和大钱不一样。量变会带来质变。你经营一桩<span lang=\"EN-US\">20</span>万元的小买卖时，盈利<span lang=\"EN-US\">10%</span>并不难，但是你要让手上的<span lang=\"EN-US\">20</span>亿元赚回<span lang=\"EN-US\">10%</span>，那就要困难<span lang=\"EN-US\">100</span>倍。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (39)</span>必须学习如何对付屈辱、艰辛和失败，也必须学习如何对付辉煌和成功。否则，成功就会成为一种妨碍自己发展的不利因素。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (40)</span>常怀危机意识。就像人们在危机中容易失去必胜的信心一样，人们在成功时也容易忘记危机。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (41)</span>警惕缓慢逼近的危险。它常常比突发性的危机更可怕。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (42)</span>百折不挠。你和别人的不同不在于有没有过失败，而在于遇到失败的时候，有没有坚忍不拔的意志。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (43)</span>退却比进攻更需要勇气。对于一帆风顺、志得意满的经理人员来说，更是如此。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (44)</span>不要把企业当成一个真正意义上的家。员工既要感到有温馨的一面，更要奋勇争先而感到压力的另一面。<span lang=\"EN-US\"><br>\n<br>\n&nbsp;&nbsp;&nbsp; (45)</span>矢志不渝。每个公司在初创时都是激情满怀的，问题在于随着岁月的流逝会不会渐渐冷漠。所以，有必要在每年的第一天里问问自己：我还有当年的那份激情吗<span lang=\"EN-US\">?<o:p></o:p></span></span></p><p>\n\n<!--[if !mso]>\n<style>\nv\\:* {behavior:url(#default#VML);}\no\\:* {behavior:url(#default#VML);}\nw\\:* {behavior:url(#default#VML);}\n.shape {behavior:url(#default#VML);}\n</style>\n<![endif]--><!--[if gte mso 9]><xml>\n <o:OfficeDocumentSettings>\n  <o:TargetScreenSize>800x600</o:TargetScreenSize>\n </o:OfficeDocumentSettings>\n</xml><![endif]-->\n\n\n<!--[if gte mso 9]><xml>\n <w:WordDocument>\n  <w:View>Normal</w:View>\n  <w:Zoom>0</w:Zoom>\n  <w:TrackMoves/>\n  <w:TrackFormatting/>\n  <w:PunctuationKerning/>\n  <w:DrawingGridVerticalSpacing>7.8 磅</w:DrawingGridVerticalSpacing>\n  <w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>\n  <w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>\n  <w:ValidateAgainstSchemas/>\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\n  <w:DoNotPromoteQF/>\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\n  <w:LidThemeAsian>ZH-CN</w:LidThemeAsian>\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\n  <w:Compatibility>\n   <w:SpaceForUL/>\n   <w:BalanceSingleByteDoubleByteWidth/>\n   <w:DoNotLeaveBackslashAlone/>\n   <w:ULTrailSpace/>\n   <w:DoNotExpandShiftReturn/>\n   <w:AdjustLineHeightInTable/>\n   <w:BreakWrappedTables/>\n   <w:SnapToGridInCell/>\n   <w:WrapTextWithPunct/>\n   <w:UseAsianBreakRules/>\n   <w:DontGrowAutofit/>\n   <w:SplitPgBreakAndParaMark/>\n   <w:EnableOpenTypeKerning/>\n   <w:DontFlipMirrorIndents/>\n   <w:OverrideTableStyleHps/>\n   <w:UseFELayout/>\n  </w:Compatibility>\n  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>\n  <m:mathPr>\n   <m:mathFont m:val=\"Cambria Math\"/>\n   <m:brkBin m:val=\"before\"/>\n   <m:brkBinSub m:val=\"&#45;-\"/>\n   <m:smallFrac m:val=\"off\"/>\n   <m:dispDef/>\n   <m:lMargin m:val=\"0\"/>\n   <m:rMargin m:val=\"0\"/>\n   <m:defJc m:val=\"centerGroup\"/>\n   <m:wrapIndent m:val=\"1440\"/>\n   <m:intLim m:val=\"subSup\"/>\n   <m:naryLim m:val=\"undOvr\"/>\n  </m:mathPr></w:WordDocument>\n</xml><![endif]--><!--[if gte mso 9]><xml>\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"true\"\n  DefSemiHidden=\"true\" DefQFormat=\"false\" DefPriority=\"99\"\n  LatentStyleCount=\"267\">\n  <w:LsdException Locked=\"false\" Priority=\"0\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Normal\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"heading 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 7\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 8\"/>\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 9\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 7\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 8\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 9\"/>\n  <w:LsdException Locked=\"false\" Priority=\"0\" Name=\"header\"/>\n  <w:LsdException Locked=\"false\" Priority=\"0\" Name=\"footer\"/>\n  <w:LsdException Locked=\"false\" Priority=\"35\" QFormat=\"true\" Name=\"caption\"/>\n  <w:LsdException Locked=\"false\" Priority=\"10\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Title\"/>\n  <w:LsdException Locked=\"false\" Priority=\"0\" Name=\"Default Paragraph Font\"/>\n  <w:LsdException Locked=\"false\" Priority=\"11\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtitle\"/>\n  <w:LsdException Locked=\"false\" Priority=\"22\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Strong\"/>\n  <w:LsdException Locked=\"false\" Priority=\"20\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Emphasis\"/>\n  <w:LsdException Locked=\"false\" Priority=\"59\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Table Grid\"/>\n  <w:LsdException Locked=\"false\" UnhideWhenUsed=\"false\" Name=\"Placeholder Text\"/>\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"No Spacing\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 1\"/>\n  <w:LsdException Locked=\"false\" UnhideWhenUsed=\"false\" Name=\"Revision\"/>\n  <w:LsdException Locked=\"false\" Priority=\"34\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"List Paragraph\"/>\n  <w:LsdException Locked=\"false\" Priority=\"29\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Quote\"/>\n  <w:LsdException Locked=\"false\" Priority=\"30\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Quote\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 1\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 2\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 3\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 4\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 5\"/>\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 6\"/>\n  <w:LsdException Locked=\"false\" Priority=\"19\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtle Emphasis\"/>\n  <w:LsdException Locked=\"false\" Priority=\"21\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Emphasis\"/>\n  <w:LsdException Locked=\"false\" Priority=\"31\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtle Reference\"/>\n  <w:LsdException Locked=\"false\" Priority=\"32\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Reference\"/>\n  <w:LsdException Locked=\"false\" Priority=\"33\" SemiHidden=\"false\"\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Book Title\"/>\n  <w:LsdException Locked=\"false\" Priority=\"37\" Name=\"Bibliography\"/>\n  <w:LsdException Locked=\"false\" Priority=\"39\" QFormat=\"true\" Name=\"TOC Heading\"/>\n </w:LatentStyles>\n</xml><![endif]-->\n<style>\n<!--\n /* Font Definitions */\n @font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:宋体;\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-alt:SimSun;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n@font-face\n	{font-family:\"\\@宋体\";\n	panose-1:2 1 6 0 3 1 1 1 1 1;\n	mso-font-charset:134;\n	mso-generic-font-family:auto;\n	mso-font-pitch:variable;\n	mso-font-signature:3 680460288 22 0 262145 0;}\n /* Style Definitions */\n p.MsoNormal, li.MsoNormal, div.MsoNormal\n	{mso-style-unhide:no;\n	mso-style-qformat:yes;\n	mso-style-parent:\"\";\n	margin:0cm;\n	margin-bottom:.0001pt;\n	text-align:justify;\n	text-justify:inter-ideograph;\n	mso-pagination:none;\n	font-size:10.5pt;\n	mso-bidi-font-size:12.0pt;\n	font-family:\"Times New Roman\",\"serif\";\n	mso-fareast-font-family:宋体;\n	mso-font-kerning:1.0pt;}\np.MsoHeader, li.MsoHeader, div.MsoHeader\n	{mso-style-unhide:no;\n	mso-style-link:\"页眉 Char\";\n	margin:0cm;\n	margin-bottom:.0001pt;\n	text-align:center;\n	mso-pagination:none;\n	tab-stops:center 207.65pt right 415.3pt;\n	layout-grid-mode:char;\n	border:none;\n	mso-border-bottom-alt:solid windowtext .75pt;\n	padding:0cm;\n	mso-padding-alt:0cm 0cm 1.0pt 0cm;\n	font-size:9.0pt;\n	font-family:\"Times New Roman\",\"serif\";\n	mso-fareast-font-family:宋体;\n	mso-font-kerning:1.0pt;}\np.MsoFooter, li.MsoFooter, div.MsoFooter\n	{mso-style-unhide:no;\n	mso-style-link:\"页脚 Char\";\n	margin:0cm;\n	margin-bottom:.0001pt;\n	mso-pagination:none;\n	tab-stops:center 207.65pt right 415.3pt;\n	layout-grid-mode:char;\n	font-size:9.0pt;\n	font-family:\"Times New Roman\",\"serif\";\n	mso-fareast-font-family:宋体;\n	mso-font-kerning:1.0pt;}\nspan.Char\n	{mso-style-name:\"页眉 Char\";\n	mso-style-unhide:no;\n	mso-style-locked:yes;\n	mso-style-link:页眉;\n	mso-ansi-font-size:9.0pt;\n	mso-bidi-font-size:9.0pt;\n	mso-font-kerning:1.0pt;}\nspan.Char0\n	{mso-style-name:\"页脚 Char\";\n	mso-style-unhide:no;\n	mso-style-locked:yes;\n	mso-style-link:页脚;\n	mso-ansi-font-size:9.0pt;\n	mso-bidi-font-size:9.0pt;\n	mso-font-kerning:1.0pt;}\n.MsoChpDefault\n	{mso-style-type:export-only;\n	mso-default-props:yes;\n	font-size:10.0pt;\n	mso-ansi-font-size:10.0pt;\n	mso-bidi-font-size:10.0pt;\n	mso-ascii-font-family:\"Times New Roman\";\n	mso-fareast-font-family:宋体;\n	mso-hansi-font-family:\"Times New Roman\";\n	mso-font-kerning:0pt;}\n /* Page Definitions */\n @page\n	{mso-page-border-surround-header:no;\n	mso-page-border-surround-footer:no;}\n@page WordSection1\n	{size:595.3pt 841.9pt;\n	margin:72.0pt 90.0pt 72.0pt 90.0pt;\n	mso-header-margin:42.55pt;\n	mso-footer-margin:49.6pt;\n	mso-paper-source:0;\n	layout-grid:15.6pt;}\ndiv.WordSection1\n	{page:WordSection1;}\n-->\n</style>\n<!--[if gte mso 10]>\n<style>\n /* Style Definitions */\n table.MsoNormalTable\n	{mso-style-name:普通表格;\n	mso-tstyle-rowband-size:0;\n	mso-tstyle-colband-size:0;\n	mso-style-noshow:yes;\n	mso-style-priority:99;\n	mso-style-parent:\"\";\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\n	mso-para-margin:0cm;\n	mso-para-margin-bottom:.0001pt;\n	mso-pagination:widow-orphan;\n	font-size:10.0pt;\n	font-family:\"Times New Roman\",\"serif\";}\n</style>\n<![endif]-->\n\n\n\n\n\n\n\n\n\n</p><p class=\"MsoNormal\"><span lang=\"EN-US\" style=\"font-size:9.0pt;font-family:宋体;\nmso-bidi-font-family:宋体;color:#3A3A3A;mso-font-kerning:0pt\"><script>\n					function testJump(website){\n					var str = \'/images/blank.gif?jumpto=\'+website+\'-\'+ new Date().getTime();\n					document.getElementById(website+\'IMG\').src=str;\n					}\n				\n</script></span><span lang=\"EN-US\"><o:p>&nbsp;</o:p></span></p>', '(1)利用传统制度中的资源，营造一条新兴之路。在新旧制度犬牙交错的环境中，找到一个反抗旧制度但又不立即与其分裂的方法。充分利用两者的长处——旧制度的稳定和新制度', '罗玲敏', '2020-03-31 06:39:33', 1, '超级管理员', '2020-03-31 07:08:03', '审核通过', 20, 1);
INSERT INTO `t_news` VALUES (6644810930565681152, 6644810380537237504, '我公司入选2020年国家科技型中小企业库', 3, '<p>我公司入选2020年国家科技型中小企业库，编号为：202051011608001023</p><p>科技创新，中亚一直路上！</p><p><img src=\"http://192.168.0.212:8289/static/2020/17/4/69b4b20a5c584953a89ce636fc3d8384.jpg\" style=\"max-width:100%;\"><br></p>', '我公司入选2020年国家科技型中小企业库，编号为：202051011608001023科技创新，中亚一直路上！', '罗玲敏', '2020-04-01 09:58:59', 1, '超级管理员', '2020-04-01 09:59:25', '审核通过', 54, 1);
INSERT INTO `t_news` VALUES (6726072215210561536, 6726072205731434496, '习近平对平安中国建设作出重要指示强调　全面提升平安中国建设水平　不断增强人民群众获得感幸福感安全感', 4, '<p>新华社北京11月11日电 中共中央总书记、国家主席、中央军委主席习近平近日对平安中国建设作出重要指示指出，近年来，各地区各有关部门贯彻党中央决策部署，扎实开展平安中国建设，为推动经济发展、维护社会稳定、保障人民安全作出了重要贡献。</p><p>习近平强调，建设更高水平的平安中国意义重大。各地区各有关部门要认真贯彻党的十九届五中全会精神，落实总体国家安全观，坚持共建共治共享方向，聚焦影响国家安全、社会安定、人民安宁的突出问题，深入推进市域社会治理现代化，深化平安创建活动，加强基层组织、基础工作、基本能力建设，全面提升平安中国建设科学化、社会化、法治化、智能化水平，不断增强人民群众获得感、幸福感、安全感。各级党委和政府要加强对平安建设的组织领导，研究解决体制性、机制性、政策性问题，切实肩负起促一方发展、保一方平安的政治责任。</p><p>平安中国建设工作会议10日在北京召开。中共中央政治局委员、中央政法委书记郭声琨在会上传达习近平重要指示并讲话。他强调，要坚持以习近平新时代中国特色社会主义思想为指导，增强“四个意识”、坚定“四个自信”、做到“两个维护”，紧紧围绕坚持和完善中国特色社会主义制度、推进国家治理体系和治理能力现代化总目标，落实总体国家安全观，以共建共治共享为导向，以防范化解影响安全稳定的突出风险为重点，以市域社会治理现代化、基层社会治理创新、平安创建活动为抓手，建设更高水平的平安中国。</p><p>国务委员、公安部部长赵克志，最高人民法院院长周强，最高人民检察院检察长张军出席会议。</p>', '新华社北京11月11日电 中共中央总书记、国家主席、中央军委主席习近平近日对平安中国建设作出重要指示指出，近年来，各地区各有关部门贯彻党中央决策部署，扎实开展平', '测试发布用户', '2020-11-11 15:42:19', 1, '测试审核用户', '2020-11-11 15:43:13', '审核通过', 2, 1);

-- ----------------------------
-- Table structure for t_newstype
-- ----------------------------
DROP TABLE IF EXISTS `t_newstype`;
CREATE TABLE `t_newstype`  (
  `ntid` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '新闻类型id',
  `newsTName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻类型名称',
  PRIMARY KEY (`ntid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新闻类型名称' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_newstype
-- ----------------------------
INSERT INTO `t_newstype` VALUES (1, '重大新闻');
INSERT INTO `t_newstype` VALUES (2, '突发新闻');
INSERT INTO `t_newstype` VALUES (3, '内部新闻');
INSERT INTO `t_newstype` VALUES (4, '国内新闻');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` bigint(0) UNSIGNED NOT NULL COMMENT '公告id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `ntid` bigint(0) NOT NULL COMMENT '公告类型',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `publishdate` datetime(0) NOT NULL COMMENT '发布时间',
  `reviewstatus` tinyint(0) NOT NULL DEFAULT 0 COMMENT '0：未通过 1：通过',
  `reviewer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `reviewdate` datetime(0) NULL DEFAULT NULL COMMENT '审核日期',
  `reviewComment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `pageview` bigint(0) NULL DEFAULT 0 COMMENT '浏览量',
  `notRiview` tinyint(1) NULL DEFAULT 0 COMMENT '0:未审核过 1:审核操作过',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title_uniq_key`(`title`) USING BTREE,
  INDEX `title_Key`(`title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (6644078826714304512, '关于恢复正常作息时间的通知 ', 8, '关于恢复正常作息时间的通知各部门及全体员工：鉴于目前成都公共交通已完全恢复正常运转，公司决定自2020年3月18日起恢复执行正常作息时间，原正常班8:50-18', '<p>关于恢复正常作息时间的通知<br><br>各部门及全体员工：<br><br>鉴于目前成都公共交通已完全恢复正常运转，公司决定自2020年3月18日起恢复执行正常作息时间，原正常班8:50-18:00，弹性工作制仍按原弹性工作时间执行。请各位同事相互转告。<br><br>员工不得在工作时间内就餐等做与工作无关的事情。<br><br>特此通知。<br><br> <br><br>成都中亚通茂科技股份有限公司<br><br>2020年03月17日</p>', '超级管理员', '2020-03-30 09:29:52', 1, '超级管理员', '2020-03-30 09:30:02', '审核通过', 11, 1);
INSERT INTO `t_notice` VALUES (6644383721933770752, '清明节放假通知', 8, '各部门及员工：清明节将至，根据国家节假日放假规定，公司2020年清明节放假安排如下：放假时间：04月04日至04月05日，共2天。原定于04月04日的单休周周六', '<p>各部门及员工：</p><p>清明节将至，根据国家节假日放假规定，公司2020年清明节放假安排如下：</p><p>放假时间：04月04日至04月05日，共2天。</p><p>原定于04月04日的单休周周六应上班，因当天为清明节，临时调整至04月06日（周一）上班。</p><p>请各部门做好安全及相关工作安排。</p><p>特此通知。</p><p>&nbsp;</p><p>&nbsp;</p><p>成都中亚通茂科技股份有限公司</p><p>2020年03月30日&nbsp;</p>', '罗玲敏', '2020-03-31 05:41:24', 1, '超级管理员', '2020-03-31 05:41:51', '审核通过', 34, 1);

-- ----------------------------
-- Table structure for t_noticetype
-- ----------------------------
DROP TABLE IF EXISTS `t_noticetype`;
CREATE TABLE `t_noticetype`  (
  `ntid` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '通告类型id',
  `noticeTName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通告类型名称',
  PRIMARY KEY (`ntid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通告类型' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_noticetype
-- ----------------------------
INSERT INTO `t_noticetype` VALUES (1, '培训类');
INSERT INTO `t_noticetype` VALUES (2, '制度类');
INSERT INTO `t_noticetype` VALUES (3, '情况通报');
INSERT INTO `t_noticetype` VALUES (4, '批评通报');
INSERT INTO `t_noticetype` VALUES (5, '表彰通报 ');
INSERT INTO `t_noticetype` VALUES (8, '管理类');

-- ----------------------------
-- Table structure for t_orgtrain
-- ----------------------------
DROP TABLE IF EXISTS `t_orgtrain`;
CREATE TABLE `t_orgtrain`  (
  `id` bigint(0) UNSIGNED NOT NULL COMMENT '培训文章id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publishdate` datetime(0) NOT NULL,
  `pageview` bigint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title_Key`(`title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '培训专栏' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project`  (
  `contractnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '合同编号',
  `projectnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目号',
  `projecttoken` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作令',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '项目状态',
  `planstart` datetime(0) NULL DEFAULT NULL COMMENT '计划开始时间',
  `planstop` datetime(0) NULL DEFAULT NULL COMMENT '计划完工期',
  `reallycomplete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`contractnum`, `projectnum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_quality
-- ----------------------------
DROP TABLE IF EXISTS `t_quality`;
CREATE TABLE `t_quality`  (
  `id` bigint(0) UNSIGNED NOT NULL,
  `type` tinyint(0) NOT NULL COMMENT '0:质量月报 1:警示案例 3:其他',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publishdate` datetime(0) NOT NULL,
  `pageview` bigint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title_Key`(`title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '质量专栏' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_regulations
-- ----------------------------
DROP TABLE IF EXISTS `t_regulations`;
CREATE TABLE `t_regulations`  (
  `id` bigint(0) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publishdate` datetime(0) NOT NULL,
  `dptid` int(0) NULL DEFAULT NULL COMMENT '所属部门',
  `pageview` bigint(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title_Key`(`title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '规章制度' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dept`;
CREATE TABLE `t_sys_dept`  (
  `dptid` int(0) NOT NULL,
  `dptname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`dptid`, `dptname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sys_dept
-- ----------------------------
INSERT INTO `t_sys_dept` VALUES (3, '质量管理部');
INSERT INTO `t_sys_dept` VALUES (6, '生产总部');
INSERT INTO `t_sys_dept` VALUES (7, '财务部');
INSERT INTO `t_sys_dept` VALUES (8, '营销中心');
INSERT INTO `t_sys_dept` VALUES (15, '采购部');
INSERT INTO `t_sys_dept` VALUES (24, '计划部');
INSERT INTO `t_sys_dept` VALUES (25, '技术研发中心');
INSERT INTO `t_sys_dept` VALUES (26, '软件研发中心');
INSERT INTO `t_sys_dept` VALUES (27, '技术服务中心');
INSERT INTO `t_sys_dept` VALUES (46, '总经办');
INSERT INTO `t_sys_dept` VALUES (47, '人力资源管理部');
INSERT INTO `t_sys_dept` VALUES (48, '行政后勤部 ');
INSERT INTO `t_sys_dept` VALUES (49, '总工办');

-- ----------------------------
-- Table structure for t_sys_module
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_module`;
CREATE TABLE `t_sys_module`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `modulename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent` bigint(0) NOT NULL,
  `delflag` tinyint(0) NULL DEFAULT 0 COMMENT '0:未删除 1：删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sys_module
-- ----------------------------
INSERT INTO `t_sys_module` VALUES (1, '系统管理', 0, 0);
INSERT INTO `t_sys_module` VALUES (2, '用户管理', 1, 0);
INSERT INTO `t_sys_module` VALUES (3, '角色管理', 1, 0);
INSERT INTO `t_sys_module` VALUES (4, '新闻类型', 1, 0);
INSERT INTO `t_sys_module` VALUES (5, '通告类型', 1, 0);
INSERT INTO `t_sys_module` VALUES (6, '内容发布', 0, 0);
INSERT INTO `t_sys_module` VALUES (7, '新闻发布', 6, 0);
INSERT INTO `t_sys_module` VALUES (8, '通告发布', 6, 0);
INSERT INTO `t_sys_module` VALUES (9, '培训发布', 6, 0);
INSERT INTO `t_sys_module` VALUES (10, '制度文档', 6, 0);
INSERT INTO `t_sys_module` VALUES (11, '质量建设', 6, 0);
INSERT INTO `t_sys_module` VALUES (13, '荣誉管理', 6, 0);
INSERT INTO `t_sys_module` VALUES (14, '内容审核', 0, 0);
INSERT INTO `t_sys_module` VALUES (15, '新闻审核', 14, 0);
INSERT INTO `t_sys_module` VALUES (16, '通告审核', 14, 0);
INSERT INTO `t_sys_module` VALUES (17, '分享审核', 14, 0);
INSERT INTO `t_sys_module` VALUES (23, '评论审核', 14, 0);

-- ----------------------------
-- Table structure for t_sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_permission`;
CREATE TABLE `t_sys_permission`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `moduleid` bigint(0) NOT NULL COMMENT '-1表示属于系统，不属于具体某个模块',
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mustneed` tinyint(0) NOT NULL DEFAULT 0 COMMENT '1：游客可访问 0：登录访问',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sys_permission
-- ----------------------------
INSERT INTO `t_sys_permission` VALUES (1, '【用户管理】用户登录', 2, '/back/user/signin', 1);
INSERT INTO `t_sys_permission` VALUES (2, '【用户管理】用户退出/注销', 2, '/back/user/logout', 1);
INSERT INTO `t_sys_permission` VALUES (3, '【用户管理】用户新增', 2, '/back/user/add', 0);
INSERT INTO `t_sys_permission` VALUES (4, '【用户管理】用户更新', 2, '/back/user/update', 0);
INSERT INTO `t_sys_permission` VALUES (5, '【用户管理】用户分页获取', 2, '/back/user/lists', 0);
INSERT INTO `t_sys_permission` VALUES (6, '【用户管理】用户密码校验', 2, '/back/user/validate', 1);
INSERT INTO `t_sys_permission` VALUES (7, '【用户管理】用户密码更新', 2, '/back/user/updatePasswd', 0);
INSERT INTO `t_sys_permission` VALUES (8, '【用户管理】获取指定用户已绑定角色列表', 2, '/back/user/specUserRoles', 0);
INSERT INTO `t_sys_permission` VALUES (9, '【用户管理】获取指定用户未绑定的角色列表', 2, '/back/user/specUserUnEnableRoles', 0);
INSERT INTO `t_sys_permission` VALUES (10, '【用户管理】给指定用户绑定角色', 2, '/back/user/bindSpecUserRole', 0);
INSERT INTO `t_sys_permission` VALUES (11, '【用户管理】给指定用户解除绑定角色', 2, '/back/user/unBindSpecUserRole', 0);
INSERT INTO `t_sys_permission` VALUES (12, '【角色管理】分页获取角色列表', 3, '/back/sysRole/lists', 0);
INSERT INTO `t_sys_permission` VALUES (13, '【角色管理】添加一个角色', 3, '/back/sysRole/add', 0);
INSERT INTO `t_sys_permission` VALUES (14, '【角色管理】删除一个角色（通过角色id）', 3, '/back/sysRole/delete', 0);
INSERT INTO `t_sys_permission` VALUES (15, '【角色管理】获取指定角色已绑定的模块列表', 3, '/back/sysRole/specRoleEnableMoudles', 0);
INSERT INTO `t_sys_permission` VALUES (16, '【角色管理】获取指定角色未拥有的一级模块列表', 3, '/back/sysRole/specRoleUnEnableRootMoudles', 0);
INSERT INTO `t_sys_permission` VALUES (17, '【角色管理】获取某角色指定模块未拥有的子模块列表', 3, '/back/sysRole/specRoleUnEnableChildMoudles', 0);
INSERT INTO `t_sys_permission` VALUES (18, '【角色管理】绑定指定角色的模块', 3, '/back/sysRole/bindSpecRoleMoudle', 0);
INSERT INTO `t_sys_permission` VALUES (19, '【角色管理】解除指定角色绑定的模块', 3, '/back/sysRole/unBindSpecRoleMoudle', 0);
INSERT INTO `t_sys_permission` VALUES (20, '【系统设置/新闻类型】获取新闻类型列表', -1, '/back/settings/newsType/getTypes', 1);
INSERT INTO `t_sys_permission` VALUES (21, '【系统设置/新闻类型】添加新闻类型', 4, '/back/settings/newsType/add', 0);
INSERT INTO `t_sys_permission` VALUES (22, '【系统设置/新闻类型】更新新闻类型', 4, '/back/settings/newsType/update', 0);
INSERT INTO `t_sys_permission` VALUES (23, '【系统设置/通告类型】获取通告类型列表', -1, '/back/settings/noticeType/getTypes', 1);
INSERT INTO `t_sys_permission` VALUES (24, '【系统设置/通告类型】添加通告类型', 5, '/back/settings/noticeType/add', 0);
INSERT INTO `t_sys_permission` VALUES (25, '【系统设置/通告类型】更新通告类型', 5, '/back/settings/noticeType/update', 0);
INSERT INTO `t_sys_permission` VALUES (26, '【模块】获取一级模块列表', -1, '/back/sysModule/getRootModules', 1);
INSERT INTO `t_sys_permission` VALUES (27, '【模块】获取指定模块子模块列表', -1, '/back/sysModule/getChildModules', 1);
INSERT INTO `t_sys_permission` VALUES (28, '【模块】获取当前用户可用一级模块列表', -1, '/back/sysModule/getCurrentUserRootModules', 1);
INSERT INTO `t_sys_permission` VALUES (29, '【模块】获取当前用户指定模块可用子模块列表', -1, '/back/sysModule/getCurrentUserChildModules', 1);
INSERT INTO `t_sys_permission` VALUES (30, '【新闻管理/发布】标题是否重复校验', 7, '/news/existTitle', 0);
INSERT INTO `t_sys_permission` VALUES (31, '【新闻管理/发布】发布新闻', 7, '/news/addNews', 0);
INSERT INTO `t_sys_permission` VALUES (32, '【新闻管理/发布】更新新闻', 7, '/news/updateNews', 0);
INSERT INTO `t_sys_permission` VALUES (33, '【新闻管理/发布】删除新闻', 7, '/news/deleteNews', 0);
INSERT INTO `t_sys_permission` VALUES (34, '【新闻管理/发布】分页获取已发布新闻列表', -1, '/news/getReviewRecords', 1);
INSERT INTO `t_sys_permission` VALUES (35, '【新闻管理/发布】获取新闻详情(游客)', 7, '/news/getNewsDetail', 0);
INSERT INTO `t_sys_permission` VALUES (36, '【新闻管理/发布】获取新闻审核详情', 7, '/news/getReviewInfo', 0);
INSERT INTO `t_sys_permission` VALUES (37, '【新闻管理/审核】审核新闻', 15, '/news/reviewNews', 0);
INSERT INTO `t_sys_permission` VALUES (39, '【新闻管理/审核】分页获取审核通过新闻列表(游客)', 15, '/news/getNews', 1);
INSERT INTO `t_sys_permission` VALUES (40, '【文件管理】文件上传', -1, '/files/upload', 1);
INSERT INTO `t_sys_permission` VALUES (41, '【文件管理】文件下载', -1, '/files/download', 1);
INSERT INTO `t_sys_permission` VALUES (42, '【文件管理】文件删除', -1, '/files/delete', 1);
INSERT INTO `t_sys_permission` VALUES (43, '【通告管理/发布】标题是否重复', 8, '/notice/existTitle', 0);
INSERT INTO `t_sys_permission` VALUES (44, '【通告管理/发布】发布通告', 8, '/notice/addNotice', 0);
INSERT INTO `t_sys_permission` VALUES (45, '【通告管理/发布】更新通告', 8, '/notice/updateNotice', 0);
INSERT INTO `t_sys_permission` VALUES (46, '【通告管理/发布】删除通告', 8, '/notice/deleteNotice', 0);
INSERT INTO `t_sys_permission` VALUES (47, '【通告管理/发布】分页获取已发布通告列表', -1, '/notice/getReviewRecords', 1);
INSERT INTO `t_sys_permission` VALUES (48, '【通告管理/发布】获取通告详情(游客)', 8, '/notice/getNoticeDetail', 0);
INSERT INTO `t_sys_permission` VALUES (49, '【通告管理/发布】获取通告审核详情', 8, '/notice/getReviewInfo', 0);
INSERT INTO `t_sys_permission` VALUES (50, '【通告管理/审核】分页获取审核通过通告列表(游客)', 16, '/notice/getNotices', 1);
INSERT INTO `t_sys_permission` VALUES (52, '【通告管理/审核】审核通告', 16, '/notice/reviewNotice', 0);
INSERT INTO `t_sys_permission` VALUES (53, '【知识分享/发布】标题是否重复校验', -1, '/knowledgeShare/existTitle', 1);
INSERT INTO `t_sys_permission` VALUES (54, '【知识分享/发布】分页获取当前用户发布的分享列表', -1, '/knowledgeShare/getCurrentUserShares', 1);
INSERT INTO `t_sys_permission` VALUES (55, '【知识分享/发布】发布', -1, '/knowledgeShare/addKnlgeShare', 1);
INSERT INTO `t_sys_permission` VALUES (56, '【知识分享/发布】更新', -1, '/knowledgeShare/updateKnlgeShare', 1);
INSERT INTO `t_sys_permission` VALUES (57, '【知识分享/发布】删除', -1, '/knowledgeShare/deleteKnlgeShare', 1);
INSERT INTO `t_sys_permission` VALUES (58, '【知识分享】分页获取分享列表(游客)', -1, '/knowledgeShare/getKnlgeShares', 1);
INSERT INTO `t_sys_permission` VALUES (59, '【知识分享】分页获取精华帖分享列表(游客)', -1, '/knowledgeShare/getGoodKnlgeShares', 1);
INSERT INTO `t_sys_permission` VALUES (60, '【知识分享】获取分享详情(游客)', -1, '/knowledgeShare/getKnlgeShareDetail', 1);
INSERT INTO `t_sys_permission` VALUES (61, '【知识分享】点赞或点差', -1, '/knowledgeShare/giveOpinion', 1);
INSERT INTO `t_sys_permission` VALUES (62, '【知识分享/审核】分页获取已发布的分享列表', 17, '/knowledgeShare/getReviewRecords', 0);
INSERT INTO `t_sys_permission` VALUES (63, '【知识分享/审核】获取分享审核详情', 17, '/knowledgeShare/getReviewInfo', 0);
INSERT INTO `t_sys_permission` VALUES (64, '【知识分享/审核】审核指定分享', 17, '/knowledgeShare/reviewKnlgeShare', 0);
INSERT INTO `t_sys_permission` VALUES (65, '【评论】评价某文章(游客)', -1, '/comment/addComment', 1);
INSERT INTO `t_sys_permission` VALUES (66, '【评论】分页获取指定文章评论列表(游客)', -1, '/comment/getComments', 1);
INSERT INTO `t_sys_permission` VALUES (67, '【评论审核】获取已发布评论列表', 23, '/comment/getReviewRecords', 0);
INSERT INTO `t_sys_permission` VALUES (69, '【评论审核】获取指定评论审核详情', 23, '/comment/getReviewInfo', 0);
INSERT INTO `t_sys_permission` VALUES (70, '【评论审核】删除指定评论', 23, '/comment/deleteComment', 0);
INSERT INTO `t_sys_permission` VALUES (71, '【评论审核】审核指定评论', 23, '/comment/reviewComment', 0);
INSERT INTO `t_sys_permission` VALUES (72, '【培训专栏/发布】标题是否重复', 9, '/train/existTitle', 0);
INSERT INTO `t_sys_permission` VALUES (73, '【培训专栏/发布】发布', 9, '/train/addOrgTrain', 0);
INSERT INTO `t_sys_permission` VALUES (74, '【培训专栏/发布】更新', 9, '/train/updateOrgTrain', 0);
INSERT INTO `t_sys_permission` VALUES (75, '【培训专栏/发布】删除', 9, '/train/deleteOrgTrain', 0);
INSERT INTO `t_sys_permission` VALUES (76, '【培训专栏】分页获取培训文章列表(游客)', -1, '/train/getOrgTrains', 1);
INSERT INTO `t_sys_permission` VALUES (77, '【培训专栏】获取培训文章详情(游客)', -1, '/train/getOrgTrainDetail', 1);
INSERT INTO `t_sys_permission` VALUES (78, '【质量专栏/发布】标题是否重复校验', 11, '/quality/existTitle', 0);
INSERT INTO `t_sys_permission` VALUES (79, '【质量专栏/发布】发布', 11, '/quality/addQuality', 0);
INSERT INTO `t_sys_permission` VALUES (80, '【质量专栏/发布】更新', 11, '/quality/updateQuality', 0);
INSERT INTO `t_sys_permission` VALUES (81, '【质量专栏/发布】删除', 11, '/quality/deleteQuality', 0);
INSERT INTO `t_sys_permission` VALUES (82, '【质量专栏】分页获取质量文章列表(游客)', -1, '/quality/getQualitys', 1);
INSERT INTO `t_sys_permission` VALUES (83, '【质量专栏】获取质量文章详情(游客)', -1, '/quality/getQualityDetail', 1);
INSERT INTO `t_sys_permission` VALUES (84, '【制度专栏/发布】标题是否重复', 10, '/regulations/existTitle', 0);
INSERT INTO `t_sys_permission` VALUES (85, '【制度专栏/发布】发布', 10, '/regulations/addRegulations', 0);
INSERT INTO `t_sys_permission` VALUES (86, '【制度专栏/发布】更新', 10, '/regulations/updateRegulations', 0);
INSERT INTO `t_sys_permission` VALUES (87, '【制度专栏/发布】删除', 10, '/regulations/deleteRegulations', 0);
INSERT INTO `t_sys_permission` VALUES (88, '【制度专栏】分页获取制度文章列表(游客)', -1, '/regulations/getRegulations', 1);
INSERT INTO `t_sys_permission` VALUES (89, '【制度专栏】获取制度文章详情(游客)', -1, '/regulations/getRegulationsDetail', 1);
INSERT INTO `t_sys_permission` VALUES (90, '【荣誉中亚/发布】标题是否重复', 13, '/honour/existTitle', 0);
INSERT INTO `t_sys_permission` VALUES (91, '【荣誉中亚/发布】发布', 13, '/honour/addHonour', 0);
INSERT INTO `t_sys_permission` VALUES (92, '【荣誉中亚/发布】更新', 13, '/honour/updateHonour', 0);
INSERT INTO `t_sys_permission` VALUES (93, '【荣誉中亚/发布】删除', 13, '/honour/deleteHonour', 0);
INSERT INTO `t_sys_permission` VALUES (94, '【荣誉中亚】分页获取荣誉文章列表(游客)', -1, '/honour/getHonours', 1);
INSERT INTO `t_sys_permission` VALUES (95, '【荣誉中亚】获取荣誉文章详情(游客)', -1, '/honour/getHonourDetail', 1);
INSERT INTO `t_sys_permission` VALUES (96, '全局检索-搜索', -1, '/search/searchArticles', 1);
INSERT INTO `t_sys_permission` VALUES (97, '获取部门列表', -1, '/back/settings/dept/getDepartMents', 1);
INSERT INTO `t_sys_permission` VALUES (98, '【欢迎页】获取系统数据概览', -1, '/welcome/getSysOverview', 1);
INSERT INTO `t_sys_permission` VALUES (99, '【欢迎页】获取待办事项列表', -1, '/welcome/getToDolist', 1);
INSERT INTO `t_sys_permission` VALUES (100, '【用户管理】密码重置', 2, '/back/user/resetPass', 0);
INSERT INTO `t_sys_permission` VALUES (102, '【用户管理】用户搜索', 2, '/back/user/listsSearch', 0);

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES (1, 'admin', '超级管理员');
INSERT INTO `t_sys_role` VALUES (15, 'Publiser', '内容发布角色');
INSERT INTO `t_sys_role` VALUES (16, 'Reviewer', '内容审核');
INSERT INTO `t_sys_role` VALUES (17, 'Comment_Reviewer', '评论审核者角色');
INSERT INTO `t_sys_role` VALUES (18, 'ALL', '全权限-等同于超级管理员');
INSERT INTO `t_sys_role` VALUES (19, 'SysManager', '系统管理员');
INSERT INTO `t_sys_role` VALUES (20, 'Normal', '普通用户');

-- ----------------------------
-- Table structure for t_sys_roleperms
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_roleperms`;
CREATE TABLE `t_sys_roleperms`  (
  `roleid` bigint(0) NOT NULL,
  `permissionid` bigint(0) NOT NULL,
  PRIMARY KEY (`roleid`, `permissionid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sys_roleperms
-- ----------------------------
INSERT INTO `t_sys_roleperms` VALUES (15, 30);
INSERT INTO `t_sys_roleperms` VALUES (15, 31);
INSERT INTO `t_sys_roleperms` VALUES (15, 32);
INSERT INTO `t_sys_roleperms` VALUES (15, 33);
INSERT INTO `t_sys_roleperms` VALUES (15, 35);
INSERT INTO `t_sys_roleperms` VALUES (15, 36);
INSERT INTO `t_sys_roleperms` VALUES (15, 43);
INSERT INTO `t_sys_roleperms` VALUES (15, 44);
INSERT INTO `t_sys_roleperms` VALUES (15, 45);
INSERT INTO `t_sys_roleperms` VALUES (15, 46);
INSERT INTO `t_sys_roleperms` VALUES (15, 48);
INSERT INTO `t_sys_roleperms` VALUES (15, 49);
INSERT INTO `t_sys_roleperms` VALUES (15, 72);
INSERT INTO `t_sys_roleperms` VALUES (15, 73);
INSERT INTO `t_sys_roleperms` VALUES (15, 74);
INSERT INTO `t_sys_roleperms` VALUES (15, 75);
INSERT INTO `t_sys_roleperms` VALUES (15, 78);
INSERT INTO `t_sys_roleperms` VALUES (15, 79);
INSERT INTO `t_sys_roleperms` VALUES (15, 80);
INSERT INTO `t_sys_roleperms` VALUES (15, 81);
INSERT INTO `t_sys_roleperms` VALUES (15, 84);
INSERT INTO `t_sys_roleperms` VALUES (15, 85);
INSERT INTO `t_sys_roleperms` VALUES (15, 86);
INSERT INTO `t_sys_roleperms` VALUES (15, 87);
INSERT INTO `t_sys_roleperms` VALUES (15, 90);
INSERT INTO `t_sys_roleperms` VALUES (15, 91);
INSERT INTO `t_sys_roleperms` VALUES (15, 92);
INSERT INTO `t_sys_roleperms` VALUES (15, 93);
INSERT INTO `t_sys_roleperms` VALUES (16, 37);
INSERT INTO `t_sys_roleperms` VALUES (16, 52);
INSERT INTO `t_sys_roleperms` VALUES (16, 62);
INSERT INTO `t_sys_roleperms` VALUES (16, 63);
INSERT INTO `t_sys_roleperms` VALUES (16, 64);
INSERT INTO `t_sys_roleperms` VALUES (17, 67);
INSERT INTO `t_sys_roleperms` VALUES (17, 69);
INSERT INTO `t_sys_roleperms` VALUES (17, 70);
INSERT INTO `t_sys_roleperms` VALUES (17, 71);
INSERT INTO `t_sys_roleperms` VALUES (18, 3);
INSERT INTO `t_sys_roleperms` VALUES (18, 4);
INSERT INTO `t_sys_roleperms` VALUES (18, 5);
INSERT INTO `t_sys_roleperms` VALUES (18, 7);
INSERT INTO `t_sys_roleperms` VALUES (18, 8);
INSERT INTO `t_sys_roleperms` VALUES (18, 9);
INSERT INTO `t_sys_roleperms` VALUES (18, 10);
INSERT INTO `t_sys_roleperms` VALUES (18, 11);
INSERT INTO `t_sys_roleperms` VALUES (18, 20);
INSERT INTO `t_sys_roleperms` VALUES (18, 21);
INSERT INTO `t_sys_roleperms` VALUES (18, 22);
INSERT INTO `t_sys_roleperms` VALUES (18, 23);
INSERT INTO `t_sys_roleperms` VALUES (18, 24);
INSERT INTO `t_sys_roleperms` VALUES (18, 25);
INSERT INTO `t_sys_roleperms` VALUES (18, 30);
INSERT INTO `t_sys_roleperms` VALUES (18, 31);
INSERT INTO `t_sys_roleperms` VALUES (18, 32);
INSERT INTO `t_sys_roleperms` VALUES (18, 33);
INSERT INTO `t_sys_roleperms` VALUES (18, 35);
INSERT INTO `t_sys_roleperms` VALUES (18, 36);
INSERT INTO `t_sys_roleperms` VALUES (18, 37);
INSERT INTO `t_sys_roleperms` VALUES (18, 43);
INSERT INTO `t_sys_roleperms` VALUES (18, 44);
INSERT INTO `t_sys_roleperms` VALUES (18, 45);
INSERT INTO `t_sys_roleperms` VALUES (18, 46);
INSERT INTO `t_sys_roleperms` VALUES (18, 48);
INSERT INTO `t_sys_roleperms` VALUES (18, 49);
INSERT INTO `t_sys_roleperms` VALUES (18, 52);
INSERT INTO `t_sys_roleperms` VALUES (18, 62);
INSERT INTO `t_sys_roleperms` VALUES (18, 63);
INSERT INTO `t_sys_roleperms` VALUES (18, 64);
INSERT INTO `t_sys_roleperms` VALUES (18, 67);
INSERT INTO `t_sys_roleperms` VALUES (18, 69);
INSERT INTO `t_sys_roleperms` VALUES (18, 70);
INSERT INTO `t_sys_roleperms` VALUES (18, 71);
INSERT INTO `t_sys_roleperms` VALUES (18, 72);
INSERT INTO `t_sys_roleperms` VALUES (18, 73);
INSERT INTO `t_sys_roleperms` VALUES (18, 74);
INSERT INTO `t_sys_roleperms` VALUES (18, 75);
INSERT INTO `t_sys_roleperms` VALUES (18, 78);
INSERT INTO `t_sys_roleperms` VALUES (18, 79);
INSERT INTO `t_sys_roleperms` VALUES (18, 80);
INSERT INTO `t_sys_roleperms` VALUES (18, 81);
INSERT INTO `t_sys_roleperms` VALUES (18, 84);
INSERT INTO `t_sys_roleperms` VALUES (18, 85);
INSERT INTO `t_sys_roleperms` VALUES (18, 86);
INSERT INTO `t_sys_roleperms` VALUES (18, 87);
INSERT INTO `t_sys_roleperms` VALUES (18, 90);
INSERT INTO `t_sys_roleperms` VALUES (18, 91);
INSERT INTO `t_sys_roleperms` VALUES (18, 92);
INSERT INTO `t_sys_roleperms` VALUES (18, 93);
INSERT INTO `t_sys_roleperms` VALUES (18, 100);
INSERT INTO `t_sys_roleperms` VALUES (18, 102);
INSERT INTO `t_sys_roleperms` VALUES (19, 3);
INSERT INTO `t_sys_roleperms` VALUES (19, 4);
INSERT INTO `t_sys_roleperms` VALUES (19, 5);
INSERT INTO `t_sys_roleperms` VALUES (19, 7);
INSERT INTO `t_sys_roleperms` VALUES (19, 8);
INSERT INTO `t_sys_roleperms` VALUES (19, 9);
INSERT INTO `t_sys_roleperms` VALUES (19, 10);
INSERT INTO `t_sys_roleperms` VALUES (19, 11);
INSERT INTO `t_sys_roleperms` VALUES (19, 20);
INSERT INTO `t_sys_roleperms` VALUES (19, 21);
INSERT INTO `t_sys_roleperms` VALUES (19, 22);
INSERT INTO `t_sys_roleperms` VALUES (19, 23);
INSERT INTO `t_sys_roleperms` VALUES (19, 24);
INSERT INTO `t_sys_roleperms` VALUES (19, 25);
INSERT INTO `t_sys_roleperms` VALUES (19, 100);

-- ----------------------------
-- Table structure for t_sys_roleusers
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_roleusers`;
CREATE TABLE `t_sys_roleusers`  (
  `roleid` bigint(0) NOT NULL COMMENT '角色id',
  `userid` bigint(0) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`userid`, `roleid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色-用户 关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sys_roleusers
-- ----------------------------
INSERT INTO `t_sys_roleusers` VALUES (20, 1);
INSERT INTO `t_sys_roleusers` VALUES (20, 2);
INSERT INTO `t_sys_roleusers` VALUES (15, 3);
INSERT INTO `t_sys_roleusers` VALUES (16, 4);
INSERT INTO `t_sys_roleusers` VALUES (17, 4);
INSERT INTO `t_sys_roleusers` VALUES (18, 5);
INSERT INTO `t_sys_roleusers` VALUES (18, 1103);
INSERT INTO `t_sys_roleusers` VALUES (20, 1103);
INSERT INTO `t_sys_roleusers` VALUES (20, 1104);
INSERT INTO `t_sys_roleusers` VALUES (20, 1105);
INSERT INTO `t_sys_roleusers` VALUES (20, 1106);
INSERT INTO `t_sys_roleusers` VALUES (20, 1107);
INSERT INTO `t_sys_roleusers` VALUES (20, 1109);
INSERT INTO `t_sys_roleusers` VALUES (15, 1110);
INSERT INTO `t_sys_roleusers` VALUES (20, 1110);
INSERT INTO `t_sys_roleusers` VALUES (20, 1112);
INSERT INTO `t_sys_roleusers` VALUES (20, 1114);
INSERT INTO `t_sys_roleusers` VALUES (20, 1115);
INSERT INTO `t_sys_roleusers` VALUES (20, 1118);
INSERT INTO `t_sys_roleusers` VALUES (20, 1119);
INSERT INTO `t_sys_roleusers` VALUES (20, 1122);
INSERT INTO `t_sys_roleusers` VALUES (20, 1123);
INSERT INTO `t_sys_roleusers` VALUES (20, 1125);
INSERT INTO `t_sys_roleusers` VALUES (15, 1126);
INSERT INTO `t_sys_roleusers` VALUES (20, 1126);
INSERT INTO `t_sys_roleusers` VALUES (20, 1127);
INSERT INTO `t_sys_roleusers` VALUES (20, 1132);
INSERT INTO `t_sys_roleusers` VALUES (20, 1133);
INSERT INTO `t_sys_roleusers` VALUES (20, 1135);
INSERT INTO `t_sys_roleusers` VALUES (20, 1136);
INSERT INTO `t_sys_roleusers` VALUES (20, 1138);
INSERT INTO `t_sys_roleusers` VALUES (20, 1139);
INSERT INTO `t_sys_roleusers` VALUES (20, 1140);
INSERT INTO `t_sys_roleusers` VALUES (20, 1141);
INSERT INTO `t_sys_roleusers` VALUES (20, 1142);
INSERT INTO `t_sys_roleusers` VALUES (20, 1146);
INSERT INTO `t_sys_roleusers` VALUES (20, 1147);
INSERT INTO `t_sys_roleusers` VALUES (20, 1148);
INSERT INTO `t_sys_roleusers` VALUES (20, 1150);
INSERT INTO `t_sys_roleusers` VALUES (20, 1152);
INSERT INTO `t_sys_roleusers` VALUES (20, 1154);
INSERT INTO `t_sys_roleusers` VALUES (20, 1155);
INSERT INTO `t_sys_roleusers` VALUES (20, 1157);
INSERT INTO `t_sys_roleusers` VALUES (20, 1158);
INSERT INTO `t_sys_roleusers` VALUES (20, 1159);
INSERT INTO `t_sys_roleusers` VALUES (20, 1161);
INSERT INTO `t_sys_roleusers` VALUES (20, 1162);
INSERT INTO `t_sys_roleusers` VALUES (20, 1163);
INSERT INTO `t_sys_roleusers` VALUES (20, 1165);
INSERT INTO `t_sys_roleusers` VALUES (20, 1167);
INSERT INTO `t_sys_roleusers` VALUES (20, 1168);
INSERT INTO `t_sys_roleusers` VALUES (20, 1170);
INSERT INTO `t_sys_roleusers` VALUES (20, 1177);
INSERT INTO `t_sys_roleusers` VALUES (20, 1180);
INSERT INTO `t_sys_roleusers` VALUES (20, 1184);
INSERT INTO `t_sys_roleusers` VALUES (20, 1185);
INSERT INTO `t_sys_roleusers` VALUES (20, 1186);
INSERT INTO `t_sys_roleusers` VALUES (20, 1188);
INSERT INTO `t_sys_roleusers` VALUES (20, 1190);
INSERT INTO `t_sys_roleusers` VALUES (20, 1191);
INSERT INTO `t_sys_roleusers` VALUES (20, 1194);
INSERT INTO `t_sys_roleusers` VALUES (15, 1197);
INSERT INTO `t_sys_roleusers` VALUES (20, 1197);
INSERT INTO `t_sys_roleusers` VALUES (20, 1200);
INSERT INTO `t_sys_roleusers` VALUES (20, 1202);
INSERT INTO `t_sys_roleusers` VALUES (20, 1204);
INSERT INTO `t_sys_roleusers` VALUES (20, 1205);
INSERT INTO `t_sys_roleusers` VALUES (20, 1206);
INSERT INTO `t_sys_roleusers` VALUES (20, 1207);
INSERT INTO `t_sys_roleusers` VALUES (20, 1208);
INSERT INTO `t_sys_roleusers` VALUES (20, 1209);
INSERT INTO `t_sys_roleusers` VALUES (20, 1210);
INSERT INTO `t_sys_roleusers` VALUES (20, 1213);
INSERT INTO `t_sys_roleusers` VALUES (20, 1215);
INSERT INTO `t_sys_roleusers` VALUES (20, 1217);
INSERT INTO `t_sys_roleusers` VALUES (20, 1218);
INSERT INTO `t_sys_roleusers` VALUES (20, 1221);
INSERT INTO `t_sys_roleusers` VALUES (20, 1224);
INSERT INTO `t_sys_roleusers` VALUES (20, 1225);
INSERT INTO `t_sys_roleusers` VALUES (20, 1226);
INSERT INTO `t_sys_roleusers` VALUES (20, 1228);
INSERT INTO `t_sys_roleusers` VALUES (20, 1234);
INSERT INTO `t_sys_roleusers` VALUES (20, 1236);
INSERT INTO `t_sys_roleusers` VALUES (20, 1237);
INSERT INTO `t_sys_roleusers` VALUES (20, 1238);
INSERT INTO `t_sys_roleusers` VALUES (20, 1240);
INSERT INTO `t_sys_roleusers` VALUES (20, 1245);
INSERT INTO `t_sys_roleusers` VALUES (20, 1247);
INSERT INTO `t_sys_roleusers` VALUES (20, 1251);
INSERT INTO `t_sys_roleusers` VALUES (20, 1253);
INSERT INTO `t_sys_roleusers` VALUES (20, 1255);
INSERT INTO `t_sys_roleusers` VALUES (20, 1256);
INSERT INTO `t_sys_roleusers` VALUES (20, 1262);
INSERT INTO `t_sys_roleusers` VALUES (20, 1263);
INSERT INTO `t_sys_roleusers` VALUES (20, 1264);
INSERT INTO `t_sys_roleusers` VALUES (20, 1267);
INSERT INTO `t_sys_roleusers` VALUES (20, 1269);
INSERT INTO `t_sys_roleusers` VALUES (20, 1270);
INSERT INTO `t_sys_roleusers` VALUES (20, 1271);
INSERT INTO `t_sys_roleusers` VALUES (20, 1274);
INSERT INTO `t_sys_roleusers` VALUES (20, 1275);
INSERT INTO `t_sys_roleusers` VALUES (20, 1278);
INSERT INTO `t_sys_roleusers` VALUES (20, 1279);
INSERT INTO `t_sys_roleusers` VALUES (20, 1280);
INSERT INTO `t_sys_roleusers` VALUES (20, 1282);
INSERT INTO `t_sys_roleusers` VALUES (20, 1283);
INSERT INTO `t_sys_roleusers` VALUES (20, 1284);
INSERT INTO `t_sys_roleusers` VALUES (20, 1291);
INSERT INTO `t_sys_roleusers` VALUES (20, 1292);
INSERT INTO `t_sys_roleusers` VALUES (20, 1295);
INSERT INTO `t_sys_roleusers` VALUES (20, 1296);
INSERT INTO `t_sys_roleusers` VALUES (20, 1297);
INSERT INTO `t_sys_roleusers` VALUES (20, 1299);
INSERT INTO `t_sys_roleusers` VALUES (20, 1302);
INSERT INTO `t_sys_roleusers` VALUES (20, 1307);
INSERT INTO `t_sys_roleusers` VALUES (20, 1310);
INSERT INTO `t_sys_roleusers` VALUES (20, 1312);
INSERT INTO `t_sys_roleusers` VALUES (20, 1313);
INSERT INTO `t_sys_roleusers` VALUES (20, 1316);
INSERT INTO `t_sys_roleusers` VALUES (20, 1317);
INSERT INTO `t_sys_roleusers` VALUES (20, 1319);
INSERT INTO `t_sys_roleusers` VALUES (20, 1321);
INSERT INTO `t_sys_roleusers` VALUES (20, 1322);
INSERT INTO `t_sys_roleusers` VALUES (20, 1324);
INSERT INTO `t_sys_roleusers` VALUES (20, 1326);
INSERT INTO `t_sys_roleusers` VALUES (20, 1327);
INSERT INTO `t_sys_roleusers` VALUES (20, 1328);
INSERT INTO `t_sys_roleusers` VALUES (20, 1329);
INSERT INTO `t_sys_roleusers` VALUES (20, 1330);
INSERT INTO `t_sys_roleusers` VALUES (20, 1332);
INSERT INTO `t_sys_roleusers` VALUES (20, 1333);
INSERT INTO `t_sys_roleusers` VALUES (20, 1334);
INSERT INTO `t_sys_roleusers` VALUES (20, 1336);
INSERT INTO `t_sys_roleusers` VALUES (20, 1337);
INSERT INTO `t_sys_roleusers` VALUES (20, 1338);
INSERT INTO `t_sys_roleusers` VALUES (20, 1339);
INSERT INTO `t_sys_roleusers` VALUES (18, 1340);
INSERT INTO `t_sys_roleusers` VALUES (20, 1340);
INSERT INTO `t_sys_roleusers` VALUES (20, 1341);
INSERT INTO `t_sys_roleusers` VALUES (20, 1343);
INSERT INTO `t_sys_roleusers` VALUES (20, 1344);
INSERT INTO `t_sys_roleusers` VALUES (20, 1346);
INSERT INTO `t_sys_roleusers` VALUES (18, 1347);
INSERT INTO `t_sys_roleusers` VALUES (20, 1347);
INSERT INTO `t_sys_roleusers` VALUES (20, 1348);
INSERT INTO `t_sys_roleusers` VALUES (20, 1350);
INSERT INTO `t_sys_roleusers` VALUES (20, 1351);
INSERT INTO `t_sys_roleusers` VALUES (20, 1353);
INSERT INTO `t_sys_roleusers` VALUES (20, 1354);
INSERT INTO `t_sys_roleusers` VALUES (20, 1355);
INSERT INTO `t_sys_roleusers` VALUES (20, 1357);
INSERT INTO `t_sys_roleusers` VALUES (20, 1358);
INSERT INTO `t_sys_roleusers` VALUES (20, 1360);
INSERT INTO `t_sys_roleusers` VALUES (20, 1361);
INSERT INTO `t_sys_roleusers` VALUES (20, 1364);
INSERT INTO `t_sys_roleusers` VALUES (20, 1366);
INSERT INTO `t_sys_roleusers` VALUES (20, 1367);
INSERT INTO `t_sys_roleusers` VALUES (20, 1368);
INSERT INTO `t_sys_roleusers` VALUES (20, 1369);
INSERT INTO `t_sys_roleusers` VALUES (20, 1370);
INSERT INTO `t_sys_roleusers` VALUES (20, 1374);
INSERT INTO `t_sys_roleusers` VALUES (20, 1375);
INSERT INTO `t_sys_roleusers` VALUES (20, 1376);
INSERT INTO `t_sys_roleusers` VALUES (20, 1377);
INSERT INTO `t_sys_roleusers` VALUES (20, 1378);
INSERT INTO `t_sys_roleusers` VALUES (18, 1379);
INSERT INTO `t_sys_roleusers` VALUES (20, 1379);
INSERT INTO `t_sys_roleusers` VALUES (20, 1380);
INSERT INTO `t_sys_roleusers` VALUES (20, 1383);
INSERT INTO `t_sys_roleusers` VALUES (20, 1384);
INSERT INTO `t_sys_roleusers` VALUES (20, 1386);
INSERT INTO `t_sys_roleusers` VALUES (20, 1389);
INSERT INTO `t_sys_roleusers` VALUES (20, 1390);
INSERT INTO `t_sys_roleusers` VALUES (20, 1391);
INSERT INTO `t_sys_roleusers` VALUES (20, 1392);
INSERT INTO `t_sys_roleusers` VALUES (20, 1393);
INSERT INTO `t_sys_roleusers` VALUES (20, 1394);
INSERT INTO `t_sys_roleusers` VALUES (20, 1395);
INSERT INTO `t_sys_roleusers` VALUES (20, 1396);
INSERT INTO `t_sys_roleusers` VALUES (20, 1397);
INSERT INTO `t_sys_roleusers` VALUES (20, 1399);
INSERT INTO `t_sys_roleusers` VALUES (20, 1400);
INSERT INTO `t_sys_roleusers` VALUES (20, 1401);
INSERT INTO `t_sys_roleusers` VALUES (20, 1402);
INSERT INTO `t_sys_roleusers` VALUES (20, 1403);
INSERT INTO `t_sys_roleusers` VALUES (20, 1404);
INSERT INTO `t_sys_roleusers` VALUES (20, 1405);
INSERT INTO `t_sys_roleusers` VALUES (20, 1406);
INSERT INTO `t_sys_roleusers` VALUES (20, 1407);
INSERT INTO `t_sys_roleusers` VALUES (20, 1409);
INSERT INTO `t_sys_roleusers` VALUES (20, 1410);
INSERT INTO `t_sys_roleusers` VALUES (20, 1412);
INSERT INTO `t_sys_roleusers` VALUES (20, 1415);
INSERT INTO `t_sys_roleusers` VALUES (20, 1419);
INSERT INTO `t_sys_roleusers` VALUES (20, 1420);
INSERT INTO `t_sys_roleusers` VALUES (20, 1421);
INSERT INTO `t_sys_roleusers` VALUES (20, 1423);
INSERT INTO `t_sys_roleusers` VALUES (20, 1424);
INSERT INTO `t_sys_roleusers` VALUES (20, 1425);
INSERT INTO `t_sys_roleusers` VALUES (20, 1426);
INSERT INTO `t_sys_roleusers` VALUES (20, 1427);
INSERT INTO `t_sys_roleusers` VALUES (20, 1428);
INSERT INTO `t_sys_roleusers` VALUES (20, 1429);
INSERT INTO `t_sys_roleusers` VALUES (20, 1430);
INSERT INTO `t_sys_roleusers` VALUES (20, 1434);
INSERT INTO `t_sys_roleusers` VALUES (20, 1435);
INSERT INTO `t_sys_roleusers` VALUES (20, 1436);
INSERT INTO `t_sys_roleusers` VALUES (20, 1437);
INSERT INTO `t_sys_roleusers` VALUES (20, 1438);
INSERT INTO `t_sys_roleusers` VALUES (20, 1439);
INSERT INTO `t_sys_roleusers` VALUES (20, 1440);
INSERT INTO `t_sys_roleusers` VALUES (20, 1441);
INSERT INTO `t_sys_roleusers` VALUES (20, 1443);
INSERT INTO `t_sys_roleusers` VALUES (20, 1444);
INSERT INTO `t_sys_roleusers` VALUES (20, 1445);
INSERT INTO `t_sys_roleusers` VALUES (20, 1447);
INSERT INTO `t_sys_roleusers` VALUES (20, 1448);
INSERT INTO `t_sys_roleusers` VALUES (20, 1449);
INSERT INTO `t_sys_roleusers` VALUES (20, 1450);
INSERT INTO `t_sys_roleusers` VALUES (20, 1451);
INSERT INTO `t_sys_roleusers` VALUES (20, 1452);
INSERT INTO `t_sys_roleusers` VALUES (20, 1454);
INSERT INTO `t_sys_roleusers` VALUES (20, 1455);
INSERT INTO `t_sys_roleusers` VALUES (20, 1456);
INSERT INTO `t_sys_roleusers` VALUES (20, 1457);
INSERT INTO `t_sys_roleusers` VALUES (20, 1458);
INSERT INTO `t_sys_roleusers` VALUES (20, 1459);
INSERT INTO `t_sys_roleusers` VALUES (20, 1460);
INSERT INTO `t_sys_roleusers` VALUES (20, 1461);
INSERT INTO `t_sys_roleusers` VALUES (20, 1462);
INSERT INTO `t_sys_roleusers` VALUES (20, 1463);
INSERT INTO `t_sys_roleusers` VALUES (20, 1464);
INSERT INTO `t_sys_roleusers` VALUES (20, 1465);
INSERT INTO `t_sys_roleusers` VALUES (20, 1466);
INSERT INTO `t_sys_roleusers` VALUES (20, 1467);

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `passwd` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deptid` bigint(0) NULL DEFAULT NULL,
  `deleteflag` tinyint(0) NULL DEFAULT 0 COMMENT '0 未删除 1删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1468 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES (1, 'admin', '超级管理员', 'c21b86df46a5c99e2ced72d9eb4c4623', -1, 0);
INSERT INTO `t_sys_user` VALUES (2, 'test', '普通用户', 'b13a7a593524568985f8603791536c46', -1, 0);
INSERT INTO `t_sys_user` VALUES (3, 'test1', '测试发布用户', 'c01d623859f2fa4f3cb86c9078fbcfd9', -1, 0);
INSERT INTO `t_sys_user` VALUES (4, 'test2', '测试审核用户', 'b761e0f9a5ad22fe7e296ccdd52efeff', -1, 0);
INSERT INTO `t_sys_user` VALUES (5, 'testAdmin', '测试管理员', '2af85d2b8b1e176175e745bb8414ea56', -1, 0);

SET FOREIGN_KEY_CHECKS = 1;
