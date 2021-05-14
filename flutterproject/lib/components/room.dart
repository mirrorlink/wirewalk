import 'package:flutter/material.dart';
import 'package:wirewalkwebsite/components/simpleAnim.dart';

class Room extends StatefulWidget {
  final int scaleFactor;

  const Room({Key key, @required this.scaleFactor}) : super(key: key);

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: (60 * widget.scaleFactor).roundToDouble(),
        height: (45 * widget.scaleFactor).roundToDouble(),
        child: Stack(
          children: [bg(), pc()],
        ));
  }

  Widget bg() {
    return Image.asset('assets/minigame/website_room.png',
        scale: (1 / widget.scaleFactor / 2), filterQuality: FilterQuality.none);
  }

  Widget pc() {
    return SimpleAnim(
        x: 24,
        y: 8,
        timeEachFrameMs: 200,
        imageIds: [5, 6],
        scale: widget.scaleFactor);
  }
}
