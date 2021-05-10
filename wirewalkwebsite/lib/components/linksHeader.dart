import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wirewalkwebsite/constants.dart';

class LinksHeader extends StatefulWidget {
  @override
  _LinksHeaderState createState() => _LinksHeaderState();
}

class _LinksHeaderState extends State<LinksHeader> {
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 40,
        child: Container(
            padding: EdgeInsets.all(20),
            color: Constants.DARK,
            height: 100,
            child: Row(
              children: [Expanded(child: mainLogo()), Spacer(flex: 2)],
            )));
  }

  Widget mainLogo() {
    return SvgPicture.asset('assets/logo.svg', semanticsLabel: 'Wirewalk Logo');
  }
}
