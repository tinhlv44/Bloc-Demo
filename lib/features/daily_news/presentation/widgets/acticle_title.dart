import 'package:flutter/material.dart';
import 'package:bloc_app_demo/features/daily_news/domain/entities/article.dart';

class ArticleCard extends StatelessWidget {
  final ArticleEntities article;

  const ArticleCard({Key? key, required this.article}) : super(key: key);

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
            // Hiển thị hình ảnh nếu có
            // if (article.urlToImage != null && article.urlToImage!.isNotEmpty)
            //   ClipRRect(
            //     borderRadius: BorderRadius.circular(12),
            //     child: Image.network(
            //       article.urlToImage!,
            //       width: double.infinity,
            //       height: 200,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            if (article.urlToImage != null && article.urlToImage!.isNotEmpty)
              Image.network(article.urlToImage!),
            if (article.urlToImage == null) Placeholder(),

            SizedBox(height: 12),

            // Tiêu đề bài viết
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

            // Tác giả và thời gian xuất bản
            Row(
              children: [
                Text(
                  'By ${article.author!.length > 10 ? '${article.author!.substring(0, 11)}...' : article.author ?? 'Unknown'}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Spacer(),
                Text(
                  article.publishedAt ?? 'Unknown Date',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Mô tả ngắn về bài viết
            Text(
              article.description ?? 'No description available.',
              style: TextStyle(
                color: Colors.black54,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),

            // Button mở liên kết
            ElevatedButton(
              onPressed: () {
                _launchURL(article.url ?? 'https://example.com');
              },
              child: Text("Read More"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) {
    // Bạn có thể sử dụng `url_launcher` package để mở URL
    // Example: launch(url);
  }
}
