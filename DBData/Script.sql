USE [SmallHouse]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Area](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](80) NULL,
	[fuzeren] [char](10) NULL,
	[jianchengdate] [char](20) NULL,
	[lianxiren] [char](10) NULL,
	[lianxitel] [char](20) NULL,
	[yidongtel] [char](20) NULL,
	[zhandiarea] [char](20) NULL,
	[daoluarea] [char](20) NULL,
	[dcheweiarea] [char](20) NULL,
	[jianzhuarea] [char](20) NULL,
	[gaocengnum] [char](20) NULL,
	[chekuarea] [char](20) NULL,
	[gonggarea] [char](20) NULL,
	[duocengnum] [char](20) NULL,
	[cheweinum] [char](20) NULL,
	[luhuaarea] [char](20) NULL,
	[weizhi] [char](90) NULL,
	[beizhu] [char](90) NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AreaKK]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AreaKK](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](50) NULL,
	[AllName] [char](50) NULL,
	[note] [char](80) NULL,
	[MainPerson] [char](50) NULL,
	[contactPerson] [char](50) NULL,
	[phone] [char](50) NULL,
	[Memo] [char](50) NULL,
	[typeid] [int] NULL,
 CONSTRAINT [PK_AreaPhoto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bm_bm]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bm_bm](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tableName] [char](20) NULL,
	[Name] [char](30) NULL,
	[f1] [char](10) NULL,
	[f2] [char](10) NULL,
 CONSTRAINT [PK_bm_bm] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bm_Cell]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bm_Cell](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](40) NULL,
 CONSTRAINT [PK_bm_Cell] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BM_Config]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BM_Config](
	[bmConId] [int] IDENTITY(1,1) NOT NULL,
	[bmConfig] [char](20) NULL,
	[arBm] [int] NULL,
	[bmConMemo] [char](80) NULL,
 CONSTRAINT [PK_BM_Config] PRIMARY KEY CLUSTERED 
(
	[bmConId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bm_Indoor]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bm_Indoor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](40) NULL,
 CONSTRAINT [PK_Bm_Indoor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bm_Months]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bm_Months](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](40) NULL,
 CONSTRAINT [PK_bm_Months] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BM_PavilionType]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BM_PavilionType](
	[typeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](20) NULL,
 CONSTRAINT [PK_BM_Estate] PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bm_PlaceType]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bm_PlaceType](
	[typeid] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](20) NULL,
 CONSTRAINT [PK_bm_PlaceType] PRIMARY KEY CLUSTERED 
