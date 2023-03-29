import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg/src/app/features/global/cache_image_widget.dart';
import 'package:rawg/src/app/features/home/presentation/genres_bloc/genres_bloc.dart';
import 'package:rawg/src/core/responsive/app_responsive.dart';
import 'package:rawg/src/core/utils/app_colors.dart';

class HomeGenresWidget extends StatelessWidget {
  const HomeGenresWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresBloc, GenresState>(
      builder: (context, state) {
        if (state is GenresLoadingState) {
          return AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              margin: const EdgeInsets.all(AppResponsive.kdefaultPadding),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius:
                    BorderRadius.circular(AppResponsive.kBorderRadius),
              ),
            ),
          );
        } else if (state is GenresLoadedState) {
          return SizedBox(
            height: AppResponsive.height(context) * 0.4,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: AppResponsive.kdefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Genres",
                        style: AppResponsive.responsiveTextStyle(
                          context,
                          fsize: AppResponsive.kmaxExtraLargeFont(context) + 5,
                          fweight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColor.redDark,
                        ),
                      ),
                    ],
                  ),
                  CarouselSlider.builder(
                      itemCount: state.genresModel.results.length,
                      itemBuilder: (context, index, realIndex) {
                        final genre = state.genresModel.results[index];
                        return Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                AppResponsive.kBorderRadius),
                            child: CacheImageWidget(
                              imageUrl: genre.imageBackground,
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        onPageChanged: (index, reason) {},
                        scrollDirection: Axis.horizontal,
                      )),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
