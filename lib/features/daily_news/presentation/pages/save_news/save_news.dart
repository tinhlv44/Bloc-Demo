import 'package:bloc_app_demo/features/daily_news/presentation/bloc/article.dart/Local/Local_article_event.dart';
import 'package:bloc_app_demo/features/daily_news/presentation/bloc/article.dart/Local/Local_article_state.dart';
import 'package:bloc_app_demo/features/daily_news/presentation/bloc/article.dart/local/local_article_bloc.dart';
import 'package:bloc_app_demo/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveNews extends StatelessWidget {
  const SaveNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  _buildBody(BuildContext context) {
    return BlocProvider<LocalArticleBloc>(
        create: (context) => sl()..add(GetSaveArticles()),
        child: BlocBuilder<LocalArticleBloc, LocalArticleState>(
            builder: (_, state) {
          if (state is LocalArticleLoading) {
            return const CircularProgressIndicator();
          }
          if (state is LocalArticleDone) {
            return Placeholder();
          }
          return SizedBox();
        }));
  }
}
