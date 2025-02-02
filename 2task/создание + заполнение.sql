USE [master]
GO
/****** Object:  Database [LyahNA]    Script Date: 15.03.2024 15:38:07 ******/
CREATE DATABASE [LyahNA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LyahNA', FILENAME = N'C:\Users\DG\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\LyahNA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LyahNA_log', FILENAME = N'C:\Users\DG\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\LyahNA.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LyahNA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LyahNA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LyahNA] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [LyahNA] SET ANSI_NULLS ON 
GO
ALTER DATABASE [LyahNA] SET ANSI_PADDING ON 
GO
ALTER DATABASE [LyahNA] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [LyahNA] SET ARITHABORT ON 
GO
ALTER DATABASE [LyahNA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LyahNA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LyahNA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LyahNA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LyahNA] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [LyahNA] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [LyahNA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LyahNA] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [LyahNA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LyahNA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LyahNA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LyahNA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LyahNA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LyahNA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LyahNA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LyahNA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LyahNA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LyahNA] SET RECOVERY FULL 
GO
ALTER DATABASE [LyahNA] SET  MULTI_USER 
GO
ALTER DATABASE [LyahNA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LyahNA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LyahNA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LyahNA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LyahNA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LyahNA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LyahNA] SET QUERY_STORE = OFF
GO
USE [LyahNA]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 15.03.2024 15:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[point_id] [int] NOT NULL,
	[order_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Категория_товара]    Script Date: 15.03.2024 15:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Категория_товара](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 15.03.2024 15:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[client_id] [int] IDENTITY(1,1) NOT NULL,
	[client_name] [nvarchar](255) NOT NULL,
	[client_surname] [nvarchar](255) NOT NULL,
	[client_location] [nvarchar](255) NOT NULL,
	[client_phone_number] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Продавцы]    Script Date: 15.03.2024 15:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Продавцы](
	[seller_id] [int] IDENTITY(1,1) NOT NULL,
	[seller_name] [nvarchar](255) NOT NULL,
	[seller_surname] [nvarchar](255) NOT NULL,
	[seller_Patronymic] [nvarchar](255) NOT NULL,
	[seller_location] [nvarchar](255) NOT NULL,
	[seller_INN] [nvarchar](255) NOT NULL,
	[seller_phone_number] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[seller_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пункты_выдачи]    Script Date: 15.03.2024 15:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пункты_выдачи](
	[point_id] [int] IDENTITY(1,1) NOT NULL,
	[pickup_points_location] [nvarchar](255) NOT NULL,
	[working_hours] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[point_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 15.03.2024 15:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_name] [nvarchar](255) NOT NULL,
	[employee_surname] [nvarchar](255) NOT NULL,
	[employee_patronymic] [nvarchar](255) NOT NULL,
	[employee_location] [nvarchar](255) NOT NULL,
	[employee_INN] [nvarchar](255) NOT NULL,
	[employee_phone_number] [nvarchar](255) NOT NULL,
	[point_id] [int] NOT NULL,
	[employee_login] [nvarchar](255) NOT NULL,
	[employee_password] [nvarchar](255) NOT NULL,
	[employee_tag_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Теги]    Script Date: 15.03.2024 15:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Теги](
	[employee_tag_id] [int] NOT NULL,
	[tag] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товар]    Script Date: 15.03.2024 15:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товар](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[seller_id] [int] NOT NULL,
	[product_name] [nvarchar](255) NOT NULL,
	[price] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Категория_товара] ON 

INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1, N'Видеоигры')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (2, N'Еда')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1002, N'Обувь')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1003, N'Дом')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1004, N'Игрушки')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1005, N'Акссесуары')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1006, N'Детям')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1007, N'Зоотовары')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1008, N'Спорт')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1009, N'Книги')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1010, N'Сад и Дача')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1011, N'Канцтовары')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1012, N'Путешествия')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1013, N'Бытовая техника')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1014, N'Автотовары')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1015, N'Мебель')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1016, N'Электроника')
SET IDENTITY_INSERT [dbo].[Категория_товара] OFF
GO
SET IDENTITY_INSERT [dbo].[Клиенты] ON 

