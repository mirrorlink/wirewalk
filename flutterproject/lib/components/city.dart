import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wirewalkwebsite/components/cityChar.dart';
import 'package:wirewalkwebsite/components/car.dart';
import 'package:wirewalkwebsite/components/bug.dart';
import 'package:wirewalkwebsite/components/simpleAnim.dart';
import 'package:wirewalkwebsite/constants.dart';

class City extends StatefulWidget {
  final int scaleFactor;
  final ScrollController scr;

  const City({Key key, @required this.scaleFactor, @required this.scr})
      : super(key: key);

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
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
      scrollPosition =
          Constants.adjustOffset(widget.scr.offset, widget.scaleFactor);
    });
  }

  Widget build(BuildContext context) {
    double opacityReduce = 0;

    double charWalkPlus200 = (Constants.CITY_CHARWALK + 200).roundToDouble();

    if (scrollPosition > charWalkPlus200) {
      opacityReduce = (scrollPosition - charWalkPlus200) /
          (Constants.CITY_SCROLL_FULL - charWalkPlus200);
    }

    return Opacity(
        opacity: max(0, min(1 - opacityReduce, 1)),
        child: Column(children: [
          Container(height: (80 * widget.scaleFactor.roundToDouble())),
          Container(
              width: (150 * widget.scaleFactor).roundToDouble(),
              height: (465 * widget.scaleFactor).roundToDouble(),
              child: Stack(
                children: [
                  bg(),
                  warning(),
                  bee(),
                  flower(),
                  Car(scale: widget.scaleFactor, scr: widget.scr),
                  Bug(scale: widget.scaleFactor, scr: widget.scr),
                  CityChar(
                    scale: widget.scaleFactor,
                    scr: widget.scr,
                  ),
                ],
              ))
        ]));
  }

  Widget bg() {
    return Image.asset('assets/minigame/website_outside.png',
        scale: (1 / widget.scaleFactor), filterQuality: FilterQuality.none);
  }

  Widget warning() {
    return SimpleAnim(
        x: 139,
        y: 40,
        timeEachFrameMs: 250,
        imageIds: [1, 2],
        scale: widget.scaleFactor);
  }

  Widget bee() {
    return SimpleAnim(
        x: 30,
        y: 250,
        timeEachFrameMs: 50,
        imageIds: [9, 10],
        scale: widget.scaleFactor);
  }

  Widget flower() {
    return SimpleAnim(
        x: 15,
        y: 275,
        timeEachFrameMs: 750,
        imageIds: [20, 21],
        scale: widget.scaleFactor);
  }
}
