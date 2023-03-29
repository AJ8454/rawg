import 'package:flutter/material.dart';
import 'package:rawg/src/core/responsive/app_responsive.dart';

class GenresCategoryPage extends StatelessWidget {
  const GenresCategoryPage({super.key, required this.data});
  final Map<String, dynamic> data;
  static const route = "/GenresCategoryPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data["title"]),
      ),
      body: ListView.builder(
        itemCount: data["games"].length,
        itemBuilder: (context, index) {
          final game = data["games"][index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                game.name,
                style: AppResponsive.responsiveTextStyle(
                  context,
                  fsize: AppResponsive.kmaxExtraLargeFont(context),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