INSERT [dbo].[Клиенты] ([client_id], [client_name], [client_surname], [client_location], [client_phone_number]) VALUES (1, N'Ефим', N'Шадрин', N'Россия, г. Реутов, Дружбы ул., д. 5 кв.15', N'+7 (911) 922-73-25')
INSERT [dbo].[Клиенты] ([client_id], [client_name], [client_surname], [client_location], [client_phone_number]) VALUES (3, N'Зинаида', N'Павловская', N'Россия, г. Ессентуки, Майская ул., д. 7 кв.195', N'+7 (932) 419-15-14')
INSERT [dbo].[Клиенты] ([client_id], [client_name], [client_surname], [client_location], [client_phone_number]) VALUES (4, N'Никита', N'Пудин', N'Россия, г. Орск, Ленина В.И.ул., д. 17 кв.4', N'+7 (925) 407-60-27')
INSERT [dbo].[Клиенты] ([client_id], [client_name], [client_surname], [client_location], [client_phone_number]) VALUES (5, N'Галина', N'Шумякина', N'Россия, г. Ноябрьск, Восточная ул., д. 7 кв.74', N'+7 (918) 521-48-24')
INSERT [dbo].[Клиенты] ([client_id], [client_name], [client_surname], [client_location], [client_phone_number]) VALUES (6, N'Никифор', N'Чудов', N'Россия, г. Тюмень, Дружбы ул., д. 10 кв.146', N'+7 (935) 584-33-74')
INSERT [dbo].[Клиенты] ([client_id], [client_name], [client_surname], [client_location], [client_phone_number]) VALUES (9, N'Антон', N'Горячев', N'Россия, г. Петропавловск-Камчатский, Дружбы ул., д. 20 кв.86', N'+7 (937) 349-21-63')
INSERT [dbo].[Клиенты] ([client_id], [client_name], [client_surname], [client_location], [client_phone_number]) VALUES (11, N'Юлия', N'Сарычева', N'Россия, г. Армавир, Заречный пер., д. 20 кв.53', N'+7 (968) 166-30-14')
INSERT [dbo].[Клиенты] ([client_id], [client_name], [client_surname], [client_location], [client_phone_number]) VALUES (12, N'Римма', N'Тэна', N'Россия, г. Челябинск, Хуторская ул., д. 23 кв.121', N'+7 (983) 599-21-19')
INSERT [dbo].[Клиенты] ([client_id], [client_name], [client_surname], [client_location], [client_phone_number]) VALUES (13, N'Серафима', N'Лаврова', N'Россия, г. Якутск, Зеленая ул., д. 16 кв.119', N'+7 (921) 710-38-83')
INSERT [dbo].[Клиенты] ([client_id], [client_name], [client_surname], [client_location], [client_phone_number]) VALUES (14, N'Вениамин', N'Стаин', N'Россия, г. Норильск, Севернаяул., д. 22 кв.216', N'+7 (982) 908-69-24')
SET IDENTITY_INSERT [dbo].[Клиенты] OFF
GO
SET IDENTITY_INSERT [dbo].[Продавцы] ON 

