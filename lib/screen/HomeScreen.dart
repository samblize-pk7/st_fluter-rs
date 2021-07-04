import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sajjad Alizadeh'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/crypto_api');
                    },
                    child: Text('Crypto price API'))),
            Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // background
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      Get.toNamed('/todo');
                    },
                    child: Text('TO DO App ')))
          ],
        ),
      ),
    );
  }
}
