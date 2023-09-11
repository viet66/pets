﻿USE MASTER
IF EXISTS(SELECT * FROM SYSDATABASES WHERE NAME = 'SHOPTHUCUNG')
	DROP DATABASE SHOPTHUCUNG
GO
CREATE DATABASE SHOPTHUCUNG
GO
USE SHOPTHUCUNG
GO
CREATE TABLE DANHMUC
(
	MADANHMUC			CHAR(10)	PRIMARY KEY,
	TENDANHMUC			NVARCHAR(50)
)
GO
CREATE TABLE CHUONG
(
	IDCHUONG		INT		IDENTITY		PRIMARY KEY,
	TENCHUONG		NVARCHAR(20),
	TRANGTHAI	NVARCHAR(20)	DEFAULT N'Trống'
)
GO 
CREATE TABLE PET
(
	IDPET		INT		IDENTITY		PRIMARY KEY,
	MADANHMUC		CHAR(10)	DEFAULT 'CHO',
	TEN		NVARCHAR(100)	DEFAULT N'Chưa đặt tên',
	DONGIA		int DEFAULT 10000
	FOREIGN KEY(MADANHMUC) REFERENCES DANHMUC(MADANHMUC)
)
GO
CREATE TABLE HOADON
(
	IDHOADON	INT		IDENTITY		PRIMARY KEY,
	NGAYLAP		DATEtime,
	IDPET		INT		NULL,
	TRANGTHAI	NVARCHAR(20)	DEFAULT N'Chưa thanh toán'
	FOREIGN KEY (IDPET) REFERENCES PET(IDPET)
)
GO
CREATE TABLE CHITIETHOADON
(
	ID		    INT		IDENTITY		PRIMARY KEY,
	IDHOADON	INT		NOT NULL,
	IDPET		INT		NOT NULL,
	SOLUONG		INT		DEFAULT 1
	FOREIGN KEY (IDHOADON) REFERENCES HOADON(IDHOADON),
	FOREIGN KEY (IDPET) REFERENCES PET(IDPET)
)
GO



INSERT INTO DANHMUC VALUES( 'CHO', N'CHÓ')
INSERT INTO DANHMUC VALUES( 'MEO', N'MÈO')
GO



INSERT INTO CHUONG( TENCHUONG, TRANGTHAI) VALUES( N'CHUỒNG 1', N'Có người')
INSERT INTO CHUONG( TENCHUONG, TRANGTHAI) VALUES( N'CHUỒNG 2', N'Có người')
INSERT INTO CHUONG( TENCHUONG, TRANGTHAI) VALUES( N'CHUỒNG 3', N'Đã đặt')
INSERT INTO CHUONG( TENCHUONG) VALUES( N'CHUỒNG 4')
INSERT INTO CHUONG( TENCHUONG, TRANGTHAI) VALUES( N'CHUỒNG 5', N'Đã đặt')
INSERT INTO CHUONG( TENCHUONG) VALUES( N'CHUỒNG 6')
INSERT INTO CHUONG( TENCHUONG, TRANGTHAI) VALUES( N'CHUỒNG 7', N'Đã đặt')
INSERT INTO CHUONG( TENCHUONG) VALUES( N'CHUỒNG 8')
INSERT INTO CHUONG( TENCHUONG) VALUES( N'CHUỒNG 9')
GO



INSERT INTO PET(TEN, DONGIA) VALUES(N'Chó chihuahua', 20000)
INSERT INTO PET(TEN, DONGIA) VALUES(N'Chó Bắc Kinh', 15000)
INSERT INTO PET(TEN, DONGIA) VALUES(N'Chó lạp xưởng', 100000)
INSERT INTO PET(TEN, DONGIA) VALUES(N'Chó Phú Quốc', 20000)
INSERT INTO PET(TEN, DONGIA) VALUES(N'Chó Poodle', 30000)
INSERT INTO PET(TEN, DONGIA) VALUES(N'Chó Pug', 50000)
INSERT INTO PET(TEN, DONGIA) VALUES(N'Chó Alaska', 10000)
INSERT INTO PET(TEN, DONGIA) VALUES(N'Chó Husky', 10000)
INSERT INTO PET(TEN, DONGIA) VALUES(N'Chó Samoyed', 75000)
INSERT INTO PET(TEN, DONGIA) VALUES(N'Chó phốc sóc', 50000)
INSERT INTO PET(TEN, DONGIA) VALUES(N'Chó Pitbull', 5000)
INSERT INTO PET(MADANHMUC, TEN, DONGIA) VALUES('MEO', N'Mèo Mướp', 30000)
INSERT INTO PET(MADANHMUC, TEN, DONGIA) VALUES('MEO', N'Mèo Vàng', 12000)
INSERT INTO PET(MADANHMUC, TEN, DONGIA) VALUES('MEO', N'Mèo Xiêm', 10000)
INSERT INTO PET(MADANHMUC, TEN, DONGIA) VALUES('MEO', N'Mèo Ba Tư', 20000)
INSERT INTO PET(MADANHMUC, TEN, DONGIA) VALUES('MEO', N'Mèo tai cụp', 10000)
INSERT INTO PET(MADANHMUC, TEN, DONGIA) VALUES('MEO', N'Mèo mắt xanh', 5000)
GO



