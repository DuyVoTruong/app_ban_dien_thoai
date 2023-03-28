import 'package:app_ban_dien_thoai/model/DonHang.dart';
import 'package:app_ban_dien_thoai/view/seller/ChiTietDonHang.dart';
import 'package:app_ban_dien_thoai/view/seller/QuanLySanPham.dart';
import 'package:app_ban_dien_thoai/view/seller/ThemSanPham.dart';
import 'package:flutter/material.dart';

class QuanLyDonHang extends StatefulWidget{
  const QuanLyDonHang({super.key});
  State<QuanLyDonHang> createState() => _QuanLyDonHang();
}

class _QuanLyDonHang extends State<QuanLyDonHang>{
  final List donHang = <DonHang>[
    new DonHang(id: 1, image: "https://cdn.tgdd.vn/Products/Images/42/261888/realme-c35-thumb-new-600x600.jpg", gia: "100", tenSanPham: "Samsung A51", soLuong: "2", userId: 1, sanPhamId: 1, ngayDat: new DateTime.now()),
    new DonHang(id: 2, image: "https://cdn.tgdd.vn/Products/Images/42/261888/realme-c35-thumb-new-600x600.jpg", gia: "200", tenSanPham: "Iphone 12", soLuong: "2", userId: 1, sanPhamId: 2, ngayDat: new DateTime.now())
  ];

  void handleClick(int value, context) {
    switch (value) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => ThemSanPham()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => QuanLySanPham()));
        break;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đơn hàng"),
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: (item) => handleClick(item, context),
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('Thêm sản phẩm')),
              PopupMenuItem<int>(value: 1, child: Text('Quản lý sản phẩm')),
            ],
          ), //IconButton
        ],
      ),
      body: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: donHang.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              child: Center(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 88,
                      child: AspectRatio(
                        aspectRatio: 0.88,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0XFFF5F6F9),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.network(donHang[index].image.toString()),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          donHang[index].tenSanPham.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Text("Giá: "),
                            Text(donHang[index].gia.toString(), style: TextStyle(color: Colors.red),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Text("Số lượng: "),
                            Text(donHang[index].soLuong.toString(), style: TextStyle(color: Colors.red),),
                          ]
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Text("Ngày đặt: "),
                            Text(donHang[index].ngayDat.toString().substring(0,10), style: TextStyle(color: Colors.red),),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 50,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: (){},
                          child: Text("Xác nhận"),
                        ),
                        const SizedBox(height: 10,),
                        ElevatedButton(
                          onPressed: (){},
                          child: Text("Hủy"),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChiTietDonHang()));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}