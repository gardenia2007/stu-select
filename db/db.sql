-- phpMyAdmin SQL Dump
-- version 4.0.6deb1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013-11-25 03:47:10
-- 服务器版本: 5.5.34-0ubuntu0.13.10.1
-- PHP 版本: 5.5.3-1ubuntu2


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `select`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `name` varchar(64) NOT NULL,
  `pw` varchar(64) NOT NULL,
  PRIMARY KEY (`name`)
);

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`name`, `pw`) VALUES('admin', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` char(128) NOT NULL,
  `atime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data` text
-- ,UNIQUE KEY `session_id` (`session_id`)
) ;

--
-- 转存表中的数据 `sessions`
--

INSERT INTO `sessions` (`session_id`, `atime`, `data`) VALUES('3dee15d48915d22e6897052015b56100877adc37', '2013-11-13 14:58:39', 'KGRwMQpTJ25hbWUnCnAyClMnQWRtaW4nCnAzCnNTJ2lwJwpwNApWMTI3LjAuMC4xCnA1CnNTJ3Nl\nc3Npb25faWQnCnA2ClMnM2RlZTE1ZDQ4OTE1ZDIyZTY4OTcwNTIwMTViNTYxMDA4NzdhZGMzNycK\ncDcKc1MnaXNfYWRtaW4nCnA4CkkwMQpzUydyb2xlJwpwOQpTJ2FkbWluJwpwMTAKc1MnaXNfbG9n\naW4nCnAxMQpJMDEKcy4=\n');

-- --------------------------------------------------------

--
-- 表的结构 `st`
--

CREATE TABLE IF NOT EXISTS `st` (
  `id` int(11) NOT NULL ,
  `student` int(11) NOT NULL,
  `teacher` int(11) NOT NULL,
  `time` timestamp NOT NULL ,
  `status` varchar(8) DEFAULT 'wait',
  PRIMARY KEY (`id`)
)  ;

--
-- 转存表中的数据 `st`
--

INSERT INTO `st` (`id`, `student`, `teacher`, `time`, `status`) VALUES(11, 8, 11, '2013-11-12 16:33:38', 'delete');
INSERT INTO `st` (`id`, `student`, `teacher`, `time`, `status`) VALUES(12, 8, 4, '2013-11-12 16:37:19', 'delete');
INSERT INTO `st` (`id`, `student`, `teacher`, `time`, `status`) VALUES(13, 8, 3, '2013-11-12 16:37:55', 'pass');
INSERT INTO `st` (`id`, `student`, `teacher`, `time`, `status`) VALUES(14, 9, 3, '2013-11-13 02:53:43', 'pass');

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `no` varchar(32) NOT NULL,
  `pw` varchar(32) NOT NULL,
  `classno` varchar(16) NOT NULL,
  `email` varchar(64) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `intro` text NOT NULL,
  `st` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

--
-- 转存表中的数据 `student`
--

INSERT INTO `student` (`id`, `name`, `no`, `pw`, `classno`, `email`, `phone`, `intro`, `st`) VALUES(8, '李洪祥', '1100300220', 'gardenia', '1003105', 'g@g.com', '18088705625', '', 13);
INSERT INTO `student` (`id`, `name`, `no`, `pw`, `classno`, `email`, `phone`, `intro`, `st`) VALUES(9, '徐的亮', '1100300221', '1234', '1003105', 'g@a.com', '18088708979', '老师您好', 14);

-- --------------------------------------------------------

--
-- 表的结构 `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL ,
  `pw` varchar(20)  NOT NULL,
  `name` varchar(8) NOT NULL,
  `photo` text NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` varchar(16) NOT NULL,
  `office` varchar(32)  DEFAULT NULL,
  `pos` varchar(20)  NOT NULL,
  `lab` varchar(50)  NOT NULL,
  `intro` text ,
  `has` int(4)  NOT NULL,
  `total` int(4) NOT NULL,
  `pinyin` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

--
-- 转存表中的数据 `teacher`
--

INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(1, 'iambjd', '毕建东', '/static/img/avatar.png', 'gardeniaxy@gmail.com', '222221', '234', '副教授', '计算机软件基础教研室', 'jsdlfjlasjflkasdf', 0, 6, 'bjd');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(2, 'cdshit', '程丹松', '/static/img/t_chenghd.jpg', 'cdsinhit@hit.edu.cn', '', '', '副教授', '计算机硬件基础教研室', '程丹松，博士、副教授。研究方向：模式识别、数字图像处理、数字信号处理。负责国家自然基金市科技基金1项、参与国家自然科学基金、省部委基金项目多项。其成果获省科学进步二等奖1项，市科学进步二等奖1项。发表论文10余篇', 0, 6, 'cds');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(3, 'cghit', '崔刚', '/select/static/img/t_chenghd.jpg', 'cg@ftcl.hit.edu.cn', '', '', '教授', '计算机科学技术研究中心', '崔刚，教授，博士生导师，中国计算机学会高级会员，中国计算机学会容错计算专业委员会委员，哈工大计算机学院容错/嵌入/汽车计算研究中心主任，南京邮电大学兼职教授，浙江台州路桥科技创新孵化基地哈工大国家技术转移中心主任专家。研究方向：计算机体系结构、空间计算技术、可信性计算技术、容错计算技术、嵌入计算技术、（云）泛在计算技术、移动计算技术、汽车计算技术、物联网技术、传感器网技术、车载/车联网技术、工业控制技术、信息安全技术等。主持负责承担研究完成了多项国家863、部委重大科研项目及各种基金，典型如“神舟号”载人宇宙飞船容错计算机样机研制，863哈工大TS-1微小卫星容错计算机样机研制，多项多型号多种工作环境及军民任务要求的容错计算机系统及网络容错服务器系统研制，导弹武器红外仿真系统研制，工业控制容错系统研制，汽车网络控制系统，车载移动Ad Hoc，VANET系统，GPS/GSM/GIS移动定位系统，高倍率动力电池管理控制系统，声音识别系统，磁盘测试系统，穿戴SoC计算机系统,嵌入在线仿真系统等等。获得部级科技进步一等奖1项，二等奖2项，三等奖3项，发表国内外科技论文近200篇，编著教材1部，发明专利近40项。培养博士研究生20多名，硕士研究生50多名，本科生近百名。', 2, 6, 'cg');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(4, 'cwxhit', '车万翔', '/static/img/avatar.png', 'car@ir.hit.edu.cn', '', NULL, '副教授', '计算机语言基础教研室', '车万翔，博士、副教授，哈尔滨工业大学计算机科学与技术学院语言基础教研室、信息检索研究中心老师。国际ACM、ACL 以及中国计算机学会、中文信息学会会员。主要研究方向：自然语言处理、信息检索。目前主持国家自然科学基金等多项科研项目，同时参与并完成国家自然科学基金，863，国际、企业合作项目若干。在多次国际评测中获得第1名。多次在全国和国际会议上做特邀报告，并担任EMNLP 2011国际会议Publication Chair，AAAI、IJCAI、COLING等国际会议程序委员。2010年获汉王青年创新奖一等奖，钱伟长中文信息处理科学技术奖一等奖（排名第2）。在国内外高水平期刊和会议上发表学术论30余篇，出版教材1部，译著1部。', 0, 6, 'cwx');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(5, 'cyzhit', '程远志', '/static/img/avatar.png', NULL, '', NULL, '副教授', '生物计算研究中心', NULL, 0, 6, 'cyz');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(6, 'czshit', '蔡则苏', '/static/img/avatar.png', 'caizesu@hit.edu.cn', '', NULL, '副教授', '多智能体机器人研究中心', '蔡则苏，博士，副教授，中国人工智能学会智能机器人专业委员会委员、中国人工智能学会机器人足球工作委员会委员、中国计算机学会会员、中国宇航学会会员、黑龙江省机器人学会常务理事。主要研究方向：移动机器人的同时定位与地图创建、自主导航、多机器人合作与竞争。主持或参与多项国家“十五”“十一五”科技计划项目、国家自然科学基金项目、国际合作项目和省部级项目，获得了软件著作权多项，发表学术论文40余篇，其中SCI/EI/ISTP检索40余篇，出版专著1部，获得多项世界杯机器人冠军。', 0, 6, 'czs');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(7, 'djhit', '董剑', '/static/img/avatar.png', 'dj@ftcl.hit.edu.cn', '', NULL, '副教授', '容错与移动计算研究中心', '董剑，博士，副教授，硕士生导师。主要研究方向：计算机系统结构、容错计算、分布式计算、故障注入技术等', 0, 6, 'dj');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(8, 'fbxhit', '方滨兴', '/static/img/avatar.png', NULL, '', NULL, '教授', '计算机网络与信息安全研究中心', '方滨兴，博士，教授，博士生导师、中国工程院院士。兼任中国科学院计算技术研究所兼职研究员、博士生导师。同时担任国家信息化专家咨询委员会委员；国家自然科学基金信息安全重大项目专家组成员；国家发展改革委信息安全专家咨询组成员；中国通信学会常务理事兼通信安全技术委员会主任；中国互联网协会常务理事兼网络与信息安全工作委员会主任；中国计算机学会计算机安全委员会副主任委员；中国通信标准化协会网络与信息安全技术委员会主席和多个学术期刊的编委。主要研究方向：网络与信息安全、网络测量、并行计算。主持完成多项国家863项目、国家973项目、国家自然科学基金、国防预研及省部级科研项目。获得国家科技进步一等奖1项、部级科技进步二等奖3项，三等奖6项；另获得省级青年科技奖2次，市级青年科技奖1次；并获得了由中组部、中宣部、科技部、人事部联合颁发的2002年度全国“杰出专业技术人才”的荣誉称号，信息产业部颁发的“在信息产业部重点工程中做出突出贡献特等奖先进个人”的称号。在国内外期刊和会议上发表学术论文200余篇，著作1本，指导了博士研究生近40人。', 0, 6, 'fbx');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(9, 'fxphit', '范晓鹏', '/static/img/avatar.png', 'fxp@hit.edu.cn', '', NULL, '副教授', '智能接口与人机交互研究中心', '范晓鹏，博士，副教授，博士生导师，哈尔滨工业大学“百人计划”获得者，教育部新世纪人才。香港科技大学电子工程系获得博士学位。曾就职于香港科技大学电子工程系、及英特尔公司上海软件实验室。主要研究领域包括视频编码、图像处理等多媒体技术。具有较丰富的项目研发和管理经验。在视频编码领域发表论文近40篇，其中SCI检索国际期刊论文6篇，包括IEEE trans. on CSVT和IEEE SPM等，EI检索的会议论文30篇。获得美国发明专利5项，中国发明专利5项，被接收的AVS国家标准提案3项，其中L条带技术相关专利为AVS标准十项核心专利技术之一。IEEE会员，国际会议Packet Video 2010秘书。', 0, 6, 'fxp');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(10, 'fzchit', '傅忠传', '/static/img/avatar.png', 'fuzhongchuan@hit.edu.cn', '', NULL, '副教授', '计算机语言基础教研室', '责国家自然科学基金、省自然科学基金、博士后科学基金等科研项目，发表论文20余篇。参与国家精品课程建设、省精品课程建设、校级课程建设多项，国家级优秀教学团队骨干成员，获国际级奖励1项，省、市、学校级奖励多项。', 0, 6, 'fzc');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(11, 'ghhit', '高宏', '/static/img/avatar.png', 'honggao@hit.edu.cn', '', NULL, '教授', '海量数据计算研究中心', '高宏，博士，教授，博士生导师，中国计算机学会数据库专委会委员、传感器网络专委会委员、学术工作委员会委员，2005年入选国家教育部新世纪优秀人才支持计划，同年获国家科技进步二等奖。她长期从事海量数据管理、无线传感器网络等方面研究工作，主持和参加国家973计划项目课题2项、国家自然科学基金重点项目1项、国家自然科学基金面上项目4项、国家863计划项目3项、省部级科研项目5项, 获软件著作权3项，发表论文100余篇，其中IEEE Transaction on Knowledge and Data Engineering、VLDB Journal、BMC Bioinformatics、SIGMOD、SIGKDD、VLDB、ICDE、SenSys等本领域国际顶级期刊和顶级会议论文14篇，1篇被中国科协评选为全国优秀期刊论文，2篇获全国数据库年会优秀论文奖。她多次担任国际学术会议程序委员会主席、组织委员会主席、专题主席、程序委员会委员等职务。', 0, 6, 'gh');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(12, 'gmzhit', '郭茂祖', '/static/img/avatar.png', 'maozuguo@hit.edu.cn', '', NULL, '教授', '计算机软件基础教研室', '郭茂祖，博士，教授，博士生导师；计算机基础系系主任。国家自然科学基金委员会信息科学部专家评审组成员，中国人工智能学会机器学习专委会常委，中国计算机学会人工智能和模式识别专委会委员,《哈尔滨工业大学学报》等期刊编委，省杰出青年科学基金获得者，留学瑞典、英国归国学者。主要研究方向：机器学习与数据挖掘、计算生物学与生物信息学、计算机视觉与图象处理、新型计算模型。主持完成了国家自然科学基金、国家863、省自然科学基金重点项目等多项，获得省部级科技进步二等奖1项、自然科学三等奖1项，获软件著作权10余项，在国内外期刊和会议上发表学术论文100余篇。', 0, 6, 'gmz');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(13, 'gyhit', '关毅', '/static/img/avatar.png', 'guanyi@hit.edu.cn', '', NULL, '教授', '语言技术研究中心', '关毅，博士，教授，博士生导师。国家自然科学基金项目评审专家，多部国际国内学术期刊学术会议审稿人，系统相似度测度理论的提出者和WI输入法发明人。主要研究方向：智能化信息检索、网络挖掘、自然语言处理及认知语言学。主持、参与并完成了多项国家自然科学基金、国家863、国际合作等项目，在国内外期刊和会议上发表学术论文60余篇，参与编写教材1本。', 0, 6, 'gy');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(14, 'hhhit', '何慧', '/static/img/avatar.png', 'hehui@hit.edu.cn', '', NULL, '副教授', '计算机网络与信息安全研究中心', '何慧，博士，副教授，硕士生导师。IEEE&IEEE Computer会员，中国计算机学会会员，ACM协会会员。主要从事网络与信息安全、网络测量与模拟、网络安全态势评估、入侵主动防御技术等方面的研究。主持或参加国家网络信息安全工程重点项目、自然科学基金、863项目、973项目等其他省部委项目10余项，获得国防科技进步二等奖1项，黑龙江省科学技术二等奖1项。2010年指导学生参加全国信息安全竞赛获一等奖1项。在国内外重要学术刊物和会议上发表论文20余篇', 0, 6, 'hh');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(15, 'hjhhit', '黄剑华', '/static/img/avatar.png', 'jhhuang@hit.edu.cn', '', NULL, '教授', '模式识别研究中心', '黄剑华，博士、教授，黑龙江计算机学会智能人机交互专业委员会专委。主要研究方向：模式识别、人工智能、医学与图像处理、人体运动分析等。负责或参与完成国家自然科学基金、国防预研、省部委以及国际合作项目十余项，获得省部级科技进步一等奖1项，二等奖1项，三等奖2项，其它一等奖1项，二等奖2项，获得发明专利1项，软件著作权5项，在国内外期刊和会议上发表学术论文30篇。', 0, 6, 'hjh');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(16, 'hjqhit', '韩纪庆', '/static/img/avatar.png', 'jqhan@hit.edu.cn', '', NULL, '教授', '智能接口与人机交互研究中心', '韩纪庆，博士，教授，博士生导师。中国人工智能学会理事及机器感知与虚拟现实专业委员会委员、IEEE会员、中国声学学会高级会员、中国计算机学会高级会员、中文信息学报编委、数据采集与处理编委。主要研究方向：语音信号处理、音频信息处理等。近年来，主持、参与并完成了十余项国家自然科学基金、国家863项目、国家973项目子课题、教育部跨世纪人才计划、省部级项目，获得省部级科技进步二等奖3项、三等奖2项，申请专利、软件著作权多项，在国内外期刊和会议上发表学术论文100余篇，著书2部。', 0, 6, 'hjq');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(17, 'hqchit', '黄庆成', '/static/img/avatar.png', 'huangqc@hit.edu.cn', '', NULL, '副教授', '多智能体机器人研究中心', '黄庆成，博士后，副教授，参与了国家自然科学基金、863、国际合作和省部级等几十项科研项目，是多个科研项目的课题组长，擅长开发以嵌入式控制系统为核心的智能机器人、工业控制系统和民用产品等。在国内外学术刊物上发表论文40余篇，其中10余篇已被SCI或EI收录。2003年指导学生创新，获得全国大学生电子设计竞赛一等奖，并于次年被评为全国大学生电子设计竞赛优秀辅导教师。', 0, 6, 'hqc');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(18, 'hthit', '何霆', '/static/img/avatar.png', 'xuantinghe@hit.edu.cn', '', NULL, '教授', '企业与服务智能计算中心', '何霆，博士/博士后，教授，博士生导师，访英归国学者，中国计算机学会/机械工程学会高级会员。研究方向：服务管理和服务工程、服务供应链及其价值理论、智能决策支持、协同资源计划优化、移动商务。曾负责、参与国家自然科学基金、863计划、国防基础科研以及其他省部级研究课题近20项；在国内外学术刊物上发表论文30余篇，被SCI/EI/ISTP收录23篇；获得省级科技进步一等奖2项，二等奖1项。讲授《服务学概论》、《智能决策支持系统》与《CIMS概论》等课程。', 0, 6, 'ht');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(19, 'jfhit', '姜峰', '/static/img/avatar.png', 'fjiang@hit.edu.cn', '', NULL, '副教授', '智能接口与人机交互研究中心', '姜峰，男，博士，副教授，硕士生导师。2001年7月毕业于哈尔滨工业大学计算机科学与技术专业，获工学学学士学位，2003年7月毕业于哈尔滨工业大学计算机科学与技术专业，获工学硕士学位，2003年9月保送为哈尔滨工业大学计算机科学与技术专业博士研究生并提前留校工作，2008年获博士学位。主要研究方向为计算机视觉、模式识别、视频编解码。', 0, 6, 'jf');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(20, 'jsxhit', '姜守旭', '/static/img/avatar.png', 'jsx@hit.edu.cn', '', NULL, '教授', '计算机软件基础教研室', '姜守旭，博士，教授，教学带头人，博士生导师，1968年2月出生于山东省平度县，1990年7月毕业于哈工大计算机及应用专业，“计算机科学与技术核心课程”国家级教学团队骨干成员。主要研究方向为普适计算、无线传感器网络、手机感知网络、物联网、信息物理融合系统(CPS)等。主持或参加国家自然科学基金重点、面上及其他省部级科研项目10余项，获省部级科技进步三等奖2项，获国家教学成果二等奖1项、省教学成果一等奖2项、二等奖1项，在VLDB、ICDE、VLDB Journal、IEEE Transactions on Knowledge and Data Engineering (TKDE)、软件学报等重要学术会议或学术刊物上发表学术论文40余篇，出版“十一五”国家级规划教材2部(其中1部被评为2008年度国家精品教材)，译著1部，主持建设的《编译原理》课程被评为黑龙江省精品课程。', 0, 6, 'jsx');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(21, 'kzhit', '匡正', '/static/img/avatar.png', 'kuangzh@hit.edu.cn', '', NULL, '教授', '计算机软件基础教研室', '匡正，博士，教授。主要研究方向：数值算法的理论与应用研究，数学建模与数据挖掘，发表论文40多篇。', 0, 6, 'kz');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(22, 'lbqhit', '刘秉权', '/static/img/avatar.png', 'liubq@insun.hit.edu.cn', '', NULL, '副教授', '语言技术研究中心', '刘秉权，男，1970年生人，博士、副教授、硕士研究生导师，智能技术与自然语言处理研究室副主任，中国计算机学会高级会员、CCF中文信息技术专委会委员。1998年5月至1999年5月在香港理工大学电子计算学系开展一年的合作研究。先后参加和负责过多项国家自然科学基金、国家863计划和国际合作项目，其中作为主要研制人参加了“微软拼音输入法”（与微软公司合作）和“手机操作系统汉字智能输入”（与日本富士通公司合作）项目，先后在国内外学术期刊和会议上发表论文70余篇，获国家发明专利2项，软件著作权3项，获教育部技术发明二等奖1项。讲授过Web信息抽取与知识服务、中文信息处理、自然语言处理、C语言、操作系统等课程。研究方向包括自然语言处理、信息检索、知识服务、智能人机接口、普适计算等。详情见http://www.insun.hit.edu.cn/~bqliu/index.htm。', 0, 6, 'lbq');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(23, 'lcyhit', '刘远超', '/static/img/avatar.png', 'ycliu@hit.edu.cn', '', NULL, '副教授', '语言技术研究中心', '刘远超，男，博士，副教授，硕士生导师。主要研究兴趣：网络智能信息处理、自然语言理解、数据挖掘、阅读心理学等。负责及参加多项863计划、国家自然基金等课题的研究工作；参加编写专著一部《计算机自然语言处理》（清华大学出版社，2005年5月）。多次担任《计算机学报》、《电子学报》、《中文信息学报》、《Artificial Intelligence in Medicine》等学术刊物的审稿专家。获2008年度IBM中国优秀教师奖，参与研制项目“网络环境下输入法技术研究”获黑龙江省高校科学技术奖一等奖。在国内外学术刊物上发表论文30余篇，多数为SCI/EI收录。', 0, 6, 'lcy');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(24, 'lhfhit', '李海峰', '/static/img/avatar.png', 'lihaifeng@hit.edu.cn', '', NULL, '教授', '智能接口与人机交互研究中心', '李海峰：男，教授，博士生导师。IEEE高级会员，中国计算机学会高级会员， 1997年获得哈尔滨工业大学“电磁测量技术与仪器”博士学位；2002年获得法国巴黎第六大学“计算机、通讯与电子科学”博士学位。1994年起在哈工大任教，2002年起任教授，2004年起任博士生导师。2004年9月起任哈工大国家示范性软件学院副院长。2009年10月起任哈工大学科建设办公室副主任。2011年5月起任哈工大英才学院副院长。先后完成和参加了航天基金项目、欧盟与法国高技术研究项目、法国国家通讯公司研发项目、哈工大基础研究基金项目、国家自然科学基金项目、教育部博士点基金项目、国家863重点项目、省部基金科研项等十余项科研项目。获得省部级科技一等奖1项、二等奖2项；获得省级教学成果一等奖1项，二等奖1项；发表教学与科研学术论文60余篇。主要研究方向：语音情感处理技术、自然人机交互技术、智能信息处理技术、人工脑与认知科学等。', 0, 6, 'lhf');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(25, 'lhwhit', '刘宏伟', '/static/img/avatar.png', 'lhw@ftcl.hit.edu.cn', '', NULL, '教授', '计算机硬件基础教研室', '刘宏伟：博士，教授，博士生导师，哈工大计算机科学与技术学院计算机硬件基础教研室主任，中国计算机学会高级会员，容错计算专业委员会专委，体系结构专业委员会专委。主要研究方向：容错计算技术、移动计算技术、体系结构技术。主持或完成国家自然科学基金、国家863重大项目课题、国家部委预研基金项目等多项科研项目，获国防科技进步三等奖1项，发明授权专利6项，在国内外学术期刊和学术会议上发表学术论文80余篇，与人合作出版教材1部。', 0, 6, 'lhw');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(26, 'ljhit', '李杰', '/static/img/avatar.png', NULL, '', NULL, '副教授', '生物计算研究中心', NULL, 0, 6, 'lj');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(27, 'ljfhit', '刘家锋', '/static/img/avatar.png', 'jefferyliu@hit.edu.cn', '', NULL, '副教授', '模式识别研究中心', '刘家锋，博士、副教授。负责和参加完成了国家863计划研究项目、国家自然科学基金、省部委基金项目、国际合作项目等十多项。研究方向：模式识别，计算机视觉，字符识别技术，人体运动分析。其成果获国家科技进步三等奖1项，省部级科技进步一等奖1项，二等奖1项，三等奖2项，发表论文50余篇。刘家锋，博士、副教授。负责和参加完成了国家863计划研究项目、国家自然科学基金、省部委基金项目、国际合作项目等十多项。研究方向：模式识别，计算机视觉，字符识别技术，人体运动分析。其成果获国家科技进步三等奖1项，省部级科技进步一等奖1项，二等奖1项，三等奖2项，发表论文50余篇。', 0, 6, 'ljf');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(28, 'ljzhit', '李建中', '/static/img/avatar.png', 'lijzh@hit.edu.cn', '', NULL, '教授', '海量数据计算研究中心', '李建中，教授，博士生导师，1995年获得国家杰出青年基金，任中国计算机学会理事、学术工作委员会副主任、数据库专委会副主任、传感器网络专委会副主任、《IEEE Transactions on Knowledge and Data Engineering》副主编、《Journal of Computer Science and Technology》、《计算机学报》、《软件学报》、《计算机研究与发展》等学术刊物编委。主要研究方向为海量数据管理与计算、无线传感器网络等。主持完成国家973计划项目、863计划项目、国家自然科学基金重点和面上项目、国防预研项目、省部委项目以及国际合作项目30余项，在IEEE Transactions on Knowledge and Data Engineering、Algorithmica、VLDB Jurnal、ACM SIGMOD、VLDB、INFOCOM、ICDE、ICDCS等国内外顶级和重要会议和期刊发表学术论文200余篇，出版论著3部，被他引近3000次，单篇被他引最高570余次，获得国家科技进步二奖1项、省部级科技进步一等奖2项、其他奖励10余项，获专利和软件著作权11项。他30余次担任国际学术会议大会主席、程序委员会主席等职务，在国际数据库界具有很大影响。1993年获国家有突出贡献回国留学人员称号，1995年被评为国家级有突出贡献中青年专家，2001年获全国优秀科技工作者称号，2004年获全国五一劳动奖章，2009年被评为黑龙江省教学名师。', 0, 6, 'ljz');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(29, 'ljzhit', '骆吉洲', '/static/img/avatar.png', 'luojizhou@hit.edu.cn', '', NULL, '副教授', '海量数据计算研究中心', '骆吉洲，博士，副教授，重庆市铜梁县人；2001年毕业于哈尔滨工业大学数学系基础数学专业，获理学硕士学位；2006年毕业于哈尔滨工业大学计算机学院软件与理论专业，获工学博士学位；主要从事压缩数据库技术、传感器网络、算法理论等领域的研究。', 0, 6, 'ljz1');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(30, 'llhit', '林磊', '/static/img/avatar.png', 'linl@insun.hit.edu.cn', '', NULL, '副教授', '语言技术研究中心', '林磊，博士，副教授。2004年获得哈尔滨工业大学计算机应用技术学科博士学位。研究方向包括: 生物信息学、文本挖掘、网络信息处理和机器学习等。参加过多项国家自然科学基金和863计划项目，在国内外重要期刊和会议上发表论文40余篇。', 0, 6, 'll');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(31, 'lphit', '刘鹏', '/static/img/avatar.png', 'pengliu@hit.edu.cn', '', NULL, '副教授', '模式识别研究中心', '刘鹏，博士、副教授。研究方向：图象处理、视频处理、模式识别、超大规模集成电路设计。发表文章8篇。', 0, 6, 'lp');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(32, 'lqhit', '李琼', '/static/img/avatar.png', 'qiong.li@ict.hit.edu.cn', '', NULL, '副教授', '信息对抗技术研究所', '李琼，博士、副教授，哈尔滨工业大学信息对抗技术研究所教师, 中国计算机学会会员、ACM会员。曾负责/参加863项目3项、自然科学基金项目3项等，在研863项目2项、自然科学基金项目2项等。获国防科技进步二等奖1次。已发表学术论文20余篇。合作出版译著1部，参与了标准GB/T 18336-2001的修订。主要研究方向：生物信息密码技术、多媒体安全技术、信息安全技术、信息隐藏技术。', 0, 6, 'lq');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(33, 'lshit', '李生', '/static/img/avatar.png', 'lisheng@hit.edu.cn', '', NULL, '教授', '语言技术研究中心', '李生，教授，博士生导师，哈工大语言语音教育部-微软重点实验室主任,中文信息学会理事长。主要研究方向：自然语言处理、机器翻译、信息检索。近年来主持完成国家自然科学基金、国家863项目等20余项，先后获得省部级科技进步二等奖4项、三等奖3项，在国内外期刊和会议上发表学术论文200余篇。', 0, 6, 'ls');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(34, 'lshhit', '刘绍辉', '/static/img/avatar.png', NULL, '', NULL, '副教授', '智能接口与人机交互研究中心', NULL, 0, 6, 'lsh');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(35, 'lthit', '刘挺', '/static/img/avatar.png', 'tliu@ir.hit.edu.cn', '', NULL, '教授', '社会计算与信息检索研究中心', '刘挺，博士，教授，博士生导师，计算机学院副院长，社会计算与信息检索研究中心主任，中文信息学会理事、信息检索专业委员会副主任，国家863“中文处理”重点项目总体组专家。主要研究方向：社会计算、信息检索、自然语言处理。近年来主持完成国家自然科学基金、国家863、省部委40余项，在国内外期刊和会议上发表学术论文100余篇。', 0, 6, 'lt');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(36, 'lxkhit', '李秀坤', '/static/img/avatar.png', 'lixiukun@hit.edu.cn', '', NULL, '教授级高级工程师', '软件实验室', '李秀坤，硕士，教授级高工，软件实验中心主任。讲授了多门本科课程，参与国家精品课程建设、省精品课程建设、教育部微软精品课程建设等多项教学项目，是国家级优秀教学团队骨干成员，取得了多项教学成果；参与了多项国家863计划、省部委科研项目；在国内外学术刊物上发表20余篇论文，编写了5部各类教材', 0, 6, 'lxk');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(37, 'lxyhit', '刘晓燕', '/static/img/avatar.png', 'lxy0451@yahoo.com.cn', '', NULL, '副研究员', '计算机软件基础教研室', '刘晓燕，博士、副研究员。计算机软件基础教研室教师。为本科生与研究生讲授过专家系统开发工具，数据结构与算法、操作系统、软件体系结构等课程。主要研究方向：专家系统与专家系统开发工具、决策模型、操作系统。曾承担国家863计划、国家自然基金、省自然基金等十多项科研项目，并获国家教委科技进步二等奖1项及与省级科技进步二等奖2项', 0, 6, 'lxy');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(38, 'lyhit', '刘扬', '/static/img/avatar.png', 'yliu76@hit.edu.cn', '', NULL, '副教授', '计算机科学技术研究中心', '刘扬，博士，副教授、硕士生导师。曾获国防科工委及黑龙江省优秀毕业生。主要研究方向为机器学习、图像处理、计算机视觉。目前负责及参加国家自然科学基金、863及中国博士后基金；其成果获得了省自然科学三等奖一项，省高校科技进步一等奖两项；发表论文30余篇。', 0, 6, 'ly');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(39, 'lzjhit', '李治军', '/static/img/avatar.png', 'lizhijun_os@hit.edu.cn', '', NULL, '副教授', '计算机软件基础教研室', '李治军，博士、副教授，哈尔滨工业大学计算机科学与技术学院软件基础教研室老师。负责国家自然科学基金、博士点基金、博士后科学基金等多项科研项目，参与国家精品课程建设、省精品课程建设、教育部微软精品课程建设等多项教学项目，是国家级优秀教学团队骨干成员。发表论文20余篇，出版著作2部。', 0, 6, 'lzj');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(40, 'mlhit', '马琳', '/static/img/avatar.png', 'malin_li@hit.edu.cn', '', NULL, '副教授', '生物计算研究中心', ' 马琳，女，副教授，博士。硕士生导师。IEEE会员。中国中西医诊断学会委员，中国计算机学会会员。2000年获法国巴黎第六大学人工智能与模式识别及其应用硕士学位，2009年获哈尔滨工业大学计算机科学与技术博士学位。2000年10月进入法国巴黎第十二大学生物医学工程学院、医用仪器研究所任助理研究员；2002年12月起于哈尔滨工业大学计算机科学与技术学院任讲师，2008年起任副教授。2006年5月-2006年8月，2011年1月-2011年5月在香港理工大学计算机系任研究助理。研究领域包括：图象处理技术、模式识别、生物信息技术、认知科学等，主持和参与省市研究基金2项，国家自然科学基金1项；发表论文20余篇，著译书2部，专利1项。', 0, 6, 'ml');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(41, 'nlshit', '聂兰顺', '/static/img/avatar.png', 'nls@hit.edu.cn', '', NULL, '副教授', '企业与服务智能计算中心', '聂兰顺，博士，副教授，硕士生导师，中国计算机学会会员，美国SIAM学会会员，法国克莱蒙费朗第二大学LIMOS国家实验室访问学者。主要研究方向：制造与服务系统建模优化、跨组织协调、软件建模等。主持国家自然科学基金项目1项，国家863计划课题1项，参与国家863计划、“核高基”专项课题等近10项，获省部级科技进步一等奖1项，二等奖2项，发表论文30余篇，其中SCI/EI/ISTP检索20余篇。讲授《计算机基础》、《计算机导论》与《数据库系统》等课程。', 0, 6, 'nls');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(42, 'nxmhit', '牛夏牧', '/static/img/avatar.png', 'xiamu.niu@ict.hit.edu.cn', '', NULL, '教授', '信息对抗技术研究所', '牛夏牧，博士，教授，博士生导师、哈尔滨工业大学信息对抗技术研究所所长。国家863专题专家，Chinese Journal of Electronics编委；JIH-MSP 国际杂志副总编；IJCSES国际杂志编委；IEEE会员；ACM会员；中国电子学会高级会员；中国电子学会通信分会“多媒体信息安全专家委员会”委员。他是2002年全国百名优秀博士论文奖获得者；2003年国防科技百名优秀博士论文奖获得者；2003年度全国留学回国人员科技活动择优资助项目优秀类项目；2004年黑龙江省杰出青年基金获得者；2004年度入选教育部“新世纪优秀人才支持计划”；并先后多次担任各种国际会议大会主席、程序委员会主席、组织委员会主席、大会特约报告、session主席、程序委员会委员。作为特聘科学家到德国Fraunhofer Institute for Computer Graphics从事两年研究工作。共完成科研项目19项，获得国家科技进步二等奖1项；教育部科技进步一等奖1项；获航天部科技进步一等奖1项；国防科工委科技进步二等奖2项；航天部科技进步二等奖1项；教育部科技进步二等奖1项；黑龙江科技进步二等奖1项；黑龙江教学成果优秀奖二等奖1项；另有3个项目获省部级三等奖。共发表学术论文120余篇，其中50余篇被SCI/EI收录。主编与参编著作8部（其中英文4部）。发明专利2项。', 0, 6, 'nxm');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(43, 'plqhit', '潘立强', '/static/img/avatar.png', NULL, '', NULL, '高级工程师', '软件实验室', NULL, 0, 6, 'plq');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(44, 'pshhit', '朴松昊', '/static/img/avatar.png', 'piaosh@hit.edu.cn', '', NULL, '教授', '多智能体机器人研究中心', '朴松昊，博士，教授，博士生导师。民革党员，多智能体机器人研究中心副主任，中国人工智能学会理事，中国人工智能学会机器人足球工作委员会委员，中国人工智能学会青年工作委员会委员，黑龙江省机器人学会常务理事，FIRA机器人大赛副裁判长。主要研究方向：分布式人工智能、多智能体机器人系统、智能移动机器人、机器人足球、仿人机器人、运动规划、计算机仿真等，主持或参与多项国家自然基金、国家“863”计划、黑龙江省自然基金、国际合作项目，发表学术论文50余篇，其中SCI/EI/ISTP检索40多篇，带队获得二十多项世界杯及全国机器人大赛冠军。', 0, 6, 'psh');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(45, 'qbhit', '秦兵', '/static/img/avatar.png', 'qinb@ir.hit.edu.cn', '', NULL, '教授', '社会计算与信息检索研究中心', '秦兵，博士，教授，博士生导师。中国计算机学会高级会员，中文信息学会信息检索专委会委员。主要研究方向：自然语言处理、信息抽取、社会计算。本人负责承担国家自然科学基金2项，国家863项目1 项，国际合作项目3项。同时参与完成多项国家自然科学基金、国家863、省部委以及国际合作项目，获专利1项，软件著作权2项，在国内外期刊和会议上发表学术论文50余篇，出版教材及译著2部。', 0, 6, 'qb');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(46, 'rsjhit', '任世军', '/static/img/avatar.png', 'ren_shijun@163.com', '', NULL, '教授', '计算机软件基础教研室', '任世军，博士，教授。主要研究方向：聚类分析、生物信息、进化计算、多个半空间交集是否为空的判定问题及图论。在国际和国内期刊发表论文40余篇。', 0, 6, 'rsj');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(47, 'sdlhit', '孙大烈', '/static/img/avatar.png', 'sdl@hit.edu.cn', '', NULL, '副教授', '计算机语言基础教研室', '孙大烈，副教授，计算机软件与理论方向在读博士生，计算机语言基础教研室副主任，哈工大ACM国际大学生程序设计竞赛主教练，ACM国际大学生程序设计竞赛中国区指导委员会执行委员。主讲课程“形式语言”评为国家级双语教学示范课程和省级精品课程，课程组负担的课程“计算机实用基础”评为省级精品课程。主编教材2部，其中一部评为国家“十一五”规划教材。主持和参与多项校内、省高教学会、省教育厅教改项目，获得多项教学研究成果奖。2003年开始担任本科生班主任，获得“黑龙江省普通高等学校优秀思想政治工作者”称号。2008年开始负责哈工大ACM国际大学生程序设计竞赛工作，创建哈工大ACM竞赛创新基地。主要研究领域：数据库、对等计算、分布式查询，参与多项国家自然科学基金项目。', 0, 6, 'sdl');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(48, 'sdmhit', '石大明', '/static/img/avatar.png', 'dshi@hit.edu.cn', '', NULL, '教授', '模式识别研究中心', '石大明教授，博士生导师，院长助理。哈工大机电控制学博士、英国南安普敦大学计算机学博士、IEEE 高级会员、IEEE SMC学会智能网络系统技术委员会主席。自1997年起，在国外历任新加坡国立大学博士后、新加坡南洋理工大学助理教授等职，曾被德国、英国、韩国、澳大利亚等地多所大学聘为访问教授；于2011年回国进入哈工大模式识别研究中心。研究方向包括机器人视觉、模式识别与机器学习。已出版专著一部、学术论文100余篇，其中多篇论文以第一作者发表在IEEE TPAMI、IEEE TIP等国际权威刊物。', 0, 6, 'sdm');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(49, 'ssfhit', '石胜飞', '/static/img/avatar.png', 'shengfei@hit.edu.cn', '', NULL, '副教授', '海量数据计算研究中心', '石胜飞，博士，副教授，ACM会员，中国计算机学会会员。分别于1995年，2000年和2006年，在哈尔滨工业大学获得计算机软件学士，计算机软件与理论硕士和计算机软件与理论博士学位。研究领域：数据挖掘，海量数据管理，CPS数据管理等。', 0, 6, 'ssf');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(50, 'sxhhit', '苏小红', '/static/img/avatar.png', 'sxh@hit.edu.cn', '', NULL, '教授', '航天软件工程研究中心', '苏小红，原名苏晓红，博士，航天软件工程研究中心教授，博士生导师。计算机科学与技术国家级实验教学示范中心副主任，计算机语言基础教研室主任，校级教学名师，校教学带头人，中国计算机学会高级会员，电子工业出版社特聘专家，国内多种核心以上期刊的审稿人，宝钢优秀教师奖和省师德先进个人获得者。主要研究方向为：高可信软件工程（程序分析，软件可靠性和安全性评测，软件缺陷检测、软件测试与错误自动定位、软件克隆演化分析、软件重构、代码识别与检索、代码反混淆），智能信息处理与信息融合（空间目标识别与航迹跟踪、多无人机多目标航迹规划），图像处理与识别（运动目标检测与跟踪、图像色彩匹配）。主持或参加完成国家自然科学基金、国防基础科研、技术基础科研、国家863、国际合作、横向合作等科研项目多项，获黑龙江省科技进步二等奖1项、黑龙江省自然科学二等奖1项、市自然科学技术学术成果一等奖1项。发表学术研究论文100余篇，获软件著作权登记6项，申请发明专利3项。', 0, 6, 'sxh');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(51, 'thxhit', '唐好选', '/static/img/avatar.png', 'tanghx@hope.hit.edu.cn', '', NULL, '副教授', '航天软件工程研究中心', '唐好选，博士，副教授。主要研究方向：虚拟现实、计算机图形学、嵌入式系统、物联网技术，负责及参与国家科技支撑计划、横向联合项目多项。在国内外学术刊物上发表论文30篇。2010-2011年在美国宾夕法尼亚大学留学1年。', 0, 6, 'thx');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(52, 'txlhit', '唐降龙', '/static/img/avatar.png', 'tangxl@hit.edu.cn', '', NULL, '教授', '模式识别研究中心', '唐降龙  教授、博士生导师，1982、1986年获得哈尔滨工业大学学士、硕士学位，1995获哈尔滨工业大学计算机应用技术学科博士学位。哈尔滨工业大学计算机学院模式识别研究中心主任，人工智能与信息处理学科带头人。学术团体任职或兼职：智能科学与智能数据工程国际会议(IScIDE)指导委员会委员；中国人工智能协会理事，黑龙江省人工智能协会副理事长；中国计算机学会高级会员，中国计算机学会人工智能与模式识别专业委员会委员，黑龙江省计算机学会人机交互专业委员会主任。科研方向及主要学术成就：主要从事模式识别、机器学习、航天器视觉分析及装置、医学图像处理等方面的研究，开设《先进模式识别》、《运动分析与理解》等博士生课程。负责国家863计划研究项目、国家自然科学基金、省部委基金项目、国际合作项目等二十多项，先后获得国家级科技三等奖1项，省部级科技进步一等奖3项，二等奖1项，三等奖2项。发表论文100余篇，出版专著1部。获发明专利1项。', 0, 6, 'txl');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(53, 'tzhhit', '田志宏', '/static/img/avatar.png', 'tianzhihong@pact518.hit.edu.cn', '', NULL, '副研究员', '计算机网络与信息安全研究中心', '田志宏，男，博士，副教授。 中国计算机学会会员，IEEE&IEEE Computer会员。主要从事入侵检测和数据融合、主动实时防护以及计算机取证和恢复等网络与信息安全技术的研究。作为项目第一负责人主持了国家自然科学基金、国家863项目、中国博士后科学基金委博士后基金项目等。荣获黑龙江省科学技术二等奖（进步类）。在《Web Intelligence and Agent Systems》《COMPUTER COMMUNICATIONS》《软件学报》《计算机学报》《中国科学》《通信学报》《计算机研究与发展》《High Technology Letters》《SIGCOMM》《GLO', 0, 6, 'tzh');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(54, 'wdxhit', '温东新', '/static/img/avatar.png', 'wdongxin@hit.edu.cn', '', NULL, '副教授', '计算机语言基础教研室', '温东新，博士、副教授，哈尔滨工业大学计算机科学与技术学院计算机语言基础教研室老师。负责国家863、省博士后科学基金等多项科研项目，参与国家精品课程建设等多项教学项目，是国家级精品课程的主讲成员。发表论文20余篇，参编出版教材2部,主审教材1部.', 0, 6, 'wdx');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(55, 'wghhit', '汪国华', '/static/img/avatar.png', 'ghwang@hit.edu.cn', '', NULL, '副教授', '生物计算研究中心', '汪国华，博士，副教授，博士生导师，AAAS会员，中国计算机学会高级会员。2006年11月至2008年11月美国印第安纳大学-普度大学印第安纳波利斯学校生物信息与计算生物中心访问学者。主要研究方向：生物信息学，机器学习，生物知识工程。最近三年内，在BMC Genomics，Molecular and Cellular Biology，Nucleic Acids Research，PLOS ONE等国外重要生物信息学期刊发表10余篇论文，其中影响因子大于3.9 以上文章10篇，第一作者文章4篇，并列第一作者文章2篇。目前负责一项自然科学基金青年基金，一项黑龙江省归国留学人员基金，作为重要研究人员参加多项自然科学基金，863，科技支撑计划等项目。', 0, 6, 'wgh');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(56, 'whzhit', '王宏志', '/static/img/avatar.png', 'wangzh@hit.edu.cn', '', NULL, '副教授', '海量数据计算研究中心', '王宏志，博士，博士生导师，哈尔滨工业大学计算机科学与技术学院副教授，中国计算机学会高级会员，YOCSEF黑龙江省分论坛AC。2008年7月在哈尔滨工业大学计算机软件与理论学科获得博士学位，博士论文获得“中国计算机学优秀博士论文”和“哈尔滨工业大学优秀博士论文”。研究方向包括XML数据管理、图数据管理、数据质量、信息集成等。先后被评为“微软学者”、“中国优秀数据库工程师”和“IBM博士英才”。曾先后担任全国数据库会议等多个学术会议的程序委员会委员和IEEE TKDE等多个重要国际期刊的审稿人。', 0, 6, 'whz');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(57, 'wkqhit', '王宽全', '/static/img/avatar.png', 'wangkq@hit.edu.cn', '', NULL, '教授', '生物计算研究中心', '王宽全，博士，教授，博士生导师，威海计算机学院院长。生物计算研究中心副主任、计算机科学与技术国家级实验教学示范中心主任,全国工程硕士专业学位教育指导委员会计算机技术协作组组长、IEEE高级会员、中国计算机学会高级会员、中国生物医学工程学会高级会员。主要研究方向：图像处理与模式识别、生物特征识别、生物计算、虚拟现实与可视化。主持国家自然科学基金、国家863高技术计划等国家级项目10余项。发表论文150余篇，其中SCI收录40余篇，EI 收录70余篇，出版学术专著4部，获得专利授权6项，获得国家教学成果二等奖1项。', 0, 6, 'wkq');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(58, 'wlhit', '王玲', '/static/img/avatar.png', 'lwang@ftcl.hit.edu.cn', '', NULL, '教授', '计算机网络与信息安全研究中心', '王玲，博士，2004年受聘我校计算机学院副教授，2011年任教授。在国际期刊及会议上已发表四十余篇文章。2005国际会议International Conference on Information Technology的传感器网络分会以及2005 International Conference on Computational Intelligence and Multimedia Applications的学术委员会委员．2006-2010国际会议ITNG的高性能体系结构分会主席。先后参加过多项科研任务的研究工作，作为负责人已完成两项国家自然科学基金项目，及一项黑龙江省科技攻关项目。', 0, 6, 'wl');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(59, 'wxhhit', '吴翔虎', '/static/img/avatar.png', 'wxianghu@yahoo.com', '', NULL, '教授', '航天软件工程研究中心', '吴翔虎，教授。主要研究方向：高性能嵌入式计算、航天软件工程、实时嵌入式操作系统、信息物理融合系统。负责及参与国家863计划项目、总装预研、省部委科研项目10余项。获国家科技进步二等奖、国防科技进步一、二等奖各一项。在国内外学术刊物及会议上发表论文30余篇。', 0, 6, 'wxh');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(60, 'wxqhit', '邬向前', '/static/img/avatar.png', 'xqwu@hit.edu.cn', '', NULL, '教授', '生物计算研究中心', '邬向前, 博士，教授，博士生导师，IEEE会员，IAPR会员，SPIE会员，中国计算机学会高级会员。曾多次赴香港理工大学合作研究。主持完成多项国家自然科学基金、863等项目的研究。已在多个高水平国际刊物和会议上发表学术论文70余篇，出版学术专著一部，并获多项专利。是国家自然科学基金通讯评审人、IEEE Trans. PAMI等多个顶级国际刊物的审稿人。曾获得黑龙江省自然科学一等奖、黑龙江省自然科学学术成果二等奖、全国优秀博士论文提名奖、中国计算机学会优秀博士论文奖、哈尔滨工业大学优秀博士论文奖和国际会议优秀论文奖等，入选教育部“新世纪优秀人才支持计划”，并获霍英东教育基金资助。', 0, 6, 'wxq');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(61, 'wydhit', '王亚东', '/static/img/avatar.png', 'ydwang@hit.edu.cn', '', NULL, '教授', '生物计算研究中心', '王亚东，教授，博士生导师，计算机学院院长，曾任国家“863”计划生物信息技术主题第一届、第二届专家组专家，现任生物与医药技术领域专家委员会专家，黑龙江省生物医学信息技术与系统工程研究中心主任，黑龙江省生物信息技术重点实验室主任，中国人工智能学会理事，《生物信息技术》期刊编委。主要研究方向：人工智能、机器学习、知识工程、生物信息学、医学信息技术、DNA计算与生物计算机等；主持完成国家自然科学基金、国家863计划项目、国际合作项目等20余项，获国家科技进步二等奖1项；近几年，在国外重要期刊发表论文50余篇。', 0, 6, 'wyd');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(62, 'wzbhit', '吴智博', '/static/img/avatar.png', 'wzb@ftcl.hit.edu.cn', '', NULL, '教授', '计算机网络与信息安全研究中心', '吴智博，博士，教授，博士生导师。中国计算机学会系统结构专委会委员，容错计算专委会委员，信息存储专委会委员。主要研究方向：计算机系统结构、容错计算、信息存储、可信计算、普适计算与移动计算等。曾负责或参与完成多项国家863项目及其他项目，其中参与完成了“神舟”号飞船数据管理分系统容错计算机样机系统设计和研制。获得省部级科技进步二等奖1项、在国内外期刊和会议上发表学术论文50余篇。曾任国内外学术会议程序主席，分会主席多次。', 0, 6, 'wzb');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(63, 'wzjhit', '王忠杰', '/static/img/avatar.png', 'rainy@hit.edu.cn', '', NULL, '教授', '企业与服务智能计算研究中心', '王忠杰，博士，教授，博士生导师。主要研究方向：服务计算、服务工程、软件体系结构及其重构等。曾主持过国家自然科学基金和863课题各一项，参与完成5项自然基金课题和5项863课题，讲授《软件体系结构》、《软件工程》与《服务工程》等课程，发表论文40余篇。', 0, 6, 'wzj');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(64, 'xxfhit', '徐晓飞', '/static/img/avatar.png', 'xiaofei@hit.edu.cn', '', NULL, '教授', '企业与服务智能计算研究中心', '徐晓飞，博士，教授，博士生导师，哈工大校长助理。国际信息处理联合会IFIP WG5.8副主席、中国科协委员、国务院学位委计算机学科评议组成员、中国计算机学会常务理事。主要研究方向：服务工程与服务计算、企业计算与互操作、管理与决策信息系统、数据挖掘与商务智能等。近年来，主持并完成30余项国家自然科学基金、国家863计划、教育部跨世纪人才计划、省部委基金及国际合作项目，获得省部级科技进步一等奖2项、二等奖4项、三等奖4项，软件著作权20余项，在国内外期刊和会议上发表学术论文300余篇，被SCI/EI收录上百篇，著书3部，获得省教学成果一、二等奖各1项。', 0, 6, 'xxf');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(65, 'xzmhit', '徐志明', '/static/img/avatar.png', 'xuzm@hit.edu.cn', '', NULL, '教授', '语言技术研究中心', '徐志明，博士，教授。2001年获得哈工大计算机应用技术学科博士学位。研究方向为信息检索、社会计算。主持和参加多项国家自然科学基金、863项目等，获得国防科工委科技进步三等奖1项；任职以来发表文章40余篇。', 0, 6, 'xzm');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(66, 'yhxhit', '姚鸿勋', '/static/img/avatar.png', 'h.yao@hit.edu.cn', '', NULL, '教授', '智能接口与人机交互研究中心', '姚鸿勋，博士，教授，博士生导师,入选教育部"新世纪优秀人才"计划。主要研究方向：多媒体数据分析与理解、信息检索、视频监控、计算机视觉、人机交互与数字媒体技术等。担任国际会议ICIMCS 2010及ACII2005的大会程序委员主席和大会协同主席。已发表包括IEEE Trans. on Multimedia, Pattern Recognition, CVIU 等国际重要期刊及CVPR，ACM Multimedia等领域顶级国际会议在内的文章200 余篇，其中SCI 检录41 篇，EI 检录127 篇，ISTP 检录83 篇。主持完成多项国家自然科学基金、国家863、省部级以及国际合作等项目，获省自然科学技术成果奖2项，省高校科学技术奖一等奖1项，国防科学技术三等奖1项，获得国家发明专利6项，著书5部，获得黑龙江教学成果2项。', 0, 6, 'yhx');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(67, 'ymyhit', '杨沐昀', '/static/img/avatar.png', 'ymy@mtlab.hit.edu.cn', '', NULL, '副教授', '语言技术研究中心', '杨沐昀博士，副教授，中心教学秘书。2003年获得哈工大工学博士，IEEE会员，中国计算机学会青年计算机科技论坛哈尔滨份论坛学术秘书，中文信息处理学会会员。研究方向为机器翻译、计算语言学、人工智能。主持和参加多项自然科学基金和863项目的，获得国防科工委科技进步三等奖1项、国家教委三等奖1项、出版专著1部；近3年来发表文章20余篇。', 0, 6, 'ymy');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(68, 'yxzhit', '余翔湛', '/static/img/avatar.png', 'yxz@pact518.hit.edu.cn', '', NULL, '副教授', '计算机网络与信息安全研究中心', '余翔湛，博士，副教授，硕士生导师。中国计算机学会会员，IEEE会员。研究方向：网络安全、生存性、物联网安全等。主持完成863等多项课题。获省部级科技进步一等奖1项，省部级科技进步二等奖1项。发表相关论文30余篇。', 0, 6, 'yxz');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(69, 'zdbhit', '赵德斌', '/static/img/avatar.png', 'dbzhao@vilab.hit.edu.cn', '', NULL, '教授', '智能接口与人机交互研究中心', '赵德斌，博士，教授，博士生导师，计算机学院院长助理。分别于1985，1988和1998年在哈尔滨工业大学计算机系取得计算机科学与技术专业工学学士、工学硕士和工学博士学位。毕业后他加入哈尔滨工业大学计算机系，1993年任职副教授，2000年任职教授，现任哈尔滨工业大学博士生导师和中国科学院计算技术研究所博士生导师。主要研究方向：视频编码、图像处理和视频传输。到目前为止已在相关领域发表学术论文200余篇，其中IEEE Trans论文20余篇，包括IEEE Trans. on CSVT，IEEE Trans. on IP和IEEE Trans. on MM。曾获得国家技术发明二等奖1项和国家科技进步二等奖2项，获得宝钢教育奖（优秀教师奖）。 目前主持国家自然科学基金重点项目1项和国家973计划课题1项。2005年入选国防科技工业“511人才工程”。', 0, 6, 'zdb');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(70, 'zdchit', '战德臣', '/static/img/avatar.png', 'dechen@hit.edu.cn', '', NULL, '教授', '企业与服务智能计算中心', '战德臣，博士，教授，博士生导师，基础教学带头人。主要研究方向：现代企业管理、数据与知识工程、软件体系结构与软件重用、虚拟企业集成与电子商务、企业资源计划与现代集成制造系统。先后完成国家863计划重点项目、基础研究项目、国家自然科学基金项目、省部委项目20余项，曾主持过《哈尔滨电机厂国家863/CIMS重点应用示范工程》、《适合中国国情的可重构ERP系统》、《新一代企业资源计划系统》、《基于MDA动态可重构的跨企业协同资源管理系统》等项目，其主持研发的产品《CERP软件系统》已在30多家企业获得应用。目前研究课题有国家863计划重点课题、国家自然科学基金课题和省科技攻关重点课题等。其成果获部级科技进步二等奖2项，三等奖3项；发表论文100多篇，著书3部，获软件著作权22项，指导8名博士生及50余名硕士生，其中已毕业博士4名， 硕士40余名。', 0, 6, 'zdc');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(71, 'zdchit', '左德承', '/static/img/avatar.png', 'zdc@ftcl.hit.edu.cn', '', NULL, '教授', '容错与移动计算研究中心', '左德承，博士，教授，博士生导师，院长助理，容错与移动计算研究中心主任，中国计算机学会容错计算专业委员会委员。主要研究方向：容错计算、移动计算。近年来，主持或参与完成多项国家863项目、国家973项目及其他项目，获得省部级科技进步二等奖2项、三等奖1项，申请发明专利7项，在国内外期刊和会议上发表学术论文40余篇。', 0, 6, 'zdc1');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(72, 'zdqhit', '郑德权', '/static/img/avatar.png', 'dqzheng@mtlab.hit.edu.cn', '', NULL, '副教授', '语言技术研究中心', '郑德权博士，副教授。2006年在哈工大获得计算机应用技术学科博士学位，现为中国计算机学会会员，中文信息学会会员，省计算机学会智能人机交互专委会委员。研究方向包括: 互联网信息综合处理、多语言信息抽取与检索、知识工程等。主持和参加多项国家自然科学基金、国家863项目、国防科研项目以及多项省部级项目，在各级国内外学术期刊、国际及国内学术会议上发表论文60余篇，三检论文30余篇，承担《人工智能原理及应用》、《文本理解与动画生成》等研究生专业课程的教学任务。', 0, 6, 'zdq');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(73, 'zgbhit', '郑贵滨', '/static/img/avatar.png', 'zhengguibin@hit.edu.cn', '', NULL, '副教授', '智能接口与人机交互研究中心', '郑贵滨，博士，副教授，中国计算机学会高级会员，分别于1996年、1999年和2006年，获得上海交通大学计算机应用专业与电机电器及其控制专业双学士学位、哈尔滨理工大学计算应用技术专业硕士学位、哈尔滨工业大学计算机应用专业博士学位。目前主要从事音频信息检索方面的研究工作，承担并完成了多项部级和地方的科研项目，开发的音频样例检索软件已成功应用于多个领域。在国内外期刊、国际会议发表文章20余篇，其中EI和ISTP收录论文10余篇，获得省部级二等奖2项，三等奖3项，获厅局级一等奖3项、二等奖1项。软件著作权2项、申请专利2项、参与著书3部。', 0, 6, 'zgb');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(74, 'zhlhit', '张宏莉', '/static/img/avatar.png', 'zhanghongli@hit.edu.cn', '', NULL, '教授', '计算机网络与信息安全研究中心', '张宏莉，博士，教授，博士生导师。计算机学院副院长。计算机网络与信息安全研究中心副主任。信息内容安全技术国家工程重点实验室技术委员会副主任，教育部信息安全类教学指导委员会委员，黑龙江省网络安全专家委员会专家，哈尔滨市信息安全专家组副组长。主要研究方向：网络与信息安全、网络测量、并行计算等。近年来，主持完成多项国家863项目、国家973项目、国家自然科学基金、国防预研以及省部级项目，获得省部级科技进步一等奖1项，二等奖2项，在国内外期刊和会议上发表学术论文80余篇。2007年度入选教育部“新世纪优秀人才支持计划”。', 0, 6, 'zhl');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(75, 'zhyhit', '周海鹰', '/static/img/avatar.png', 'hyzhou@ftcl.hit.edu.cn', '', NULL, '教授', '容错与移动计算研究中心', '周海鹰，博士，教授，硕士生导师。主要研究方向包括计算机系统结构、移动计算技术、无线自组网技术、容错计算', 0, 6, 'zhy');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(76, 'zhzhit', '张宏志', '/static/img/avatar.png', 'zhanghz@hit.edu.cn', '', NULL, '副教授', '生物计算研究中心', '张宏志（男，1976年10月出生）博士，副教授。于2007年获哈尔滨工业大学计算机应用技术专业博士学位，并于2008年入选哈尔滨工业大学优秀青年教师培养计划。曾分别于2005年12至2006年6月，2007年8月至2008年1月在香港理工大学计算机系任研究助理。截止2011年，作为主要成员获得省教育厅自然科学一等奖1项，作为项目负责人主持国家自然科学基金项目1项，作为项目主要成员参与国家自然科学基金重点、重大国际合作项目、863重点项目及教育部博士点基金项目各1项；已发表学术论文32篇（含国际教学论文2篇），其中，SCI检索4篇，EI检索26篇；作为副主编出版中、英文专著各1部，英文专著章节1篇；已获得国家发明专利授权5项。', 0, 6, 'zhz');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(77, 'ztjhit', '赵铁军', '/static/img/avatar.png', 'tjzhao@mtlab.hit.edu.cn', '', NULL, '教授', '语言技术研究中心', '赵铁军，博士，教授，博士生导师。计算机学院党委书记兼副院长副院长，语言技术研究中心副主任，哈工大语言语音教育部-微软重点实验室副主任。中国中文信息学会理事，中文信息学会机器翻译专委会副主任，《中文信息学报》编委。主要研究方向：自然语言处理、人工智能应用。近年来主持完成国家自然科学基金、国家863项目、国防预研、省部委、国际合作项目等20余项，2009年获得国防科技进步奖1项。近4年来获得软件著作权7项，在国内外刊物和会议上发表论文150余篇。', 0, 6, 'ztj');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(78, 'ztrhit', '郑铁然', '/static/img/avatar.png', 'zhengtieran@hit.edu.cn', '', NULL, '副教授', '智能接口与人机交互研究中心', '郑铁然,博士，副教授，硕士生导师.主要研究方向：语音识别、语音文档检索、说话人识别、音频场景分析等.', 0, 6, 'ztr');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(79, 'ztyhit', '臧天仪', '/static/img/avatar.png', 'Tianyi.zang@gmail.com', '', NULL, '教授', '企业与服务智能计算中心', '臧天仪，博士，教授，博士生导师、归侨。IEEE TCSC绿色计算技术领域执行委员会委员，中国计算机学会高级会员。主要研究方向：面向服务计算，互联网计算，复杂系统建模及其验证与分析，面向服务的软件工程。主持、参与并完成多项英国政府、新加坡政府等资助的科研项目，担任多项重要国际会议主席和程序委员会成员，在国际期刊和会议上发表学术论文30余篇。', 0, 6, 'zty');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(80, 'zwhit', '张炜', '/static/img/avatar.png', 'weizhang@hit.edu.cn', '', NULL, '副教授', '海量数据计算研究中心', '张炜，博士，副教授，2006年毕业于哈尔滨工业大学计算机学院软件与理论专业，获工学博士学位。主要从事图数据管理、无线传感器网络等领域的研究。', 0, 6, 'zw');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(81, 'zwmhit', '左旺孟', '/static/img/avatar.png', 'cswmzuo@gmail.com', '', NULL, '副教授', '生物计算研究中心', '左旺孟，博士，副教授，博士生导师。IEEE会员，中国计算机学会会员，国际期刊《ISRN Signal Processing》编委。主要研究方向：图像处理、模式识别、生物特征识别、维数约简、稀疏表示和优化。目前承担国家自然科学基金1项，在ACM CSUR、IEEE T-IP等重要国际期刊和CVPR、ICPR、ICIP等重要国际会议上发表学术论文40余篇。曾获得全国优秀博士论文提名奖、哈尔滨工业大学优秀博士论文奖和国际会议优秀论文奖。', 0, 6, 'zwm');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(82, 'zwzhit', '张伟哲', '/static/img/avatar.png', 'wzzhang@hit.edu.cn', '', NULL, '教授', '计算机网络与信息安全研究中心', '张伟哲，男，博士后，教授，博士生导师。 计算机学会高性能计算专委会委员，计算机学会青年科技论坛YOCSEF哈尔滨分论坛副主席，中国计算机学会会员，IEEE&IEEE Computer会员。主要从事网络计算、分布式系统和网络安全方面的研究。作为项目第一负责人主持5项国家级与省部级科研项目，包括国家863重点项目、国家自然科学基金、中国博士后科学基金委博士后基金特别资助项目等。作为项目第二负责人参加6项国家级与省部级科研项目，包括国家自然科学基金与863基金各一项，973与国防预研各两项。在《Science in China Series F-Information》、《IEICE Transaction》、《CIKM》、《IPDPS》、《中国科学》、《软件学报》、《计算机学报》、《计算机研究与发展》、《通信学报》等国内外刊物与会议发表论文40余篇，申请国家发明专利3项。', 0, 6, 'zwz');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(83, 'zyhit', '张宇', '/static/img/avatar.png', 'zhangyu@ir.hit.edu.cn', '', NULL, '副教授', '社会计算与信息检索研究中心', '张宇，博士，副教授，硕士生导师。中国计算机学会高级会员，中文信息学会会员。主要研究方向：信息检索、问答技术。负责国家自然科学基金2项，省部委项目1项，国际合作项目1项。同时参与完成多项国家自然科学基金重点及面上项目、国家863、省部委以及国际合作项目，在国内外期刊和会议上发表学术论文40余篇，出版教材1部，译著1部。', 0, 6, 'zy');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(84, 'zythit', '张英涛', '/static/img/avatar.png', 'yingtao@hit.edu.cn', '', NULL, '副教授', '计算机硬件基础教研室', '张英涛，博士，副教授,美国犹他州立大学访问学者。主要研究方向：模式识别、医学图像处理、计算机视觉。参与承担国家自然基金项目2项。负责黑龙江省青年基金项目1项、哈工大创新基金项目1项。发表教学及科研论文二十余篇，其中SCI检索国际期刊文章8篇。', 0, 6, 'zyt');
INSERT INTO `teacher` (`id`, `pw`, `name`, `photo`, `email`, `phone`, `office`, `pos`, `lab`, `intro`, `has`, `total`, `pinyin`) VALUES(85, 'zzhit', '张展', '/static/img/avatar.png', 'zz@ftcl.hit.edu.cn', '', NULL, '副教授', '容错与移动计算研究中心', '张展，博士，副教授。主要研究方向为计算机系统结构、可穿戴计算技术、容错计算技术，系统评测技术、移动计算等。', 0, 6, 'zz');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
