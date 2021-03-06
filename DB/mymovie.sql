USE [movie]
GO
/****** Object:  Table [dbo].[admins]    Script Date: 4/25/2018 5:54:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins](
	[id] [int] NOT NULL,
	[uname] [varchar](255) NULL,
	[pwd] [varchar](255) NULL,
	[realname] [varchar](255) NULL,
	[contact] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[article]    Script Date: 4/25/2018 5:54:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[article](
	[id] [int] NOT NULL,
	[title] [varchar](255) NULL,
	[cateid] [varchar](255) NULL,
	[image] [varchar](255) NULL,
	[contents] [text] NULL,
	[istop] [varchar](255) NULL,
	[isimage] [varchar](255) NULL,
	[addtime] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cate]    Script Date: 4/25/2018 5:54:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cate](
	[id] [int] NOT NULL,
	[catename] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[topic]    Script Date: 4/25/2018 5:54:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topic](
	[id] [int] NOT NULL,
	[usersid] [varchar](255) NULL,
	[articleid] [varchar](255) NULL,
	[contents] [text] NULL,
	[addtime] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 4/25/2018 5:54:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] NOT NULL,
	[uname] [varchar](255) NULL,
	[pwd] [varchar](255) NULL,
	[realname] [varchar](255) NULL,
	[sex] [varchar](255) NULL,
	[birthday] [varchar](255) NULL,
	[contact] [varchar](255) NULL,
	[email] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vote]    Script Date: 4/25/2018 5:54:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vote](
	[id] [int] NOT NULL,
	[title] [varchar](255) NULL,
	[num] [varchar](255) NULL,
	[addtime] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[admins] ([id], [uname], [pwd], [realname], [contact]) VALUES (1, N'admin', N'admin', N'管理员', N'123123')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (1, N'狂怒', N'1', N'upfile/1459147467.jpg', N'<p>主演：布拉德&middot;皮特 罗根&middot;勒曼 希亚&middot;拉博夫 乔&middot;博恩瑟 詹森&middot;艾萨克</p>\r\n\r\n<p>导演：大卫&middot;艾亚 年代：2014 地区：</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：英语发音 中英字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>狂怒(2014电影)</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">电影2014《狂怒》（Fury）情节设定在1945年二战硝烟即将消散之时，同盟国军队准备在欧洲战场发动最后一轮猛烈攻击。在以寡敌众、弹尽粮绝的不利条件下，身经百战的陆军中士Wardaddy（布拉德&bull;皮特饰演）指挥谢尔曼坦克的几名坦克手以及二等兵Norman（希安&middot;拉博夫饰演）深入纳粹德国的中心地带，执行一项死亡任务。主演布拉德&middot;皮特在看完剧本后就答应了导演大卫&middot;艾亚（David Ayer）的邀约，他表示自己被故事中浓浓的英雄主义情结所打动。希安&middot;拉博夫也感动于故事中的牺牲精神，并表示首次出演战争题材电影对自己也是一个挑战。&nbsp;</div>\r\n</div>\r\n', N'否', N'是', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (2, N'惊魂电影院之对号入座', N'2', N'upfile/1459147373.jpg', N'<p>主演：王晔 林晓凡 姚一奇 赵圆圆 蒋中伟 洪图</p>\r\n\r\n<p>导演：王鸣 年代：2015 地区：大陆</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：普通话发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>惊魂电影院之对号入座</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">《惊魂电影院之对号入座》电影讲述了男主人公张帅为了把万人迷希希追到手，跟朋友一起在电影院策划了一次恐怖刺激的观影经历。最终，张帅与希希终成眷属。</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (3, N'通灵之六世古宅', N'2', N'upfile/1459147309.jpg', N'<p>主演：徐娇 陆思宇</p>\r\n\r\n<p>导演：彭发 年代：2015 地区：香港</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：粤语发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>通灵之六世古宅</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">《通灵之六世古宅》是香港鬼王&rdquo;彭发执导的3D恐怖片，预计将在2015年上映。2014年10月末该片首次曝光了影片概念海报，海报以暗黑血红为主基调，一个满身阴郁看不清正脸的红衣少女被捆绑在布满蜡烛的阵图中央，看似一个诡谲异常的仪式，再联想到片名&ldquo;通灵&rdquo;二字，整部影片&ldquo;诡异阴森&rdquo;的恐怖感觉展露无疑，这也是彭发继《见鬼2》十年之后的大作。影片&ldquo;启灵&rdquo;版概念海报以暗黑血红为主基调，气氛十分阴森诡异，满地的蜡烛和奇怪的图案仿佛组成了某种阵法，而一个满身阴郁的红衣少女则被捆绑固定在整个阵法中央，整张脸被密集的发丝遮挡看不清面相，只露出一只意味不明的怪异眼珠，似乎透露着很多不为人知的诡怪，让人不寒而栗。而海报中&ldquo;十年见鬼，一朝通灵&rdquo;的恐怖宣言也让人联想不断，六世古宅、红衣少女、古怪仪式等一系列元素将影片有关&ldquo;通灵&rdquo;的故事基调呈现在了影迷面前。有业内人也评论《通灵》海报真正做到了恐怖的意象传达，让人看得后背发凉，而不仅仅是用血腥暴力等视觉冲击画面来刺激观众。</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (4, N'鬼驱人2015', N'2', N'upfile/1459147116.jpg', N'<p>主演：山姆&middot;洛克威尔 杰瑞德&middot;哈里斯 罗丝玛丽&middot;德薇特 萨克斯&middot;沙比诺 凯尔&middot;凯特莱特 尼可拉斯&middot;博朗 简&middot;亚当</p>\r\n\r\n<p>导演：吉尔&middot;克兰 年代：2015 地区：美国</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：英语发音 中英字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>鬼驱人2015</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">新版《鬼驱人》发布新剧照。讲述的是房产推销员Steve和妻子带着三个女儿搬进了郊区一栋房子，某天房子忽然开始闹鬼，小女儿更是被鬼抓走的故事。恐怖片爱好者的福音，《怪兽屋》导演吉尔&middot;克兰执导，《月球》男主角山姆&middot;洛克威尔主演，7月24日北美上映。</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (5, N'鬼吹灯·寻龙诀', N'2', N'upfile/1459147006.jpg', N'<p>主演：陈坤 黄渤 舒淇 杨颖 夏雨</p>\r\n\r\n<p>导演：乌尔善 年代：2015 地区：大陆</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：普通话发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>鬼吹灯&middot;寻龙诀(电影)</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">两个盗墓贼在刑警吴悠和杨小邪的眼前离奇惨死，一幅明月崖飞仙图引导他们随考古队寻找马楚太子古墓。驱魔龙族马家新一代传人马出尘和神秘青年唐昧在文物部门的授命下前去协助。他们穿越原始森林，经历种种诡异之事，最后却进入了一个战国时期的楚墓。 随行队员唐昧来历不明，隐匿在他们周围的算命先生袁瞎子和清风道人更是神秘莫测。战国楚墓中的壁画和九鼎让他们发现了历史上一些不为人知的秘密，原来一切都源于一个名叫西瑶的女人。一条时空隧道，将战国楚墓和马楚太子墓联系到一起。吴悠几人身上隐藏多年的秘密也在墓穴中得到了答案</div>\r\n</div>\r\n', N'是', N'是', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (6, N'新神奇四侠', N'3', N'upfile/1459146626.jpg', N'<p>主演：凯特&middot;玛拉 迈尔斯&middot;特勒 杰米&middot;贝尔 迈克尔&middot;B&middot;乔丹 托比&middot;凯贝尔</p>\r\n\r\n<p>导演：乔什&middot;特兰克 年代：2015 地区：美国</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：英语发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>新神奇四侠</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">理查德博士的科学梦想即将实现！他将飞往宇宙风暴的中心，揭开人类基因的密码。同行的还有，项目赞助人冯&middot;杜姆、宇航员本&middot;格林姆、博士的前女友苏&middot;斯通以及她弟弟约翰尼&middot;斯通。　　不料，飞船接近风暴中心时，由于计算错误，导致飞船被宇宙射线所吞没！大难逃生返回地球后，组员们的基因因宇宙射线的影响，发生了变异，他们具有了各个不同的超能力。 理查德、苏、约翰尼和本组成了&ldquo;神奇四侠&rdquo;，利用宇宙射线所赋予的超能力去打击黑暗势力、帮助世界。杜姆获得超能力后变身成为了&ldquo;毁灭钢眼博士&rdquo;，正在实施他的邪恶计划。神奇四侠出击了！</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (7, N'寄生兽真人版:完结篇', N'3', N'upfile/1459146342.jpg', N'<p>主演：染谷将太 深津絵里 阿部サダヲ 橋本愛 新井浩文</p>\r\n\r\n<p>导演：山崎贵 年代：2015 地区：日本</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：日语发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>寄生兽真人版:完结篇</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">对&ldquo;永恒0&rdquo;山崎隆导演，两部分组成的系列，这是流行的漫画岩明均&ldquo;寄生兽&rdquo;的续集的真人电影改编。Higashifukuyama市班高中生和泉伸一窝藏寄生虫Migi右手，建立一个大的网络组织寄生在我们身边广川市长。人性化的一面，其目的是寄生虫也湮灭，并已形成了对寄生虫特种部队已经准备突击的战术。在另一方面，奠定了人类的孩子，寄生虫田宫凉子的存在与人类去探索，新一高中泉在与Migi和谐的存在，已经发现了它的可能性，真一被打死母亲是不是让招的机会，寄生虫是仇恨。这样他们之前，最强的寄生虫转到出现。</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (8, N'蚁人', N'3', N'upfile/1459145950.jpg', N'<p>主演：伊万杰琳&middot;莉莉 保罗&middot;路德 帕特里克&middot;威尔森 迈克尔&middot;道格拉斯</p>\r\n\r\n<p>导演：佩顿&middot;里德 年代：2015 地区：美国</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：英语发音 中英字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>蚁人(2015电影)</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">《蚁人》（Ant-Man）改编自漫威经典超级英雄漫画，预订于2015年7月17日全球公映，将作为漫威电影宇宙第三阶段的首发作品面世。&ldquo;蚁人&rdquo;汉克&middot;皮姆由漫威经典搭档斯坦&middot;李和杰克&middot;科比以及拉里&middot;利伯 创造，于1962年初次在漫画中登场，作为一名出色的生物学家，他最新发现的一组亚原子微粒，做一项可以改变大小的创造试验。结果中途出了些问题，拿自己做实验的汉克，竟然能够变得跟蚂蚁一样小。随后，他又发明了一项工具，帮助他跟蚂蚁们进行交流，甚至控制它们为自己所用。</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (9, N'移动迷宫2:烧痕审判', N'3', N'upfile/1459144883.jpg', N'<p>主演：迪伦&middot;欧布莱恩 托马斯&middot;桑斯特 卡雅&middot;斯考达里奥 李基弘 吉安卡罗&middot;埃斯波西托</p>\r\n\r\n<p>导演：韦斯&middot;鲍尔 年代：2015 地区：美国</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：英语发音 中英字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>移动迷宫2:烧痕审判</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">《移动迷宫2》根据詹姆斯&middot;达什纳创作的一套类似《饥饿游戏》的小说改编，故事由三部分组成，分别是《移动迷宫》（The Maze Runner）、《烧痕审判》（The Scorch Trials）和《死亡解药》（The Death Cure）。故事的主角是一个叫做&ldquo;托马斯&rdquo;的男孩，在《移动迷宫》中托马斯要带领大家找到迷宫的出口，而在《烧痕审判》中他则要和伙伴们在两周时间内，穿过地球上被太阳耀斑炙烤的最灼热的焦土，到达北方的避难所。</div>\r\n</div>\r\n', N'是', N'是', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (10, N'小时代4:灵魂尽头', N'4', N'upfile/1459144174.jpg', N'<p>主演：杨幂 郭采洁 柯震东 陈学冬 郭碧婷 谢依霖 姜潮 李贤宰</p>\r\n\r\n<p>导演：郭敬明 年代：2015 地区：大陆</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：普通话发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>小时代4:灵魂尽头</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">《小时代4：灵魂尽头》改编自郭敬明小说《小时代》系列，与2013年12月与《小时代3：刺金时代》一起启动，为套拍电影。电影由郭敬明执导，由杨幂、郭采洁、柯震东、陈学冬、郭碧婷、谢依霖、姜潮、李贤宰、锦荣、任佑明、商侃、杜天皓等人主演 。《小时代4：灵魂尽头》预计将于2015年春节档上映。《小时代4：灵魂尽头》将延续《小时代3：刺金时代》的故事，进一步讲述顾源坐牢、顾里癌症以及这一群人的友谊方向是如何发展的。</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (11, N'新步步惊心', N'4', N'upfile/1459143541.jpg', N'<p>主演：陈意涵，窦骁，杨祐宁，宋伊人，于波</p>\r\n\r\n<p>导演：宋迪 年代：2015 地区：大陆</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：普通话发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>新步步惊心</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">\r\n<ul style=\"list-style-type:none\">\r\n\t<li><span style=\"font-size:14px\">情感一直不如意的都市白领张小文（陈意涵 饰），因一次意外的时光逆转，穿越到古代变成了清朝的格格马尔泰若曦，张小文现代人的思维与生活习惯与身处古代的格格身份形成了巨大的反差，并引起了皇室的疑心。同时，聪明机智、阳光活泼的她更是得到了两位阿哥四爷胤禛（杨祐宁 饰）和十四爷胤禵（窦骁 饰）的倾爱，两人对若曦展开了风格迥然不同的爱的攻势，一个是唯我独尊、深情内敛的霸道总裁，一个是有求必应默默为爱守候的柔情骑士，上演了一段揪心、惊心又暖心的旷世三角恋情，在现在与未来之间，张小文究竟会情归何处&hellip;为您提供新步步惊心在线观看,新步步惊心西瓜影音高清,新步步惊心电影</span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (12, N'台北夜蒲团团转', N'4', N'upfile/1459143118.jpg', N'<p>主演：关楚耀 王思佳 郑家纯</p>\r\n\r\n<p>导演：钱国伟 年代：2015 地区：香港</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：粤语发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>台北夜蒲团团转</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">《台北夜蒲团团转》以台湾的夜店为主题，被誉为是台版的《喜爱夜蒲》。片中集结了许维恩、鸡排妹、王思佳、陶嫚曼（陶妍霖）、小Call、Vita、丫头等女星，而她们皆在片中有性感演出。台湾艺人鸡排妹和王思佳因拍摄网络剧《光环之后》产生摩擦而成为死对头，双方多次隔空交战，互不相让。原以为不会再有交集的两个人，没想到又同时收到电影《台北夜蒲团团转》的邀约，将在新片中再度合作。</div>\r\n</div>\r\n', N'否', N'是', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (13, N'有一个地方只有我们知道', N'4', N'upfile/1459143118.jpg', N'<p>主演：徐静蕾 吴亦凡 张超 王丽坤 热依扎</p>\r\n\r\n<p>导演：徐静蕾 年代：2015 地区：大陆</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：普通话发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>有一个地方只有我们知道</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">由徐静蕾执导、吴亦凡主演的电影《有一个地方只有我们知道》讲述小白领金颖正在经历人生中最失败时刻：男友悔婚，深爱的奶奶去世，金颖的内心断然崩溃。伤心的她误打误撞来到了欧洲某城市，想用逃避来抚平内心的创痛。在这个城市她结识了彭克，而一段奶奶尘封的爱情也在她面前展开。该片目前拍摄中，定档播出为2015年2月14日的情人节</div>\r\n</div>\r\n', N'否', N'是', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (14, N'华丽上班族', N'5', N'upfile/1459143043.jpg', N'<p>主演：张艾嘉 周润发 汤唯 陈奕迅 郎月婷 王紫逸 张兆</p>\r\n\r\n<p>导演：杜琪峰 年代：2015 地区：香港</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：粤语发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>华丽上班族</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">《华丽上班族》是由杜琪峰导演，张艾嘉编剧兼主演，汤唯、陈奕迅和周润发等人领携主演的都市职场爱情喜剧，还有黄金幕后罗大佑、张叔平、陈辉阳、林夕、郑兆强等鼎力加盟，为影片的制作&ldquo;保驾护航&rdquo;。 清晨的香港，空气中都弥漫着紧张的气息。就在这样忙碌的清晨，一个刚步入社会的年轻人，李想，略显青涩地加入到步履匆忙的上班族的行列。他揣着满腔的热情跟对未来的希冀，以为只要努力勤奋工作定能一展拳脚，殊不知，一场关乎利益的职场博弈正等待着他&hellip;&hellip; 华丽丽的职场戏，星光熠熠的演员阵容，现实的故事题材，让我们共同期待《华丽上班族》的上映！</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (15, N'恶棍天使', N'5', N'upfile/1459142893.jpg', N'<p>主演：邓超 孙俪 代乐乐 梁超 杨新鸣</p>\r\n\r\n<p>导演：俞白眉 邓超 年代：2015 地区：大陆</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：普通话发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>恶棍天使</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">改编自同名话剧，讲述了莫非里和查小刀两个性格迥异的人狭路相逢发生的故事因为一起车祸，高智商低情商的学霸女查小刀（孙俪 饰）意外相遇专职替人讨债的恶棍莫非里（邓超 饰）。被莫非里狠狠敲诈一笔的查小刀意志消沉，回想自己与母亲断绝关系，工作被老板开除便愈加绝望。偶然间查小刀看到专治心理疑难杂症折耳根神医（梁超 饰）的广告，走投无路的她决定去神医处求救，没想到在诊所再次遭遇恶棍莫非里。惊慌失措的查小刀害怕见到恶棍莫非里，却没想到被急于转移视线的神医当做&ldquo;药&rdquo;介绍给了患有严重失眠症的莫非里。神医也告诉查小刀，莫非里也是能治好她心理问题的&ldquo;药&rdquo;，打消疑虑的查小刀跃跃欲试。而也因此，性格迥异的二人成为拍档。两人一个极端嚣张跋扈，一个极端懦弱胆小，在讨债的过程里发生了一连串紧张刺激又亦笑亦泪的故事。 &nbsp;</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (16, N'万万没想到：西游篇', N'5', N'upfile/1459142740.jpg', N'<p>主演：白客 杨子姗 陈柏霖 马天宇 刘循子墨 披拉&middot;尼迪裴善官 叫兽易小星</p>\r\n\r\n<p>导演：易小星 年代：2015 地区：大陆</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：普通话发音</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>万万没想到：西游篇</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">屌丝小妖王大锤，他生来便与常人不同，两耳尖尖，又有些小法力，总是自诩本地妖王。但让他万万没想到的是，在遇到唐僧师徒四人组后，他的命运发生了逆转；而对于唐僧师徒四人组来说，遇见王大锤也是无比郁闷的第八十二难。</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (17, N'人在囧途3之港囧', N'5', N'upfile/1459140357.jpg', N'<p>主演：徐峥 赵薇 包贝尔</p>\r\n\r\n<p>导演：徐峥 年代：2015 地区：大陆</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：普通话发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>人在囧途3之港囧</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">人在囧途第三集杀往香港 徐峥王宝强黄渤继续《泰囧》续集《人在囧途3之港囧》在度来临这次讲述是徐来和小舅子抱着各自不同目的来到香港，展开了一段阴差阳错、啼笑 皆非的旅程，最终两人获得友谊并懂得了人生真谛。 届时原班人马杀来香港拍外景，徐峥王宝强黄渤囧到香港。</div>\r\n</div>\r\n', N'是', N'是', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (18, N'霹雳囧花', N'6', N'upfile/1459140079.jpg', N'<p>主演：周秀娜 卢颂之 余晓彤 徐天佑</p>\r\n\r\n<p>导演：卓韵芝 年代：2016 地区：大陆</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：普通话发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>霹雳囧花</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">阿宝（周秀娜 饰），阿娇（卢颂之 饰）和TT（余晓彤 饰）各自面对着她们的深渊，一时之间找不到解决问题的方法，人生陷入了停顿和困境之中。一笔飞来横财吸引三人踏上了远赴马来西亚的旅途，她们以为，在那里等待着她们的会是充满了幸福和快乐的生活，以及享用不尽的荣华富贵。 　　然而，令三人没有想到的是，从她们踏上旅途的那一刻起，即落入了神秘女子诸葛（童冰玉 饰）一手策划的圈套之中，三人不仅没能享福，甚至还落入了贩卖妇女的人贩手中。兔子急了也要人，可不要小看这三个看似孱弱的女人，当她们尽情使用女人的手段来对抗专门欺辱压迫女人的罪犯们之时，可没有几个人能够与她们匹敌哦。</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (19, N'全境封锁：特工起源', N'6', N'upfile/1459139919.jpg', N'<p>主演：Matt Lynch Sasha Andreev Amanda Day</p>\r\n\r\n<p>导演：德文&middot;格雷厄姆 年代：2016 地区：美国</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：英语发音 中文字幕</h5>\r\n</div>\r\n\r\n<ol>\r\n\t<li><em>剧情：</em>育碧为《全境封锁》拍摄一部真人系列短片《特工起源》介绍游戏的世界观。 《全境封锁：特工起源》共分为四个部分，由四个不同的团队制作。讲述了四名休眠特工在纽约遭受病毒危机后苏醒并聚在一起最终解救一起人质危机。四部短片主题各不相同但又有联系，在最后一部里汇聚。特效非常棒，枪战，动作，爆炸，追击一个都不少。 &nbsp;</li>\r\n</ol>\r\n', N'否', N'否', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (20, N'图书馆战争2-最后的任务', N'6', N'upfile/1459139737.jpg', N'<div class=\"pits\">\r\n<h6><strong>图书馆战争2-最后的任务</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">曾被改编成漫画、动画的有川浩的轻小说《图书馆战争》时隔一年再次登上电影的舞台，新作《图书馆战争-最后的任务-》将于明年10月在日本全国公映，今年将首次登上NHK红白歌合战的舞台的冈田准一即将再次返回荧幕，而女主角也仍旧为荣仓奈奈出演。1459139737.jpg</div>\r\n', N'否', N'否', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (21, N'伦敦陷落', N'6', N'upfile/1459138978.jpg', N'<p>伦敦陷落全集,伦敦陷落在线观看.2013年有两部恐怖分子攻打白宫题材电影上映，结果投资偏小、上映更早的《奥林匹斯的陷落》获得更好的商业收益。近日焦点影业CEO宣布，该片续集定名《伦敦陷落》将于2015年10月2日上映，扮演特工的杰拉德&middot;巴特勒确定回归，并担任制片人。影片编剧为卡特琳&middot;贝内迪特、 克雷格东&middot;罗森贝格，导演还没选定，前一集的导演为安东尼&middot;福奎阿，但暂时没确定再执导。由杰拉德&middot;巴特勒、艾伦&middot;艾克哈特、摩根&middot;弗里曼联袂主演的动作惊悚大片《白宫陷落》（又译《奥林匹斯陷落》Olympus Has Fallen），启动了续集的拍摄计划&mdash;&mdash;三大主演将携手回归，出演一部名为《伦敦陷落》（London Has Fallen）的灾难片。显然，这部电影是把轰炸对象瞄准了伦敦。《伦敦陷落》的故事发生在伦敦，讲述英国首相神秘去世后，包括美国总统在内的西方国家领导人去参加葬礼，再次遭遇恐怖威胁。此时只有三个人能阻止这一切，艾伦&middot;艾克哈特饰演的美国总统、杰拉德&middot;巴特勒扮演的贴身特工和一个谁都不信任的军情六处特工。除了艾克哈特与巴特勒之外，《奥林匹斯的陷落》中饰演众议院议长的摩根&middot;弗里曼也将回归出演这部续集。</p>\r\n', N'是', N'是', N'2016-03-24')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (22, N'英雄连', N'1', N'upfile/1459147532.jpg', N'<p>主演：汤姆&middot;塞兹摩尔 维尼&middot;琼斯 尼尔&middot;麦克唐纳</p>\r\n\r\n<p>导演：唐&middot;迈克尔&middot;保罗 年代：2013 地区：欧美</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：英语发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>英雄连</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">英雄连在二战最后一波进攻德军的战斗里，一群美国士兵组成的连队在战役中迷失在了敌后战线，不过他们却发现一个秘密，那就是希特勒正在打造一个超级炸弹。随后他们开始执行押回掌管武器计划德国科学家的绝密任务，一场紧张刺激的敌后潜入作战就此进行。</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-28')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (23, N'白虎(美版)/白色虎式', N'1', N'upfile/1459147590.jpg', N'<p>主演：Gerasim Arkhipov Aleksandr Bakhov</p>\r\n\r\n<p>导演：未知 年代：2012 地区：</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：俄罗斯 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>白虎(美版)/白色虎式</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">白虎(美版)/白色虎式二战眼看行将结束，激烈的持久战使苏联军队和德国军队都日渐疲惫。随着进攻力度逐渐猛烈，苏军惊恐地发现，敌方派出了一种势不可挡的巨型坦克&mdash;&mdash;&ldquo;白虎&rdquo;。&ldquo;白虎&rdquo;屡屡从战场的硝烟中幽幽出现，将苏军的坦克轰炸得机毁人亡，然后转瞬消失。最可怕的是，没人能证实&ldquo;白虎&rdquo;确实存在，但也没人敢否认。直到有一天，苏军指挥官决定建造一辆超级坦克&mdash;&mdash;T-34坦克的变种。坦克操作团队中有一个神奇的人物&mdash;&mdash;他曾在操纵坦克时，被一场轰炸烧得体无完肤。出人意料的是，他不仅活了下来，而且几乎完全痊愈，回到了坦克驾驶室内。他不记得自己的名字，也不记得过去发生的一切，却拥有了一种特异功能&mdash;&mdash;理解&ldquo;坦克的语言&rdquo;。他坚信神秘的德军坦克&ldquo;白虎&rdquo;确实存在，并下决心要摧毁它，因为它是战争、暴行和流血的象征。猎捕奇兽的旅程就此开始。</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-28')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (24, N'锅盖头2:战火之地', N'1', N'upfile/1459147675.jpg', N'<p>主演：杰西&middot;加西亚 博基姆&middot;伍德拜因 埃塞&middot;莫拉雷斯</p>\r\n\r\n<p>导演：唐&middot;迈克尔&middot;保罗 年代：2014 地区：</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：英语发音 中英字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>锅盖头2:战火之地</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">身经百战的克里斯下士（Josh Kelly 饰）晋升为小队的指挥官，该小队的下一个任务是给位于塔利班控制边缘地区的前线哨所提供补给。当车队行经敌对的赫尔德曼省时，他们遇到了寻求帮助的海豹突击队，双方将合作完成一项重要任务&mdash;&mdash;护送一名因反抗塔利班而闻名的妇女逃离该国...　　没有坦克装甲车和空中支援，克里斯下士和他的团队必须鼓足全部勇气，拼尽所有弹药，横穿这个被战争蹂躏的国家，直至护送该妇女到安全地点。</div>\r\n</div>\r\n', N'是', N'是', N'2016-03-28')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (25, N'归来', N'7', N'upfile/1459147771.jpg', N'<p>主演：陈道明 巩俐 闫妮 秦海璐 张嘉译 刘佩琦 祖峰</p>\r\n\r\n<p>导演：张艺谋 年代：2013 地区：大陆</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：普通话发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>归来(张艺谋电影)</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">归来张艺谋电影该片讲述的是：陆焉识与妻子冯婉喻多年未见，好不容易有了机会，两人却失之交臂，等他再次归来时，患病的冯婉喻却已认不出他，繁华落尽，他们怀着各自强烈而执着的爱，在永远的等待中一起慢慢变老。片中人物陆焉识与冯婉喻，均是严歌苓2011年出版的小说《陆犯焉识》里的人物。</div>\r\n</div>\r\n', N'是', N'是', N'2016-03-28')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (26, N'小姐诱心', N'7', N'upfile/1459147838.jpg', N'<p>主演：庄思敏 何佩瑜 姜皓文 刘心悠 周柏豪</p>\r\n\r\n<p>导演：黄柏基 年代：2014 地区：香港</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：普通话发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>小姐诱心</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">《小姐诱心》由刘心悠与周柏豪主演，并邀得多位美女包括庄思敏、何佩瑜 (Jeana)、Jessica.C、许雅婷(Kabby)、倪晨曦(Elva)、黄美琪以及大埔Lulu等演出，齐齐挑战破格爱情题材，玩尽绝密性事！宝(刘心悠　饰)和雄(周柏豪　饰)新婚一年，本应过著最甜美的蜜月期，偏偏在性生活方面却总是不协调，夫妇各自寻找解决方法，却引来更多的矛盾和对立。诗咏(庄思敏　饰)和国邦(姜皓文饰)结婚多年，既是商界娱乐界名人亦是城中公认的模范夫妻。但在鲜为人知的背後，国邦其实是性上瘾患者！诗咏为国邦的问题烦恼同时，竟又杀出一个年轻的追求者&hellip;&hellip;　　两对夫妻，两段截然不同的故事，遇上的却是你我他都会遇上的问题。 &nbsp;</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-28')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (27, N'烈日灼心', N'7', N'upfile/1459147892.jpg', N'<p>主演：邓超 王珞丹 段奕宏 郭涛 高虎</p>\r\n\r\n<p>导演：曹保平 年代：2014 地区：大陆</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：普通话发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>烈日灼心</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">三个谜样的男人，杨自道、辛小丰、陈比觉，正值盛年，拼命工作，低调做人。他们不娶妻，不交友，回避闹市区的繁华，在偏僻处，合力抚养一个叫&ldquo;尾巴&rdquo;的美丽女弃婴。率性、狡黠的漂亮姑娘伊谷夏对的哥杨自道一见钟情，却遭到拒绝，的哥的种种表现，令人疑窦丛生；阳刚正义的协警辛小丰，习惯性地把燃烧的烟头用自己的左手捻灭，他是刑警伊谷春最得力的助手，也是伊谷春从没放弃过的怀疑对象；看守鱼排的陈比觉，常与两人会合于城郊小屋，尽享三个老爸一个娃的亲情之乐&hellip;&hellip;这一切的背后，还有一双热衷于偷窥、记录的房东的阴暗眼睛。重重谜雾揭开，三人竟是该市轰动一时的水库灭门案的凶嫌&hellip;&hellip; &nbsp;</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-28')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (28, N'王朝的女人·杨贵妃', N'7', N'upfile/1459147945.jpg', N'<p>主演：范冰冰 黎明 王力宏 小栗旬 温朱万</p>\r\n\r\n<p>导演：郭在容 田壮壮 年代：2015 地区：大陆</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：普通话发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>王朝的女人&middot;杨贵妃</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">电影《杨贵妃》是由中、日、韩三国一线影人合拍，投资高达2000万美金的&ldquo;爱情战争史诗钜制&rdquo;，讲述从杨贵妃和唐明皇的爱情所衍生出的一系列战争与宫廷阴谋的故事，影片中包含了爱情、动作、战争、宫廷阴谋等多种元素。 片方为还原大唐盛世，将斥资过亿重金打造盛唐全景图，再现金戈铁马、恢弘壮阔的历史画卷。杨贵妃(范冰冰电影版)全集,杨贵妃(范冰冰电影版)百度影音在线观看.(其实我具备贵族的所有气质，现在就差钱了)《杨贵妃》的记者发布会，范冰冰一身桃粉色高开叉长裙性感亮相，现场获赠韩国服饰，并与韩国导演郭在容、王力宏等畅谈影片。据悉，《杨贵妃》将由范冰冰、王力宏、温州万等中韩两国演员出演，将于11月15日开机，明年1月杀青</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-28')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (29, N'斗地主传奇之双王之王', N'5', N'upfile/1459156061.jpg', N'<p>主演：温超 周凯文 武凌 吴樾</p>\r\n\r\n<p>导演：殷博 年代：2016 地区：大陆</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：普通话发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>斗地主传奇之双王之王</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">讲述了在以斗地主牌技论高低的江湖中，终日游手好闲的混混阿生在遇见&ldquo;百乐门&rdquo;掌门陈尽后发生的一系列跌宕起伏的故事。</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-28')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (30, N'检察官外传', N'5', N'upfile/1459156299.jpg', N'<p>主演：黄政民 姜东元 李成民 朴圣雄 申素率</p>\r\n\r\n<p>导演：李日炯 年代：2016 地区：韩国</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：韩语发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>检察官外传</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">投资发行公司Showbox透露，韩国演员黄政民将主演李日炯导演的新片《检察官外传》，该片是由《群盗：民乱的时代》的&ldquo;月狂&rdquo;制作公司和&ldquo;男子汉电影&rdquo;公司共同制作。 　　《检察官外传》讲述的是背负着杀人犯罪名冤枉入狱的检察官，聚集了一群有才能的犯罪者，对黑社会组织进行复仇的故事。黄政民在片中饰演男主人公。 　　今年年末黄政民主演的尹济均导演新片《国际市场》即将上映，而黄政民目前正在拍摄罗宏镇导演的《谷城》，之后还将主演李石勋导演的《喜马拉雅》，之后才会拍摄《检察官外传》。2014年末到2015年的日程都排满了，也印证了黄政民在韩国电影界的超高人气。 　　《检察官外传》预计会在2015年上映。</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-28')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (31, N'德云三逗士', N'5', N'upfile/1459156386.jpg', N'<p>主演：郭德纲 于谦</p>\r\n\r\n<p>导演：张莫闲 年代：2016 地区：大陆</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：普通话发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>德云三逗士</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">本片以搞笑、活泼的手法讲述一群&ldquo;贱男&rdquo;在大都市生活的种种糗事。每集都会为&ldquo;贱男&ldquo;配备不同的性感都市美女，用写实手法让大家在莞尔一笑同时产生共鸣,提升&ldquo;话题感&rdquo;。以时下时髦的生活方式,以及族群为标本,让大家在搞笑同时,也崇尚这种自由自在的生活态度,以及对人生的&ldquo;囧&rdquo;刻也能轻松的心情对待</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-28')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (32, N'出柜第四格', N'5', N'upfile/1459159453.jpg', N'<p>主演：帕克&middot;扬 伊万&middot;托德 Jon Gabrus 考德&middot;欧威尔斯特利特</p>\r\n\r\n<p>导演：Andrew Nackman 年代：2016 地区：美国</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：英语发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>出柜第四格</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">亚当是普通工薪阶层的人生活在美国的一个小镇。他是一个汽车修理工,他将自己的空闲时间和他亲密的兄弟,克里斯,尼克和Ortu,与他everything-poker,视频游戏,投篮,醉酒和会议的女性。</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-28')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (33, N'道歉大师', N'5', N'upfile/1459159642.jpg', N'<p>主演：阿部隆史 井上真央 冈田将生 尾野真千子</p>\r\n\r\n<p>导演：水田伸生 年代：2013 地区：日本</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：日语发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>道歉大师</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">《道歉大师》又叫《谢罪大王》,《谢罪王》百度影音免费在线收看阿部隆史，在此次的影片中饰演的主人公黑岛让从事着一种虚构的职业&mdash;&mdash;&ldquo;道歉师&rdquo;。 他运用道歉技术解决着小到朋友吵架、大到国家存亡的危机的事件，更有运用比下跪更胜一筹的终极道歉手段拯救日本的情节，是一部爆笑至极的社会讽刺喜剧。影片有六个故事组成，六个故事的主人公分别是：不能好好道歉的归国子女仓持典子（井上真央饰），因为被控性骚扰而陷入工作困境的内衣公司职员沼田卓也（冈田将生饰），因为儿子的伤害事件而代为道歉的大牌演员南部哲郎（高桥克实饰），向离婚后很久没见的女儿道歉的超一流国际律师箕轮正臣（竹野内丰饰），因为误让某王国的皇太子做临时演员而卷入国际事件的电影制作人和田耕作（荒川良良饰），以及主人公黑岛自己。这六个故事中的人物、时间、场景不时互相穿插，由&ldquo;解决&rdquo;联系每个故事来。这其中第一个故事的主人公仓持典子，在麻烦得到解决后，被黑岛的行为感动，成为了黑岛的助手 &nbsp;</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-28')
INSERT [dbo].[article] ([id], [title], [cateid], [image], [contents], [istop], [isimage], [addtime]) VALUES (34, N'六福喜事', N'5', N'upfile/1459159801.jpg', N'<p>主演：黄百鸣 曾志伟 吴君如 郑中基</p>\r\n\r\n<p>导演：谷德昭 年代：2014 地区：香港</p>\r\n\r\n<div class=\"land\">\r\n<h5>语言：普通话发音 中文字幕</h5>\r\n\r\n<div class=\"pits\">\r\n<h6><strong>六福喜事(电影)</strong>-剧情介绍：</h6>\r\n</div>\r\n\r\n<div class=\"des\">电影《六福喜事》讲述了雷鸣（黄百鸣 饰）和杨亚伟（曾志伟 饰）这对&ldquo;老对头&rdquo;都盼望抱孙子，并督促儿子儿媳、侄子侄媳生育，期间产生了一系列爆笑故事。 富商雷鸣得知死对头杨伟将要迎来一个男孙，怒不可遏，要挟侄孙雷带子与侄孙媳妇雪儿即刻传宗接代，更重金礼聘星级月嫂宫三严格监管，起初令二人生活遭逢巨变，但却间接重拾了夫妻间久违了的激情和浪漫，展开了活色生香的&ldquo;生育的进击&rdquo;。雷鸣确诊患有老年痴呆，为了圆其心愿，雪儿假装大肚，并向有孕在身的黛黛和秀波夫妇求助，欲借其子瞒过叔公。不料想生产当日，杨伟出现，众人精心编造的弥天大谎眼看就要拆穿&middot;&middot;&middot;&middot;&middot;&middot; &nbsp;</div>\r\n</div>\r\n', N'否', N'否', N'2016-03-28')
INSERT [dbo].[cate] ([id], [catename]) VALUES (1, N'战争片')
INSERT [dbo].[cate] ([id], [catename]) VALUES (2, N'恐怖片')
INSERT [dbo].[cate] ([id], [catename]) VALUES (3, N'科幻片')
INSERT [dbo].[cate] ([id], [catename]) VALUES (4, N'爱情片')
INSERT [dbo].[cate] ([id], [catename]) VALUES (5, N'喜剧片')
INSERT [dbo].[cate] ([id], [catename]) VALUES (6, N'动作片')
INSERT [dbo].[cate] ([id], [catename]) VALUES (7, N'剧情片')
INSERT [dbo].[topic] ([id], [usersid], [articleid], [contents], [addtime]) VALUES (3, N'1', N'18', N'有看过这部电影的没？最近想看下', N'2016-03-24')
INSERT [dbo].[topic] ([id], [usersid], [articleid], [contents], [addtime]) VALUES (4, N'2', N'6', N'很喜欢看，有一起交流下的没？', N'2016-03-24')
INSERT [dbo].[users] ([id], [uname], [pwd], [realname], [sex], [birthday], [contact], [email]) VALUES (1, N'123123', N'123123', N'123123', N'0', N'2016-03-24', N'123123', N'123123')
INSERT [dbo].[users] ([id], [uname], [pwd], [realname], [sex], [birthday], [contact], [email]) VALUES (2, N'111', N'111', N'1111', N'1', N'2016-03-24', N'111', N'111')
INSERT [dbo].[vote] ([id], [title], [num], [addtime]) VALUES (1, N'新闻更新很快', N'0', N'2016-03-24')
INSERT [dbo].[vote] ([id], [title], [num], [addtime]) VALUES (2, N'时效性很好', N'1', N'2016-03-24')
INSERT [dbo].[vote] ([id], [title], [num], [addtime]) VALUES (3, N'是否应该一日三更呢？', N'1', N'2016-03-24')
ALTER TABLE [dbo].[admins] ADD  DEFAULT (NULL) FOR [uname]
GO
ALTER TABLE [dbo].[admins] ADD  DEFAULT (NULL) FOR [pwd]
GO
ALTER TABLE [dbo].[admins] ADD  DEFAULT (NULL) FOR [realname]
GO
ALTER TABLE [dbo].[admins] ADD  DEFAULT (NULL) FOR [contact]
GO
ALTER TABLE [dbo].[article] ADD  DEFAULT (NULL) FOR [title]
GO
ALTER TABLE [dbo].[article] ADD  DEFAULT (NULL) FOR [cateid]
GO
ALTER TABLE [dbo].[article] ADD  DEFAULT (NULL) FOR [image]
GO
ALTER TABLE [dbo].[article] ADD  DEFAULT (NULL) FOR [istop]
GO
ALTER TABLE [dbo].[article] ADD  DEFAULT (NULL) FOR [isimage]
GO
ALTER TABLE [dbo].[article] ADD  DEFAULT (NULL) FOR [addtime]
GO
ALTER TABLE [dbo].[cate] ADD  DEFAULT (NULL) FOR [catename]
GO
ALTER TABLE [dbo].[topic] ADD  DEFAULT (NULL) FOR [usersid]
GO
ALTER TABLE [dbo].[topic] ADD  DEFAULT (NULL) FOR [articleid]
GO
ALTER TABLE [dbo].[topic] ADD  DEFAULT (NULL) FOR [addtime]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [uname]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [pwd]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [realname]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [sex]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [birthday]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [contact]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[vote] ADD  DEFAULT (NULL) FOR [title]
GO
ALTER TABLE [dbo].[vote] ADD  DEFAULT (NULL) FOR [num]
GO
ALTER TABLE [dbo].[vote] ADD  DEFAULT (NULL) FOR [addtime]
GO
