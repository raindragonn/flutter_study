import 'dart:convert';

import 'package:Flutter_Study/chapter5/data/music.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' as html;
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../news.dart';

class NewsApi {
  final Logger _logger = Logger();
  static String baseUrl = "newsapi.org";
  static String path = "v2/top-headlines";

  static String countyCode = "kr";
  static String apiKey = "588188f958f140718481da10db91ace3";

  Uri uri = Uri.https(baseUrl, path,
      {"country": countyCode, "apiKey": apiKey, "pageSize": "100"});

  Future<List<News>> getNews() async {
    http.Client client = http.Client();

    try {
      List<News> news = [];
      final response = await client.get(uri);
      final statusCode = response.statusCode;
      final body = response.body;

      if (statusCode == 200) {
        news = jsonDecode(body)['articles']
            .map<News>((article) => News.fromMap(article))
            .toList();
      }
      return news;
    } finally {
      client.close();
    }
  }

  test() async {
    const String base = "www.4shared.com";
    const String path = "web/rest/v1_2/files.json";
    Map<String, String> query = {"query": "아이유", "category": "1"};
    Uri uri = Uri.https(base, path, query);
    var response = await http.get(uri);
    var body = response.body;
    List<Music> list =
        jsonDecode(body)['files'].map<Music>((e) => Music.fromMap(e)).toList();
    var downloadPage = await http.get(Uri.parse(list[0].downloadPage));
    Document document = html.parse(downloadPage.body);
  }
}
