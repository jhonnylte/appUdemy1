import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'app',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int pessoas = 0;
  String _permissao = "Entre!";
  void acresc(int changePeople) {
    setState(() {
      if (0 <= pessoas && pessoas <= 40) {
        if (pessoas > 0 && changePeople < 0) pessoas += changePeople;
        if (pessoas < 40 && changePeople > 0) pessoas += changePeople;
        if (pessoas == 0 && changePeople < 0) _permissao = "Vazio!";
        if (pessoas == 40 && changePeople > 0) _permissao = "Lotado!";
        if (1 <= pessoas && pessoas <= 39) _permissao = "Entre!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/busao.png",
          fit: BoxFit.scaleDown,
          height: 750,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $pessoas",
                style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.red, // foreground
                      ),
                      onPressed: () {
                        acresc(-1);
                      },
                      child: Text(
                        '-1',
                        style: TextStyle(fontSize: 60),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.lightGreen, // foreground
                    ),
                    onPressed: () {
                      acresc(1);
                    },
                    child: Text('+1', style: TextStyle(fontSize: 60)),
                  ),
                )
              ],
            ),
            Text("$_permissao",
                style: TextStyle(
                    color: Colors.yellow, fontStyle: FontStyle.italic)),
          ],
        )
      ],
    );
  }
}
