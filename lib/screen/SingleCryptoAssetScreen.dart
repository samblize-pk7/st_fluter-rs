import 'package:flutter/material.dart';

import 'package:st_resume/model/crypto.dart';

class SingleCryptoAssetScreen extends StatelessWidget {
  final CryptoModel coin;
  const SingleCryptoAssetScreen({@required this.coin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coin.name)),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Text(
                  coin.symbol,
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Image.network(
                    coin.logoUrl,
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            indent: 10,
            height: 1,
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Rank: ${coin.rank}',
                style: TextStyle(fontSize: 15),
              )),
          Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'price: \$${coin.price}',
                style: TextStyle(fontSize: 15),
              )),
          Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'MarketCap: ${coin.marketCap}',
                style: TextStyle(fontSize: 15),
              )),
          Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'MarketCap: ${coin.circulatingSupply}',
                style: TextStyle(fontSize: 15),
              )),
          Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'MarketCap: ${coin.maxSupply}',
                style: TextStyle(fontSize: 15),
              )),
          Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'MarketCap: ${coin.marketDominance}',
                style: TextStyle(fontSize: 15),
              )),
        ],
      ),
    );
  }
}
