import 'dart:async';

import 'package:flutter/material.dart';

class SimpleAnim extends StatefulWidget {
  final int x;
  final int y;
  final int timeEachFrameMs;
  final List<int> imageIds;
  final int scale;

  const SimpleAnim(
      {Key key,
      @required this.x,
      @required this.y,
      @required this.timeEachFrameMs,
      @required this.imageIds,
      @required this.scale})
      : super(key: key);

  @override
  _SimpleAnimState createState() => _SimpleAnimState();
}

class _SimpleAnimState extends State<SimpleAnim> {
  Timer t;
  int currFrame = 0;

  @override
  void initState() {
    super.initState();
    t = Timer.periodic(Duration(milliseconds: widget.timeEachFrameMs),
        (Timer t) {
      currFrame++;

      if (currFrame >= widget.imageIds.length) {
        currFrame = 0;
      }

      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    t.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: (widget.x * widget.scale).roundToDouble(),
        top: (widget.y * widget.scale).roundToDouble(),
        child: Image.asset(
            'assets/minigame/images/websitesprites_${getCurrId()}.png',
            scale: (1 / widget.scale),
            filterQuality: FilterQuality.none));
  }

  String getCurrId() {
    int id = widget.imageIds[currFrame];
    return (id < 10 ? '0' : '') + id.toString();
  }
}
