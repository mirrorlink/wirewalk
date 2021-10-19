import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:universal_html/html.dart';
import 'package:url_launcher/link.dart';
import 'package:wirewalkwebsite/constants.dart';
import 'dart:ui' as ui;

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final IFrameElement _steamFrame = IFrameElement();
  final IFrameElement _itchFrame = IFrameElement();

  @override
  void initState() {
    super.initState();
    _steamFrame.width = '646';
    _steamFrame.height = '190';
    _steamFrame.src = 'https://store.steampowered.com/widget/1636700/';
    _steamFrame.style.border = 'none';

    _itchFrame.width = '552';
    _itchFrame.height = '167';
    _itchFrame.src = 'https://itch.io/embed/1241097';
    _itchFrame.style.border = 'none';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'steamFrame',
      (int viewId) => _steamFrame,
    );

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'itchFrame',
      (int viewId) => _itchFrame,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            mainLogo(),
            Container(
              height: 80,
            ),
            steamWidget(),
            Container(
              height: 40,
            ),
            itchWidget(),
            //wishListNow(),
            Container(
              height: 80,
            ),
            credits(),
            Container(
              height: 50,
            ),
            sitedev(),
            Container(height: 20)
          ],
        ));
  }

  Widget mainLogo() {
    return Container(
        height: 200,
        child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 800),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: 20,
              ),
              Expanded(
                  child: Container(
                      height: 200,
                      width: 800,
                      child: SvgPicture.asset('assets/logo.svg',
                          semanticsLabel: 'Wirewalk Logo'))),
              Container(
                width: 20,
              ),
            ])));
  }

  Widget steamWidget() {
    return SizedBox(
        height: 190,
        width: 646,
        child: HtmlElementView(
          key: UniqueKey(),
          viewType: 'steamFrame',
        ));
  }

  Widget itchWidget() {
    return SizedBox(
        height: 167,
        width: 552,
        child: HtmlElementView(
          key: UniqueKey(),
          viewType: 'itchFrame',
        ));
  }

  Widget wishListNow() {
    return Container(
        height: 500,
        child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: 20,
              ),
              Expanded(flex: 4, child: wishListLink()),
              Container(
                width: 30,
              ),
              Expanded(
                  flex: 4,
                  child: Image.asset(
                    'assets/main_char.png',
                    filterQuality: FilterQuality.medium,
                  )),
              Container(
                width: 20,
              ),
            ])));
  }

  Widget wishListLink() {
    return Link(
        uri: Uri.parse('https://store.steampowered.com/app/1636700'),
        target: LinkTarget.blank,
        builder: (BuildContext context, FollowLink followLink) {
          return ElevatedButton(
              onPressed: followLink,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      "Wishlist\nON",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'RobotPC', fontSize: 60),
                    ),
                    Container(
                      height: 50,
                    ),
                    Container(
                        child: SvgPicture.asset('assets/steam.svg',
                            color: Constants.LIGHT,
                            semanticsLabel: 'Steam Logo'))
                  ]));
        });
  }

  Widget credits() {
    return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1000),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Container(
            width: 20,
          ),
          Expanded(
              flex: 3, child: singleTwitter('assets/dani.png', 'daniserranu')),
          Spacer(),
          Expanded(
              flex: 3,
              child: singleTwitter('assets/debugchicken.png', 'debugchicken')),
          Container(
            width: 20,
          ),
        ]));
  }

  Widget singleTwitter(String img, String name) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: Image.asset(img),
      ),
      Container(
        width: 20,
      ),
      Expanded(
          flex: 3,
          child: Link(
              uri: Uri.parse('https://twitter.com/' + name),
              target: LinkTarget.blank,
              builder: (BuildContext context, FollowLink followLink) {
                return TextButton(
                  child: AutoSizeText(
                    '@' + name,
                    maxLines: 1,
                    style: TextStyle(fontFamily: 'Monogram', fontSize: 60),
                  ),
                  onPressed: followLink,
                );
              }))
    ]);
  }

  Widget sitedev() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Constants.isTouchScreen()
          ? Expanded(
              child: AutoSizeText(
              siteString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Constants.LIGHT, fontFamily: 'Monogram', fontSize: 22),
            ))
          : SelectableText(
              siteString(),
              style: TextStyle(
                  color: Constants.LIGHT, fontFamily: 'Monogram', fontSize: 22),
            ),
    ]);
  }

  String siteString() {
    return "<2017-2022> debugChicken - contact: debugchicken@gmail.com";
  }
}
