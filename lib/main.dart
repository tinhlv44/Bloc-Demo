import 'package:bloc_app_demo/config/theme/app_theme.dart';
import 'package:bloc_app_demo/features/daily_news/presentation/bloc/article.dart/remote/remote_article_bloc.dart';
import 'package:bloc_app_demo/features/daily_news/presentation/bloc/article.dart/remote/remote_article_event.dart';
import 'package:bloc_app_demo/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:bloc_app_demo/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DailyNews(),
        theme: theme(),
      ),
    );
  }
}
