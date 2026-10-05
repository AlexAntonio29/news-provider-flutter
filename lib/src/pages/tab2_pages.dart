import 'package:flutter/material.dart';
import 'package:news_provider/src/models/model_news_response.dart';
import 'package:news_provider/src/services/news_service.dart';
import 'package:news_provider/src/theme/global_themes.dart';
import 'package:provider/provider.dart';

class Tab2Pages extends StatefulWidget {
  const Tab2Pages({Key? key}) : super(key: key);

  @override
  State<Tab2Pages> createState() => _Tab2PagesState();
}

class _Tab2PagesState extends State<Tab2Pages> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),

        scrollDirection: Axis.vertical,
        itemCount: newsService.articles.length,
        // itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          final article = newsService.articles[index];
          return _article(article: article);
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _article extends StatelessWidget {
  const _article({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        //height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: GlobalThemes.secundary,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.black12,
              blurRadius: 15,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${article.title}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            _imageNews(article: article),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '${article.description}',
                  style: TextStyle(color: Colors.black54),
                  maxLines: 2,
                ),
            ),
          ],
        ),
      ),
    );
  }
}

class _imageNews extends StatelessWidget {
  const _imageNews({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: FadeInImage(
        width: double.infinity,
        placeholder: AssetImage('assets/giphy.gif'),
        image: article.urlToImage != null
            ? NetworkImage(article.urlToImage!)
            : AssetImage('assets/no-image.png'),
      ),
    );
  }
}
