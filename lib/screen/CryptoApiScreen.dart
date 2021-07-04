import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:st_resume/API/crypto_api.dart';

import 'package:st_resume/model/crypto.dart';
import 'package:st_resume/screen/SingleCryptoAssetScreen.dart';

class CryptoApiScreen extends StatefulWidget {
  @override
  _CryptoApiScreenState createState() => _CryptoApiScreenState();
}

class _CryptoApiScreenState extends State<CryptoApiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getCrypto(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: Text('none'));
            case ConnectionState.waiting:
              return Center(child: Text('Loading...'));
            case ConnectionState.done:
              if (snapshot.hasData) {
                List<CryptoModel> cryptos = [];
                snapshot.data.forEach((element) {
                  cryptos.add(CryptoModel.fromJson(element));
                });
                return ListView.builder(
                    itemCount: cryptos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(SingleCryptoAssetScreen(
                            coin: cryptos[index],
                          ));
                        },
                        child: Material(
                          elevation: 4,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(cryptos[index].rank),
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Image.network(
                                        cryptos[index].logoUrl,
                                        width: 40,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                    padding: EdgeInsets.only(left: 10),
                                    width: 100,
                                    child: Text(
                                      cryptos[index].name,
                                      textWidthBasis: TextWidthBasis.parent,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Text(
                                      '\$${cryptos[index].price}',
                                      style: TextStyle(color: Colors.green),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(
                  child: Text('error'),
                );
              }
              break;
            default:
          }
        },
      ),
    );
  }
}
