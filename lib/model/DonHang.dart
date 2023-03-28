import 'package:flutter/material.dart';

class DonHang {
  int id;
  int userId;
  int sanPhamId;
  String tenSanPham;
  String gia;
  String soLuong;
  String image;
  DateTime ngayDat;

  DonHang({
    required this.id,
    required this.userId,
    required this.sanPhamId,
    required this.tenSanPham,
    required this.gia,
    required this.soLuong,
    required this.image,
    required this.ngayDat
  });
}