import 'package:cached_network_image/cached_network_image.dart';
import 'package:fas7ny/components/list_tiles.dart';
import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/home_cubit/home_cubit.dart';
import 'package:fas7ny/cubit/home_cubit/home_state.dart';
import 'package:fas7ny/models/place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getAllRecommendedPlaces();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is PlacesLoadedState) {
          return Column(
            children: [
              const TitleWidget(
                titleName: 'Recommended',
              ),
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: state.places.length,
                  itemBuilder: (context, index) {
                    return GFListTile(
                      onTap: () {},
                      //enabled: true,
                      selected: true,
                      padding: EdgeInsets.zero,
                      onLongPress: () {},
                      avatar: CachedNetworkImage(
                        fit: BoxFit.fill,
                        width: 85,
                        height: 75,
                        imageUrl: state.places[index].mainImage.url,
                      ),
                      // title: Text(state.places[index].nameEn),
                      titleText: state.places[index].nameEn,

                      color: MyColors.myGrey.withOpacity(0.50),
                      description: Text(
                        state.places[index].descriptionEn,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }),
            ],
          );
        }
        return Container();
      },
    );
  }
}
