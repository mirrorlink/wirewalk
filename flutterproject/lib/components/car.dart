import 'package:flutter/material.dart';
import 'package:wirewalkwebsite/constants.dart';

class Car extends StatefulWidget {
  final int scale;
  final ScrollController scr;

  const Car({Key key, @required this.scale, this.scr}) : super(key: key);

  @override
  _CarState createState() => _CarState();
}

class _CarState extends State<Car> {
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
    double desloc = (scrollPosition - Constants.BAR_SCROLL) / 400 * 100;

    return Positioned(
        left: ((135 - desloc.toInt()) * widget.scale).roundToDouble(),
        top: (150 * widget.scale).roundToDouble(),
        child: Image.asset('assets/minigame/images/websitesprites_19.png',
            scale: (1 / widget.scale), filterQuality: FilterQuality.none));
  }
}
