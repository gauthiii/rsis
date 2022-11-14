import 'package:flutter/material.dart';
import 'package:rsis/rsis.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String x = "";
  String y = "Enter the text to encrypt/decrypt:";

  TextEditingController con = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RSIS Algorithm'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              y,
            ),
            Container(height: 10),
            SelectableText(
              x,
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(height: 10),
            Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                  controller: con,
                  decoration:
                      InputDecoration(hintText: 'Tap here to Enter Text'),
                )),
            Container(height: 10),
            RaisedButton(
              onPressed: () {
                setState(() {
                  y = "The encrypted text is:";
                  x = Rsis.encrypt(text: con.text.trim());
                });
              },
              child: Text("Encrypt"),
            ),
            Container(height: 10),
            RaisedButton(
              onPressed: () {
                setState(() {
                  y = "The decrypted text is:";
                  x = Rsis.decrypt(text: con.text.trim());
                });
              },
              child: Text("Decrypt"),
            ),
          ],
        ),
      ),
    );
  }
}
