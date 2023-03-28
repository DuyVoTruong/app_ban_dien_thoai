
import 'package:app_ban_dien_thoai/LoginPage.dart';
import 'package:app_ban_dien_thoai/view/seller/QuanLyDonHang.dart';
import 'package:app_ban_dien_thoai/view/user/pages/home/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  void handleClick(int value, context) {
    switch (value) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => QuanLyDonHang()));
        break;
    }
  }

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}