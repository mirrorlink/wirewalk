import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [mainLogo()],
    );
  }

  Widget mainLogo() {
    return Row(children: [
      Spacer(),
      Expanded(
          flex: 2,
          child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset('assets/logo.svg',
                  semanticsLabel: 'Wirewalk Logo'))),
      Spacer(),
    ]);
  }
}
