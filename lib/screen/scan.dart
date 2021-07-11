import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'หน้าสแกน'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String scanresult;
  bool checkLineURL = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SizedBox(
              height: 300,
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ผลการสแกน",
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(scanresult ??= "ยังไม่มีข้อมูล",
                          style: TextStyle(fontSize: 25)),
                      checkLineURL
                          ? SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                                onPressed: () {},
                                color: Colors.green[900],
                                child: Text("ติดตามผ่านไลน์"),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: startScan,
        child: Icon(Icons.qr_code_scanner_sharp),
      ),
    );
  }

  startScan() async {
    //อ่านข้อมูลจาก barcode
    String cameraScanResult = await scanner.scan();
    setState(() {
      scanresult = cameraScanResult;
    });

    if (scanresult.contains("line.me")) {
      checkLineURL = true;
    }
  }
}