INSERT [dbo].[Продавцы] ([seller_id], [seller_name], [seller_surname], [seller_Patronymic], [seller_location], [seller_INN], [seller_phone_number]) VALUES (3, N'Иван', N'Иванов', N'Иваненко', N'Россия, г. Саратов, 17 Сентября ул., д. 14 кв.60', N'351633397500', N'+7 (985) 349-51-765')
INSERT [dbo].[Продавцы] ([seller_id], [seller_name], [seller_surname], [seller_Patronymic], [seller_location], [seller_INN], [seller_phone_number]) VALUES (1004, N'Елена', N'Кувардина', N'Валериановна', N'Россия, г. Набережные Челны, Коммунистическая ул., д. 21 кв.42', N'028016191005', N'+7 (959) 380-65-20')
INSERT [dbo].[Продавцы] ([seller_id], [seller_name], [seller_surname], [seller_Patronymic], [seller_location], [seller_INN], [seller_phone_number]) VALUES (1006, N'Федор', N'Умаметев', N'Никитович', N'Россия, г. Тольятти, Колхозная ул., д. 22 кв.214', N'813629986007', N'+7 (947) 751-22-31')
INSERT [dbo].[Продавцы] ([seller_id], [seller_name], [seller_surname], [seller_Patronymic], [seller_location], [seller_INN], [seller_phone_number]) VALUES (1007, N'Семен', N'Гришачёв', N'Акимович', N'Россия, г. Нефтекамск, Зеленый пер., д. 25 кв.195', N'028923627550', N'+7 (916) 926-61-51')
INSERT [dbo].[Продавцы] ([seller_id], [seller_name], [seller_surname], [seller_Patronymic], [seller_location], [seller_INN], [seller_phone_number]) VALUES (1008, N'Павел', N'Симонов', N'Севастьянович', N'Россия, г. Ноябрьск, Пионерская ул., д. 1 кв.65', N'028923627550', N'+7 (915) 117-69-47')
INSERT [dbo].[Продавцы] ([seller_id], [seller_name], [seller_surname], [seller_Patronymic], [seller_location], [seller_INN], [seller_phone_number]) VALUES (1010, N'Емельян', N'Шаршин', N'Кириллович', N'Россия, г. Йошкар-Ола, Чапаева ул., д. 17 кв.54', N'028923627550', N'+7 (988) 383-32-27')
INSERT [dbo].[Продавцы] ([seller_id], [seller_name], [seller_surname], [seller_Patronymic], [seller_location], [seller_INN], [seller_phone_number]) VALUES (1011, N'Валерия', N'Труш', N'Антоновна', N'Россия, г. Кисловодск, Молодежная ул., д. 10 кв.190', N'964601095737', N'+7 (965) 249-29-46')
INSERT [dbo].[Продавцы] ([seller_id], [seller_name], [seller_surname], [seller_Patronymic], [seller_location], [seller_INN], [seller_phone_number]) VALUES (1012, N'Ева', N'Панкова', N'Климентьевна', N'Россия, г. Йошкар-Ола, Вокзальная ул., д. 25 кв.203', N'823129137700', N'+7 (962) 315-65-31')
INSERT [dbo].[Продавцы] ([seller_id], [seller_name], [seller_surname], [seller_Patronymic], [seller_location], [seller_INN], [seller_phone_number]) VALUES (1013, N'Антон', N'Ахвледиани', N'Григорьевич', N'Россия, г. Брянск, Чкалова ул., д. 14 кв.168', N'746088162354', N'+7 (917) 144-10-37')
INSERT [dbo].[Продавцы] ([seller_id], [seller_name], [seller_surname], [seller_Patronymic], [seller_location], [seller_INN], [seller_phone_number]) VALUES (1014, N'Ульяна', N'Дубинина', N'Филипповна', N'Россия, г. Димитровград, Советская ул., д. 4 кв.119', N'028235475546', N'+7 (993) 424-72-41')
INSERT [dbo].[Продавцы] ([seller_id], [seller_name], [seller_surname], [seller_Patronymic], [seller_location], [seller_INN], [seller_phone_number]) VALUES (1015, N'Петр', N'Шпикалов', N'Григорьевич', N'Россия, г. Находка, Дорожная ул., д. 10 кв.43', N'729249192108', N'+7 (943) 207-78-74')
INSERT [dbo].[Продавцы] ([seller_id], [seller_name], [seller_surname], [seller_Patronymic], [seller_location], [seller_INN], [seller_phone_number]) VALUES (1016, N'Валентина', N'Дуркина', N'Макаровна', N'Россия, г. Рубцовск, Максима Горького ул., д. 11 кв.39', N'734514514546', N'+7 (938) 982-13-33')
INSERT [dbo].[Продавцы] ([seller_id], [seller_name], [seller_surname], [seller_Patronymic], [seller_location], [seller_INN], [seller_phone_number]) VALUES (1017, N'Александра', N'Севастьянова', N'Николаевна', N'Россия, г. Иркутск, Строителей ул., д. 21 кв.73', N'212370345372', N'+7 (957) 423-62-80')
SET IDENTITY_INSERT [dbo].[Продавцы] OFF
GO
SET IDENTITY_INSERT [dbo].[Пункты_выдачи] ON 

INSERT [dbo].[Пункты_выдачи] ([point_id], [pickup_points_location], [working_hours]) VALUES (1, N'400665, г. Волгоград, ул. Московская, 49, оф. 4', N'9-21')
INSERT [dbo].[Пункты_выдачи] ([point_id], [pickup_points_location], [working_hours]) VALUES (2, N'445465, г. Тольятти, ул. Некрасова, 35, оф. 37', N'9-21')
INSERT [dbo].[Пункты_выдачи] ([point_id], [pickup_points_location], [working_hours]) VALUES (3, N'420442, г. Казань, ул. Октябрьская, 29, оф. 51', N'9-21')
INSERT [dbo].[Пункты_выдачи] ([point_id], [pickup_points_location], [working_hours]) VALUES (4, N'400136, г. Волгоград, ул. Солнечная, 42, оф. 81', N'9-21')
INSERT [dbo].[Пункты_выдачи] ([point_id], [pickup_points_location], [working_hours]) VALUES (1002, N'833790, Липецкая область, город Орехово-Зуево, въезд Сталина, 49', N'9-21')
INSERT [dbo].[Пункты_выдачи] ([point_id], [pickup_points_location], [working_hours]) VALUES (1003, N'294033, Амурская область, город Талдом, пл. Бухарестская, 41', N'9-21')
INSERT [dbo].[Пункты_выдачи] ([point_id], [pickup_points_location], [working_hours]) VALUES (1004, N'680746, Псковская область, город Клин, ул. Гагарина, 12', N'9-21')
INSERT [dbo].[Пункты_выдачи] ([point_id], [pickup_points_location], [working_hours]) VALUES (1006, N'566713, Ярославская область, город Павловский Посад, пер. Гагарина, 31', N'9-21')
INSERT [dbo].[Пункты_выдачи] ([point_id], [pickup_points_location], [working_hours]) VALUES (1007, N'458847, Сахалинская область, город Талдом, въезд Бухарестская, 72', N'9-21')
SET IDENTITY_INSERT [dbo].[Пункты_выдачи] OFF
GO
SET IDENTITY_INSERT [dbo].[Сотрудники] ON 

