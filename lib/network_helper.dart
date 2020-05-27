import 'package:bitcoin_ticker/coin_data.dart';
/**
    {
    "time": "2020-05-27T14:36:03.0876323Z",
    "asset_id_base": "BTC",
    "asset_id_quote": "USD",
    "rate": 9145.786192694357099758962665
    }
 **/
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class CoinNetworkHelper {

  final exchangeUrl = 'https://rest.coinapi.io/v1/exchangerate';
  Future getExchange(String fromCurrency, String toCurrency ) async {
    // Await the http get response, then decode the json-formatted response.
    print("$exchangeUrl/$fromCurrency/$toCurrency?apikey=$coinAPIKey");
    var response = await http.get("$exchangeUrl/$fromCurrency/$toCurrency?apikey=$coinAPIKey");

    if (response.statusCode == 200) {
      try {
        var jsonResponse = convert.jsonDecode(response.body);
        return jsonResponse['rate'];
      }catch(exception){
        print(exception);
        return 0.0;
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

}