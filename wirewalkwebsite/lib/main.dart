import 'package:flutter/material.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';
import 'package:wirewalkwebsite/components/footer.dart';
import 'package:wirewalkwebsite/components/linksHeader.dart';
import 'package:wirewalkwebsite/components/mainBody.dart';
import 'package:wirewalkwebsite/constants.dart';
import 'package:universal_html/html.dart' as html;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Constants.LIGHT;
    }
    return Constants.MED;
  }

  EdgeInsets getPadding(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return EdgeInsets.only(bottom: 20);
    }
    return EdgeInsets.only(bottom: 0, right: 0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wirewalk()↳',
      theme: ThemeData(
          fontFamily: 'Hollowcraft',
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith(
                      (state) => Colors.transparent),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (state) => Colors.transparent),
                  padding: MaterialStateProperty.resolveWith(
                      (state) => getPadding(state)),
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (state) => getColor(state)))),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith(
                      (state) => Colors.transparent),
                  elevation: MaterialStateProperty.resolveWith((state) => 0),
                  backgroundColor:
                      MaterialStateProperty.resolveWith((state) => Colors.transparent),
                  foregroundColor: MaterialStateProperty.resolveWith((state) => Constants.LIGHT)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scr = ScrollController();

  bool isTouchScreen() {
    String userAgent = html.window.navigator.userAgent.toString().toLowerCase();
    // smartphone
    if (userAgent.contains("iphone")) return true;
    if (userAgent.contains("android")) return true;

    // tablet
    if (userAgent.contains("ipad")) return true;
    if (html.window.navigator.platform.toLowerCase().contains("macintel") &&
        html.window.navigator.maxTouchPoints > 0) return true;

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: isTouchScreen() ? mobileBody() : webBody());
  }

  Widget webBody() {
    return SmoothScrollWeb(
        controller: scr,
        child: Container(
            color: Constants.DARK,
            child: Column(
              children: [
                LinksHeader(),
                Expanded(
                    child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: scr,
                        children: <Widget>[MainBody(scr: scr), Footer()]))
              ],
            )));
  }

  Widget mobileBody() {
    return Container(
        color: Constants.DARK,
        child: Column(
          children: [
            LinksHeader(),
            Expanded(
                child: ListView(
                    controller: scr,
                    children: <Widget>[MainBody(scr: scr), Footer()]))
          ],
        ));
  }
}
