import 'package:flutter/material.dart';
import 'package:test_project/presentation/common/ui/page_view_indicator.dart';

class Carousel extends StatelessWidget {
  final int itemCount;
  final Widget Function(int) pageBuilder;
  final double aspectRatio;
  final Function(double)? offsetListener;
  final PageController _pageController = PageController(viewportFraction: 0.9, keepPage: true);

  Carousel({
    required this.itemCount,
    required this.pageBuilder,
    this.aspectRatio = 16 / 9,
    this.offsetListener,
    Key? key,
  }) : super(key: key) {
    _pageController.addListener(() {
      offsetListener?.call(_pageController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: aspectRatio,
          child: PageView.builder(
            itemCount: itemCount,
            controller: _pageController,
            itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.all(8),
                child: pageBuilder(index),
              );
            },
          ),
        ),
        PageViewIndicator(
          itemCount: itemCount,
          pageController: _pageController,
        ),
      ],
    );
  }
}
