import 'package:flutter/material.dart';
import 'package:rawg/src/app/features/global/cache_image_widget.dart';
import 'package:rawg/src/core/responsive/app_responsive.dart';
import 'package:rawg/src/core/utils/app_colors.dart';

class GenresCategoryPage extends StatelessWidget {
  const GenresCategoryPage({super.key, required this.data});
  final Map<String, dynamic> data;
  static const route = "/GenresCategoryPage";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _genresCatHeader(context),
            Expanded(
              child: ListView.builder(
                itemCount: data["data"].games.length,
                itemBuilder: (context, index) {
                  final game = data["data"].games[index];
                  return ListTile(
                    title: Text(game.name),
                    onTap: () {},
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.redDark,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _genresCatHeader(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(AppResponsive.kBorderRadius),
            bottomRight: Radius.circular(AppResponsive.kBorderRadius),
          ),
          child: CacheImageWidget(
            imageUrl: data["data"].imageBackground,
          ),
        ),
        Positioned(
            top: 0,
            child: Container(
              width: AppResponsive.width(context),
              color: Colors.black38,
              child: Row(
                children: [
                  const BackButton(),
                  Text(
                    data["data"].name,
                    style: Theme.of(context)
                        .appBarTheme
                        .titleTextStyle!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
