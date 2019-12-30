import 'package:bitcoin_ticker/network_helper.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  NetworkHelper networkHelper;
  String endpoint = 'https://apiv2.bitcoinaverage.com/indices/global/ticker';

  CoinData(){
    networkHelper = NetworkHelper();
  }

  Future<double> getData(String symbol) async {
    String url = '$endpoint/$symbol';
    return await networkHelper.get(url);
  }
}
