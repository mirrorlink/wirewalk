import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wirewalkwebsite/constants.dart';

class Bug extends StatefulWidget {
  final int scale;
  final ScrollController scr;

  const Bug({Key key, @required this.scale, this.scr}) : super(key: key);

  @override
  _BugState createState() => _BugState();
}

class _BugState extends State<Bug> {
  double scrollPosition = 0;

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
    setState(() {
      scrollPosition = Constants.adjustOffset(widget.scr.offset, widget.scale);
    });
  }

  @override
  Widget build(BuildContext context) {
    double finalDesloc = min(scrollPosition, 1320);

    bool isFinal = finalDesloc == 1320;

    double desloc = (finalDesloc - Constants.BAR_SCROLL - 500) / 100 * 12;

    return Positioned(
        left: ((120 - desloc.toInt()) * widget.scale).roundToDouble(),
        top: (235 * widget.scale).roundToDouble(),
        child: Image.asset(
            'assets/minigame/images/websitesprites_' +
                (isFinal ? '08' : '07') +
                '.png',
            scale: (1 / widget.scale),
            filterQuality: FilterQuality.none));
  }
}
