import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wirewalkwebsite/constants.dart';
import 'package:url_launcher/link.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class MediaCoverage extends StatefulWidget {
  @override
  _MediaCoverageState createState() => _MediaCoverageState();
}

Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
  return rootBundle
      .loadString(assetsPath)
      .then((jsonStr) => jsonDecode(jsonStr));
}

class _MediaCoverageState extends State<MediaCoverage> {
  ScrollController scr = ScrollController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: parseJsonFromAssets('assets/websites.json'),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<dynamic> websiteMetadatas = snapshot.data['list'];

            if (Constants.isTouchScreen()) {
              return ListView(
                  children: List.generate(websiteMetadatas.length, (index) {
                return Container(
                    height: 300,
                    padding: EdgeInsets.all(10),
                    child: Row(children: [
                      Expanded(child: singleLink(websiteMetadatas[index]))
                    ]));
              }));
            }

            return GridView.count(
                crossAxisCount: 3,
                padding: EdgeInsets.all(30),
                childAspectRatio: 1,
                mainAxisSpacing: 50,
                crossAxisSpacing: 50,
                shrinkWrap: false,
                children: List.generate(websiteMetadatas.length, (index) {
                  return GridTile(child: singleLink(websiteMetadatas[index]));
                }));
          }

          return Container();
        });
  }

  Widget singleLink(dynamic metadata) {
    return Link(
        uri: Uri.parse(metadata['metadata']['website']),
        target: LinkTarget.blank,
        builder: (BuildContext context, FollowLink followLink) {
          return TextButton(onPressed: followLink, child: card(metadata));
        });
  }

  Widget getFlag(String lang) {
    return Image.asset('icons/flags/png/' + lang + '.png',
        package: 'country_icons');
  }

  Widget card(dynamic metadata) {
    return Card(
      elevation: 5,
      color: Constants.LIGHT,
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Row(children: [
                Expanded(
                    child: Image.asset(
                        'assets/websitebanners/' + metadata['name'] + '.img',
                        fit: BoxFit.cover))
              ])),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: 60,
                      child: Text(
                        metadata['metadata']['title']
                            .replaceAll("()↳", "")
                            .replaceAll("()", ""),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: 'Roboto',
                          color: Constants.DARK,
                        ),
                      )),
                  Expanded(
                      flex: 5,
                      child: Center(
                          child: AutoSizeText(
                        metadata['metadata']['description']
                            .replaceAll("()↳", "")
                            .replaceAll("()", ""),
                        minFontSize: 16,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20,
                            color: Constants.DARK,
                            fontFamily: 'Roboto'),
                      ))),
                  Container(height: 5),
                  Expanded(
                      flex: 1,
                      child: Row(children: [
                        Expanded(
                            child: AutoSizeText(
                          Uri.parse(metadata['metadata']['website']).host,
                          minFontSize: 1,
                          style: TextStyle(
                              fontSize: 14,
                              color: Constants.DARK,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Roboto'),
                        )),
                        Container(width: 10),
                        getFlag(metadata['lang']),
                        Container(
                          width: 10,
                        )
                      ])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
