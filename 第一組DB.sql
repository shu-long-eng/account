USE [財經系統]
GO
/****** Object:  Table [dbo].[Assets]    Script Date: 2021/6/14 上午 09:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assets](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Sub] [nvarchar](50) NULL,
	[Usefor] [nvarchar](50) NULL,
	[Money] [int] NULL,
	[IncomeAndExpenditure] [nvarchar](50) NULL,
	[Total] [int] NULL,
	[IsDelete] [bit] NULL,
	[SubID] [int] NULL,
	[CreateTime] [datetime] NULL,
	[Creater] [varchar](50) NULL,
 CONSTRAINT [PK_Assets] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 2021/6/14 上午 09:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Cid] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Phone] [varchar](11) NOT NULL,
	[Address] [nvarchar](30) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PettyCash]    Script Date: 2021/6/14 上午 09:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PettyCash](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [varchar](50) NOT NULL,
	[Receipt] [varchar](50) NULL,
	[Usefor] [nvarchar](50) NULL,
	[Money] [int] NULL,
	[Total] [int] NULL,
	[Isdelete] [bit] NULL,
 CONSTRAINT [PK_Petty Cash] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 2021/6/14 上午 09:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ReceiptNumber] [varchar](11) NOT NULL,
	[Date] [date] NOT NULL,
	[Company] [int] NOT NULL,
	[Amount] [decimal](8, 0) NOT NULL,
	[Revenue_Expense] [int] NOT NULL,
	[CreateDate] [date] NULL,
	[Creator] [nchar](10) NULL,
	[ModifyDate] [date] NULL,
	[Modifier] [nchar](10) NULL,
	[DeleteDate] [date] NULL,
	[Deleter] [nchar](10) NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[ReceiptNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubList]    Script Date: 2021/6/14 上午 09:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubList] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SubList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Taxation]    Script Date: 2021/6/14 上午 09:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Taxation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[發票日期] [date] NULL,
	[科目] [nvarchar](50) NULL,
	[發票號碼] [int] NULL,
	[發票金額] [int] NULL,
	[進出口] [nvarchar](50) NULL,
	[發票稅額] [int] NULL,
 CONSTRAINT [PK_Taxation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2021/6/14 上午 09:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Account] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Level] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[零用金]    Script Date: 2021/6/14 上午 09:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[零用金](
	[GUID] [uniqueidentifier] NOT NULL,
	[CaseID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[class] [nvarchar](50) NOT NULL,
	[pay] [decimal](18, 0) NOT NULL,
	[Event] [nvarchar](50) NOT NULL,
	[invoiceCode] [nchar](10) NOT NULL,
	[Updatetime] [datetime] NULL,
	[Createtime] [datetime] NULL,
	[Isdelete] [bit] NULL,
 CONSTRAINT [PK_零用金] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Assets] ON 

INSERT [dbo].[Assets] ([ID], [Date], [Sub], [Usefor], [Money], [IncomeAndExpenditure], [Total], [IsDelete], [SubID], [CreateTime], [Creater]) VALUES (35, CAST(N'2021-05-01' AS Date), N'交通費', N'-', 10000, N'收入', 10000, 0, 4, CAST(N'2021-05-21T10:36:40.813' AS DateTime), N'Boss')
INSERT [dbo].[Assets] ([ID], [Date], [Sub], [Usefor], [Money], [IncomeAndExpenditure], [Total], [IsDelete], [SubID], [CreateTime], [Creater]) VALUES (36, CAST(N'2021-01-15' AS Date), N'交通費', N'-', 10000, N'收入', 20000, 0, 4, CAST(N'2021-05-21T10:36:57.293' AS DateTime), N'Boss')
INSERT [dbo].[Assets] ([ID], [Date], [Sub], [Usefor], [Money], [IncomeAndExpenditure], [Total], [IsDelete], [SubID], [CreateTime], [Creater]) VALUES (37, CAST(N'2021-02-02' AS Date), N'交通費', N'-', 500, N'收入', 20500, 0, 4, CAST(N'2021-05-21T13:40:21.303' AS DateTime), N'Boss')
INSERT [dbo].[Assets] ([ID], [Date], [Sub], [Usefor], [Money], [IncomeAndExpenditure], [Total], [IsDelete], [SubID], [CreateTime], [Creater]) VALUES (38, CAST(N'2021-03-10' AS Date), N'交通費', N'-', 5000, N'收入', 25500, 0, 4, CAST(N'2021-05-21T13:40:34.127' AS DateTime), N'Boss')
INSERT [dbo].[Assets] ([ID], [Date], [Sub], [Usefor], [Money], [IncomeAndExpenditure], [Total], [IsDelete], [SubID], [CreateTime], [Creater]) VALUES (39, CAST(N'2021-04-26' AS Date), N'交通費', N'-', 50000, N'收入', 75500, 0, 4, CAST(N'2021-05-21T13:40:58.580' AS DateTime), N'Boss')
INSERT [dbo].[Assets] ([ID], [Date], [Sub], [Usefor], [Money], [IncomeAndExpenditure], [Total], [IsDelete], [SubID], [CreateTime], [Creater]) VALUES (40, CAST(N'2021-05-19' AS Date), N'其他雜費', N'-', 5000, N'支出', 70500, 0, 5, CAST(N'2021-05-21T13:41:11.283' AS DateTime), N'Boss')
INSERT [dbo].[Assets] ([ID], [Date], [Sub], [Usefor], [Money], [IncomeAndExpenditure], [Total], [IsDelete], [SubID], [CreateTime], [Creater]) VALUES (41, CAST(N'2021-01-17' AS Date), N'其他雜費', N'-', 7000, N'支出', 63500, 1, 5, CAST(N'2021-05-21T13:41:26.153' AS DateTime), N'Boss')
INSERT [dbo].[Assets] ([ID], [Date], [Sub], [Usefor], [Money], [IncomeAndExpenditure], [Total], [IsDelete], [SubID], [CreateTime], [Creater]) VALUES (42, CAST(N'2021-02-25' AS Date), N'其他雜費', N'-', 2500, N'支出', 61000, 1, 5, CAST(N'2021-05-21T13:41:43.070' AS DateTime), N'Boss')
INSERT [dbo].[Assets] ([ID], [Date], [Sub], [Usefor], [Money], [IncomeAndExpenditure], [Total], [IsDelete], [SubID], [CreateTime], [Creater]) VALUES (43, CAST(N'2021-03-22' AS Date), N'其他雜費', N'-', 7000, N'支出', 54000, 1, 5, CAST(N'2021-05-21T13:41:59.463' AS DateTime), N'Boss')
INSERT [dbo].[Assets] ([ID], [Date], [Sub], [Usefor], [Money], [IncomeAndExpenditure], [Total], [IsDelete], [SubID], [CreateTime], [Creater]) VALUES (44, CAST(N'2021-04-21' AS Date), N'交通費', N'-', 7000, N'支出', 63500, 0, 4, CAST(N'2021-05-21T13:42:35.623' AS DateTime), N'Boss')
INSERT [dbo].[Assets] ([ID], [Date], [Sub], [Usefor], [Money], [IncomeAndExpenditure], [Total], [IsDelete], [SubID], [CreateTime], [Creater]) VALUES (45, CAST(N'2021-04-22' AS Date), N'交通費', N'-', 7000, N'收入', 61000, 1, NULL, CAST(N'2021-04-21T13:42:35.623' AS DateTime), NULL)
INSERT [dbo].[Assets] ([ID], [Date], [Sub], [Usefor], [Money], [IncomeAndExpenditure], [Total], [IsDelete], [SubID], [CreateTime], [Creater]) VALUES (47, CAST(N'2021-06-02' AS Date), N'交通費', N'-', 100, N'收入', 63600, 0, 4, CAST(N'2021-06-14T08:59:09.610' AS DateTime), N'Boss')
SET IDENTITY_INSERT [dbo].[Assets] OFF
GO
INSERT [dbo].[Company] ([Cid], [Name], [Phone], [Address]) VALUES (1, N'UBay', N'080-9998888', N'kkkaaa')
INSERT [dbo].[Company] ([Cid], [Name], [Phone], [Address]) VALUES (2, N'7-Eleven', N'070-6699666', N'bbbccc')
INSERT [dbo].[Company] ([Cid], [Name], [Phone], [Address]) VALUES (3, N'FamilyMart', N'060-5544332', N'tttrrreeee')
INSERT [dbo].[Company] ([Cid], [Name], [Phone], [Address]) VALUES (4, N'GlobalGas', N'030-2233446', N'wwwooo')
GO
SET IDENTITY_INSERT [dbo].[PettyCash] ON 

INSERT [dbo].[PettyCash] ([ID], [Date], [Receipt], [Usefor], [Money], [Total], [Isdelete]) VALUES (1, N'2021-04-20', N'22222222', N'2222', 222, 222, 0)
SET IDENTITY_INSERT [dbo].[PettyCash] OFF
GO
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'AA-10000000', CAST(N'2021-04-28' AS Date), 3, CAST(3 AS Decimal(8, 0)), 2, CAST(N'2021-05-18' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'AA-10000001', CAST(N'2021-05-20' AS Date), 3, CAST(5 AS Decimal(8, 0)), 2, CAST(N'2021-05-18' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'AA-10000002', CAST(N'2021-05-20' AS Date), 1, CAST(909 AS Decimal(8, 0)), 1, CAST(N'2021-05-19' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'AA-10000003', CAST(N'2021-05-19' AS Date), 2, CAST(6 AS Decimal(8, 0)), 2, CAST(N'2021-05-19' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'AA-10000004', CAST(N'2021-05-20' AS Date), 1, CAST(8 AS Decimal(8, 0)), 2, CAST(N'2021-05-19' AS Date), N'Brian     ', CAST(N'2021-05-20' AS Date), N'Brian     ', NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'AA-10000007', CAST(N'2021-05-12' AS Date), 1, CAST(66 AS Decimal(8, 0)), 2, CAST(N'2021-05-24' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'AA-10000009', CAST(N'2021-08-05' AS Date), 1, CAST(2336 AS Decimal(8, 0)), 1, CAST(N'2021-05-27' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'AJ-54128774', CAST(N'2021-05-17' AS Date), 2, CAST(559 AS Decimal(8, 0)), 2, CAST(N'2021-05-17' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'AS-54126397', CAST(N'2021-04-29' AS Date), 3, CAST(220 AS Decimal(8, 0)), 2, CAST(N'2021-05-05' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'BT-99650245', CAST(N'2021-03-12' AS Date), 3, CAST(70 AS Decimal(8, 0)), 2, CAST(N'2021-07-24' AS Date), N'Biran     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'DC-96553261', CAST(N'2021-07-01' AS Date), 1, CAST(66666 AS Decimal(8, 0)), 2, CAST(N'2021-07-01' AS Date), N'Brian     ', CAST(N'2021-05-27' AS Date), N'Brian     ', NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'EY-56479854', CAST(N'2021-03-02' AS Date), 4, CAST(1200 AS Decimal(8, 0)), 2, CAST(N'2021-07-23' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'FG-25445632', CAST(N'2021-05-18' AS Date), 2, CAST(55 AS Decimal(8, 0)), 2, CAST(N'2021-05-27' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'FR-66666666', CAST(N'2021-05-20' AS Date), 3, CAST(2222 AS Decimal(8, 0)), 2, CAST(N'2021-05-18' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'FR-66666667', CAST(N'2021-05-20' AS Date), 3, CAST(2 AS Decimal(8, 0)), 2, CAST(N'2021-05-18' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'FR-66666668', CAST(N'2021-05-22' AS Date), 3, CAST(321 AS Decimal(8, 0)), 2, CAST(N'2021-05-18' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'FR-87546213', CAST(N'2021-05-07' AS Date), 2, CAST(777 AS Decimal(8, 0)), 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'FS-36588545', CAST(N'2021-03-21' AS Date), 4, CAST(899 AS Decimal(8, 0)), 2, CAST(N'2021-07-25' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'GH-54569964', CAST(N'2021-06-23' AS Date), 2, CAST(500 AS Decimal(8, 0)), 2, CAST(N'2021-06-14' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'GH-54569965', CAST(N'2021-05-12' AS Date), 1, CAST(22545 AS Decimal(8, 0)), 1, CAST(N'2021-05-27' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'GH-88547477', CAST(N'2021-02-23' AS Date), 3, CAST(586 AS Decimal(8, 0)), 2, CAST(N'2021-07-22' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'JK-74541123', CAST(N'2021-01-13' AS Date), 2, CAST(20 AS Decimal(8, 0)), 2, CAST(N'2021-07-22' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'KJ-84521320', CAST(N'2021-03-09' AS Date), 2, CAST(50 AS Decimal(8, 0)), 2, CAST(N'2021-07-23' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'MN-84864711', CAST(N'2021-06-10' AS Date), 2, CAST(2365 AS Decimal(8, 0)), 2, CAST(N'2021-06-15' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'MR-10000002', CAST(N'2021-03-31' AS Date), 1, CAST(777 AS Decimal(8, 0)), 1, CAST(N'2021-05-05' AS Date), N'Brian     ', NULL, NULL, CAST(N'2021-05-17' AS Date), N'Brian     ')
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'NV-16549821', CAST(N'2021-03-21' AS Date), 3, CAST(130 AS Decimal(8, 0)), 2, CAST(N'2021-07-24' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'OK-11542399', CAST(N'2021-05-18' AS Date), 4, CAST(655 AS Decimal(8, 0)), 2, CAST(N'2021-05-17' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'OP-65412369', CAST(N'2021-05-13' AS Date), 3, CAST(33333 AS Decimal(8, 0)), 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'QC-65164997', CAST(N'2021-05-26' AS Date), 3, CAST(3385 AS Decimal(8, 0)), 2, CAST(N'2021-05-26' AS Date), N'Brian     ', CAST(N'2021-05-26' AS Date), N'Brian     ', NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'QE-45689563', CAST(N'2021-05-12' AS Date), 1, CAST(8888 AS Decimal(8, 0)), 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'QW-10000001', CAST(N'2021-04-01' AS Date), 3, CAST(200 AS Decimal(8, 0)), 2, CAST(N'2021-05-05' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'RB-89745632', CAST(N'2021-04-02' AS Date), 1, CAST(5000 AS Decimal(8, 0)), 1, CAST(N'2021-05-05' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'RE-44789653', CAST(N'2021-05-17' AS Date), 1, CAST(7149 AS Decimal(8, 0)), 1, CAST(N'2021-05-17' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'RY-56942366', CAST(N'2021-04-28' AS Date), 1, CAST(456 AS Decimal(8, 0)), 1, CAST(N'2021-05-05' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'TE-74156325', CAST(N'2021-04-03' AS Date), 4, CAST(800 AS Decimal(8, 0)), 2, CAST(N'2021-05-05' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'TY-54125896', CAST(N'2021-05-13' AS Date), 2, CAST(5566 AS Decimal(8, 0)), 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'UI-33654785', CAST(N'2021-01-03' AS Date), 2, CAST(36 AS Decimal(8, 0)), 2, CAST(N'2021-07-21' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'UY-55694471', CAST(N'2021-06-02' AS Date), 3, CAST(1474 AS Decimal(8, 0)), 2, CAST(N'2021-06-02' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'VN-69663521', CAST(N'2021-06-03' AS Date), 2, CAST(693 AS Decimal(8, 0)), 2, CAST(N'2021-06-03' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Receipt] ([ReceiptNumber], [Date], [Company], [Amount], [Revenue_Expense], [CreateDate], [Creator], [ModifyDate], [Modifier], [DeleteDate], [Deleter]) VALUES (N'WE-56214785', CAST(N'2021-05-31' AS Date), 1, CAST(123 AS Decimal(8, 0)), 1, CAST(N'2021-05-27' AS Date), N'Brian     ', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[SubList] ON 

INSERT [dbo].[SubList] ([ID], [SubList]) VALUES (4, N'交通費')
INSERT [dbo].[SubList] ([ID], [SubList]) VALUES (5, N'其他雜費')
INSERT [dbo].[SubList] ([ID], [SubList]) VALUES (1, N'旅費')
INSERT [dbo].[SubList] ([ID], [SubList]) VALUES (2, N'健保費')
INSERT [dbo].[SubList] ([ID], [SubList]) VALUES (3, N'零用金')
SET IDENTITY_INSERT [dbo].[SubList] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Account], [Password], [Name], [Level]) VALUES (6, N'boss', N'123456', N'Boss', NULL)
INSERT [dbo].[User] ([ID], [Account], [Password], [Name], [Level]) VALUES (7, N'supervisor', N'123456', N'Supervisor', NULL)
INSERT [dbo].[User] ([ID], [Account], [Password], [Name], [Level]) VALUES (8, N'staff', N'123456', N'Staff', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'606ab6a4-b00b-4d76-b4ff-0a9de210e8f2', 70, CAST(N'2021-05-26' AS Date), N'公費', CAST(10000 AS Decimal(18, 0)), N'公差', N'TW-070    ', NULL, CAST(N'2021-05-26T10:27:50.693' AS DateTime), 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'83bc1b23-0d48-49fe-99af-0e67dbe2097f', 25, CAST(N'2021-04-19' AS Date), N'預算', CAST(10000 AS Decimal(18, 0)), N'其他', N'TW-023    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'110c7c74-897d-4f91-b4e0-156e413cffd0', 29, CAST(N'2021-05-05' AS Date), N'公費', CAST(555 AS Decimal(18, 0)), N'公差', N'TW-031    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'a2985438-7e30-47f1-b115-1caff82bdf37', 70, CAST(N'2021-05-13' AS Date), N'公費', CAST(200 AS Decimal(18, 0)), N'公差', N'TW-070    ', NULL, CAST(N'2021-05-26T10:27:22.480' AS DateTime), 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'bb9a4262-4b91-4da4-a4f5-21c07b8b9c63', 7, CAST(N'2021-04-17' AS Date), N'公費', CAST(1500 AS Decimal(18, 0)), N'維修', N'TW-007    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'766648bc-427b-433b-b308-23a27791d994', 17, CAST(N'2021-04-18' AS Date), N'公費', CAST(2014 AS Decimal(18, 0)), N'交通', N'TW-017    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'e7c65a96-cae5-4334-8224-24cec2506e6d', 21, CAST(N'2021-04-19' AS Date), N'公費', CAST(5555 AS Decimal(18, 0)), N'公差', N'TW-020    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'1efeab11-6a3a-483b-a52a-296f3b8a7724', 12, CAST(N'2021-04-18' AS Date), N'公費', CAST(5555 AS Decimal(18, 0)), N'出差', N'TW-012    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'8b887db2-230b-4f03-ada4-34f8b200cb1b', 55, CAST(N'2021-06-16' AS Date), N'公費', CAST(250 AS Decimal(18, 0)), N'公差', N'TW-0022   ', NULL, CAST(N'2021-06-14T09:05:21.973' AS DateTime), 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'b9a12063-bf0c-4b0c-9e39-3ead3951637a', 62, CAST(N'2021-05-11' AS Date), N'公費', CAST(62 AS Decimal(18, 0)), N'公差', N'TW-062    ', NULL, CAST(N'2021-05-11T10:50:55.240' AS DateTime), 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'38d89181-846a-456a-89aa-4a028d311007', 61, CAST(N'2021-05-12' AS Date), N'補貼', CAST(61 AS Decimal(18, 0)), N'餐飲', N'TW-061    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'69c2f30c-0f4e-4ad1-97e8-4a117f4b3353', 22, CAST(N'2021-04-19' AS Date), N'補貼', CAST(600 AS Decimal(18, 0)), N'公差', N'TW-021    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'cfb0d8fe-bd50-4807-b54c-5a5028c0d88f', 16, CAST(N'2021-04-18' AS Date), N'公費', CAST(2011 AS Decimal(18, 0)), N'公差', N'TW-016    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'183d47c4-4591-4065-8456-5ca94003a68c', 68, CAST(N'2021-05-14' AS Date), N'繳費', CAST(68 AS Decimal(18, 0)), N'文具', N'TW-068    ', NULL, CAST(N'2021-05-14T11:25:47.233' AS DateTime), 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'afa9e036-f863-46e5-a85b-5f02e3ff74ba', 66, CAST(N'2021-05-14' AS Date), N'公費', CAST(666 AS Decimal(18, 0)), N'公差', N'TW-066    ', NULL, CAST(N'2021-05-14T11:06:08.287' AS DateTime), 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'ef1ff2b1-ae26-424c-a58a-6bcbac31e8c3', 28, CAST(N'2021-04-22' AS Date), N'公費', CAST(500 AS Decimal(18, 0)), N'其他', N'TW-024    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'095bcf2b-5583-44a0-b293-84791bd1e48c', 4, CAST(N'2021-04-17' AS Date), N'公費', CAST(300 AS Decimal(18, 0)), N'交通', N'TW-004    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'00d04733-ecb5-4441-9332-95170c2e0234', 30, CAST(N'2021-05-06' AS Date), N'公費', CAST(3333 AS Decimal(18, 0)), N'公差', N'TW-032    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'e29c42ac-ba3e-425a-acd1-95be3681e68e', 65, CAST(N'2021-05-11' AS Date), N'公費', CAST(65 AS Decimal(18, 0)), N'公差', N'TW-065    ', NULL, CAST(N'2021-05-11T11:36:00.650' AS DateTime), 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'bc227ad7-f194-4cf6-95d1-9780e97c44ef', 15, CAST(N'2021-04-18' AS Date), N'繳費', CAST(2011 AS Decimal(18, 0)), N'繳費', N'TW-015    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'76ca1353-2b01-4c45-a940-a4066f37a511', 20, CAST(N'2021-04-19' AS Date), N'預算', CAST(5000 AS Decimal(18, 0)), N'公差', N'TW-019    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'1aa2d0dd-9254-44ad-8d1a-a424be53d986', 2, CAST(N'2021-05-14' AS Date), N'公費', CAST(2001 AS Decimal(18, 0)), N'繳費', N'TW-002    ', CAST(N'2021-05-14T10:05:09.150' AS DateTime), NULL, 1)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'71d09f8f-4b85-4a5f-8db5-a7e741bd4dcb', 55, CAST(N'2021-05-13' AS Date), N'公費', CAST(100 AS Decimal(18, 0)), N'公差', N'TW-069    ', NULL, CAST(N'2021-05-26T10:25:47.790' AS DateTime), 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'daa7bce9-df62-4a61-8943-ac593d91a950', 19, CAST(N'2021-04-18' AS Date), N'補貼', CAST(5555 AS Decimal(18, 0)), N'其他', N'TW-018    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'cfa2229a-f6eb-4f80-b752-afb05c0c601d', 6, CAST(N'2021-04-17' AS Date), N'公費', CAST(230 AS Decimal(18, 0)), N'文具', N'TW-006    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'2dae2f67-6d79-4873-b211-b5ae8dac31e8', 64, CAST(N'2021-05-18' AS Date), N'補貼', CAST(64 AS Decimal(18, 0)), N'公差', N'TW-064    ', CAST(N'2021-05-11T11:33:02.977' AS DateTime), CAST(N'2021-05-11T11:29:13.430' AS DateTime), 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'8b86ca87-b963-463a-be29-c73ca02373be', 10, CAST(N'2021-05-01' AS Date), N'公費', CAST(350 AS Decimal(18, 0)), N'文具', N'TW-010    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'1aeb5065-8e02-430b-9023-c97982c79246', 5, CAST(N'2021-04-17' AS Date), N'公費', CAST(3000 AS Decimal(18, 0)), N'公差', N'TW-005    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'88a3e819-451c-44a7-87b9-d1ae43539f9e', 9, CAST(N'2021-04-17' AS Date), N'公費', CAST(400 AS Decimal(18, 0)), N'維修', N'TW-009    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'52591cd4-60d3-447f-9115-d4e2173b29e1', 63, CAST(N'2021-05-11' AS Date), N'公費', CAST(63 AS Decimal(18, 0)), N'公差', N'TW-063    ', CAST(N'2021-05-11T10:53:04.577' AS DateTime), CAST(N'2021-05-11T10:52:47.383' AS DateTime), 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'48be2383-2019-404e-81be-e03b142bea8a', 29, CAST(N'2021-05-05' AS Date), N'公費', CAST(11111 AS Decimal(18, 0)), N'公差', N'TW-033    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'3c5d424c-5ce2-4d21-9f71-e48fb854ad81', 23, CAST(N'2021-04-19' AS Date), N'公費', CAST(600 AS Decimal(18, 0)), N'公差', N'TW-022    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'29403e35-796a-4eab-8165-e4cdc348ac27', 67, CAST(N'2021-05-14' AS Date), N'補貼', CAST(67 AS Decimal(18, 0)), N'其他', N'TW-067    ', NULL, CAST(N'2021-05-14T11:22:48.680' AS DateTime), 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'ed15a9f0-082d-4523-b3f3-ea2a27e553f7', 13, CAST(N'2021-04-18' AS Date), N'補貼', CAST(5555 AS Decimal(18, 0)), N'公差', N'TW-013    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'e5b95ea4-e9e4-4c4e-85fc-ecdc12a6cbac', 8, CAST(N'2021-04-17' AS Date), N'公費', CAST(560 AS Decimal(18, 0)), N'公差', N'TW-008    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'3e248dfd-0d84-495c-bd8f-ecf050ab9732', 3, CAST(N'2021-05-12' AS Date), N'公費', CAST(250 AS Decimal(18, 0)), N'文具', N'TW-003    ', CAST(N'2021-05-27T14:56:20.613' AS DateTime), NULL, 1)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'5d18b8b7-eb06-4ed6-b33b-f2aa5e6ebd47', 60, CAST(N'2021-05-11' AS Date), N'公費', CAST(60 AS Decimal(18, 0)), N'公差', N'TW-060    ', NULL, NULL, 0)
INSERT [dbo].[零用金] ([GUID], [CaseID], [Date], [class], [pay], [Event], [invoiceCode], [Updatetime], [Createtime], [Isdelete]) VALUES (N'0d6b8b6e-9f71-4a45-9cc8-f7bb9863191e', 24, CAST(N'2021-04-19' AS Date), N'公費', CAST(600 AS Decimal(18, 0)), N'公差', N'TW-023    ', NULL, NULL, 0)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SubList]    Script Date: 2021/6/14 上午 09:29:13 ******/
ALTER TABLE [dbo].[SubList] ADD  CONSTRAINT [IX_SubList] UNIQUE NONCLUSTERED 
(
	[SubList] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assets]  WITH CHECK ADD  CONSTRAINT [FK_Assets_SubList] FOREIGN KEY([Sub])
REFERENCES [dbo].[SubList] ([SubList])
GO
ALTER TABLE [dbo].[Assets] CHECK CONSTRAINT [FK_Assets_SubList]
GO