SET DATEFORMAT DMY
INSERT INTO HOADON(NGAYLAP, IDPET) VALUES(GETDATE(), 3) 
INSERT INTO HOADON(NGAYLAP, IDPET) VALUES(GETDATE(), 5) 
INSERT INTO HOADON(NGAYLAP, IDPET, TRANGTHAI) VALUES('01/01/2020', 5, N'Đã thanh toán') 
INSERT INTO HOADON(NGAYLAP, IDPET, TRANGTHAI) VALUES('05/11/2019', 1, N'Đã thanh toán')
INSERT INTO HOADON(NGAYLAP, IDPET, TRANGTHAI) VALUES('29/12/2019', 4, N'Đã thanh toán')
INSERT INTO HOADON(NGAYLAP, IDPET, TRANGTHAI) VALUES('12/10/2019', 9, N'Đã thanh toán')
INSERT INTO HOADON(NGAYLAP, IDPET, TRANGTHAI) VALUES('03/01/2020', 4, N'Đã thanh toán')
INSERT INTO HOADON(NGAYLAP, IDPET, TRANGTHAI) VALUES('13/01/2020', 6, N'Đã thanh toán')
INSERT INTO HOADON(NGAYLAP, IDPET, TRANGTHAI) VALUES('22/12/2019', 8, N'Đã thanh toán')
GO


INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(1, 3, 1)
INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(1, 8, 4)
INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(1, 9, 2)
INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(2, 10, 3)
INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(2, 6, 4)
INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(2, 11, 10)
INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(2, 2, 5)
INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(1, 14, 2)
INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(1, 13, 2)
INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(2, 14, 3)
INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(2, 15, 2)
INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(3, 3, 1)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(3, 1, 5)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(3, 4, 5)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(3, 2, 10)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(3, 8, 5)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(3, 10, 3)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(3, 11, 10)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(3, 15, 5)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(3, 13, 2)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(4, 2, 2)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(4, 9, 10)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(4, 11, 20)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(4, 5, 1)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(4, 3, 2)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(4, 1, 7)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(4, 10, 1)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(4, 7, 4)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(4, 17, 3)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(4, 14, 10)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(5, 7, 10)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(5, 9, 8)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(5, 1, 9)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(5, 3, 5)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(5, 6, 4)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(5, 5, 5)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(5, 11, 9)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(5, 8, 4)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(5, 2, 6)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(5, 4, 3)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(5, 17, 6)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(5, 13, 9)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(6, 8, 4)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(6, 9, 6)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(6, 5, 3)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(6, 4, 8)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(6, 3, 2)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(6, 1, 7)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(6, 2, 5)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(6, 10, 4)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(6, 7, 3)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(6, 15, 10)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(7, 5, 8)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(7, 4, 3)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(7, 2, 9)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(7, 9, 6)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(7, 13, 5)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(7, 12, 7)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(8, 5, 6)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(8, 3, 7)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(8, 1, 5)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(8, 2, 6)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(8, 7, 5)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(8, 10, 9)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(8, 16, 2)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(8, 12, 5)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(9, 2, 1)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(9, 3, 5)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(9, 7, 9)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(9, 8, 4)
	INSERT INTO CHITIETHOADON(IDHOADON, IDPET, SOLUONG) VALUES(9, 6, 2)
go



 create proc themPET
 @mahoadon int, @idpet int, @soluong int
 as
 begin
	if exists(select * from chitiethoadon where idhoadon = @mahoadon and IDPET = @idpet)
		begin
			declare @slcu int 
			select @slcu = soluong from chitiethoadon where idhoadon = @mahoadon and IDPET = @idpet
			declare @tongsl int =  @slcu + @soluong
			if(@tongsl >0)
				update chitiethoadon set soluong = @tongsl where idhoadon = @mahoadon and IDPET = @idpet
			else
				delete chitiethoadon where idhoadon = @mahoadon and IDPET = @idpet
		end
	else
		insert into chitiethoadon(idhoadon, IDPET, soluong) values (@mahoadon, @idpet, @soluong)
 end
 go



 create proc thongke
 as
 begin
	select hd.idhoadon as N'Mã hóa đơn', ngaylap as N'Ngày lập', tongtien as N'Tổng tiền', trangthai as N'Trạng thái'
	from hoadon hd,
		(select idhoadon, sum((soluong * dongia)) as tongtien
		from PET , chitiethoadon ct
		where PET.IDPET = ct.IDPET
		group by idhoadon) as tong
	where hd.idhoadon = tong.idhoadon
 end
 go



 create proc thongke_DaThanhToan
 as
 begin
	select hd.idhoadon as N'Mã hóa đơn', ngaylap as N'Ngày lập', tongtien as N'Tổng tiền', trangthai as N'Trạng thái'
	from hoadon hd,
		(select idhoadon, sum((soluong * dongia)) as tongtien
		from PET , chitiethoadon ct
		where PET.IDPET = ct.IDPET
		group by idhoadon) as tong
	where hd.idhoadon = tong.idhoadon and
		   trangthai = N'Đã thanh toán'
 end
 go



 create proc thongke_ChuaThanhToan
 as
 begin
	select hd.idhoadon as N'Mã hóa đơn', ngaylap as N'Ngày lập', tongtien as N'Tổng tiền', trangthai as N'Trạng thái'
	from hoadon hd,
		(select idhoadon, sum((soluong * dongia)) as tongtien
		from PET , chitiethoadon ct
		where PET.IDPET = ct.IDPET
		group by idhoadon) as tong
	where hd.idhoadon = tong.idhoadon and
		   trangthai = N'Chưa thanh toán'
 end
 go



 create proc xemchitiet(@idhoadon int)
 as
 begin
	select ten, soluong, dongia , (soluong * dongia) as thanhtien
	from hoadon hd, chitiethoadon ct, PET m
	where hd.idhoadon = ct.idhoadon and
		   m.IDPET = ct.IDPET and 
		   hd.idhoadon = @idhoadon
 end
go




create proc tongtien(@mahoadon int)
as
begin
	select sum((soluong * dongia)) as tongtien
	from PET , chitiethoadon ct
	where PET.IDPET = ct.IDPET and 
		  idhoadon = @mahoadon
	group by idhoadon
end
go


