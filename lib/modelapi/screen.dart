import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberapi/modelapi/controller.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  final Controller productController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: Obx(
        () {
          if (productController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading:
                      Text(productController.productList[index].id.toString()),
                  title: Text(
                      productController.productList[index].title.toString()),
                      subtitle: Text(productController.productList[index].url.toString()),
                  trailing: Image(
                      image: NetworkImage(productController
                          .productList[index].thumbnailUrl
                          .toString())),
                );
              },
            );
          }
        },
      ),
    ));
  }
}