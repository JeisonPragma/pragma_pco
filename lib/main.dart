import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pco/features/url_shorten/bloc/url_shorten_bloc.dart';
import 'package:pco/features/url_shorten/ui/url_shorten_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UrlShortenBloc())],
      child: MaterialApp(
        title: 'PCO Demo',
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        home: const UrlShortenScreen(title: 'PCO - Pragma'),
      ),
    );
  }
}
