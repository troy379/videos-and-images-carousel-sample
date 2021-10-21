import 'package:flutter/material.dart';
import 'package:test_project/presentation/common/ui/carousel.dart';

class ImagesCarousel extends StatelessWidget {
  final List<String> imageUrls;
  final Function(String) omImageTap;

  const ImagesCarousel({required this.imageUrls, required this.omImageTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Carousel(
      itemCount: imageUrls.length,
      pageBuilder: (index) {
        final image = imageUrls[index];

        return GestureDetector(
          onTap: () => omImageTap(image),
          child: Card(
            elevation: 8,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Image.network(image, fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
