USE [LyahNA]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 12.03.2024 17:30:53 ******/
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
/****** Object:  Table [dbo].[Категория_товара]    Script Date: 12.03.2024 17:30:53 ******/
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
/****** Object:  Table [dbo].[Клиенты]    Script Date: 12.03.2024 17:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[client_id] [int] IDENTITY(1,1) NOT NULL,
	[client_name] [nvarchar](255) NOT NULL,
	[client_surname] [nvarchar](255) NOT NULL,
	[client_location] [nvarchar](255) NOT NULL,
	[client_phone_number] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Продавцы]    Script Date: 12.03.2024 17:30:53 ******/
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
/****** Object:  Table [dbo].[Пункты_выдачи]    Script Date: 12.03.2024 17:30:53 ******/
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
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 12.03.2024 17:30:53 ******/
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
/****** Object:  Table [dbo].[Теги]    Script Date: 12.03.2024 17:30:53 ******/
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
/****** Object:  Table [dbo].[Товар]    Script Date: 12.03.2024 17:30:53 ******/
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

INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (1, N'Game')
INSERT [dbo].[Категория_товара] ([category_id], [category_name]) VALUES (2, N'Food')
SET IDENTITY_INSERT [dbo].[Категория_товара] OFF
GO
SET IDENTITY_INSERT [dbo].[Продавцы] ON 

INSERT [dbo].[Продавцы] ([seller_id], [seller_name], [seller_surname], [seller_Patronymic], [seller_location], [seller_INN], [seller_phone_number]) VALUES (3, N'Ivan', N'Ivanov', N'Ivanenko', N'Msk', N'66457457457', N'23562525')
SET IDENTITY_INSERT [dbo].[Продавцы] OFF
GO
SET IDENTITY_INSERT [dbo].[Пункты_выдачи] ON 

INSERT [dbo].[Пункты_выдачи] ([point_id], [pickup_points_location], [working_hours]) VALUES (1, N'400665, г. Волгоград, ул. Московская, 49, оф. 4', N'9-21')
INSERT [dbo].[Пункты_выдачи] ([point_id], [pickup_points_location], [working_hours]) VALUES (2, N'445465, г. Тольятти, ул. Некрасова, 35, оф. 37', N'9-21')
INSERT [dbo].[Пункты_выдачи] ([point_id], [pickup_points_location], [working_hours]) VALUES (3, N'420442, г. Казань, ул. Октябрьская, 29, оф. 51', N'9-21')
INSERT [dbo].[Пункты_выдачи] ([point_id], [pickup_points_location], [working_hours]) VALUES (4, N'400136, г. Волгоград, ул. Солнечная, 42, оф. 81', N'9-21')
SET IDENTITY_INSERT [dbo].[Пункты_выдачи] OFF
GO
SET IDENTITY_INSERT [dbo].[Сотрудники] ON 

INSERT [dbo].[Сотрудники] ([employee_id], [employee_name], [employee_surname], [employee_patronymic], [employee_location], [employee_INN], [employee_phone_number], [point_id], [employee_login], [employee_password], [employee_tag_id]) VALUES (2, N'Nikita', N'Lyah', N'Andreevich', N'Novosibirsk', N'569668885906', N'+7(913)483-30-88', 1, N'LyahNA', N'd6ae65396d7d363229d3aa454d971ba41b35be932c8d0ff1bd853e3d849b2581', 1)
SET IDENTITY_INSERT [dbo].[Сотрудники] OFF
GO
INSERT [dbo].[Теги] ([employee_tag_id], [tag]) VALUES (1, N'Admin')
INSERT [dbo].[Теги] ([employee_tag_id], [tag]) VALUES (2, N'employee')
GO
SET IDENTITY_INSERT [dbo].[Товар] ON 

INSERT [dbo].[Товар] ([product_id], [seller_id], [product_name], [price], [category_id], [Quantity]) VALUES (2, 3, N'Pineapple', 1000, 2, 10)
INSERT [dbo].[Товар] ([product_id], [seller_id], [product_name], [price], [category_id], [Quantity]) VALUES (6, 3, N'CS2', 100, 1, 10)
INSERT [dbo].[Товар] ([product_id], [seller_id], [product_name], [price], [category_id], [Quantity]) VALUES (9, 3, N'DOTA2', 500, 1, 5)
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
