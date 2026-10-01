-- =============================================
-- DATABASE SCRIPT: WebOnline_De05 (Website Bán Giày)
-- Sinh viên: Đinh Phú Sỹ - MSSV: 24162109 - Đề số: 05
-- =============================================

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = N'WebOnline_De05')
BEGIN
    ALTER DATABASE WebOnline_De05 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE WebOnline_De05;
END
GO

CREATE DATABASE WebOnline_De05;
GO

USE WebOnline_De05;
GO

-- 1. Bảng UserRoles
CREATE TABLE UserRoles (
    roleId INT IDENTITY(1,1) PRIMARY KEY,
    roleName NVARCHAR(50) NULL
);
GO

-- 2. Bảng Seller
CREATE TABLE Seller (
    sellerId INT IDENTITY(1,1) PRIMARY KEY,
    sellername NVARCHAR(50) NULL,
    images NVARCHAR(500) NULL,
    status INT NULL
);
GO

-- 3. Bảng Users
CREATE TABLE Users (
    userId INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NULL,
    email NVARCHAR(100) NULL,
    fullname NVARCHAR(50) NULL,
    password NVARCHAR(50) NULL,
    images NVARCHAR(500) NULL,
    phone NVARCHAR(20) NULL,
    status INT NULL,
    code NVARCHAR(50) NULL,
    roleId INT NULL,
    sellerId INT NULL,
    CONSTRAINT FK_Users_UserRoles FOREIGN KEY (roleId) REFERENCES UserRoles(roleId),
    CONSTRAINT FK_Users_Seller FOREIGN KEY (sellerId) REFERENCES Seller(sellerId)
);
GO

-- 4. Bảng Category
CREATE TABLE Category (
    categoryId INT IDENTITY(1,1) PRIMARY KEY,
    categoryName NVARCHAR(200) NULL,
    images NVARCHAR(500) NULL,
    status INT NULL
);
GO

-- 5. Bảng Product
CREATE TABLE Product (
    productId INT IDENTITY(1,1) PRIMARY KEY,
    productName NVARCHAR(200) NULL,
    productCode BIGINT NULL,
    categoryId INT NULL,
    description NVARCHAR(500) NULL,
    price FLOAT NULL,
    amount INT NULL,
    stock INT NULL,
    images NVARCHAR(500) NULL,
    wishlist INT NULL,
    status INT NULL,
    createDate DATE NULL,
    sellerId INT NULL,
    CONSTRAINT FK_Product_Category FOREIGN KEY (categoryId) REFERENCES Category(categoryId) ON DELETE SET NULL,
    CONSTRAINT FK_Product_Seller FOREIGN KEY (sellerId) REFERENCES Seller(sellerId) ON DELETE SET NULL
);
GO

-- 6. Bảng Cart
CREATE TABLE Cart (
    cartId NVARCHAR(50) PRIMARY KEY,
    userId INT NULL,
    buyDate DATETIME NULL,
    status INT NULL,
    CONSTRAINT FK_Cart_Users FOREIGN KEY (userId) REFERENCES Users(userId)
);
GO

-- 7. Bảng CartItem
CREATE TABLE CartItem (
    cartItemId NVARCHAR(50) PRIMARY KEY,
    quantity INT NULL,
    unitPrice FLOAT NULL,
    productId INT NULL,
    cartId NVARCHAR(50) NULL,
    CONSTRAINT FK_CartItem_Product FOREIGN KEY (productId) REFERENCES Product(productId),
    CONSTRAINT FK_CartItem_Cart FOREIGN KEY (cartId) REFERENCES Cart(cartId)
);
GO

-- =============================================
-- INSERT SAMPLE DATA (CHUYÊN BIỆT CHO WEBSITE BÁN GIÀY)
-- =============================================

-- 1. Roles
SET IDENTITY_INSERT UserRoles ON;
INSERT INTO UserRoles (roleId, roleName) VALUES 
(1, N'ADMIN'),
(2, N'SELLER'),
(3, N'USER');
SET IDENTITY_INSERT UserRoles OFF;
GO

-- 2. Sellers (Cửa hàng giày)
SET IDENTITY_INSERT Seller ON;
INSERT INTO Seller (sellerId, sellername, images, status) VALUES
(1, N'Nike Official Store VN', N'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500', 1),
(2, N'Adidas Vietnam Flagship', N'https://images.unsplash.com/photo-1518002171953-a080ee817e1f?w=500', 1),
(3, N'Sneaker Buzz & Streetwear', N'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=500', 1);
SET IDENTITY_INSERT Seller OFF;
GO

-- 3. Users
SET IDENTITY_INSERT Users ON;
INSERT INTO Users (userId, username, email, fullname, password, images, phone, status, code, roleId, sellerId) VALUES
(1, N'admin', N'admin@gmail.com', N'Quản Trị Viên (Admin)', N'123456', N'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=200', N'0901234567', 1, NULL, 1, NULL),
(2, N'seller1', N'seller1@gmail.com', N'Nike Store Manager', N'123456', N'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?w=200', N'0912345678', 1, NULL, 2, 1),
(3, N'user1', N'phusy779@gmail.com', N'Đinh Phú Sỹ', N'123456', N'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=200', N'0987654321', 1, NULL, 3, NULL);
SET IDENTITY_INSERT Users OFF;
GO

