import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wirewalkwebsite/constants.dart';
import 'package:wirewalkwebsite/pages/youtubePlayer.dart';

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
              children: [
                Container(width: 200, child: mainLogo()),
                Container(width: 50),
                watchTrailer(),
                Spacer(flex: 1),
              ],
            )));
  }

  Widget mainLogo() {
    return SvgPicture.asset('assets/logo.svg', semanticsLabel: 'Wirewalk Logo');
  }

  Widget watchTrailer() {
    return TextButton(
        onPressed: () {
          showGeneralDialog(
            context: context,
            barrierColor: Colors.black12.withOpacity(0.6),
            barrierDismissible: true,
            barrierLabel: "trailer",
            transitionDuration: Duration(milliseconds: 400),
            pageBuilder: (_, __, ___) {
              return SizedBox.expand(child: YoutubePlayer());
            },
          );
        },
        child: Text(
          'Trailer',
          style: TextStyle(fontSize: 60, color: Constants.MED),
        ));
  }
}
