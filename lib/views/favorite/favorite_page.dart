import 'package:cached_network_image/cached_network_image.dart';
import 'package:fas7ny/components/list_tiles.dart';
import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/user_cubit/user_cubit.dart';
import 'package:fas7ny/models/place_model.dart';
import 'package:fas7ny/views/details/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserCubit>(context).getFavourites();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: MyColors.myMainColor,
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          List<Place> favoritePlaces =
              BlocProvider.of<UserCubit>(context).favoritePlaces;
          if (favoritePlaces.isNotEmpty) {
            return FavPlaceWidget(
              favoritePlaces: favoritePlaces,
            );
          } else if (state is FavoriteLoadingState) {
            return const CircleLoadingWidget();
          } else if (state is FavoriteErrorState) {
            print(state.error);
            return const CircleLoadingWidget();
          }
          ////    Empty Image for no Data
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/images/empty.png"),
                  height: 150,
                ),
                const Text("Add favourite places to see here"),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Text("Explore"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

//  Card Place For Favourite Screen
class FavPlaceWidget extends StatelessWidget {
  final List<Place> favoritePlaces;

  const FavPlaceWidget({Key? key, required this.favoritePlaces})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: favoritePlaces.length,
            //state.places.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(favoritePlaces[index].id),
                onDismissed: (direction) {
                  BlocProvider.of<UserCubit>(context)
                      .deleteFavourite(favoritePlaces[index]);

                  getSnackBar(context, 'Place deleted successfully.');
                },
                direction: DismissDirection.endToStart,
                background: Container(),
                secondaryBackground: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      RotatedBox(
                        quarterTurns: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Delete",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  color: Colors.red,
                ),
                child: GFListTile(
                  //enabled: true,
                  selected: true,
                  padding: EdgeInsets.zero,
                  onLongPress: () {},
                  avatar: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: 85,
                    height: 90,
                    imageUrl: favoritePlaces[index].mainImage.url,
                  ),
                  //title: Text(recommendedPlaces[index].nameEn),
                  titleText: favoritePlaces[index].nameEn,
                  subTitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15,
                        ),
                        Text(favoritePlaces[index].rate.toString() + "/5"),
                      ],
                    ),
                  ),
                  color: MyColors.myGrey.withOpacity(0.40),
                  description: Text(
                    favoritePlaces[index].descriptionEn,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsPlacePage(placeId: favoritePlaces[index].id),
                      ),
                    );
                  },
                ),
              );
            }),
      ],
    );
  }
}
