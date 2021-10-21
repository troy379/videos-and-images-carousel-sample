import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewIndicator extends StatelessWidget {
  final int itemCount;
  final PageController pageController;

  const PageViewIndicator({required this.itemCount, required this.pageController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController, // PageController
      count: itemCount,
      effect: SlideEffect(
        spacing: 10.0,
        dotWidth: 10.0,
        dotHeight: 10.0,
        paintStyle: PaintingStyle.stroke,
        strokeWidth: 1.5,
        dotColor: Theme.of(context).primaryColor,
        activeDotColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
