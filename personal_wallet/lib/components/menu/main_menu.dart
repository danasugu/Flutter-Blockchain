import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainMenu extends StatelessWidget {
  MainMenu({this.address, this.onReset});

  final String address;
  final Function onReset;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Get tokens"),
            subtitle: Text("Claim some test tokens"),
            trailing: Icon(Icons.wine_bar, color: Colors.blue),
            onTap: () async {
              var url = 'https://faucet.clempe.dev?address=${this.address}';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          ListTile(
            title: Text("Get ETH"),
            subtitle: Text("Claim some test ether"),
            trailing: Icon(
              Icons.money,
              color: Colors.black,
            ),
            onTap: () async {
              var url = 'https://faucet.ropsten.be';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          ListTile(
              title: Text("Reset wallet"),
              subtitle: Text("Wipe all wallet data"),
              trailing: Icon(
                Icons.supervised_user_circle_rounded,
                color: Colors.orange,
              ),
              onTap: this.onReset),
        ],
      ),
    );
  }
}
