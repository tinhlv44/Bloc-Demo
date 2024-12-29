import 'package:bloc_app_demo/features/daily_news/presentation/bloc/article.dart/remote/remote_article_bloc.dart';
import 'package:bloc_app_demo/features/daily_news/presentation/bloc/article.dart/remote/remote_article_state.dart';
import 'package:bloc_app_demo/features/daily_news/presentation/pages/save_news/save_news.dart';
import 'package:bloc_app_demo/features/daily_news/presentation/widgets/acticle_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Daily News",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SaveNews(),
                ),
              );
            },
            icon: Icon(Icons.save))
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (_, state) {
        if (state is RemoteArticleLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is RemoteArticleError) {
          print(state.error!.toString());
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is RemoteArticleDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ArticleCard(article: state.articles![index]);
            },
            itemCount: state.articles!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
