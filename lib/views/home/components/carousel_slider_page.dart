import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/home_cubit/home_cubit.dart';
import 'package:fas7ny/cubit/home_cubit/home_state.dart';
import 'package:fas7ny/views/details/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getAllBanners();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: Error here
      },
      builder: (context, state) {
        return (state is BannerLoadedState)
            /////// Carousel Slider ////////
            ? CarouselSlider.builder(
                options: CarouselOptions(
                  height: 175,
                  disableCenter: true,
                  aspectRatio: 12 / 9,
                  viewportFraction: 0.85,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 7),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  onPageChanged: (int, CarouselPageChangedReason) {},
                  scrollDirection: Axis.horizontal,
                ),
                itemCount: state.banners.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: GestureDetector(
                      onTap: () {
                        print(itemIndex);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                place: state.banners[itemIndex].place)));
                      },
                      child: Stack(
                        children: [
                          /////// Carousel Image ////////
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: FancyShimmerImage(
                                shimmerBaseColor: MyColors.myGrey,
                                shimmerHighlightColor:
                                    MyColors.myDarkGrey.withOpacity(0.20),
                                shimmerBackColor: MyColors.myWhite,
                                boxFit: BoxFit.fitWidth,
                                imageUrl:
                                    state.banners[itemIndex].bannerImage.url),
                          ),
                          /////// Carousel Title ////////
                          Positioned(
                            top: 0,
                            right: 0,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                              ),
                              child: Container(
                                color: MyColors.myDarkGrey.withOpacity(.80),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 5, bottom: 5),
                                  child: Text(state.banners[itemIndex].title,
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.myWhite,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15),
                              ),
                              child: Container(
                                color: MyColors.myDarkGrey.withOpacity(.70),
                                height: 30,
                                width: MediaQuery.of(context).size.height * .4,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5, top: 5),
                                  child: Text(
                                      state.banners[itemIndex].description,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : const CircleLoadingWidget();
      },
    );
  }
}