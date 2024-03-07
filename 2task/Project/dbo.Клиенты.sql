CREATE TABLE [dbo].[Клиенты] (
    [client_id]           INT            IDENTITY (1, 1) NOT NULL,
    [client_name]         NVARCHAR (255) NOT NULL,
    [client_surname]      NVARCHAR (255) NOT NULL,
    [client_location]     NVARCHAR (1)   NOT NULL,
    [client_phone_number] INT            NOT NULL,
	[client_login] NVARCHAR (255)            NOT NULL,
	[client_password] NVARCHAR (255)            NOT NULL,
    PRIMARY KEY CLUSTERED ([client_id] ASC)
);

