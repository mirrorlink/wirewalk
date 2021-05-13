import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wirewalkwebsite/components/bar.dart';
import 'package:wirewalkwebsite/components/city.dart';
import 'package:wirewalkwebsite/constants.dart';

class MainBody extends StatefulWidget {
  final ScrollController scr;

  const MainBody({Key key, @required this.scr}) : super(key: key);

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  bool barVisible = true;

  @override
  void initState() {
    super.initState();
    widget.scr.addListener(updatedScroll);
  }

  @override
  void dispose() {
    super.dispose();
    widget.scr.removeListener(updatedScroll);
  }

  void updatedScroll() {
    bool bVisible = widget.scr.offset < Constants.BAR_SCROLL;

    if (barVisible != bVisible) {
      setState(() {
        barVisible = bVisible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int scaleFactor = (MediaQuery.of(context).size.width / 150).floor();

    scaleFactor = min(scaleFactor, 5);

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(children: [
        Container(
          height: 50,
        ),
        Stack(children: [
          Positioned(
              top: 0,
              child: Opacity(
                  opacity: barVisible ? 1 : 0,
                  child: City(
                    scaleFactor: scaleFactor,
                    scr: widget.scr,
                  ))),
          Positioned(
              top: 0,
              child: Opacity(
                  opacity: barVisible ? 1 : 0,
                  child: Bar(
                    scaleFactor: scaleFactor,
                    scr: widget.scr,
                  ))),
        ]),
        Container(
          height: 100,
        )
      ])
    ]);
  }
}
