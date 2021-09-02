import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/link.dart';
import 'package:wirewalkwebsite/constants.dart';
import 'package:wirewalkwebsite/pages/MediaCoverage.dart';
import 'package:wirewalkwebsite/pages/youtubePlayer.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LinksHeader extends StatefulWidget {
  final Function showModal;

  LinksHeader(this.showModal);

  @override
  _LinksHeaderState createState() => _LinksHeaderState();
}

class _LinksHeaderState extends State<LinksHeader> {
  AutoSizeGroup linksGroup = AutoSizeGroup();
  AutoSizeGroup linksGroup2 = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    if (Constants.isTouchScreen()) {
      return Container(
          height: 120,
          child: Column(children: [
            Row(
              children: [
                Container(
                  width: 10,
                ),
                Expanded(child: mainLogo()),
                Container(
                  width: 10,
                ),
                Expanded(
                    flex: 4,
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 20,
                            ),
                            Expanded(child: watchTrailer()),
                            Container(
                              width: 20,
                            ),
                            Expanded(child: steam()),
                            Container(
                              width: 20,
                            ),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(child: onMedia()),
                          Container(
                            width: 10,
                          ),
                          Expanded(child: pressKit()),
                          Container(
                            width: 10,
                          ),
                          Expanded(child: contact()),
                          Container(
                            width: 10,
                          ),
                        ],
                      )
                    ]))
              ],
            ),
            Divider(
              color: Constants.LIGHT,
              height: 5,
              thickness: 5,
            )
          ]));
    } else {
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
                constraints: BoxConstraints(maxWidth: 1100),
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
                      width: 15,
                    ),
                    Expanded(child: onMedia()),
                    Container(
                      width: 10,
                    ),
                    Expanded(child: contact()),
                    Container(
                      width: 20,
                    ),
                  ],
                ))),
      ]);
    }
  }

  Widget mainLogo() {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: SvgPicture.asset('assets/logo.svg',
            semanticsLabel: 'Wirewalk Logo'));
  }

  Widget watchTrailer() {
    if (Constants.isTouchScreen()) {
      return Link(
          uri: Uri.parse('https://www.youtube.com/watch?v=MdMhGzTZNIg'),
          builder: (BuildContext context, FollowLink followLink) {
            return TextButton(
                onPressed: followLink,
                child: AutoSizeText(
                  'Trailer',
                  group: linksGroup,
                  maxLines: 1,
                  style: TextStyle(fontSize: 60),
                ));
          });
    } else {
      return TextButton(
          onPressed: () async {
            widget.showModal(true);

            await showGeneralDialog(
              context: context,
              barrierColor: Colors.black12.withOpacity(0.6),
              barrierDismissible: true,
              barrierLabel: "trailer",
              transitionDuration: Duration(milliseconds: 200),
              pageBuilder: (_, __, ___) {
                return SizedBox.expand(child: YoutubePlayer());
              },
            );

            await Future.delayed(Duration(milliseconds: 500));

            widget.showModal(false);
          },
          child: AutoSizeText(
            'Trailer',
            group: linksGroup,
            maxLines: 1,
            style: TextStyle(fontSize: 60),
          ));
    }
  }

  Widget onMedia() {
    return TextButton(
        onPressed: () async {
          widget.showModal(true);

          await showGeneralDialog(
            context: context,
            barrierColor: Colors.black12.withOpacity(0.6),
            barrierDismissible: true,
            barrierLabel: "media",
            transitionDuration: Duration(milliseconds: 200),
            pageBuilder: (_, __, ___) {
              if (Constants.isTouchScreen()) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
              }

              return Container(
                  width: 1000,
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.only(left: 80, right: 80, top: 80),
                  child: mediaCenter());
            },
          );

          await Future.delayed(Duration(milliseconds: 500));

          widget.showModal(false);
        },
        child: AutoSizeText(
          'Media',
          group: Constants.isTouchScreen() ? linksGroup2 : linksGroup,
          maxLines: 1,
          style: TextStyle(fontSize: 60),
        ));
  }

  Widget mediaCenter() {
    return Column(children: [
      Expanded(child: Container(color: Colors.white38, child: MediaCoverage())),
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
    ]);
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
                group: Constants.isTouchScreen() ? linksGroup2 : linksGroup,
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
                group: Constants.isTouchScreen() ? linksGroup2 : linksGroup,
                style: TextStyle(fontSize: 60),
              ));
        });
  }
}
