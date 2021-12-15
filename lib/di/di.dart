import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_flutter/data/articles_repository.dart';
import 'package:news_flutter/feature/article_details/article_details_cubit.dart';
import 'package:news_flutter/feature/articles_list/articles_list_cubit.dart';
import 'package:news_flutter/usecase/fetch_articles_use_case.dart';

class CubitsFactory {
  static final CubitsFactory _instance = CubitsFactory._create();

  final GetIt _locator = GetIt.instance;

  CubitsFactory._create() {

    // Repositories
    _locator.registerSingleton<ArticlesRepository>(NetworkArticlesRepository());

    // Use cases
    _locator.registerSingleton(FetchArticlesUseCase(_locator.get()));


    // Cubits
    _locator.registerFactory<ArticlesListPageCubit>(() => ArticlesListPageCubit(_locator.get()));
    _locator.registerFactory<ArticleDetailsCubit>(() => ArticleDetailsCubit());

  }

  static T get<T extends Cubit>() => _instance._locator.get<T>();
}
