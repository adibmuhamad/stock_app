part of '../cubit/news_cubit.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> news;

  NewsLoaded(this.news);
}

class NewsError extends NewsState {
  final String error;

  NewsError(this.error);
}
