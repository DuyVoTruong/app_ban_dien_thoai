import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemSanPham extends StatefulWidget{
  const ThemSanPham({super.key});

  @override
  State<ThemSanPham> createState() => _ThemSanPham();
}

class _ThemSanPham extends State<ThemSanPham>{
  final controllerId = TextEditingController();
  final controllerTen = TextEditingController();
  final controllerMoTa = TextEditingController();
  final controllerGia = TextEditingController();
  final controllerHinhAnh = TextEditingController();

  CollectionReference collectionReference = FirebaseFirestore.instance.collection('SanPham');

  Future<void> addSanPham(){
    return collectionReference
        .add({
          "id": controllerId.text,
          "ten": controllerTen.text,
          "gia": int.parse(controllerGia.text),
          "image": controllerHinhAnh.text,
          "moTa": controllerMoTa.text,
        })
        .then((value) => print("SanPham Added"))
        .catchError((error) => print("Failed to add SanPham: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm sản phẩm"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: TextField(
                controller: controllerId,
                decoration: InputDecoration(
                  label: Text("Id"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: TextField(
                controller: controllerTen,
                decoration: InputDecoration(
                  label: Text("Tên"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: TextField(
                controller: controllerGia,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Giá"),
                  border: OutlineInputBorder(),
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: TextField(
                controller: controllerMoTa,
                decoration: InputDecoration(
                  label: Text("Mô tả"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: TextField(
                controller: controllerHinhAnh,
                decoration: InputDecoration(
                  label: Text("Hình ảnh"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ElevatedButton(
                onPressed: (){addSanPham();},
                child: Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}