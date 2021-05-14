import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wirewalkwebsite/constants.dart';

class DescriptiveText extends StatefulWidget {
  final int scaleFactor;
  final ScrollController scr;

  const DescriptiveText(
      {Key key, @required this.scaleFactor, @required this.scr})
      : super(key: key);

  @override
  _DescriptiveTextState createState() => _DescriptiveTextState();
}

class _DescriptiveTextState extends State<DescriptiveText> {
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

  @override
  Widget build(BuildContext context) {
    double opacity = (scrollPosition - Constants.CITY_SCROLL_FULL) / 150;

    return Opacity(
        opacity: max(0, min(.2 + opacity, 1)),
        child: Container(
            height: 300,
            width: (150 * widget.scaleFactor).roundToDouble(),
            child: Row(children: [
              Expanded(
                  child: AutoSizeText.rich(
                TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: ' Wirewalk ',
                      style: TextStyle(color: Constants.MED)),
                  TextSpan(
                      text: 'is an adventure where you use your PC to ',
                      style: TextStyle(color: Constants.LIGHT)),
                  TextSpan(
                      text: 'raid virus-riddled ',
                      style: TextStyle(color: Constants.MED)),
                  TextSpan(
                      text: 'digital systems.',
                      style: TextStyle(color: Constants.LIGHT)),
                ]),
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Monogram', fontSize: 60),
              ))
            ])));
  }
}
