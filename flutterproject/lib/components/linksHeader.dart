import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/link.dart';
import 'package:wirewalkwebsite/constants.dart';
import 'package:wirewalkwebsite/pages/MediaCoverage.dart';
import 'package:wirewalkwebsite/pages/youtubePlayer.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LinksHeader extends StatefulWidget {
  @override
  _LinksHeaderState createState() => _LinksHeaderState();
}

class _LinksHeaderState extends State<LinksHeader> {
  AutoSizeGroup linksGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Material(
          elevation: 40,
          child: Container(
            height: 80,
            color: Constants.DARK,
            width: MediaQuery.of(context).size.width,
          )),
      Container(
          height: 80,
          child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1200),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                  ),
                  Expanded(child: mainLogo()),
                  Container(
                    width: 20,
                  ),
                  Expanded(child: watchTrailer()),
                  Expanded(child: steam()),
                  Container(
                    width: 10,
                  ),
                  Expanded(child: pressKit()),
                  Container(
                    width: 30,
                  ),
                  //Expanded(child: onMedia()),
                  //Container(
                  //  width: 30,
                  //),
                  Expanded(child: contact()),
                  Container(
                    width: 20,
                  ),
                ],
              ))),
    ]);
  }

  Widget mainLogo() {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: SvgPicture.asset('assets/logo.svg',
            semanticsLabel: 'Wirewalk Logo'));
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
          group: linksGroup,
          maxLines: 1,
          style: TextStyle(fontSize: 60),
        ));
  }

  Widget onMedia() {
    return TextButton(
        onPressed: () {
          showGeneralDialog(
            context: context,
            barrierColor: Colors.black12.withOpacity(0.6),
            barrierDismissible: true,
            barrierLabel: "media",
            transitionDuration: Duration(milliseconds: 400),
            pageBuilder: (_, __, ___) {
              return Container(
                  width: 1000,
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.only(left: 80, right: 80, top: 80),
                  child: Column(children: [
                    Expanded(
                        child: Container(
                            color: Colors.white38, child: MediaCoverage())),
                    Container(
                      height: 50,
                    ),
                    TextButton(
                      child: Text(
                        "Close",
                        style: TextStyle(fontSize: 60),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Container(
                      height: 50,
                    ),
                  ]));
            },
          );
        },
        child: AutoSizeText(
          'On Media',
          group: linksGroup,
          maxLines: 1,
          style: TextStyle(fontSize: 60),
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
                group: linksGroup,
                maxLines: 1,
                style: TextStyle(fontSize: 60),
              ));
        });
  }

  Widget steam() {
    return Link(
        uri: Uri.parse('https://store.steampowered.com/app/1636700'),
        target: LinkTarget.blank,
        builder: (BuildContext context, FollowLink followLink) {
          return TextButton(
              onPressed: followLink,
              child: AutoSizeText(
                'Steam',
                group: linksGroup,
                maxLines: 1,
                style: TextStyle(fontSize: 60),
              ));
        });
  }

  Widget pressKit() {
    print(Uri.base);

    Uri pressKit =
        Uri.base.replace(pathSegments: ['assets', 'assets', 'PressKit.zip']);

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
                'PressKit',
                maxLines: 1,
                group: linksGroup,
                style: TextStyle(fontSize: 60),
              ));
        });
  }
}
