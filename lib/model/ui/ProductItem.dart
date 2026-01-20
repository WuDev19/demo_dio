import 'package:demo_dio/model/response/Product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Function() onClick;
  final Function(Product product) onDismiss;

  const ProductItem({
    super.key,
    required this.product,
    required this.onClick,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.thumbnail),
      onDismissed: (direction) {
        onDismiss(product);
      },
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
              ),
              backgroundColor: Colors.lightGreen,
              icon: Image.asset(
                "assets/images/icon_avatar.png",
                width: 20,
                height: 20,
              ),
              title: Text("Xoa san pham"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("OK"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("Ko"),
                ),
              ],
            );
          },
        );
      },
      background: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
          ),
          child: Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Delete"),
            ),
          ),
        ),
      ),
      secondaryBackground: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
          ),
          child: Align(
            alignment: AlignmentGeometry.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text("Nothing"),
            ),
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      dismissThresholds: {DismissDirection.startToEnd: 0.2},
      child: InkWell(
        onTap: () => onClick(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
                    child: Image.network(
                      product.thumbnail,
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset("assets/images/icon_avatar.png");
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Text(product.motaSp),
                      SizedBox(height: 5),
                      Text(product.tenNguoiBan),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
