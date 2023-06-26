import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pco/core/validatos/text_validators.dart';
import 'package:pco/features/url_shorten/bloc/url_shorten_bloc.dart';
import 'package:pco/features/url_shorten/ui/widgets/url_list_widget.dart';

class UrlShortenScreen extends StatefulWidget {
  const UrlShortenScreen({super.key, required this.title});

  final String title;

  @override
  State<UrlShortenScreen> createState() => _UrlShortenScreenState();
}

class _UrlShortenScreenState extends State<UrlShortenScreen> {
  final TextEditingController _urlInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _shortenUrl() {
    if (_formKey.currentState!.validate()) {
      context
          .read<UrlShortenBloc>()
          .add(ShortenURLEvent(url: _urlInputController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<UrlShortenBloc, UrlShortenState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is LoadedState) {
              return Center(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'URL a acortar',
                          ),
                          controller: _urlInputController,
                          validator: (value) =>
                              TextValidators.addressWebValidator(
                                  _urlInputController.text),
                        ),
                        UrlListWidget(urlCleaned: state.url),
                      ],
                    ),
                  ),
                ),
              );
            }
            if (state is ErrorState) {
              return Center(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'URL a acortar',
                          ),
                          controller: _urlInputController,
                          validator: (value) =>
                              TextValidators.addressWebValidator(
                                  _urlInputController.text),
                        ),
                        const Text(
                          'Sorry, no pudimos cortar la URL',
                          style: TextStyle(color: Colors.redAccent),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'URL a acortar',
                      ),
                      controller: _urlInputController,
                      validator: (value) => TextValidators.addressWebValidator(
                          _urlInputController.text),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shortenUrl,
        tooltip: 'Cut URL',
        child: const Icon(Icons.cut),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