(
	[typeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bm_Property]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bm_Property](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](40) NULL,
 CONSTRAINT [PK_bm_Property] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BM_Pursuant]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BM_Pursuant](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](40) NULL,
 CONSTRAINT [PK_BM_Pursuant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bm_SLevel]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bm_SLevel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](10) NULL,
 CONSTRAINT [PK_bm_SLevel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BM_Sunny]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BM_Sunny](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](15) NULL,
 CONSTRAINT [PK_BM_Sunny] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bm_YesNO]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bm_YesNO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](10) NULL,
 CONSTRAINT [PK_bm_YesNO] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Carbarn]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Carbarn](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[theNO] [char](20) NULL,
	[carNO] [char](50) NULL,
	[carType] [char](50) NULL,
	[Area] [char](50) NULL,
	[Place] [char](20) NULL,
	[Master] [char](15) NULL,
	[Phone] [char](20) NULL,
	[Memo] [char](150) NULL,
 CONSTRAINT [PK_Carbarn] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[House]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[House](
	[hoID] [int] IDENTITY(1,1) NOT NULL,
	[paID] [int] NULL,
	[cellID] [int] NULL,
	[hoFloor] [varchar](50) NULL,
	[hoRoom] [varchar](50) NULL,
	[sunnyId] [int] NULL,
	[indoorID] [int] NULL,
	[hoArchArce] [char](15) NULL,
	[hoUseArce] [char](15) NULL,
	[CLIENT_NAME] [char](20) NULL,
	[CLIENT_CARD] [char](18) NULL,
	[CLIENT_ACCOUNT_NUMBER] [char](50) NULL,
	[COMPANY_NAME] [char](50) NULL,
	[CLIENT_PHONE] [char](50) NULL,
	[CLIENT_ADDRESS] [char](100) NULL,
	[USE_DATE] [datetime] NULL,
	[Memo] [char](150) NULL,
 CONSTRAINT [PK_House] PRIMARY KEY CLUSTERED 
(
	[hoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ldcw]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ldcw](
	[id] [int] NOT NULL,
	[location] [char](20) NOT NULL,
 CONSTRAINT [PK_ldcw] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lvhua]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lvhua](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mingcheng] [char](50) NOT NULL,
	[jiaoshuijiange] [char](10) NULL,
	[shifoujiaoshui] [char](10) NULL,
	[shifeijiange] [char](10) NULL,
	[shifoushifei] [char](10) NULL,
	[fuzeren] [char](20) NULL,
	[beizhu] [char](50) NULL,
 CONSTRAINT [PK_lvhua] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[members]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[members](
	[member_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [char](20) NULL,
	[member_login] [char](15) NULL,
	[member_password] [char](15) NULL,
	[email] [char](30) NULL,
	[country_id] [int] NULL,
	[state_id] [char](10) NULL,
	[city] [char](30) NULL,
	[zip] [char](10) NULL,
	[address1] [char](50) NULL,
	[address2] [char](50) NULL,
	[address3] [char](50) NULL,
	[phone_day] [char](20) NULL,
	[phone_evn] [char](20) NULL,
	[fax] [char](20) NULL,
	[date_created] [datetime] NULL,
	[ip_insert] [char](50) NULL,
	[ip_update] [char](50) NULL,
	[last_login_date] [datetime] NULL,
	[security_level_id] [smallint] NULL,
	[memo] [char](40) NULL,
 CONSTRAINT [PK_members] PRIMARY KEY CLUSTERED 
(
	[member_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MeterReading]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MeterReading](
	[mrID] [int] IDENTITY(1,1) NOT NULL,
	[taID] [int] NULL,
	[paID] [int] NULL,
	[hoID] [int] NULL,
	[mrYear] [int] NULL,
	[mrMonth2] [int] NULL,
	[mrMonth1] [int] NULL,
	[mrPreceding] [numeric](8, 2) NULL,
	[mrCurrent] [numeric](8, 2) NULL,
	[mrNumber] [numeric](8, 2) NULL,
	[arBm] [int] NULL,
	[mrOperDate] [datetime] NULL,
	[opBm] [int] NULL,
	[mrMemo] [char](80) NULL,
 CONSTRAINT [PK_MeterReading] PRIMARY KEY CLUSTERED 
(
	[mrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pavilion]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pavilion](
	[paID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](20) NULL,
	[Layer] [char](10) NULL,
	[High] [char](20) NULL,
	[area] [char](20) NULL,
	[buildDate] [char](15) NULL,
	[Memo] [char](80) NULL,
	[typeId] [int] NULL,
	[sunnyId] [int] NULL,
 CONSTRAINT [PK_Pavilion] PRIMARY KEY CLUSTERED 
(
	[paID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaviPhoto]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaviPhoto](
	[ppSymbol] [nvarchar](3) NULL,
	[ppBm] [int] NOT NULL,
	[paBm] [int] NULL,
	[ppName] [nvarchar](20) NULL,
	[ppImage] [image] NULL,
	[arBm] [int] NULL,
	[ppMemo] [nvarchar](80) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phone]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Phone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[phone] [char](30) NULL,
	[paID] [int] NULL,
	[hoID] [int] NULL,
	[Memo] [char](150) NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[shebei_mingxi]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[shebei_mingxi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mingcheng] [char](50) NOT NULL,
	[guige] [char](50) NULL,
	[shuliang] [int] NULL,
	[changshang] [char](50) NULL,
	[riqi] [char](20) NULL,
	[zhouqi] [char](20) NULL,
	[beizhu] [char](50) NULL,
 CONSTRAINT [PK_shebei_mingxi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[shebei_weixiu]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[shebei_weixiu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mingcheng] [char](50) NOT NULL,
	[yuanyin] [char](50) NULL,
	[danwei] [char](50) NULL,
	[fuzeren] [char](20) NULL,
	[riqi] [char](10) NULL,
	[fukuanfou] [char](10) NULL,
	[beizhu] [char](50) NULL,
 CONSTRAINT [PK_shebei_weixiu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[zhuhu]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zhuhu](
	[bianhao] [char](20) NOT NULL,
	[xingming] [char](50) NOT NULL,
	[xingbie] [char](10) NOT NULL,
	[danwei] [char](100) NULL,
	[shenfenzhenghao] [char](50) NOT NULL,
	[dianhua] [char](20) NULL,
	[shouji] [char](20) NULL,
	[youjian] [char](50) NULL,
	[jianlizhe] [char](20) NULL,
	[zhaopian] [char](50) NULL,
	[leixing] [char](20) NULL,
	[shifouruzhu] [char](10) NOT NULL CONSTRAINT [DF_zhuhu_shifouruzhu]  DEFAULT ('否'),
 CONSTRAINT [PK_zhuhu] PRIMARY KEY CLUSTERED 
(
	[bianhao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[zhuhuchuru]    Script Date: 2019/4/19 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zhuhuchuru](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[wuyebianhao] [char](20) NULL,
	[wuyemingcheng] [char](100) NULL,
	[yezhubianhao] [char](20) NULL,
	[yezhuxingming] [char](50) NULL,
	[xingbie] [char](10) NOT NULL,
	[dianhua] [char](20) NULL,
	[danwei] [char](100) NULL,
	[qianruriqi] [char](20) NULL,
	[qianrufangshi] [char](20) NULL,
	[qianrujingbanren] [char](20) NULL,
	[qianchuriqi] [char](20) NULL,
	[qianchujingbanren] [char](20) NULL,
	[yufujieyu] [char](20) NULL,
	[shifouqianchu] [char](10) NULL CONSTRAINT [DF_zhuhuchuru_shifouqianchu]  DEFAULT ('否'),
	[beizhu] [char](100) NULL,
 CONSTRAINT [PK_zhuhuchuru] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([id], [Name], [fuzeren], [jianchengdate], [lianxiren], [lianxitel], [yidongtel], [zhandiarea], [daoluarea], [dcheweiarea], [jianzhuarea], [gaocengnum], [chekuarea], [gonggarea], [duocengnum], [cheweinum], [luhuaarea], [weizhi], [beizhu]) VALUES (1, N'桂花园                                                                          ', N'王甍      ', N'2004年5月24日       ', N'wangmeng  ', N'82391703            ', N'13681578614         ', N'200亩               ', N'121平方公里         ', N'3000平方公里        ', N'198亩               ', N'12                  ', N'23平方公里          ', N'122平方米           ', N'22                  ', N'1200个              ', N'222平方公里         ', N'金港大道98号                                                                              ', N'                                                                                          ')
INSERT [dbo].[Area] ([id], [Name], [fuzeren], [jianchengdate], [lianxiren], [lianxitel], [yidongtel], [zhandiarea], [daoluarea], [dcheweiarea], [jianzhuarea], [gaocengnum], [chekuarea], [gonggarea], [duocengnum], [cheweinum], [luhuaarea], [weizhi], [beizhu]) VALUES (3, N'碧桂园                                                                          ', N'汤        ', N'2019年              ', N'ER        ', N'156                 ', N'135                 ', N'                    ', N'                    ', N'                    ', N'123                 ', N'45                  ', N'                    ', N'12345               ', N'                    ', N'                    ', N'                    ', N'                                                                                          ', N'                                                                                          ')
INSERT [dbo].[Area] ([id], [Name], [fuzeren], [jianchengdate], [lianxiren], [lianxitel], [yidongtel], [zhandiarea], [daoluarea], [dcheweiarea], [jianzhuarea], [gaocengnum], [chekuarea], [gonggarea], [duocengnum], [cheweinum], [luhuaarea], [weizhi], [beizhu]) VALUES (6, N'万达                                                                            ', N'王健林    ', N'                    ', N'          ', N'                    ', N'                    ', N'                    ', N'                    ', N'                    ', N'                    ', N'                    ', N'                    ', N'                    ', N'                    ', N'                    ', N'                    ', N'                                                                                          ', N'                                                                                          ')
SET IDENTITY_INSERT [dbo].[Area] OFF
SET IDENTITY_INSERT [dbo].[AreaKK] ON 

INSERT [dbo].[AreaKK] ([id], [Name], [AllName], [note], [MainPerson], [contactPerson], [phone], [Memo], [typeid]) VALUES (5, N'桂花园卫生站                                      ', N'桂花园卫生站                                      ', N'B超                                                                             ', N'c                                                 ', N'c                                                 ', N'88970987                                          ', NULL, 6)
INSERT [dbo].[AreaKK] ([id], [Name], [AllName], [note], [MainPerson], [contactPerson], [phone], [Memo], [typeid]) VALUES (6, N'桂花园小学                                        ', N'桂花园小学                                        ', N'教室                                                                            ', N'd                                                 ', N'd                                                 ', N'98980989                                          ', NULL, 4)
INSERT [dbo].[AreaKK] ([id], [Name], [AllName], [note], [MainPerson], [contactPerson], [phone], [Memo], [typeid]) VALUES (8, N'桂花园停车场                                      ', N'桂花园停车场                                      ', N'停车场                                                                          ', N'g                                                 ', N'g                                                 ', N'67678987                                          ', N'g                                                 ', 10)
INSERT [dbo].[AreaKK] ([id], [Name], [AllName], [note], [MainPerson], [contactPerson], [phone], [Memo], [typeid]) VALUES (9, N'开心网球场                                        ', N'开心网球场                                        ', N'开心网球场                                                                      ', N'h                                                 ', N'h                                                 ', N'98765467                                          ', N'h                                                 ', 7)
INSERT [dbo].[AreaKK] ([id], [Name], [AllName], [note], [MainPerson], [contactPerson], [phone], [Memo], [typeid]) VALUES (10, N'桂花园幼儿园                                      ', N'桂花园幼儿园                                      ', N'桂花园幼儿园                                                                    ', N'j                                                 ', N'k                                                 ', N'76543224                                          ', N'j                                                 ', 8)
INSERT [dbo].[AreaKK] ([id], [Name], [AllName], [note], [MainPerson], [contactPerson], [phone], [Memo], [typeid]) VALUES (11, N'桂花园饭店                                        ', N'桂花园饭店                                        ', N'桂花园饭店                                                                      ', N'k                                                 ', N'k                                                 ', N'87467545                                          ', N'k                                                 ', 9)
INSERT [dbo].[AreaKK] ([id], [Name], [AllName], [note], [MainPerson], [contactPerson], [phone], [Memo], [typeid]) VALUES (12, N'工商银行桂花园支行                                ', N'工商银行桂花园支行                                ', N'工商银行桂花园支行                                                              ', N'l                                                 ', N'l                                                 ', N'98756457                                          ', N'l                                                 ', 11)
INSERT [dbo].[AreaKK] ([id], [Name], [AllName], [note], [MainPerson], [contactPerson], [phone], [Memo], [typeid]) VALUES (13, N'桂花园游乐场                                      ', N'桂花园游乐场                                      ', N'桂花园游乐场                                                                    ', N'm                                                 ', N'm                                                 ', N'98764567                                          ', N'm                                                 ', 12)
INSERT [dbo].[AreaKK] ([id], [Name], [AllName], [note], [MainPerson], [contactPerson], [phone], [Memo], [typeid]) VALUES (14, N'万家游泳池                                        ', N'万家游泳池                                        ', N'万家游泳池                                                                      ', N'n                                                 ', N'n                                                 ', N'87645808                                          ', N'n                                                 ', 13)
INSERT [dbo].[AreaKK] ([id], [Name], [AllName], [note], [MainPerson], [contactPerson], [phone], [Memo], [typeid]) VALUES (15, N'德福小吃店                                        ', N'德福小吃店                                        ', N'德福小吃店                                                                      ', N'o                                                 ', N'o                                                 ', N'98989898                                          ', N'o                                                 ', 9)
INSERT [dbo].[AreaKK] ([id], [Name], [AllName], [note], [MainPerson], [contactPerson], [phone], [Memo], [typeid]) VALUES (20, N'小小活动中心                                      ', NULL, NULL, N'小指                                              ', NULL, NULL, NULL, 2)
INSERT [dbo].[AreaKK] ([id], [Name], [AllName], [note], [MainPerson], [contactPerson], [phone], [Memo], [typeid]) VALUES (21, N'健身中心                                          ', NULL, NULL, NULL, NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[AreaKK] OFF
SET IDENTITY_INSERT [dbo].[bm_bm] ON 

INSERT [dbo].[bm_bm] ([id], [tableName], [Name], [f1], [f2]) VALUES (1, N'bm_cell             ', N'单元号                        ', N'id        ', N'Name      ')
INSERT [dbo].[bm_bm] ([id], [tableName], [Name], [f1], [f2]) VALUES (2, N'Bm_Indoor           ', N'房屋类型                      ', N'id        ', N'Name      ')
INSERT [dbo].[bm_bm] ([id], [tableName], [Name], [f1], [f2]) VALUES (4, N'BM_PavilionType     ', N'楼宇类别                      ', N'typeID    ', N'Name      ')
INSERT [dbo].[bm_bm] ([id], [tableName], [Name], [f1], [f2]) VALUES (5, N'bm_PlaceType        ', N'设施类型                      ', N'typeid    ', N'Name      ')
INSERT [dbo].[bm_bm] ([id], [tableName], [Name], [f1], [f2]) VALUES (6, N'BM_Sunny            ', N'朝向                          ', N'id        ', N'name      ')
SET IDENTITY_INSERT [dbo].[bm_bm] OFF
SET IDENTITY_INSERT [dbo].[bm_Cell] ON 

INSERT [dbo].[bm_Cell] ([ID], [Name]) VALUES (1, N'1单元                                   ')
INSERT [dbo].[bm_Cell] ([ID], [Name]) VALUES (2, N'2单元                                   ')
INSERT [dbo].[bm_Cell] ([ID], [Name]) VALUES (3, N'3单元                                   ')
INSERT [dbo].[bm_Cell] ([ID], [Name]) VALUES (4, N'4单元                                   ')
SET IDENTITY_INSERT [dbo].[bm_Cell] OFF
SET IDENTITY_INSERT [dbo].[BM_Config] ON 

INSERT [dbo].[BM_Config] ([bmConId], [bmConfig], [arBm], [bmConMemo]) VALUES (2, N'复式                ', 5, N'alskj                                                                           ')
INSERT [dbo].[BM_Config] ([bmConId], [bmConfig], [arBm], [bmConMemo]) VALUES (3, N'高层                ', 5, N'ddd                                                                             ')
INSERT [dbo].[BM_Config] ([bmConId], [bmConfig], [arBm], [bmConMemo]) VALUES (4, N'三房两厅            ', 5, NULL)
SET IDENTITY_INSERT [dbo].[BM_Config] OFF
SET IDENTITY_INSERT [dbo].[Bm_Indoor] ON 

INSERT [dbo].[Bm_Indoor] ([id], [Name]) VALUES (1, N'3室1厅                                  ')
INSERT [dbo].[Bm_Indoor] ([id], [Name]) VALUES (2, N'2室1厅                                  ')
INSERT [dbo].[Bm_Indoor] ([id], [Name]) VALUES (3, N'1室1厅                                  ')
INSERT [dbo].[Bm_Indoor] ([id], [Name]) VALUES (4, N'3室2厅                                  ')
SET IDENTITY_INSERT [dbo].[Bm_Indoor] OFF
SET IDENTITY_INSERT [dbo].[bm_Months] ON 

INSERT [dbo].[bm_Months] ([Id], [Name]) VALUES (1, N'1                                       ')
INSERT [dbo].[bm_Months] ([Id], [Name]) VALUES (2, N'2                                       ')
INSERT [dbo].[bm_Months] ([Id], [Name]) VALUES (3, N'3                                       ')
INSERT [dbo].[bm_Months] ([Id], [Name]) VALUES (4, N'4                                       ')
INSERT [dbo].[bm_Months] ([Id], [Name]) VALUES (5, N'5                                       ')
INSERT [dbo].[bm_Months] ([Id], [Name]) VALUES (6, N'6                                       ')
INSERT [dbo].[bm_Months] ([Id], [Name]) VALUES (7, N'7                                       ')
INSERT [dbo].[bm_Months] ([Id], [Name]) VALUES (8, N'8                                       ')
INSERT [dbo].[bm_Months] ([Id], [Name]) VALUES (9, N'9                                       ')
INSERT [dbo].[bm_Months] ([Id], [Name]) VALUES (10, N'10                                      ')
INSERT [dbo].[bm_Months] ([Id], [Name]) VALUES (11, N'11                                      ')
INSERT [dbo].[bm_Months] ([Id], [Name]) VALUES (12, N'12                                      ')
SET IDENTITY_INSERT [dbo].[bm_Months] OFF
SET IDENTITY_INSERT [dbo].[BM_PavilionType] ON 

INSERT [dbo].[BM_PavilionType] ([typeID], [Name]) VALUES (1, N'高层                ')
INSERT [dbo].[BM_PavilionType] ([typeID], [Name]) VALUES (2, N'别墅                ')
INSERT [dbo].[BM_PavilionType] ([typeID], [Name]) VALUES (3, N'写字楼              ')
INSERT [dbo].[BM_PavilionType] ([typeID], [Name]) VALUES (4, N'仓库                ')
INSERT [dbo].[BM_PavilionType] ([typeID], [Name]) VALUES (5, N'厂房                ')
INSERT [dbo].[BM_PavilionType] ([typeID], [Name]) VALUES (6, N'停车库              ')
INSERT [dbo].[BM_PavilionType] ([typeID], [Name]) VALUES (7, N'平房                ')
INSERT [dbo].[BM_PavilionType] ([typeID], [Name]) VALUES (8, N'小高层              ')
INSERT [dbo].[BM_PavilionType] ([typeID], [Name]) VALUES (9, N'其他                ')
SET IDENTITY_INSERT [dbo].[BM_PavilionType] OFF
SET IDENTITY_INSERT [dbo].[bm_PlaceType] ON 

INSERT [dbo].[bm_PlaceType] ([typeid], [Name]) VALUES (1, N'其他                ')
INSERT [dbo].[bm_PlaceType] ([typeid], [Name]) VALUES (2, N'运动场所            ')
INSERT [dbo].[bm_PlaceType] ([typeid], [Name]) VALUES (3, N'商场                ')
INSERT [dbo].[bm_PlaceType] ([typeid], [Name]) VALUES (4, N'小学                ')
INSERT [dbo].[bm_PlaceType] ([typeid], [Name]) VALUES (5, N'中学                ')
INSERT [dbo].[bm_PlaceType] ([typeid], [Name]) VALUES (6, N'医院                ')
INSERT [dbo].[bm_PlaceType] ([typeid], [Name]) VALUES (7, N'网球场              ')
INSERT [dbo].[bm_PlaceType] ([typeid], [Name]) VALUES (8, N'幼儿园              ')
INSERT [dbo].[bm_PlaceType] ([typeid], [Name]) VALUES (9, N'餐厅                ')
INSERT [dbo].[bm_PlaceType] ([typeid], [Name]) VALUES (10, N'停车场              ')
INSERT [dbo].[bm_PlaceType] ([typeid], [Name]) VALUES (11, N'金融机构            ')
INSERT [dbo].[bm_PlaceType] ([typeid], [Name]) VALUES (12, N'游乐场              ')
INSERT [dbo].[bm_PlaceType] ([typeid], [Name]) VALUES (13, N'游泳池              ')
SET IDENTITY_INSERT [dbo].[bm_PlaceType] OFF
SET IDENTITY_INSERT [dbo].[bm_Property] ON 

INSERT [dbo].[bm_Property] ([Id], [Name]) VALUES (1, N'月费用                                  ')
INSERT [dbo].[bm_Property] ([Id], [Name]) VALUES (2, N'年费用                                  ')
INSERT [dbo].[bm_Property] ([Id], [Name]) VALUES (3, N'一次性费用                              ')
SET IDENTITY_INSERT [dbo].[bm_Property] OFF
SET IDENTITY_INSERT [dbo].[BM_Pursuant] ON 

INSERT [dbo].[BM_Pursuant] ([Id], [Name]) VALUES (1, N'无                                      ')
INSERT [dbo].[BM_Pursuant] ([Id], [Name]) VALUES (2, N'建筑面积                                ')
INSERT [dbo].[BM_Pursuant] ([Id], [Name]) VALUES (3, N'使用面积                                ')
SET IDENTITY_INSERT [dbo].[BM_Pursuant] OFF
SET IDENTITY_INSERT [dbo].[bm_SLevel] ON 

INSERT [dbo].[bm_SLevel] ([id], [Name]) VALUES (1, N'用户      ')
INSERT [dbo].[bm_SLevel] ([id], [Name]) VALUES (2, N'管理员    ')
SET IDENTITY_INSERT [dbo].[bm_SLevel] OFF
SET IDENTITY_INSERT [dbo].[BM_Sunny] ON 

INSERT [dbo].[BM_Sunny] ([id], [Name]) VALUES (1, N'东西           ')
INSERT [dbo].[BM_Sunny] ([id], [Name]) VALUES (2, N'南北           ')
INSERT [dbo].[BM_Sunny] ([id], [Name]) VALUES (3, N'西南           ')
INSERT [dbo].[BM_Sunny] ([id], [Name]) VALUES (4, N'西北           ')
SET IDENTITY_INSERT [dbo].[BM_Sunny] OFF
SET IDENTITY_INSERT [dbo].[bm_YesNO] ON 

INSERT [dbo].[bm_YesNO] ([id], [Name]) VALUES (1, N'否        ')
INSERT [dbo].[bm_YesNO] ([id], [Name]) VALUES (2, N'是        ')
SET IDENTITY_INSERT [dbo].[bm_YesNO] OFF
SET IDENTITY_INSERT [dbo].[Carbarn] ON 

INSERT [dbo].[Carbarn] ([id], [theNO], [carNO], [carType], [Area], [Place], [Master], [Phone], [Memo]) VALUES (7, N'8                   ', N'京A R9988                                         ', N'夏利                                              ', NULL, NULL, N'小指           ', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Carbarn] OFF
SET IDENTITY_INSERT [dbo].[House] ON 

INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (16, 6, 1, N'1', N'2-1-101', 1, 1, N'233.00         ', NULL, N'张三                ', N'310110650421309   ', N'                                                  ', N'林业大学                                          ', N'01082380526                                       ', N'                                                                                                    ', CAST(N'2019-04-16 15:18:13.970' AS DateTime), N'                                                                                                                                                      ')
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (17, 6, 2, N'2', N'2-2-101', 2, 2, N'234.00         ', NULL, N'谢小敏              ', NULL, NULL, NULL, NULL, NULL, NULL, N'sadsfas                                                                                                                                               ')
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (18, 6, 4, N'2', N'2-4-103', 1, 3, N'234.00         ', NULL, N'刘思江              ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (22, 5, 2, N'1', N'1-2-101', 3, 1, N'125            ', N'118            ', N'上官燕              ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (25, 9, 3, N'22', N'3-3-201', 2, 2, N'112.00         ', N'22.00          ', N'张海天              ', N'0988988           ', N'3333                                              ', N'北京无线电有限公司                                ', N'0775－4552748                                     ', N'天坛路98号                                                                                          ', CAST(N'2019-04-16 15:18:13.970' AS DateTime), N'从北京调回贵港                                                                                                                                        ')
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (31, 10, 4, NULL, N'401', 4, 1, NULL, NULL, N'444                 ', N'44                ', N'                                                  ', N'北京第一机床厂                                    ', N'44                                                ', N'                                                                                                    ', CAST(N'2019-04-16 15:18:13.970' AS DateTime), N'                                                                                                                                                      ')
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (32, 9, 1, NULL, N'3-9-10', 1, 1, NULL, NULL, N'                    ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (33, 5, 2, N'2', N'1-2-210', 1, 2, N'90             ', N'80             ', N'萧萧                ', N'110109878987672   ', N'12323                                             ', N'银行                                              ', N'12323545                                          ', NULL, CAST(N'2019-04-16 15:18:13.970' AS DateTime), N'5112424                                                                                                                                               ')
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (34, 5, 4, N'4', N'1-4-401', 1, 1, N'102            ', N'90             ', N'析西                ', N'111111111111111   ', NULL, N'所第                                              ', NULL, NULL, CAST(N'2019-04-16 15:18:13.970' AS DateTime), NULL)
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (35, 5, 4, N'4', N'1-4-402', 1, 1, N'100            ', N'90             ', N'克勤                ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (36, 5, 3, N'3', N'1-3-305', 1, 1, N'120            ', N'100            ', N'漏名                ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (37, 5, 2, N'2', N'1-2-106', 1, 1, N'156            ', N'143            ', N'文简                ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (39, 5, 3, N'3', N'1-3-304', 1, 3, N'78             ', N'70             ', N'霏霏                ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (40, 5, 1, N'1', N'1-1-103', 1, 3, N'111            ', N'100            ', N'晶格                ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (41, 5, 2, N'2', N'1-2-204', 3, 4, N'111            ', N'100            ', N'李萧童              ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (43, 5, 4, N'4', N'1-4-412', 4, 2, N'80             ', N'70             ', N'贝贝                ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (44, 5, 2, N'2', N'1-2-202', 2, 4, N'220            ', N'200            ', N'尚姗姗              ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (45, 6, 1, N'2', N'2-2', 1, 1, N'222            ', N'221            ', N'尚姗姗              ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (46, 5, 1, NULL, N'5-5', 1, 1, NULL, NULL, N'李萧童              ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (48, 5, 1, NULL, N'1-7-101', 1, 1, NULL, NULL, N'                    ', N'123456789098765432', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[House] ([hoID], [paID], [cellID], [hoFloor], [hoRoom], [sunnyId], [indoorID], [hoArchArce], [hoUseArce], [CLIENT_NAME], [CLIENT_CARD], [CLIENT_ACCOUNT_NUMBER], [COMPANY_NAME], [CLIENT_PHONE], [CLIENT_ADDRESS], [USE_DATE], [Memo]) VALUES (49, 5, 1, N'1', N'1-1-103', 1, 1, N'165            ', N'158            ', N'                    ', NULL, NULL, NULL, N'99800987                                          ', NULL, CAST(N'2019-04-16 15:18:13.970' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[House] OFF
INSERT [dbo].[ldcw] ([id], [location]) VALUES (1, N'南1                 ')
INSERT [dbo].[ldcw] ([id], [location]) VALUES (2, N'南2                 ')
INSERT [dbo].[ldcw] ([id], [location]) VALUES (3, N'南3                 ')
INSERT [dbo].[ldcw] ([id], [location]) VALUES (4, N'南4                 ')
INSERT [dbo].[ldcw] ([id], [location]) VALUES (5, N'南5                 ')
INSERT [dbo].[ldcw] ([id], [location]) VALUES (6, N'南6                 ')
INSERT [dbo].[ldcw] ([id], [location]) VALUES (7, N'北1                 ')
INSERT [dbo].[ldcw] ([id], [location]) VALUES (8, N'北2                 ')
INSERT [dbo].[ldcw] ([id], [location]) VALUES (9, N'北3                 ')
INSERT [dbo].[ldcw] ([id], [location]) VALUES (10, N'北4                 ')
INSERT [dbo].[ldcw] ([id], [location]) VALUES (11, N'北5                 ')
INSERT [dbo].[ldcw] ([id], [location]) VALUES (12, N'北6                 ')
SET IDENTITY_INSERT [dbo].[lvhua] ON 

INSERT [dbo].[lvhua] ([id], [mingcheng], [jiaoshuijiange], [shifoujiaoshui], [shifeijiange], [shifoushifei], [fuzeren], [beizhu]) VALUES (1, N'月季                                              ', N'一星期    ', N'未知      ', N'一个月    ', N'否        ', N'呵呵呵呵呵          ', N'呵呵呵呵呵                                        ')
INSERT [dbo].[lvhua] ([id], [mingcheng], [jiaoshuijiange], [shifoujiaoshui], [shifeijiange], [shifoushifei], [fuzeren], [beizhu]) VALUES (2, N'矮牵牛                                            ', N'三天      ', N'否        ', N'一周      ', N'否        ', N'小李                ', N'长势不错                                          ')
INSERT [dbo].[lvhua] ([id], [mingcheng], [jiaoshuijiange], [shifoujiaoshui], [shifeijiange], [shifoushifei], [fuzeren], [beizhu]) VALUES (3, N'菊花                                              ', N'一周      ', N'是        ', N'半个月    ', N'是        ', N'小李                ', N'长势一般                                          ')
INSERT [dbo].[lvhua] ([id], [mingcheng], [jiaoshuijiange], [shifoujiaoshui], [shifeijiange], [shifoushifei], [fuzeren], [beizhu]) VALUES (6, N'ttttt                                             ', N'半月      ', N'是        ', N'半个月    ', N'否        ', N'小王                ', N'小王                                              ')
INSERT [dbo].[lvhua] ([id], [mingcheng], [jiaoshuijiange], [shifoujiaoshui], [shifeijiange], [shifoushifei], [fuzeren], [beizhu]) VALUES (7, N'rrrrrr                                            ', N'一周      ', N'是        ', N'半月      ', N'未知      ', N'小王                ', N'小王                                              ')
INSERT [dbo].[lvhua] ([id], [mingcheng], [jiaoshuijiange], [shifoujiaoshui], [shifeijiange], [shifoushifei], [fuzeren], [beizhu]) VALUES (8, N'hhhhh                                             ', N'半月      ', N'未知      ', N'半月      ', N'未知      ', N'小王                ', N'小王                                              ')
INSERT [dbo].[lvhua] ([id], [mingcheng], [jiaoshuijiange], [shifoujiaoshui], [shifeijiange], [shifoushifei], [fuzeren], [beizhu]) VALUES (9, N'kkkkkk                                            ', N'半月      ', N'否        ', N'半月      ', N'否        ', N'小王                ', N'小王                                              ')
INSERT [dbo].[lvhua] ([id], [mingcheng], [jiaoshuijiange], [shifoujiaoshui], [shifeijiange], [shifoushifei], [fuzeren], [beizhu]) VALUES (10, N'aaaaa                                             ', N'两周      ', N'否        ', N'一个月    ', N'否        ', N'小王                ', N'小王                                              ')
INSERT [dbo].[lvhua] ([id], [mingcheng], [jiaoshuijiange], [shifoujiaoshui], [shifeijiange], [shifoushifei], [fuzeren], [beizhu]) VALUES (11, N'aa                                                ', N'一星期    ', N'否        ', N'一个月    ', N'否        ', N'小王                ', N'小王                                              ')
INSERT [dbo].[lvhua] ([id], [mingcheng], [jiaoshuijiange], [shifoujiaoshui], [shifeijiange], [shifoushifei], [fuzeren], [beizhu]) VALUES (12, N'黄洋                                              ', N'一周      ', N'是        ', N'一月      ', N'否        ', N'小军                ', N'培养得很好!                                       ')
SET IDENTITY_INSERT [dbo].[lvhua] OFF
SET IDENTITY_INSERT [dbo].[members] ON 

INSERT [dbo].[members] ([member_id], [name], [member_login], [member_password], [email], [country_id], [state_id], [city], [zip], [address1], [address2], [address3], [phone_day], [phone_evn], [fax], [date_created], [ip_insert], [ip_update], [last_login_date], [security_level_id], [memo]) VALUES (7, N'张祥                ', N'小小           ', N'小小           ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'住户                                    ')
INSERT [dbo].[members] ([member_id], [name], [member_login], [member_password], [email], [country_id], [state_id], [city], [zip], [address1], [address2], [address3], [phone_day], [phone_evn], [fax], [date_created], [ip_insert], [ip_update], [last_login_date], [security_level_id], [memo]) VALUES (8, N'雷蒙                ', N'gigi           ', N'gigi           ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'住户                                    ')
INSERT [dbo].[members] ([member_id], [name], [member_login], [member_password], [email], [country_id], [state_id], [city], [zip], [address1], [address2], [address3], [phone_day], [phone_evn], [fax], [date_created], [ip_insert], [ip_update], [last_login_date], [security_level_id], [memo]) VALUES (9, N'吉斯                ', N'jeese          ', N'jeese          ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'vip住户                                 ')
INSERT [dbo].[members] ([member_id], [name], [member_login], [member_password], [email], [country_id], [state_id], [city], [zip], [address1], [address2], [address3], [phone_day], [phone_evn], [fax], [date_created], [ip_insert], [ip_update], [last_login_date], [security_level_id], [memo]) VALUES (10, N'甜甜                ', N'titi           ', N'titi           ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'住户                                    ')
INSERT [dbo].[members] ([member_id], [name], [member_login], [member_password], [email], [country_id], [state_id], [city], [zip], [address1], [address2], [address3], [phone_day], [phone_evn], [fax], [date_created], [ip_insert], [ip_update], [last_login_date], [security_level_id], [memo]) VALUES (12, N'萧平                ', N'kawayi         ', N'0              ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'住户                                    ')
INSERT [dbo].[members] ([member_id], [name], [member_login], [member_password], [email], [country_id], [state_id], [city], [zip], [address1], [address2], [address3], [phone_day], [phone_evn], [fax], [date_created], [ip_insert], [ip_update], [last_login_date], [security_level_id], [memo]) VALUES (13, N'admin               ', N'admin          ', N'123456         ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, N'管理员                                  ')
SET IDENTITY_INSERT [dbo].[members] OFF
SET IDENTITY_INSERT [dbo].[MeterReading] ON 

INSERT [dbo].[MeterReading] ([mrID], [taID], [paID], [hoID], [mrYear], [mrMonth2], [mrMonth1], [mrPreceding], [mrCurrent], [mrNumber], [arBm], [mrOperDate], [opBm], [mrMemo]) VALUES (20, 7, 5, 44, 2003, 4, 3, CAST(3.00 AS Numeric(8, 2)), CAST(4.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(8, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[MeterReading] ([mrID], [taID], [paID], [hoID], [mrYear], [mrMonth2], [mrMonth1], [mrPreceding], [mrCurrent], [mrNumber], [arBm], [mrOperDate], [opBm], [mrMemo]) VALUES (21, 7, 5, 46, 2004, 7, 6, CAST(3.00 AS Numeric(8, 2)), CAST(7.00 AS Numeric(8, 2)), CAST(4.00 AS Numeric(8, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[MeterReading] ([mrID], [taID], [paID], [hoID], [mrYear], [mrMonth2], [mrMonth1], [mrPreceding], [mrCurrent], [mrNumber], [arBm], [mrOperDate], [opBm], [mrMemo]) VALUES (22, 7, 5, 22, 2003, 11, 10, CAST(4.00 AS Numeric(8, 2)), CAST(5.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(8, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[MeterReading] ([mrID], [taID], [paID], [hoID], [mrYear], [mrMonth2], [mrMonth1], [mrPreceding], [mrCurrent], [mrNumber], [arBm], [mrOperDate], [opBm], [mrMemo]) VALUES (23, 5, 6, 30, 2003, 10, 9, CAST(89.00 AS Numeric(8, 2)), CAST(102.00 AS Numeric(8, 2)), CAST(13.00 AS Numeric(8, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[MeterReading] ([mrID], [taID], [paID], [hoID], [mrYear], [mrMonth2], [mrMonth1], [mrPreceding], [mrCurrent], [mrNumber], [arBm], [mrOperDate], [opBm], [mrMemo]) VALUES (24, 5, 13, NULL, 2003, 10, 9, CAST(66.00 AS Numeric(8, 2)), CAST(77.00 AS Numeric(8, 2)), CAST(11.00 AS Numeric(8, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[MeterReading] ([mrID], [taID], [paID], [hoID], [mrYear], [mrMonth2], [mrMonth1], [mrPreceding], [mrCurrent], [mrNumber], [arBm], [mrOperDate], [opBm], [mrMemo]) VALUES (25, 5, 10, 31, 2003, 8, 7, CAST(66.00 AS Numeric(8, 2)), CAST(77.00 AS Numeric(8, 2)), CAST(11.00 AS Numeric(8, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[MeterReading] ([mrID], [taID], [paID], [hoID], [mrYear], [mrMonth2], [mrMonth1], [mrPreceding], [mrCurrent], [mrNumber], [arBm], [mrOperDate], [opBm], [mrMemo]) VALUES (26, 7, 9, 32, 2003, 7, 6, CAST(45.00 AS Numeric(8, 2)), CAST(67.00 AS Numeric(8, 2)), CAST(22.00 AS Numeric(8, 2)), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MeterReading] OFF
SET IDENTITY_INSERT [dbo].[Pavilion] ON 

INSERT [dbo].[Pavilion] ([paID], [Name], [Layer], [High], [area], [buildDate], [Memo], [typeId], [sunnyId]) VALUES (5, N'1号楼               ', N'18        ', N'60                  ', N'1200.00             ', N'2019-4-15      ', NULL, 1, 1)
INSERT [dbo].[Pavilion] ([paID], [Name], [Layer], [High], [area], [buildDate], [Memo], [typeId], [sunnyId]) VALUES (6, N'2号楼               ', N'8         ', N'98                  ', N'398.00              ', N'2019-4-15      ', NULL, 1, 1)
INSERT [dbo].[Pavilion] ([paID], [Name], [Layer], [High], [area], [buildDate], [Memo], [typeId], [sunnyId]) VALUES (9, N'3号楼               ', N'12        ', N'334                 ', N'222.00              ', N'2019-4-15      ', NULL, 1, 1)
INSERT [dbo].[Pavilion] ([paID], [Name], [Layer], [High], [area], [buildDate], [Memo], [typeId], [sunnyId]) VALUES (10, N'4号楼               ', N'8         ', N'234                 ', N'123                 ', N'2019-4-15      ', NULL, 4, 3)
INSERT [dbo].[Pavilion] ([paID], [Name], [Layer], [High], [area], [buildDate], [Memo], [typeId], [sunnyId]) VALUES (13, N'5号楼               ', N'10        ', N'109                 ', N'873                 ', N'2019-4-15      ', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Pavilion] OFF
SET IDENTITY_INSERT [dbo].[Phone] ON 

INSERT [dbo].[Phone] ([id], [phone], [paID], [hoID], [Memo]) VALUES (1, N'01082391703                   ', 5, 22, N'固定电话                                                                                                                                              ')
INSERT [dbo].[Phone] ([id], [phone], [paID], [hoID], [Memo]) VALUES (2, N'1381578614                    ', 5, 22, N'我的移动电话                                                                                                                                          ')
INSERT [dbo].[Phone] ([id], [phone], [paID], [hoID], [Memo]) VALUES (4, N'99990000                      ', 5, 34, NULL)
INSERT [dbo].[Phone] ([id], [phone], [paID], [hoID], [Memo]) VALUES (5, N'55554444                      ', 5, 43, NULL)
INSERT [dbo].[Phone] ([id], [phone], [paID], [hoID], [Memo]) VALUES (6, N'66565554                      ', 9, 32, NULL)
INSERT [dbo].[Phone] ([id], [phone], [paID], [hoID], [Memo]) VALUES (7, N'6879808                       ', 5, 35, NULL)
INSERT [dbo].[Phone] ([id], [phone], [paID], [hoID], [Memo]) VALUES (8, N'88887777                      ', 5, 36, NULL)
INSERT [dbo].[Phone] ([id], [phone], [paID], [hoID], [Memo]) VALUES (9, N'99999999                      ', 5, 36, NULL)
INSERT [dbo].[Phone] ([id], [phone], [paID], [hoID], [Memo]) VALUES (10, N'00990099                      ', 5, 36, NULL)
INSERT [dbo].[Phone] ([id], [phone], [paID], [hoID], [Memo]) VALUES (11, N'9898989                       ', 5, 22, NULL)
INSERT [dbo].[Phone] ([id], [phone], [paID], [hoID], [Memo]) VALUES (12, N'99998888                      ', 5, 34, NULL)
INSERT [dbo].[Phone] ([id], [phone], [paID], [hoID], [Memo]) VALUES (13, N'66666666                      ', 5, 35, NULL)
INSERT [dbo].[Phone] ([id], [phone], [paID], [hoID], [Memo]) VALUES (14, N'95443453                      ', 5, 41, NULL)
INSERT [dbo].[Phone] ([id], [phone], [paID], [hoID], [Memo]) VALUES (15, N'3456567                       ', 5, 39, NULL)
SET IDENTITY_INSERT [dbo].[Phone] OFF
SET IDENTITY_INSERT [dbo].[shebei_mingxi] ON 

INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (12, N'轮胎                                              ', N'111                                               ', 111, N'齐休厂                                            ', N'2019/04/15          ', N'111                 ', N'1111                                              ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (15, N'111                                               ', N'111                                               ', 111, N'111                                               ', N'2019/04/15          ', N'111                 ', N'1111                                              ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (16, N'111                                               ', N'111                                               ', 111, N'111                                               ', N'2019/04/15          ', N'111                 ', N'1111                                              ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (17, N'111                                               ', N'111                                               ', 111, N'111                                               ', N'2019/04/15          ', N'111                 ', N'1111                                              ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (18, N'111                                               ', N'111                                               ', 111, N'111                                               ', N'2019/04/15          ', N'111                 ', N'1111                                              ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (19, N'111                                               ', N'111                                               ', 111, N'111                                               ', N'2019/04/15          ', N'111                 ', N'1111                                              ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (22, N'65                                                ', N'65                                                ', 65, N'65                                                ', N'2019/04/15          ', N'65                  ', N'65                                                ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (25, N'ghgfh                                             ', N'hgfh                                              ', 7, N'hgfh                                              ', N'2019/04/15          ', N'hgfh                ', N'hgfhgfgh                                          ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (26, N'65656                                             ', N'65656                                             ', 6565, N'656                                               ', N'2019/04/15          ', N'6565                ', N'65656                                             ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (27, N'54                                                ', N'45                                                ', 54, N'54                                                ', N'2019/04/15          ', N'54                  ', N'545                                               ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (28, N'43                                                ', N'                                                  ', 43, N'                                                  ', N'2019/04/15          ', N'                    ', N'                                                  ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (29, N'1111111111                                        ', N'11                                                ', 0, N'                                                  ', N'2019/04/15          ', N'11                  ', N'                                                  ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (30, N'1222333                                           ', N'223                                               ', 0, N'323                                               ', N'2019/04/15          ', N'323                 ', N'32333333333333                                    ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (32, N'23243                                             ', N'323                                               ', 0, N'                                                  ', N'2019/04/15          ', N'                    ', N'                                                  ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (33, N'dfsdfdsaf                                         ', N'111                                               ', 11, N'111                                               ', N'2019/04/15          ', N'11                  ', N'111                                               ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (34, N'2323                                              ', N'3232                                              ', 3232, N'3232                                              ', N'2019/04/15          ', N'323                 ', N'32323                                             ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (35, N'111rerew                                          ', N'werwe                                             ', 32, N'32                                                ', N'2019/04/15          ', N'32                  ', N'32                                                ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (36, N'12weqw                                            ', N'32                                                ', 0, N'32                                                ', N'2019/04/15          ', N'32                  ', N'32                                                ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (37, N'11111wedsf                                        ', N'dsfds                                             ', 0, N'fsdf                                              ', N'2019/04/15          ', N'fsdf                ', N'sdff                                              ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (38, N'1112321123                                        ', N'dfsd                                              ', 43, N'fdsf                                              ', N'2019/04/15          ', N'dsfds               ', N'fdsf                                              ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (39, N'2323                                              ', N'323                                               ', 32, N'32                                                ', N'2019/04/15          ', N'32                  ', N'323                                               ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (44, N'发电机                                            ', N'5000W                                             ', 2, N'中国第一电机厂                                    ', N'2019/04/15          ', N'8个月               ', N'便宜实惠好用！                                    ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (45, N'发电机                                            ', N'5000W                                             ', 2, N'中国第一电机厂                                    ', N'2019/04/15          ', N'8个月               ', N'便宜实惠好用！                                    ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (46, N'发电机                                            ', N'5000W                                             ', 2, N'中国第一电机厂                                    ', N'2019/04/15          ', N'8个月               ', N'便宜实惠好用！                                    ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (47, N'发电机                                            ', N'5000W                                             ', 2, N'中国第一电机厂                                    ', N'2019/04/15          ', N'8个月               ', N'便宜实惠好用！                                    ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (48, N'发电机                                            ', N'5000W                                             ', 2, N'中国第一电机厂                                    ', N'2019/04/15          ', N'8个月               ', N'便宜实惠好用！                                    ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (49, N'发电机                                            ', N'5000W                                             ', 2, N'中国第一电机厂                                    ', N'2019/04/15          ', N'8个月               ', N'便宜实惠好用！                                    ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (50, N'1234                                              ', N'1234                                              ', 12, N'12                                                ', N'2019/04/15          ', N'12                  ', N'12                                                ')
INSERT [dbo].[shebei_mingxi] ([id], [mingcheng], [guige], [shuliang], [changshang], [riqi], [zhouqi], [beizhu]) VALUES (52, N'电梯                                              ', N'10000KG                                           ', 2, N'东芝                                              ', N'2019/04/15          ', N'                    ', N'                                                  ')
SET IDENTITY_INSERT [dbo].[shebei_mingxi] OFF
SET IDENTITY_INSERT [dbo].[shebei_weixiu] ON 

INSERT [dbo].[shebei_weixiu] ([id], [mingcheng], [yuanyin], [danwei], [fuzeren], [riqi], [fukuanfou], [beizhu]) VALUES (1, N'111                                               ', N'机械故障留在六楼                                  ', N'东芝电梯公司                                      ', N'小指                ', N'2019/04/15', N'否        ', N'坏了                                              ')
INSERT [dbo].[shebei_weixiu] ([id], [mingcheng], [yuanyin], [danwei], [fuzeren], [riqi], [fukuanfou], [beizhu]) VALUES (2, N'楼梯                                              ', N'硬物敲打                                          ', N'北京五建                                          ', N'大明                ', N'2019/04/15', N'是        ', N'全部修整                                          ')
INSERT [dbo].[shebei_weixiu] ([id], [mingcheng], [yuanyin], [danwei], [fuzeren], [riqi], [fukuanfou], [beizhu]) VALUES (3, N'111                                               ', N'111                                               ', N'111                                               ', N'111                 ', N'2019/04/15', N'否        ', N'1111                                              ')
INSERT [dbo].[shebei_weixiu] ([id], [mingcheng], [yuanyin], [danwei], [fuzeren], [riqi], [fukuanfou], [beizhu]) VALUES (6, N'过道                                              ', N'掉漆                                              ', N'中建五局                                          ', N'李帅工程师          ', N'2019/04/15', N'否        ', N'翻修一新                                          ')
INSERT [dbo].[shebei_weixiu] ([id], [mingcheng], [yuanyin], [danwei], [fuzeren], [riqi], [fukuanfou], [beizhu]) VALUES (7, N'333                                               ', N'333                                               ', N'333                                               ', N'333                 ', N'2019/04/15', N'是        ', N'333                                               ')
INSERT [dbo].[shebei_weixiu] ([id], [mingcheng], [yuanyin], [danwei], [fuzeren], [riqi], [fukuanfou], [beizhu]) VALUES (8, N'5656                                              ', N'6565                                              ', N'656                                               ', N'656                 ', N'2019/04/15', N'是        ', N'6565                                              ')
INSERT [dbo].[shebei_weixiu] ([id], [mingcheng], [yuanyin], [danwei], [fuzeren], [riqi], [fukuanfou], [beizhu]) VALUES (9, N'323                                               ', N'434                                               ', N'434                                               ', N'434                 ', N'2019/04/15', N'是        ', N'4343                                              ')
INSERT [dbo].[shebei_weixiu] ([id], [mingcheng], [yuanyin], [danwei], [fuzeren], [riqi], [fukuanfou], [beizhu]) VALUES (10, N'4343                                              ', N'434                                               ', N'434                                               ', N'434                 ', N'2019/04/15', N'是        ', N'434                                               ')
INSERT [dbo].[shebei_weixiu] ([id], [mingcheng], [yuanyin], [danwei], [fuzeren], [riqi], [fukuanfou], [beizhu]) VALUES (11, N'俄热我                                            ', N'343                                               ', N'434                                               ', N'434                 ', N'2019/04/15', N'是        ', N'4343                                              ')
INSERT [dbo].[shebei_weixiu] ([id], [mingcheng], [yuanyin], [danwei], [fuzeren], [riqi], [fukuanfou], [beizhu]) VALUES (12, N'轮胎                                              ', N'自燃                                              ', N'                                                  ', N'                    ', N'2019/04/15', N'是        ', N'咳咳                                              ')
SET IDENTITY_INSERT [dbo].[shebei_weixiu] OFF
INSERT [dbo].[zhuhu] ([bianhao], [xingming], [xingbie], [danwei], [shenfenzhenghao], [dianhua], [shouji], [youjian], [jianlizhe], [zhaopian], [leixing], [shifouruzhu]) VALUES (N'A001                ', N'小指                                              ', N'男        ', N'林业大学                                                                                            ', N'310110650421309                                   ', N'01082380526         ', N'13311455669         ', N'zhangsan@010.com                                  ', N'韩非                ', N'human\human1.ico                                  ', N'                    ', N'是        ')
INSERT [dbo].[zhuhu] ([bianhao], [xingming], [xingbie], [danwei], [shenfenzhenghao], [dianhua], [shouji], [youjian], [jianlizhe], [zhaopian], [leixing], [shifouruzhu]) VALUES (N'A002                ', N'李四                                              ', N'男        ', N'地质大学                                                                                            ', N'310110605000000                                   ', N'01052565589         ', N'13000002222         ', N'lisi@010.com                                      ', N'王诚                ', N'human\human2.ico                                  ', N'购买                ', N'是        ')
INSERT [dbo].[zhuhu] ([bianhao], [xingming], [xingbie], [danwei], [shenfenzhenghao], [dianhua], [shouji], [youjian], [jianlizhe], [zhaopian], [leixing], [shifouruzhu]) VALUES (N'B002                ', N'333                                               ', N'女        ', N'清华大学                                                                                            ', N'111111010101010                                   ', N'01022333355         ', N'13844554455         ', N'333@010.com                                       ', N'王诚                ', N'human\human4.ico                                  ', N'购买                ', N'是        ')
INSERT [dbo].[zhuhu] ([bianhao], [xingming], [xingbie], [danwei], [shenfenzhenghao], [dianhua], [shouji], [youjian], [jianlizhe], [zhaopian], [leixing], [shifouruzhu]) VALUES (N'C001                ', N'李小明                                            ', N'男        ', N'清华大学                                                                                            ', N'00000011122                                       ', N'01022555568         ', N'13966556566         ', N'xiaoming@010.com                                  ', N'王诚                ', N'human\human2.ico                                  ', N'尚未入住            ', N'否        ')
INSERT [dbo].[zhuhu] ([bianhao], [xingming], [xingbie], [danwei], [shenfenzhenghao], [dianhua], [shouji], [youjian], [jianlizhe], [zhaopian], [leixing], [shifouruzhu]) VALUES (N'C002                ', N'张大明                                            ', N'男        ', N'清华东路35号                                                                                        ', N'101222325223                                      ', N'01022555563         ', N'13955664256         ', N'daming@010.com                                    ', N'王诚                ', N'human\human1.ico                                  ', N'购买                ', N'是        ')
INSERT [dbo].[zhuhu] ([bianhao], [xingming], [xingbie], [danwei], [shenfenzhenghao], [dianhua], [shouji], [youjian], [jianlizhe], [zhaopian], [leixing], [shifouruzhu]) VALUES (N'C003                ', N'张莉                                              ', N'女        ', N'中国航天集团                                                                                        ', N'12345678910                                       ', N'01022556633         ', N'13955623365         ', N'zhangli@010.com                                   ', N'韩非                ', N'human\human2.ico                                  ', N'尚未入住            ', N'否        ')
INSERT [dbo].[zhuhu] ([bianhao], [xingming], [xingbie], [danwei], [shenfenzhenghao], [dianhua], [shouji], [youjian], [jianlizhe], [zhaopian], [leixing], [shifouruzhu]) VALUES (N'D001                ', N'444                                               ', N'女        ', N'北京第一机床厂                                                                                      ', N'44                                                ', N'44                  ', N'44                  ', N'44                                                ', N'张莉                ', N'human\human4.ico                                  ', N'租用                ', N'是        ')
INSERT [dbo].[zhuhu] ([bianhao], [xingming], [xingbie], [danwei], [shenfenzhenghao], [dianhua], [shouji], [youjian], [jianlizhe], [zhaopian], [leixing], [shifouruzhu]) VALUES (N'D002                ', N'222                                               ', N'女        ', N'北京第一机床厂                                                                                      ', N'222                                               ', N'222                 ', N'222                 ', N'222                                               ', N'张莉                ', N'human\human2.ico                                  ', N'尚未入住            ', N'否        ')
INSERT [dbo].[zhuhu] ([bianhao], [xingming], [xingbie], [danwei], [shenfenzhenghao], [dianhua], [shouji], [youjian], [jianlizhe], [zhaopian], [leixing], [shifouruzhu]) VALUES (N'D003                ', N'111                                               ', N'男        ', N'北京第一机床厂                                                                                      ', N'111                                               ', N'111                 ', N'111                 ', N'111                                               ', N'张莉                ', N'human\human4.ico                                  ', N'尚未入住            ', N'否        ')
INSERT [dbo].[zhuhu] ([bianhao], [xingming], [xingbie], [danwei], [shenfenzhenghao], [dianhua], [shouji], [youjian], [jianlizhe], [zhaopian], [leixing], [shifouruzhu]) VALUES (N'必填项              ', N'必填项                                            ', N'男        ', N'                                                                                                    ', N'必填项                                            ', N'                    ', N'                    ', N'                                                  ', N'                    ', N'human\                                            ', N'                    ', N'否        ')
SET IDENTITY_INSERT [dbo].[zhuhuchuru] ON 

INSERT [dbo].[zhuhuchuru] ([id], [wuyebianhao], [wuyemingcheng], [yezhubianhao], [yezhuxingming], [xingbie], [dianhua], [danwei], [qianruriqi], [qianrufangshi], [qianrujingbanren], [qianchuriqi], [qianchujingbanren], [yufujieyu], [shifouqianchu], [beizhu]) VALUES (4, N'22                  ', N'1-2-101                                                                                             ', N'A001                ', N'张三                                              ', N'男        ', N'01082380526         ', N'林业大学                                                                                            ', N'2004-6-13           ', N'租用                ', N'主管                ', NULL, NULL, N'0                   ', N'是        ', N'                                                                                                    ')
INSERT [dbo].[zhuhuchuru] ([id], [wuyebianhao], [wuyemingcheng], [yezhubianhao], [yezhuxingming], [xingbie], [dianhua], [danwei], [qianruriqi], [qianrufangshi], [qianrujingbanren], [qianchuriqi], [qianchujingbanren], [yufujieyu], [shifouqianchu], [beizhu]) VALUES (5, N'22                  ', N'1-2-101                                                                                             ', N'A002                ', N'李四                                              ', N'男        ', N'01052565589         ', N'地质大学                                                                                            ', N'2004-6-14           ', N'借用                ', N'王甍                ', NULL, NULL, N'0                   ', N'是        ', N'无                                                                                                  ')
INSERT [dbo].[zhuhuchuru] ([id], [wuyebianhao], [wuyemingcheng], [yezhubianhao], [yezhuxingming], [xingbie], [dianhua], [danwei], [qianruriqi], [qianrufangshi], [qianrujingbanren], [qianchuriqi], [qianchujingbanren], [yufujieyu], [shifouqianchu], [beizhu]) VALUES (10, N'31                  ', N'401                                                                                                 ', N'A002                ', N'李四                                              ', N'男        ', N'01052565589         ', N'地质大学                                                                                            ', N'2004-6-14           ', N'购买                ', N'主管                ', NULL, NULL, N'                    ', N'否        ', N'                                                                                                    ')
INSERT [dbo].[zhuhuchuru] ([id], [wuyebianhao], [wuyemingcheng], [yezhubianhao], [yezhuxingming], [xingbie], [dianhua], [danwei], [qianruriqi], [qianrufangshi], [qianrujingbanren], [qianchuriqi], [qianchujingbanren], [yufujieyu], [shifouqianchu], [beizhu]) VALUES (11, N'25                  ', N'3-3-201                                                                                             ', N'B001                ', N'王五                                              ', N'男        ', N'01025252668         ', N'矿业大学                                                                                            ', N'2004-6-14           ', N'租用                ', N'主管                ', N'2004-6-14           ', N'主管                ', N'0                   ', N'是        ', N'租期一个月                                                                                          ')
INSERT [dbo].[zhuhuchuru] ([id], [wuyebianhao], [wuyemingcheng], [yezhubianhao], [yezhuxingming], [xingbie], [dianhua], [danwei], [qianruriqi], [qianrufangshi], [qianrujingbanren], [qianchuriqi], [qianchujingbanren], [yufujieyu], [shifouqianchu], [beizhu]) VALUES (12, N'25                  ', N'3-3-201                                                                                             ', N'A001                ', N'张三                                              ', N'男        ', N'01082380526         ', N'林业大学                                                                                            ', N'2004-6-14           ', N'                    ', N'主管                ', NULL, NULL, N'                    ', N'否        ', N'                                                                                                    ')
INSERT [dbo].[zhuhuchuru] ([id], [wuyebianhao], [wuyemingcheng], [yezhubianhao], [yezhuxingming], [xingbie], [dianhua], [danwei], [qianruriqi], [qianrufangshi], [qianrujingbanren], [qianchuriqi], [qianchujingbanren], [yufujieyu], [shifouqianchu], [beizhu]) VALUES (13, N'22                  ', N'1-2-101                                                                                             ', N'C002                ', N'张大明                                            ', N'男        ', N'01022555563         ', N'清华东路35号                                                                                        ', N'2004-6-14           ', N'购买                ', N'主管                ', NULL, NULL, N'0                   ', N'否        ', N'无                                                                                                  ')
INSERT [dbo].[zhuhuchuru] ([id], [wuyebianhao], [wuyemingcheng], [yezhubianhao], [yezhuxingming], [xingbie], [dianhua], [danwei], [qianruriqi], [qianrufangshi], [qianrujingbanren], [qianchuriqi], [qianchujingbanren], [yufujieyu], [shifouqianchu], [beizhu]) VALUES (14, N'31                  ', N'401                                                                                                 ', N'D001                ', N'444                                               ', N'女        ', N'44                  ', N'北京第一机床厂                                                                                      ', N'2004-6-14           ', N'租用                ', N'主管                ', N'2004-6-14           ', N'主管                ', N'0                   ', N'是        ', N'无                                                                                                  ')
INSERT [dbo].[zhuhuchuru] ([id], [wuyebianhao], [wuyemingcheng], [yezhubianhao], [yezhuxingming], [xingbie], [dianhua], [danwei], [qianruriqi], [qianrufangshi], [qianrujingbanren], [qianchuriqi], [qianchujingbanren], [yufujieyu], [shifouqianchu], [beizhu]) VALUES (15, N'31                  ', N'401                                                                                                 ', N'D001                ', N'444                                               ', N'女        ', N'44                  ', N'北京第一机床厂                                                                                      ', N'2004-6-14           ', N'租用                ', N'主管                ', NULL, NULL, N'0                   ', N'否        ', N'无                                                                                                  ')
INSERT [dbo].[zhuhuchuru] ([id], [wuyebianhao], [wuyemingcheng], [yezhubianhao], [yezhuxingming], [xingbie], [dianhua], [danwei], [qianruriqi], [qianrufangshi], [qianrujingbanren], [qianchuriqi], [qianchujingbanren], [yufujieyu], [shifouqianchu], [beizhu]) VALUES (16, N'16                  ', N'2-1-101                                                                                             ', N'A001                ', N'张三                                              ', N'男        ', N'01082380526         ', N'林业大学                                                                                            ', N'2004-12-24          ', N'                    ', N'主管                ', NULL, NULL, N'                    ', N'否        ', N'                                                                                                    ')
SET IDENTITY_INSERT [dbo].[zhuhuchuru] OFF
