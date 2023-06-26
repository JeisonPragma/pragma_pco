import 'package:flutter/material.dart';

class UrlListWidget extends StatelessWidget {
  const UrlListWidget({super.key, required this.urlCleaned});

  final List<String> urlCleaned;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.6,
      width: size.width * 0.8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Text(
              key: Key('url_item_$index'),
                urlCleaned[index],
            );
          },
          itemCount: urlCleaned.length,
        ),
      ),
    );
  }
}
