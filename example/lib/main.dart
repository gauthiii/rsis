import 'package:flutter/material.dart';
import 'package:rsis/rsis.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rsis',
      theme: ThemeData.dark(),
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
  String y = "Enter your message";

  TextEditingController con = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RSIS Algorithm'),
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: _getColorFromHex("#8E150D"),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(height: 30),
            Center(
                child: Text(
              y,
              style: const TextStyle(
                  fontFamily: "Alfa",
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
            Container(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(children: [
                  SelectableText(
                    x,
                    style: const TextStyle(
                        fontFamily: "Alfa",
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(height: 30),
                ])),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  minLines: 1,
                  maxLines: null,
                  style: const TextStyle(
                    fontFamily: "Alfa",
                    fontSize: 18,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold
                  ),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.5),
                    ),
                    hintStyle: TextStyle(
                        fontSize: 18,
                        fontFamily: "Mono",
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 29, 24, 24)),
                    hintText: 'Enter your Message',
                  ),
                  controller: con,
                )),
            Container(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                    width: 85,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () {
                        setState(() {
                          y = "The encrypted text is:";
                          x = Rsis.encrypt(text: con.text.trim());
                        });
                      },
                      child: Text("Encrypt"),
                    )),
                Container(width: 20),
                SizedBox(
                    width: 85,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () {
                        setState(() {
                          y = "The decrypted text is:";
                          x = Rsis.decrypt(text: con.text.trim());
                        });
                      },
                      child: Text("Decrypt"),
                    )),
                Container(width: 20),
                SizedBox(
                    width: 85,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () {
                        setState(() {
                          x = "";
                          y = "Enter your message";
                          con.clear();
                        });
                      },
                      child: Text("Reset"),
                    )),
              ]),
            ),
            Container(height: 30),
            const Center(
                child: SelectableText(
                    "Package created By: Gauthiii's Applications",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))),
            Container(height: 30),
          ],
        ),
      ),
    );
  }
}

_getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";

    return Color(int.parse("0x$hexColor"));
  }

  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
}
