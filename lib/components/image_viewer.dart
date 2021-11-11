import 'package:carousel_slider/carousel_slider.dart';
import 'package:fas7ny/views/details/components/details_widgets.dart';
import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final List<String> images;
  final int selectedIndex;
  const ImageViewer(
      {Key? key, required this.images, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBackBtnWidget(),
          CarouselSlider.builder(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height - 100,
              disableCenter: true,
              aspectRatio: 12 / 9,
              viewportFraction: 0.85,
              initialPage: selectedIndex,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 7),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (int int, carouselPageChangedReason) {},
              scrollDirection: Axis.horizontal,
            ),
            ///////////// Edit///////////
            itemCount: images.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GestureDetector(
                    onTap: () {},
                    child: Hero(
                      tag: images[itemIndex],
                      child: Image(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(images[itemIndex]),
                      ),
                    )),
              );
            },
          ),
        ],
      ),
    );
  }
}
