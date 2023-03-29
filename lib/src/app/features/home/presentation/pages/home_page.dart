import 'package:flutter/material.dart';
import 'package:rawg/src/app/features/geners/presentation/widgets/genres_slider_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const route = '/HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          GenresSliderWidget(),
        ],
      ),
    );
  }
}
