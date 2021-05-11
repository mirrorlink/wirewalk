import 'package:flutter/material.dart';
import 'package:wirewalkwebsite/components/footer.dart';
import 'package:wirewalkwebsite/components/linksHeader.dart';
import 'package:wirewalkwebsite/components/mainBody.dart';
import 'package:wirewalkwebsite/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wirewalk()↳',
      theme: ThemeData(fontFamily: 'Hollowcraft'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Constants.DARK,
            child: Column(
              children: [
                LinksHeader(),
                Expanded(
                    child: ListView(children: <Widget>[MainBody(), Footer()]))
              ],
            )));
  }
}
