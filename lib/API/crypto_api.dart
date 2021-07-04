import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> getCrypto() async {
  final String key = 'key=877cba04b2e0979d57511c204f96a00f50c02575';
  final url = Uri.parse(
      'https://api.nomics.com/v1/currencies/ticker?$key&interval=1d&convert=USD&per-page=100&page=1&sort=rank');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    List jsonCrypto = jsonDecode(response.body);

    return jsonCrypto;
  }
}
