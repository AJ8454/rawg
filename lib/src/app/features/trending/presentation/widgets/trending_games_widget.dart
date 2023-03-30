import 'package:flutter/material.dart';
import 'package:rawg/src/core/responsive/app_responsive.dart';
import 'package:rawg/src/core/utils/app_colors.dart';

class TrendingGamesWidget extends StatelessWidget {
  const TrendingGamesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppResponsive.height(context) * 0.42,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trendings",
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
        ],
      ),
    );
  }
}
