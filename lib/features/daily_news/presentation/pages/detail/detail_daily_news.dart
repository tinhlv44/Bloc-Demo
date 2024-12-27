import 'package:bloc_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsDetailPage extends StatelessWidget {
  final ArticleEntities article;

  const NewsDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title ?? '',
                style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 8.0),
              _datetime(),
              const SizedBox(height: 8.0),
              CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
              const SizedBox(height: 16.0),
              if (article.author != null && article.author!.isNotEmpty)
                Text(
                  'By ${article.author}',
                  style: const TextStyle(color: Colors.grey),
                ),
              const SizedBox(height: 8.0),
              // Display the news description
              Text(article.description ?? ''),
              const SizedBox(height: 16.0),
              // Display the full news content (optional)
              Text(article.content ?? ''),
            ],
          ),
        ),
      ),
    );
  }

  Text _datetime() {
    String? date = article.publishedAt;
    date = date!.isNotEmpty
        ? DateFormat('yyyy/MM/dd HH:mm:ss').format(DateTime.parse(date))
        : '';

    return Text(
      date,
      style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
    );
  }
}
