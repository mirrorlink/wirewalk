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
      scrollPosition = widget.scr.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (scrollPosition >= 1200) {
      return Positioned(
          left: (67 * widget.scale).roundToDouble(),
          top: (500 * widget.scale).roundToDouble(),
          child: Image.asset('assets/minigame/images/websitesprites_17.png',
              scale: (1 / widget.scale), filterQuality: FilterQuality.none));
    }

    double desloc = (scrollPosition - Constants.BAR_SCROLL) /
        (Constants.CITY_SCROLL - Constants.BAR_SCROLL) *
        300;

    return SimpleAnim(
        x: 67,
        y: 150 + desloc.toInt(),
        timeEachFrameMs: 100,
        imageIds: [13, 15, 13, 15, 17, 17, 14, 16, 14, 16, 17, 17],
        scale: widget.scale);
  }
}
