import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wirewalkwebsite/components/bar.dart';
import 'package:wirewalkwebsite/components/footer.dart';
import 'package:wirewalkwebsite/components/room.dart';
import 'package:wirewalkwebsite/components/city.dart';
import 'package:wirewalkwebsite/components/descriptiveText.dart';
import 'package:wirewalkwebsite/constants.dart';

class MainBody extends StatefulWidget {
  final ScrollController scr;

  const MainBody({Key key, @required this.scr}) : super(key: key);

  @override
  _MainBodyState createState() => _MainBodyState();
}

enum partsVisible { BAR, CITY, TEXT_AND_ROOM }

class _MainBodyState extends State<MainBody> {
  partsVisible pVisi = partsVisible.BAR;

  double textOpacity = 0;
  int scaleFactor = Constants.MAX_SCALE;

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
    partsVisible nPVisi;

    double adjustedOffset =
        Constants.adjustOffset(widget.scr.offset, scaleFactor);

    if (adjustedOffset < Constants.BAR_SCROLL) {
      nPVisi = partsVisible.BAR;
    } else if (adjustedOffset < Constants.CITY_SCROLL_FULL) {
      nPVisi = partsVisible.CITY;
    } else {
      nPVisi = partsVisible.TEXT_AND_ROOM;
    }

    if (pVisi != nPVisi) {
      setState(() {
        pVisi = nPVisi;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    scaleFactor = (MediaQuery.of(context).size.width / 150).floor();
    scaleFactor = min(scaleFactor, Constants.MAX_SCALE);

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(children: [
        Container(
          height: 100,
        ),
        Stack(children: [
          Opacity(
              opacity: pVisi == partsVisible.CITY ? 1 : 0,
              child: City(
                scaleFactor: scaleFactor,
                scr: widget.scr,
              )),
          Opacity(
              opacity: pVisi == partsVisible.BAR ? 1 : 0,
              child: Bar(
                scaleFactor: scaleFactor,
                scr: widget.scr,
              )),
        ]),
        Opacity(
          opacity: (pVisi == partsVisible.TEXT_AND_ROOM) ? 1 : 0,
          child: DescriptiveText(
            scaleFactor: scaleFactor,
            scr: widget.scr,
          ),
        ),
        Container(height: 50),
        Opacity(
            opacity: pVisi == partsVisible.TEXT_AND_ROOM ? 1 : 0,
            child: Room(
              scaleFactor: scaleFactor,
            )),
        Container(height: 80),
        Footer()
      ])
    ]);
  }
}
