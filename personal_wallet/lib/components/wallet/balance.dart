import 'package:flutter/material.dart';
import 'package:personal_wallet/components/copyButton/copy_button.dart';
import 'package:personal_wallet/utils/eth_amount_formatter.dart';

class Balance extends StatelessWidget {
  Balance({this.address, this.ethBalance, this.tokenBalance});

  final String address;
  final BigInt ethBalance;
  final BigInt tokenBalance;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(address ?? ""),
          CopyButton(
            text: const Text('Copy address'),
            value: address,
          ),
//          QrImage(
//            data: address ?? "",
//            size: 150.0,
//          ),
          Text(
            "${EthAmountFormatter(tokenBalance).format()} tokens",
            style: TextStyle(fontSize: 8),
          ),

          Text(
            "${EthAmountFormatter(ethBalance).format()} eth",
            style: TextStyle(fontSize: 8, color: Colors.blueGrey),
            // Theme.of(context).textTheme.body2.apply(color: Colors.blueGrey),
          )
        ],
      ),
    );
  }
}
