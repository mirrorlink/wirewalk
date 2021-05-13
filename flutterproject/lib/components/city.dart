import 'package:flutter/material.dart';
import 'package:wirewalkwebsite/components/cityChar.dart';
import 'package:wirewalkwebsite/components/simpleAnim.dart';

class City extends StatefulWidget {
  final int scaleFactor;
  final ScrollController scr;

  const City({Key key, @required this.scaleFactor, @required this.scr})
      : super(key: key);

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(height: (80 * widget.scaleFactor.roundToDouble())),
      Container(
          width: (150 * widget.scaleFactor).roundToDouble(),
          height: (480 * widget.scaleFactor).roundToDouble(),
          child: Stack(
            children: [
              bg(),
              CityChar(
                scale: widget.scaleFactor,
                scr: widget.scr,
              )
            ],
          ))
    ]);
  }

  Widget bg() {
    return Image.asset('assets/minigame/website_outside.png',
        scale: (1 / widget.scaleFactor), filterQuality: FilterQuality.none);
  }
}