-- 4. Categories (Danh mục giày)
SET IDENTITY_INSERT Category ON;
INSERT INTO Category (categoryId, categoryName, images, status) VALUES
(1, N'Giày Sneaker Thời Trang', N'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=500', 1),
(2, N'Giày Chạy Bộ (Running)', N'https://images.unsplash.com/photo-1584735935682-2f2b69dff9d2?w=500', 1),
(3, N'Giày Bóng Rổ & Thể Thao', N'https://images.unsplash.com/photo-1579338559194-a162d19bf842?w=500', 1),
(4, N'Giày Tây & Da Cao Cấp', N'https://images.unsplash.com/photo-1614252235316-8c857d38b5f4?w=500', 1);
SET IDENTITY_INSERT Category OFF;
GO

-- 5. Products (Sản phẩm giày phong phú)
SET IDENTITY_INSERT Product ON;
INSERT INTO Product (productId, productName, productCode, categoryId, description, price, amount, stock, images, wishlist, status, createDate, sellerId) VALUES
(1, N'Giày Nike Air Jordan 1 Retro High OG', 101, 1, N'Huyền thoại sneaker với chất liệu da cao cấp, phối màu Chicago kinh điển, đệm Air êm ái hỗ trợ tối đa.', 4850000, 20, 50, N'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=600', 35, 1, '2026-09-01', 1),
(2, N'Giày Nike Air Force 1 07 Triple White', 102, 1, N'Mẫu giày quốc dân tone trắng tinh tế, thiết kế cổ điển không lỗi mốt, đế cao su chống trượt bền bỉ.', 2950000, 45, 100, N'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=600', 50, 1, '2026-09-02', 1),
(3, N'Giày Chạy Bộ Nike Pegasus 40', 103, 2, N'Đôi giày chạy êm ái linh hoạt với công nghệ bọt React và 2 bộ đệm Zoom Air giúp bật nảy tối ưu trên mọi cung đường.', 3490000, 30, 80, N'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600', 28, 1, '2026-09-03', 1),
(4, N'Giày Chạy Bộ Adidas Ultraboost Light', 201, 2, N'Siêu phẩm chạy bộ với bộ đệm Light BOOST nhẹ hơn 30%, hoàn trả năng lượng vượt trội và thân thiện môi trường.', 4200000, 25, 60, N'https://images.unsplash.com/photo-1584735935682-2f2b69dff9d2?w=600', 42, 1, '2026-09-05', 2),
(5, N'Giày Sneaker Adidas Forum Low Classic', 202, 1, N'Phong cách bóng rổ thập niên 80 với quai dán đặc trưng, chất liệu da thật mềm mại, kiểu dáng năng động.', 2600000, 35, 90, N'https://images.unsplash.com/photo-1518002171953-a080ee817e1f?w=600', 19, 1, '2026-09-06', 2),
(6, N'Giày Sneaker Converse Chuck 70 Vintage', 301, 1, N'Biểu tượng văn hóa đường phố với vải Canvas 14oz dày dặn, đường chỉ may vintage, đế bóng cổ điển.', 1950000, 60, 150, N'https://images.unsplash.com/photo-1607522370275-f14206abe5d3?w=600', 65, 1, '2026-09-10', 3),
(7, N'Giày Vans Old Skool Black White', 302, 1, N'Dòng giày trượt ván kinh điển với sọc Jazz huyền thoại, đế Waffle bám đường cực tốt, bền chắc.', 1750000, 50, 120, N'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=600', 55, 1, '2026-09-12', 3),
(8, N'Giày Tây Oxford Nam Da Bò Cao Cấp', 401, 4, N'Giày da nam công sở phong cách Derby/Oxford chuẩn quý ông, da bò thật 100%, đế phíp may thủ công sang trọng.', 1890000, 20, 40, N'https://images.unsplash.com/photo-1614252235316-8c857d38b5f4?w=600', 15, 1, '2026-09-14', 3),
(9, N'Giày Sneaker Adidas Samba OG Black White', 203, 1, N'Cơn sốt thời trang đường phố toàn cầu, chất liệu da mềm phối da lộn mũi chữ T, đế gum đặc trưng.', 2700000, 40, 100, N'https://images.unsplash.com/photo-1587563871167-1ee9c731aefb?w=600', 70, 1, '2026-09-15', 2),
(10, N'Giày Thể Thao Adidas Superstar Cloud White', 204, 1, N'Huyền thoại mũi sò Shell-toe vượt thời gian, thiết kế 3 sọc răng cưa nguyên bản, lót đệm êm ái.', 2300000, 35, 80, N'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?w=600', 48, 1, '2026-09-16', 2);
SET IDENTITY_INSERT Product OFF;
GO

PRINT 'Database WebOnline_De05 (Giay Sneaker & Shoes Store) created successfully!';
GO
