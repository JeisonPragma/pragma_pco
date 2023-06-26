import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pco/features/url_shorten/data_source/url_shorten_data_source.dart';

part 'url_shorten_event.dart';
part 'url_shorten_state.dart';

class UrlShortenBloc extends Bloc<UrlShortenEvent, UrlShortenState> {

  UrlShortenDataSource urlShortenDS = UrlShortenDataSource();
  final List<String> urlCleaned = [];

  UrlShortenBloc() : super(UrlShortenInitialState()) {
    on<ShortenURLEvent>((event, emit) async {
      emit(LoadingState());
      try{
        final urlShorted = await urlShortenDS.postCleanUrl(url: event.url);
        urlCleaned.add(urlShorted);
        emit(LoadedState(url: urlCleaned));
      }catch (e){
        emit(ErrorState());
      }
    });
  }
}
