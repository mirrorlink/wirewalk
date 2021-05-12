import 'package:flutter/material.dart';

class BarChar extends StatefulWidget {
  final int scale;
  final ScrollController scr;

  const BarChar({Key key, @required this.scale, this.scr}) : super(key: key);

  @override
  _BarCharState createState() => _BarCharState();
}

class _BarCharState extends State<BarChar> {
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

  void updatedScroll() {}

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: (45 * widget.scale).roundToDouble(),
        top: (52 * widget.scale).roundToDouble(),
        child: Image.asset('assets/minigame/images/websitesprites_12.png',
            scale: (1 / widget.scale), filterQuality: FilterQuality.none));
  }
}
