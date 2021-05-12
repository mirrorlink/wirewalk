import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wirewalkwebsite/components/bar.dart';

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
    bool bVisible = widget.scr.offset < 500;

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
        Opacity(
            opacity: barVisible ? 1 : 0,
            child: Bar(
              scaleFactor: scaleFactor,
              scr: widget.scr,
            )),
        Visibility(visible: !barVisible, child: Container()),
        Container(
          height: 100,
        )
      ])
    ]);
  }
}
