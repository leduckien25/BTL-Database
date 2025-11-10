CREATE DATABASE VanChuyen;
USE VanChuyen;

CREATE TABLE KhachHang
(
  MaKhachHang CHAR(5) NOT NULL,
  HoTen NVARCHAR(50) NOT NULL,
  SDT CHAR(10) NOT NULL,
  DiaChi NVARCHAR(150) NOT NULL,
  Email VARCHAR(50),
  PRIMARY KEY (MaKhachHang)
);

CREATE TABLE DonHang
(
  MaDonHang CHAR(5) NOT NULL,
  DiaChiGui NVARCHAR(150) NOT NULL,
  SDTNguoiGui CHAR(10) NOT NULL,
  DiaChiNhan NVARCHAR(150) NOT NULL,
  SDTNguoiNhan CHAR(10) NOT NULL,
  NgayTao DATE NOT NULL,
  DichVu NVARCHAR(20) NOT NULL,
  SoTienThuHo REAL NOT NULL,
  PhiCuoc REAL NOT NULL,
  TrangThai NVARCHAR(20) NOT NULL,
  MaKhachHang CHAR(5) NOT NULL,
  PRIMARY KEY (MaDonHang),
  FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);

CREATE TABLE KienHang
(
  MaKienHang CHAR(6) NOT NULL,
  TrongLuong REAL NOT NULL,
  KichThuoc REAL,
  MaDonHang CHAR(5) NOT NULL,
  PRIMARY KEY (MaKienHang),
  FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang)
);

CREATE TABLE LoaiSanPham
(
  MaLoai CHAR(5) NOT NULL,
  TenLoai NVARCHAR(50) NOT NULL,
  PRIMARY KEY (MaLoai)
);

CREATE TABLE SanPham
(
  MaSanPham CHAR(5) NOT NULL,
  TenSanPham NVARCHAR(50) NOT NULL,
  SoLuong INT NOT NULL,
  TrongLuong REAL NOT NULL,
  KichThuoc REAL,
  MaKienHang CHAR(6) NOT NULL,
  MaLoai CHAR(5) NOT NULL,
  PRIMARY KEY (MaSanPham, MaKienHang),
  FOREIGN KEY (MaKienHang) REFERENCES KienHang(MaKienHang),
  FOREIGN KEY (MaLoai) REFERENCES LoaiSanPham(MaLoai)
);

CREATE TABLE NhanVien
(
  MaNhanVien CHAR(7) NOT NULL,
  HoTen NVARCHAR(50) NOT NULL,
  SDT CHAR(10) NOT NULL,
  DiaChi NVARCHAR(150) NOT NULL,
  Email VARCHAR(50),
  PRIMARY KEY (MaNhanVien)
);

CREATE TABLE CuocPhi
(
  LoaiDichVu NVARCHAR(20) NOT NULL,
  VungGiao NVARCHAR(150) NOT NULL,
  TrongLuongToiDa REAL NOT NULL,
  DonGia REAL NOT NULL,
  MaLoai CHAR(5) NOT NULL,
  PRIMARY KEY (LoaiDichVu, VungGiao, TrongLuongToiDa, MaLoai),
  FOREIGN KEY (MaLoai) REFERENCES LoaiSanPham(MaLoai)
);

CREATE TABLE NhanVienGiaoHang
(
  MaNhanVienGH CHAR(7) NOT NULL,
  PRIMARY KEY (MaNhanVienGH),
  FOREIGN KEY (MaNhanVienGH) REFERENCES NhanVien(MaNhanVien)
);

CREATE TABLE PhuongTien
(
  MaPhuongTien CHAR(5) NOT NULL,
  BienSo CHAR(15) NOT NULL,
  TaiTrong REAL NOT NULL,
  PRIMARY KEY (MaPhuongTien)
);

CREATE TABLE NhanVienVanChuyen
(
  MaNhanVienVC CHAR(7) NOT NULL,
  MaPhuongTien CHAR(5) NOT NULL,
  PRIMARY KEY (MaNhanVienVC),
  FOREIGN KEY (MaNhanVienVC) REFERENCES NhanVien(MaNhanVien),
  FOREIGN KEY (MaPhuongTien) REFERENCES PhuongTien(MaPhuongTien)
);

CREATE TABLE BuuCuc
(
  MaBuuCuc CHAR(5) NOT NULL,
  TenBuuCuc NVARCHAR(50) NOT NULL,
  DiaChi NVARCHAR(150) NOT NULL,
  LoaiHinh NVARCHAR(20) NOT NULL,
  PRIMARY KEY (MaBuuCuc)
);

CREATE TABLE NhanVienBuuCuc
(
  MaNhanVienBC CHAR(7) NOT NULL,
  MaBuuCuc CHAR(5) NOT NULL,
  PRIMARY KEY (MaNhanVienBC),
  FOREIGN KEY (MaNhanVienBC) REFERENCES NhanVien(MaNhanVien),
  FOREIGN KEY (MaBuuCuc) REFERENCES BuuCuc(MaBuuCuc)
);

