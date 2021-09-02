import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:wirewalkwebsite/constants.dart';
import 'package:url_launcher/link.dart';
import 'package:http/http.dart' as http;

enum Language { br, en, es }

class SingleMediaCoverage {
  String url;
  Language lang;

  SingleMediaCoverage(this.url, this.lang);
}

class MediaCoverage extends StatefulWidget {
  @override
  _MediaCoverageState createState() => _MediaCoverageState();
}

class _MediaCoverageState extends State<MediaCoverage> {
  ScrollController scr = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<SingleMediaCoverage> urls = getUrls();

    return GridView.count(
        crossAxisCount: 4,
        padding: EdgeInsets.all(30),
        childAspectRatio: 1,
        mainAxisSpacing: 50,
        crossAxisSpacing: 50,
        shrinkWrap: true,
        children: List.generate(urls.length, (index) {
          return GridTile(
              child: Link(
                  uri: Uri.parse(urls[index].url),
                  target: LinkTarget.blank,
                  builder: (BuildContext context, FollowLink followLink) {
                    return TextButton(
                        onPressed: followLink, child: card(urls[index]));
                  }));
        }));
  }

  List<SingleMediaCoverage> getUrls() {
    return [
      SingleMediaCoverage(
          'https://www.gamerview.com.br/noticias/conheca-o-indie-brasileiro-futurista-wirewalk%E2%86%B3-que-chega-em-breve',
          Language.br),
      SingleMediaCoverage(
          'https://www.ultimaficha.com.br/2021/05/25/wirewalk-conheca-o-jogo-o-mais-novo-indie-100-br/',
          Language.br),
      SingleMediaCoverage(
          'https://www.subarashow.com.br/podcast/subarashow-32-wirewalk-e-a-dificuldade-pra-criacao-de-jogos-indies-com-danilo-ganzella',
          Language.br),
      SingleMediaCoverage(
          'https://www.5mgsite.com/post/wirewalk-a-futuristic-themed-zelda-game-where-you-have-to-face-a-computer-virus',
          Language.en)
    ];
  }

  Widget getFlag(Language l) {
    String ctry = 'br';

    if (l == Language.en) {
      ctry = 'us';
    } else if (l == Language.es) {
      ctry = 'es';
    }

    return Image.asset('icons/flags/png/' + ctry + '.png',
        package: 'country_icons');
  }

  Future<Metadata> manualFetch(SingleMediaCoverage smc) async {
    var response = await http.get(Uri.parse(smc.url), headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
      "Access-Control-Allow-Headers": "Content-Type"
    });

    return MetadataParser.parse(MetadataFetch.responseToDocument(response));
  }

  Widget card(SingleMediaCoverage smc) {
    return FutureBuilder<Metadata>(
        future: manualFetch(smc),
        builder: (BuildContext context, AsyncSnapshot<Metadata> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return doCard(smc, snapshot.data);
          }

          return Container();
        });
  }

  Widget doCard(SingleMediaCoverage smc, Metadata m) {
    if (m.description == null) {
      m.description = m.title;
    }

    return Card(
      elevation: 5,
      color: Constants.LIGHT,
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Row(children: [
                Expanded(child: Image.network(m.image, fit: BoxFit.cover))
              ])),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: AutoSizeText(
                        m.title.replaceAll("()↳", "").replaceAll("()", ""),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        minFontSize: 21,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                          fontFamily: 'Roboto',
                          color: Constants.DARK,
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: AutoSizeText(
                        m.description
                            .replaceAll("()↳", "")
                            .replaceAll("()", ""),
                        maxLines: 4,
                        minFontSize: 15,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20,
                            color: Constants.DARK,
                            fontFamily: 'Roboto'),
                      )),
                  Container(
                    height: 5,
                  ),
                  Container(
                      height: 25,
                      child: Row(children: [
                        Expanded(
                            child: AutoSizeText(
                          Uri.parse(smc.url).host,
                          minFontSize: 1,
                          style: TextStyle(
                              fontSize: 14,
                              color: Constants.DARK,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Roboto'),
                        )),
                        Container(width: 10),
                        getFlag(smc.lang),
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
