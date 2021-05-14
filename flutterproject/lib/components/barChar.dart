import 'package:flutter/material.dart';
import 'package:wirewalkwebsite/components/simpleAnim.dart';
import 'package:wirewalkwebsite/constants.dart';

class BarChar extends StatefulWidget {
  final int scale;
  final ScrollController scr;

  const BarChar({Key key, @required this.scale, this.scr}) : super(key: key);

  @override
  _BarCharState createState() => _BarCharState();
}

class _BarCharState extends State<BarChar> {
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
    if (scrollPosition == 0) {
      return Positioned(
          left: (45 * widget.scale).roundToDouble(),
          top: (52 * widget.scale).roundToDouble(),
          child: Image.asset('assets/minigame/images/websitesprites_12.png',
              scale: (1 / widget.scale), filterQuality: FilterQuality.none));
    }

    double desloc = (scrollPosition / Constants.BAR_SCROLL) * 50;

    return SimpleAnim(
        x: 67,
        y: 60 + desloc.toInt(),
        timeEachFrameMs: 100,
        imageIds: [13, 15, 13, 15, 17, 17, 14, 16, 14, 16, 17, 17],
        scale: widget.scale);
  }
}
