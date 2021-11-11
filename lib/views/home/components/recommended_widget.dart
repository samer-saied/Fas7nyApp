import 'package:cached_network_image/cached_network_image.dart';
import 'package:fas7ny/components/list_tiles.dart';
import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/home_cubit/home_cubit.dart';
import 'package:fas7ny/cubit/home_cubit/home_state.dart';
import 'package:fas7ny/views/details/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedWidget extends StatelessWidget {
  RecommendedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getAllRecommendedPlaces();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var recommendedPlaces =
            BlocProvider.of<HomeCubit>(context).recommendedPlaces;
        if (recommendedPlaces.isNotEmpty) {
          return Column(
            children: [
              const TitleWidget(
                titleName: 'suggested for you',
              ),
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: recommendedPlaces.length,
                  //state.places.length,
                  itemBuilder: (context, index) {
                    return GFListTile(
                      //enabled: true,
                      selected: true,
                      padding: EdgeInsets.zero,
                      onLongPress: () {},
                      avatar: CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: 85,
                        height: 90,
                        imageUrl: recommendedPlaces[index].mainImage.url,
                      ),
                      //title: Text(recommendedPlaces[index].nameEn),
                      titleText: recommendedPlaces[index].nameEn,
                      subTitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.location_pin,
                              color: Colors.red,
                              size: 15,
                            ),
                            Text(recommendedPlaces[index].city),
                            const Spacer(),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                            Text(recommendedPlaces[index].rate.toString() +
                                "/5"),
                          ],
                        ),
                      ),
                      color: MyColors.myGrey.withOpacity(0.40),
                      description: Text(
                        recommendedPlaces[index].descriptionEn,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailsPlacePage(
                                placeId: recommendedPlaces[index].id),
                          ),
                        );
                      },
                    );
                  }),
            ],
          );
        } else if (state is RecomandedLoadingState) {
          return const CircleLoadingWidget();
        }
        return Container();
      },
    );
  }
}
