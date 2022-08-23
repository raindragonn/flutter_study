import 'package:Flutter_Study/chapter5/data/provider/news_api.dart';
import 'package:flutter/material.dart';

import '../data/news.dart';
import '../data/provider/news_api.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<News> news = [];
  NewsApi newsApi = NewsApi();
  bool isLoading = true;

  Future initNews() async {
    await newsApi.test();
    news = await newsApi.getNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News List'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: news.length,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Flexible(
                        flex: 2,
                        child: AspectRatio(
                            aspectRatio: 16.0 / 9.0,
                            child: Image.network(
                              news[index].imageUrl,
                              errorBuilder: (context, error, stackTrace) {
                                return LayoutBuilder(
                                  builder: (context, constraints) {
                                    return Icon(
                                      Icons.error,
                                      size: constraints.biggest.height,
                                    );
                                  },
                                );
                              },
                            ))),
                    Text(
                      news[index].title,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      news[index].description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
