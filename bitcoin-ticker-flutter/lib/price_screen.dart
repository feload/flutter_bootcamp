import 'package:flutter/material.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String btc = 'Nothing';
  String eth = 'Nothing';
  String ltc = 'Nothing';
  String currency = 'USD';
  CoinData coinData = CoinData();

  @override
  void initState() {
    super.initState();
    getCurrency();
  }

  void setCurrency(String newCurrency) {
    currency = newCurrency;
    getCurrency();
  }

  void getCurrency() async {
    var btcResponse = await coinData.getData('BTC$currency');
    var ethResponse = await coinData.getData('ETH$currency');
    var ltcResponse = await coinData.getData('LTC$currency');

    setState(() {
      btc = btcResponse.toString();
      eth = ethResponse.toString();
      ltc = ltcResponse.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CurrencyButton(crypto: 'BTC', currency: currency, total: btc,),
          CurrencyButton(crypto: 'ETH', currency: currency, total: eth,),
          CurrencyButton(crypto: 'LTC', currency: currency, total: ltc,),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(
              value: currency,
              items: currenciesList.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (selectedValue) {
               setCurrency(selectedValue);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CurrencyButton extends StatelessWidget {

  CurrencyButton({this.crypto, this.total, this.currency});

  final String total;
  final String currency;
  final String crypto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $total $currency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}