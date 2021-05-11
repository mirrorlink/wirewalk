// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/link.dart';
import 'package:wirewalkwebsite/constants.dart';
import 'package:wirewalkwebsite/pages/youtubePlayer.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
                Expanded(flex: 10, child: mainLogo()),
                Spacer(flex: 2),
                Expanded(flex: 10, child: watchTrailer()),
                Spacer(flex: 2),
                Expanded(flex: 10, child: steam()),
                Spacer(flex: 2),
                Expanded(flex: 10, child: pressKit()),
                Spacer(flex: 2),
                Expanded(flex: 10, child: contact()),
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
        child: AutoSizeText(
          'Trailer',
          style: TextStyle(fontSize: 60, color: Constants.MED),
        ));
  }

  Widget contact() {
    return Link(
        uri: Uri(
            scheme: 'mailto',
            path: 'debugchicken@gmail.com',
            queryParameters: {'subject': 'Inquiry about Wirewalk!'}),
        builder: (BuildContext context, FollowLink followLink) {
          return TextButton(
              onPressed: followLink,
              child: AutoSizeText(
                'Contact',
                style: TextStyle(fontSize: 60, color: Constants.MED),
              ));
        });
  }

  Widget steam() {
    return Link(
        uri: Uri.parse('https://store.steampowered.com/app/391540'),
        target: LinkTarget.blank,
        builder: (BuildContext context, FollowLink followLink) {
          return TextButton(
              onPressed: followLink,
              child: AutoSizeText(
                'Steam',
                style: TextStyle(fontSize: 60, color: Constants.MED),
              ));
        });
  }

  Widget pressKit() {
    print(Uri.base);

    Uri pressKit = Uri.base.replace(pathSegments: ['assets', 'PressKit.zip']);

    return Link(
        uri: pressKit,
        target: LinkTarget.blank,
        builder: (BuildContext context, FollowLink followLink) {
          return TextButton(
              onPressed: () {
                html.AnchorElement anchorElement =
                    new html.AnchorElement(href: pressKit.toString());
                anchorElement.download = 'presskit.zip';
                anchorElement.click();
              },
              child: AutoSizeText(
                'Press Kit',
                style: TextStyle(fontSize: 60, color: Constants.MED),
              ));
        });
  }
}
