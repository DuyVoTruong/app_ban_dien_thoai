import 'package:app_ban_dien_thoai/model/SanPham.dart';
import 'package:flutter/material.dart';

class ChiTietDonHang extends StatelessWidget{


  const ChiTietDonHang({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 200,
              child: AspectRatio(
                aspectRatio: 0.9,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Image.network("https://cdn.tgdd.vn/Products/Images/42/261888/realme-c35-thumb-new-600x600.jpg"),
                ),
              )
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(35), topLeft: Radius.circular(35)),
                  color: Color.fromRGBO(224, 255, 255, 1),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Text("Samsung A52", style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                    ),),
                    SizedBox(height: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Người đặt: "),
                            Text("Nguyễn Văn A"),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: <Widget>[
                                  Text("Sđt: "),
                                  Text("034584759"),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: <Widget>[
                                  Text("Ngày đặt: "),
                                  Text(DateTime.now().toString().substring(0,10)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: <Widget>[
                                  Text("Giá: "),
                                  Text("100"),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: <Widget>[
                                  Text("Số lượng: "),
                                  Text("10"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Text("Mô tả: "),
                            Text("Còn tốt"),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Text("Trạng thái: "),
                            Text("Chờ xác nhận"),
                          ],
                        ),
                        SizedBox(height: 30,),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Wrap(
                          spacing: 32,
                          runSpacing: 16,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: (){},
                              child: Text("Xác nhận"),
                            ),
                            ElevatedButton(
                              onPressed: (){},
                              child: Text("Hủy"),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}