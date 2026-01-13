import 'package:demo_dio/ui/AllProductScreen.dart';
import 'package:demo_dio/model/request/ProductRequest.dart';
import 'package:flutter/material.dart';

class DioScreen extends StatelessWidget {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final giaController = TextEditingController();
  final motaController = TextEditingController();
  final thumbnailController = TextEditingController();
  final giamGiaController = TextEditingController();

  DioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox(width: 10),
            Text("Nhap id san pham: "),
            Spacer(),
            SizedBox(
              height: 50,
              width: 250,
              child: TextField(
                controller: idController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox(width: 10),
            Text("Nhap ten nguoi ban: "),
            Spacer(),
            SizedBox(
              height: 50,
              width: 250,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox(width: 10),
            Text("Nhap gia san pham: "),
            Spacer(),
            SizedBox(
              height: 50,
              width: 250,
              child: TextField(
                controller: giaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox(width: 10),
            Text("Nhap mo ta san pham: "),
            Spacer(),
            SizedBox(
              height: 50,
              width: 250,
              child: TextField(
                controller: motaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox(width: 10),
            Text("Nhap link anh thumbnail: "),
            Spacer(),
            SizedBox(
              height: 50,
              width: 250,
              child: TextField(
                controller: thumbnailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox(width: 10),
            Text("Nhap giam gia: "),
            Spacer(),
            SizedBox(
              height: 50,
              width: 250,
              child: TextField(
                controller: giamGiaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          height: 100,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              // childAspectRatio: 2 //tỉ lệ width / height
              mainAxisExtent: 40,
            ),
            children: [
              ElevatedButton(
                onPressed: () async {
                  String ten = nameController.text;
                  int gia = int.parse(giaController.text);
                  String mota = motaController.text;
                  String thumbnail = thumbnailController.text;
                  int giamGia = int.parse(giamGiaController.text);
                  final pr = ProductRequest(
                    tenNguoiBan: ten,
                    giaSp: gia,
                    motaSp: mota,
                    thumbnail: thumbnail,
                    giamgia: giamGia,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                ),
                child: Text("Create", style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () async {
                  String ten = nameController.text;
                  int gia = int.parse(giaController.text);
                  String mota = motaController.text;
                  String thumbnail = thumbnailController.text;
                  int giamGia = int.parse(giamGiaController.text);
                  final pr = ProductRequest(
                    tenNguoiBan: ten,
                    giaSp: gia,
                    motaSp: mota,
                    thumbnail: thumbnail,
                    giamgia: giamGia,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
                child: Text("Update", style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                ),
                child: Text("Delete", style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () async {
                  String ten = nameController.text;
                  int gia = int.parse(giaController.text);
                  String mota = motaController.text;
                  String thumbnail = thumbnailController.text;
                  int giamGia = int.parse(giamGiaController.text);
                  print("$ten + $gia");
                  final pr = ProductRequest(
                    tenNguoiBan: ten,
                    giaSp: gia,
                    motaSp: mota,
                    thumbnail: thumbnail,
                    giamgia: giamGia,
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                child: Text("Patch", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => AllProductScreen()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreenAccent,
          ),
          child: Text("Get", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

}
