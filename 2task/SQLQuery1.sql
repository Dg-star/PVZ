GO
CREATE TABLE [dbo].[Товар](
	[product_id] INT IDENTITY NOT NULL,
	[seller_id] INT NOT NULL,
	[product_name] NVARCHAR (255) NOT NULL,
	[price] INT NOT NULL DEFAULT 0,
	[category_id] INT NOT NULL DEFAULT 1,
	PRIMARY KEY CLUSTERED([product_id] ASC)
)

CREATE TABLE [dbo].[Продавцы](
	[seller_id] INT IDENTITY NOT NULL,
	[seller_name] NVARCHAR (255) NOT NULL,
	[seller_surname] NVARCHAR (255) NOT NULL,
	[seller_Patronymic] NVARCHAR (255) NOT NULL,
	[seller_location] NVARCHAR (255) NOT NULL,
	[seller_INN] INT NOT NULL,
	[seller_phone_number] INT NOT NULL,
	PRIMARY KEY CLUSTERED([seller_id] ASC)
)

CREATE TABLE [dbo].[Сотрудники](
	[employee_id] INT IDENTITY NOT NULL,
	[employee_name] NVARCHAR (255) NOT NULL,
	[employee_surname] NVARCHAR (255) NOT NULL,
	[employee_patronymic] NVARCHAR (255) NOT NULL,
	[employee_location] NVARCHAR (255) NOT NULL,
	[employee_INN] INT NOT NULL,
	[employee_phone_number] INT NOT NULL,
	[point_id] INT NOT NULL,
	PRIMARY KEY CLUSTERED([employee_id] ASC)
)

CREATE TABLE [dbo].[Клиенты](
	[client_id] INT IDENTITY NOT NULL,
	[client_name] NVARCHAR (255) NOT NULL,
	[client_surname] NVARCHAR (255) NOT NULL,
	[client_location] NVARCHAR (255) NOT NULL,
	[client_phone_number] INT NOT NULL,
	PRIMARY KEY CLUSTERED([client_id] ASC)
)

CREATE TABLE [dbo].[Заказы](
	[order_id] INT IDENTITY NOT NULL,
	[client_id] INT NOT NULL,
	[product_id] INT NOT NULL,
	[point_id] INT NOT NULL,	
	[order_date] datetime NOT NULL,
	PRIMARY KEY CLUSTERED([order_id] ASC)
)

CREATE TABLE [dbo].[Пункты_выдачи](
	[point_id] INT IDENTITY NOT NULL,
	[pickup_points_location] NVARCHAR (255) NOT NULL,
	[working_hours] NVARCHAR (255) NOT NULL,
	PRIMARY KEY CLUSTERED([point_id] ASC)
)

CREATE TABLE [dbo].[Категория_товара](
	[category_id] INT IDENTITY NOT NULL,
	[category_name] NVARCHAR (255) NOT NULL,
	PRIMARY KEY CLUSTERED([category_id] ASC)

);

GO
ALTER TABLE [dbo].[Товар]
ADD CONSTRAINT fk_seller
FOREIGN KEY (seller_id)
REFERENCES [dbo].[Продавцы] (seller_id);

GO
ALTER TABLE [dbo].[Товар]
ADD CONSTRAINT fk_category
FOREIGN KEY (category_id)
REFERENCES [dbo].[Категория_товара] (category_id);

GO
ALTER TABLE [dbo].[Сотрудники]
ADD CONSTRAINT fk_point
FOREIGN KEY (point_id)
REFERENCES [dbo].[Пункты_выдачи] (point_id);


GO
ALTER TABLE [dbo].[Заказы]
ADD CONSTRAINT fk_client
FOREIGN KEY (client_id)
REFERENCES [dbo].[Клиенты] (client_id);

GO
ALTER TABLE [dbo].[Заказы]
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES [dbo].[Товар] (product_id);

GO
ALTER TABLE [dbo].[Заказы]
ADD CONSTRAINT fk_point_order
FOREIGN KEY (point_id)
REFERENCES [dbo].[Пункты_выдачи] (point_id);