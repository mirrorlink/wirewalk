import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wirewalkwebsite/components/simpleAnim.dart';
import 'package:wirewalkwebsite/constants.dart';

class CityChar extends StatefulWidget {
  final int scale;
  final ScrollController scr;

  const CityChar({Key key, @required this.scale, this.scr}) : super(key: key);

  @override
  _CityCharState createState() => _CityCharState();
}

class _CityCharState extends State<CityChar> {
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
    double desloc =
        (min(scrollPosition, Constants.CITY_CHARWALK) - Constants.BAR_SCROLL) /
            (Constants.CITY_SCROLL - Constants.BAR_SCROLL) *
            152;

    if (scrollPosition < (Constants.BAR_SCROLL + 90)) {
      return Container();
    }

    if (scrollPosition >= Constants.CITY_CHARWALK) {
      return Positioned(
          left: (60 * widget.scale).roundToDouble(),
          top: ((60 + desloc.toInt()) * widget.scale).roundToDouble(),
          child: Image.asset('assets/minigame/images/websitesprites_17.png',
              scale: (1 / widget.scale), filterQuality: FilterQuality.none));
    }

    return SimpleAnim(
        x: 60,
        y: 60 + desloc.toInt(),
        timeEachFrameMs: 100,
        imageIds: [13, 15, 13, 15, 17, 17, 14, 16, 14, 16, 17, 17],
        scale: widget.scale);
  }
}
