import 'package:cached_network_image/cached_network_image.dart';
import 'package:fas7ny/components/list_tiles.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/city_cubit/city_cubit.dart';
import 'package:fas7ny/cubit/city_cubit/city_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlacesForCity extends StatelessWidget {
  final String cityName;
  const PlacesForCity({Key? key, required this.cityName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PlacesCityCubit>(context)
        .getPlacesForCity(cityName: cityName);
    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: MyColors.mypurpleRGB,
      ),
      body: BlocBuilder<PlacesCityCubit, CityState>(
        builder: (context, state) {
          if (state is PlacesCityLoadedState) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: state.placesCity.length,
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
                    imageUrl: state.placesCity[index].mainImage.url,
                  ),
                  // title: Text(state.places[index].nameEn),
                  titleText: state.placesCity[index].nameEn,

                  color: MyColors.myGrey.withOpacity(0.50),
                  description: Text(
                    state.placesCity[index].descriptionEn,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