INSERT [dbo].[Сотрудники] ([employee_id], [employee_name], [employee_surname], [employee_patronymic], [employee_location], [employee_INN], [employee_phone_number], [point_id], [employee_login], [employee_password], [employee_tag_id]) VALUES (2, N'Nikita', N'Lyah', N'Andreevich', N'Novosibirsk', N'569668885906', N'+7(913)483-30-88', 1, N'LyahNA', N'd6ae65396d7d363229d3aa454d971ba41b35be932c8d0ff1bd853e3d849b2581', 1)
SET IDENTITY_INSERT [dbo].[Сотрудники] OFF
GO
INSERT [dbo].[Теги] ([employee_tag_id], [tag]) VALUES (1, N'Admin')
INSERT [dbo].[Теги] ([employee_tag_id], [tag]) VALUES (2, N'Employee')
INSERT [dbo].[Теги] ([employee_tag_id], [tag]) VALUES (3, N'Default')
GO
SET IDENTITY_INSERT [dbo].[Товар] ON 

INSERT [dbo].[Товар] ([product_id], [seller_id], [product_name], [price], [category_id], [Quantity]) VALUES (2, 1004, N'Яблоки(Малайзия) 10 шт', 600, 2, 10)
INSERT [dbo].[Товар] ([product_id], [seller_id], [product_name], [price], [category_id], [Quantity]) VALUES (6, 1006, N'Cyberpunk 2077: Ultimate Edition', 7399, 1, 3)
INSERT [dbo].[Товар] ([product_id], [seller_id], [product_name], [price], [category_id], [Quantity]) VALUES (9, 1006, N'Fallout 76', 899, 1, 5)
INSERT [dbo].[Товар] ([product_id], [seller_id], [product_name], [price], [category_id], [Quantity]) VALUES (1005, 1007, N'Мандарины(Марокко)10шт', 700, 2, 5)
INSERT [dbo].[Товар] ([product_id], [seller_id], [product_name], [price], [category_id], [Quantity]) VALUES (1007, 1013, N'Токийский гуль. Книга 1', 831, 1009, 20)
INSERT [dbo].[Товар] ([product_id], [seller_id], [product_name], [price], [category_id], [Quantity]) VALUES (1008, 1013, N'Токийский гуль. Книга 2', 678, 1009, 15)
INSERT [dbo].[Товар] ([product_id], [seller_id], [product_name], [price], [category_id], [Quantity]) VALUES (1009, 1012, N'Подушка ортопедическая', 1136, 1003, 6)
INSERT [dbo].[Товар] ([product_id], [seller_id], [product_name], [price], [category_id], [Quantity]) VALUES (1010, 1011, N'Термометр комнатный гигрометр', 281, 1003, 40)
INSERT [dbo].[Товар] ([product_id], [seller_id], [product_name], [price], [category_id], [Quantity]) VALUES (1012, 1017, N'Увеличитель для телефона', 255, 1016, 20)
INSERT [dbo].[Товар] ([product_id], [seller_id], [product_name], [price], [category_id], [Quantity]) VALUES (1013, 1016, N'Лампочка фонарик usb портативная светодиодная', 149, 1016, 50)
SET IDENTITY_INSERT [dbo].[Товар] OFF
GO
ALTER TABLE [dbo].[Товар] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[Товар] ADD  DEFAULT ((1)) FOR [category_id]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [fk_client] FOREIGN KEY([client_id])
REFERENCES [dbo].[Клиенты] ([client_id])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [fk_client]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [fk_point_order] FOREIGN KEY([point_id])
REFERENCES [dbo].[Пункты_выдачи] ([point_id])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [fk_point_order]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [fk_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Товар] ([product_id])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [fk_product]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [fk_employee_tag_id] FOREIGN KEY([employee_tag_id])
REFERENCES [dbo].[Теги] ([employee_tag_id])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [fk_employee_tag_id]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [fk_point] FOREIGN KEY([point_id])
REFERENCES [dbo].[Пункты_выдачи] ([point_id])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [fk_point]
GO
ALTER TABLE [dbo].[Товар]  WITH CHECK ADD  CONSTRAINT [fk_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Категория_товара] ([category_id])
GO
ALTER TABLE [dbo].[Товар] CHECK CONSTRAINT [fk_category]
GO
ALTER TABLE [dbo].[Товар]  WITH CHECK ADD  CONSTRAINT [fk_seller] FOREIGN KEY([seller_id])
REFERENCES [dbo].[Продавцы] ([seller_id])
GO
ALTER TABLE [dbo].[Товар] CHECK CONSTRAINT [fk_seller]
GO
USE [master]
GO
ALTER DATABASE [LyahNA] SET  READ_WRITE 
GO
