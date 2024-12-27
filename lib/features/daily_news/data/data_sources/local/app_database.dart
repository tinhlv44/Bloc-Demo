import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:bloc_app_demo/features/daily_news/data/data_sources/local/DAO/article_DAO.dart';
import 'package:bloc_app_demo/features/daily_news/data/models/article.dart';
import 'package:floor/floor.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDAO;
}