CREATE TABLE SuKienVanHanh
(
  MaSuKien CHAR(5) NOT NULL,
  TenSuKien NVARCHAR(50) NOT NULL,
  ThoiGian DATETIME NOT NULL,
  MaKienHang CHAR(6) NOT NULL,
  MaNhanVienBC CHAR(7) NOT NULL,
  PRIMARY KEY (MaSuKien),
  FOREIGN KEY (MaKienHang) REFERENCES KienHang(MaKienHang),
  FOREIGN KEY (MaNhanVienBC) REFERENCES NhanVienBuuCuc(MaNhanVienBC)
);

CREATE TABLE ChuyenVanChuyen
(
  MaChuyen CHAR(5) NOT NULL,
  ThoiGianBatDau DATETIME NOT NULL,
  ThoiGianKetThuc DATETIME NOT NULL,
  MaPhuongTien CHAR(5) NOT NULL,
  MaBuuCucDen CHAR(5) NOT NULL,
  MaBuuCucDi CHAR(5) NOT NULL,
  PRIMARY KEY (MaChuyen),
  FOREIGN KEY (MaPhuongTien) REFERENCES PhuongTien(MaPhuongTien),
  FOREIGN KEY (MaBuuCucDen) REFERENCES BuuCuc(MaBuuCuc),
  FOREIGN KEY (MaBuuCucDi) REFERENCES BuuCuc(MaBuuCuc)
);

CREATE TABLE GiaoHang
(
  MaGiaoHang CHAR(5) NOT NULL,
  ThoiGian DATETIME NOT NULL,
  TrangThai NVARCHAR(20) NOT NULL,
  MaNhanVienGH CHAR(7) NOT NULL,
  MaDonHang CHAR(5) NOT NULL,
  PRIMARY KEY (MaGiaoHang),
  FOREIGN KEY (MaNhanVienGH) REFERENCES NhanVienGiaoHang(MaNhanVienGH),
  FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang)
);

CREATE TABLE ThanhToan
(
  MaThanhToan CHAR(5) NOT NULL,
  SoTien REAL NOT NULL,
  HinhThuc NVARCHAR(30) NOT NULL,
  ThoiGian DATETIME NOT NULL,
  TrangThai NVARCHAR(20) NOT NULL,
  MaDonHang CHAR(5) NOT NULL,
  PRIMARY KEY (MaThanhToan),
  FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang)
);

CREATE TABLE KhieuNai
(
  MaKhieuNai CHAR(5) NOT NULL,
  Ngay DATE NOT NULL,
  NoiDung NVARCHAR(500) NOT NULL,
  TrangThai NVARCHAR(20) NOT NULL,
  MaDonHang CHAR(5) NOT NULL,
  PRIMARY KEY (MaKhieuNai),
  FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang)
);

CREATE TABLE Chuyen_Kien
(
  MaChuyen CHAR(5) NOT NULL,
  MaKienHang CHAR(6) NOT NULL,
  PRIMARY KEY (MaChuyen, MaKienHang),
  FOREIGN KEY (MaChuyen) REFERENCES ChuyenVanChuyen(MaChuyen),
  FOREIGN KEY (MaKienHang) REFERENCES KienHang(MaKienHang)
);


CREATE PROCEDURE sp_ThemNhanVien
    @MaNhanVien CHAR(5),
    @HoTen NVARCHAR(50),
    @SDT CHAR(10),
    @DiaChi VARCHAR(150),
    @Email VARCHAR(50) = NULL,
    @MaPhuongTien CHAR(5) = NULL,
    @MaBuuCuc CHAR(5) = NULL
AS
BEGIN
    INSERT INTO NhanVien (MaNhanVien, HoTen, SDT, DiaChi, Email)
    VALUES (@MaNhanVien, @HoTen, @SDT, @DiaChi, @Email);

    IF @MaNhanVien LIKE 'NVBC%'
        INSERT INTO NhanVienBuuCuc (MaNhanVienBC, MaBuuCuc)
        VALUES (@MaNhanVien, @MaBuuCuc);

    ELSE IF @MaNhanVien LIKE 'NVVC%'
        INSERT INTO NhanVienVanChuyen (MaNhanVienVC, MaPhuongTien)
        VALUES (@MaNhanVien, @MaPhuongTien);

    ELSE IF @MaNhanVien LIKE 'NVGH%'
        INSERT INTO NhanVienGiaoHang (MaNhanVienGH)
        VALUES (@MaNhanVien);
END;
GO


CREATE TRIGGER trg_DonHang_Insert
ON DonHang
AFTER INSERT
AS
BEGIN
    UPDATE DonHang
    SET TrangThai = N'Đã tạo'
    WHERE MaDonHang IN (SELECT MaDonHang FROM inserted);
END;
GO

CREATE TRIGGER trg_SuKienVanHanh_Insert
ON SuKienVanHanh
AFTER INSERT
AS
BEGIN
    UPDATE D
    SET D.TrangThai = N'Trung chuyển'
    FROM DonHang D
    JOIN KienHang K ON D.MaDonHang = K.MaDonHang
    JOIN inserted I ON I.MaKienHang = K.MaKienHang;
END;
GO

CREATE TRIGGER trg_GiaoHang_Update
ON GiaoHang
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE D
    SET D.TrangThai = I.TrangThai
    FROM DonHang D
    JOIN inserted I ON D.MaDonHang = I.MaDonHang;
END;
GO


