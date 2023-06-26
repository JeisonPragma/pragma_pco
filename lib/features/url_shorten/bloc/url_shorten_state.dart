part of 'url_shorten_bloc.dart';

abstract class UrlShortenState extends Equatable {
  const UrlShortenState();
}

class UrlShortenInitialState extends UrlShortenState {
  @override
  List<Object> get props => [];
}

class LoadingState extends UrlShortenState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends UrlShortenState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends UrlShortenState {
  const LoadedState({required this.url});

  final List<String> url;

  @override
  List<Object?> get props => [url];
}
