import 'package:flutter/material.dart';
import 'package:news_provider/src/models/model_news_response.dart';
import 'package:http/http.dart' as http;

class NewsService extends ChangeNotifier {
  List<Article> articles = [];

  final _URL_BASE = 'https://newsapi.org';
  final _APIKEY = '3dd99a512ce940c39420c4797c1470cc';

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = '$_URL_BASE/v2/top-headlines?country=us&apiKey=$_APIKEY';
    final response = await http.get(Uri.parse(url));
    final newsResponse = NewsResponse.fromRawJson(response.body);

    articles.addAll(newsResponse.articles);
    notifyListeners();
  }
  
}
