import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/link.dart';

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
        Container(
          height: 50,
        ),
        credits(),
        Container(
          height: 50,
        ),
      ],
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
}
