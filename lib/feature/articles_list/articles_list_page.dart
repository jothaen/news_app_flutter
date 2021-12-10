import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter/base/base_page_state.dart';
import 'package:news_flutter/feature/articles_list/articles_list_cubit.dart';
import 'package:news_flutter/feature/articles_list/articles_list_state.dart';

import 'articles_list_ui_provider.dart';


class ArticlesListPage extends StatefulWidget {
  const ArticlesListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ArticlesListPageState();
}

class ArticlesListPageState extends BasePageState<ArticlesListPageCubit, ArticlesListPage> {

  final _uiProvider = ArticlesListUiProvider();

  @override
  void initState() {
    cubit.onScreenStart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocListener(
      bloc: cubit,
      child: BlocBuilder<ArticlesListPageCubit, ArticlesListBlocState>(
          bloc: cubit,
          builder: (context, state) => _uiProvider.getPageLayout(state)),
      listener: (context, state) {
        // TODO - navigation (?)
      });

}
