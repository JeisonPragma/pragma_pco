part of 'url_shorten_bloc.dart';

abstract class UrlShortenEvent extends Equatable {
  const UrlShortenEvent();
}

class ShortenURLEvent extends UrlShortenEvent {
  const ShortenURLEvent({required this.url});

  final String url;

  @override
  List<Object?> get props => [url];
}
