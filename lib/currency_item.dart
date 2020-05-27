import 'package:bitcoin_ticker/network_helper.dart';
import 'package:flutter/material.dart';

class CurrencyItem extends StatefulWidget {

  final cryptoCurrency;
  final targetCurrency;

  const CurrencyItem({this.cryptoCurrency, this.targetCurrency});

  @override
  _CurrencyItemState createState() => _CurrencyItemState();
}

class _CurrencyItemState extends State<CurrencyItem> {

  double rate;

  @override
  void initState() {
    super.initState();
    updateData();
  }

  @override
  void didUpdateWidget(CurrencyItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateData();
  }

  void updateData() async {
    var resultRate = await CoinNetworkHelper().getExchange(widget.cryptoCurrency, widget.targetCurrency);
    setState(() {
      rate = resultRate;
    });
  }

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
            rate == null ?  '1 ${widget.cryptoCurrency} = ? ${widget.targetCurrency}' : '1 ${widget.cryptoCurrency} = ${rate.toStringAsFixed(0)} ${widget.targetCurrency}',
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