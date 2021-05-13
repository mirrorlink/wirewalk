import 'package:flutter/material.dart';
import 'package:wirewalkwebsite/components/barChar.dart';
import 'package:wirewalkwebsite/components/simpleAnim.dart';

class Bar extends StatefulWidget {
  final int scaleFactor;
  final ScrollController scr;

  const Bar({Key key, @required this.scaleFactor, @required this.scr})
      : super(key: key);

  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: (150 * widget.scaleFactor).roundToDouble(),
        height: (120 * widget.scaleFactor).roundToDouble(),
        child: Stack(
          children: [
            bg(),
            glauber(),
            tv(),
            BarChar(
              scale: widget.scaleFactor,
              scr: widget.scr,
            )
          ],
        ));
  }

  Widget bg() {
    return Image.asset('assets/minigame/website_bar.png',
        scale: (1 / widget.scaleFactor), filterQuality: FilterQuality.none);
  }

  Widget glauber() {
    return SimpleAnim(
        x: 15,
        y: 30,
        timeEachFrameMs: 750,
        imageIds: [3, 4],
        scale: widget.scaleFactor);
  }

  Widget tv() {
    return SimpleAnim(
        x: 125,
        y: 10,
        timeEachFrameMs: 50,
        imageIds: [22, 27, 24, 27, 25, 26, 23, 26],
        scale: widget.scaleFactor);
  }
}
