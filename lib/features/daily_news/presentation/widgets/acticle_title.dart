import 'package:bloc_app_demo/features/daily_news/presentation/pages/detail/detail_daily_news.dart';
import 'package:flutter/material.dart';
import 'package:bloc_app_demo/features/daily_news/domain/entities/article.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleCard extends StatelessWidget {
  final ArticleEntities article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage != null && article.urlToImage!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  article.urlToImage!,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(height: 12),
            Text(
              article.title ?? 'No Title Available',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                _author(),
                Spacer(),
                _publishedAt(),
              ],
            ),
            SizedBox(height: 8),
            Text(
              article.description ?? 'No description available.',
              style: TextStyle(
                color: Colors.black54,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              // onPressed: () {
              //   _launchURL(article.url ?? 'https://example.com');
              // },
              onPressed: () {
                // Navigate to the detailed news page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetailPage(article: article),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 105, 105),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Read More",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _author() {
    return Text(
      'By ${article.author!.length > 10 ? '${article.author!.substring(0, 11)}...' : article.author!.isNotEmpty ? article.author : 'Unknown'}',
      style: TextStyle(
          fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.bold),
    );
  }

  Text _publishedAt() {
    String date = article.publishedAt ?? 'Unknown Date';
    date = date != 'Unknown Date'
        ? DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.parse(date))
        : date;
    return Text(
      date,
      style: TextStyle(
        fontFamily: 'Muli',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.grey[600],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
