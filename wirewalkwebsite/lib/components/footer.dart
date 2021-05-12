import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/link.dart';
import 'package:wirewalkwebsite/constants.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mainLogo(),
        wishListNow(),
        Container(
          height: 50,
        ),
        credits(),
        Container(
          height: 50,
        ),
        sitedev(),
        Container(height: 20)
      ],
    );
  }

  Widget mainLogo() {
    return Row(children: [
      Spacer(),
      Expanded(
          flex: 2,
          child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset('assets/logo.svg',
                  semanticsLabel: 'Wirewalk Logo'))),
      Spacer(),
    ]);
  }

  Widget wishListNow() {
    return Container(
        height: 500,
        child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1000),
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
        uri: Uri.parse('https://store.steampowered.com/app/391540'),
        target: LinkTarget.blank,
        builder: (BuildContext context, FollowLink followLink) {
          return ElevatedButton(
              onPressed: followLink,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      "Wishlist\nNow ON",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'RobotPC', fontSize: 80),
                    ),
                    Container(
                      height: 80,
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
      SelectableText(
        '<2017-2022> debugChicken - contact: debugchicken@gmail.com',
        style: TextStyle(
            color: Constants.LIGHT, fontFamily: 'Monogram', fontSize: 22),
      ),
    ]);
  }
}
