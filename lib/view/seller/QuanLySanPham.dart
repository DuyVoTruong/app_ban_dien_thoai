import 'package:app_ban_dien_thoai/model/SanPham.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

CollectionReference collectionReference = FirebaseFirestore.instance.collection('SanPham');

Future<void> deleteSanPham(index) {
  return collectionReference
      .doc(index)
      .delete()
      .then((value) => print("SanPham Deleted"))
      .catchError((error) => print("Failed to delete SanPham: $error"));
}

class QuanLySanPham extends StatelessWidget{
  const QuanLySanPham({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản lý sản phẩm"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('SanPham').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data?.docs ?? []);
      }, ); }
  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 22.0),
      shrinkWrap: true,
      children: snapshot.map((data) =>
          _buildListItem(context, data)).toList(),
    ); }
  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final sanPham = SanPham.fromSnapshot(data);
    return Center(
      child: Column(
        children: <Widget>[
          Row(
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
                    child: Image.network(sanPham.image.toString()),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        sanPham.ten.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Text("Giá: "),
                          Text(sanPham.gia.toString(), style: TextStyle(color: Colors.red),),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                          children: <Widget>[
                            Text("Mô tả: "),
                            Text(sanPham.moTa.toString(), style: TextStyle(color: Colors.red),),
                          ]
                      ),
                    ],
                  )),
              const SizedBox(width: 50,),
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context){
                                final controllerId = TextEditingController(text: sanPham.id.toString());
                                final controllerTen = TextEditingController(text: sanPham.ten.toString());
                                final controllerMoTa = TextEditingController(text: sanPham.moTa.toString());
                                final controllerGia = TextEditingController(text: sanPham.gia.toString());
                                final controllerHinhAnh = TextEditingController(text: sanPham.image.toString());

                                Future<void> updateSanPham(index){
                                  return collectionReference
                                      .doc(index).update({
                                    "id": controllerId.text,
                                    "ten": controllerTen.text,
                                    "gia": int.parse(controllerGia.text),
                                    "image": controllerHinhAnh.text,
                                    "moTa": controllerMoTa.text,
                                  })
                                      .then((value) => print("SanPham Updated"))
                                      .catchError((error) => print("Failed to update SanPham: $error"));
                                }

                                return AlertDialog(
                                    title: Text("Update Dilaog"),
                                    content: Center(
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
                                            hintText: sanPham.id.toString(),
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
                                            hintText: sanPham.ten.toString(),
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
                                            hintText: sanPham.gia.toString(),
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
                                            hintText: sanPham.moTa.toString(),
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
                                            hintText: sanPham.image.toString(),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                        child: ElevatedButton(
                                          onPressed: (){
                                            updateSanPham(data.id);
                                          },
                                          child: Text("Update"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                              }
                          );
                        },
                        child: Text("Cập nhật"),
                      ),
                      const SizedBox(height: 10,),
                      ElevatedButton(
                        onPressed: (){
                          deleteSanPham(data.id);
                        },
                        child: Text("Xóa"),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(height: 16,),
        ],
      ),
    );
  }
}