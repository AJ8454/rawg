import 'package:flutter/material.dart';
import 'package:rawg/src/app/features/geners/presentation/pages/genres_category_page.dart';
import 'package:rawg/src/app/features/global/cache_image_widget.dart';
import 'package:rawg/src/app/features/geners/data/models/genres_model.dart';
import 'package:rawg/src/core/responsive/app_responsive.dart';
import 'package:rawg/src/core/routes/app_navigator.dart';

class GenersPage extends StatelessWidget {
  const GenersPage({super.key, required this.genersList});
  static const route = "/GenresPage";

  final List<GenresDataModel> genersList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Genres"),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: genersList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              AppNavigator.pushWithData(
                context,
                GenresCategoryPage.route,
                {
                  "title": genersList[index].name,
                  "games": genersList[index].games,
                },
              );
            },
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppResponsive.kBorderRadius),
                  child: CacheImageWidget(
                    imageUrl: genersList[index].imageBackground,
                    cFit: BoxFit.cover,
                    imgheight: double.infinity,
                    color: Colors.black54,
                    colorBlendMode: BlendMode.dstATop,
                  ),
                ),
                Text(
                  genersList[index].name,
                  style: AppResponsive.responsiveTextStyle(context,
                      fsize: AppResponsive.klargeFont(context)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
