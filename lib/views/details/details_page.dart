import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/place_cubit/place_cubit.dart';
import 'package:fas7ny/cubit/user_cubit/user_cubit.dart';
import 'package:fas7ny/models/place_model.dart';
import 'package:fas7ny/views/details/components/details_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPlacePage extends StatelessWidget {
  final String placeId;

  const DetailsPlacePage({
    Key? key,
    required this.placeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PlaceCubit>(context).getPlace(placeId: placeId);
    var favCubit = BlocProvider.of<UserCubit>(context);
    bool isFav = favCubit.checkFavourites(placeId);
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      body: BlocBuilder<PlaceCubit, PlaceState>(
        builder: (context, state) {
          if (state is PlaceLoadedState) {
            Place place = state.place;

            return Stack(
              children: [
                //////////////////   Backgroung Image For Place   //////////////////
                PlaceImageWidget(
                  place: place,
                ),

                //////////////////     Main Screen     //////////////////
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          // White Space Above the details screen
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .45),
                          ),
                          // widget which contain all data for Place and images
                          PlaceDataWidget(
                            place: place,
                          ),
                          const SizedBox(
                            height: 75,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //////////////////      Back Bottom      //////////////////
                const Positioned(
                  child: AppBackBtnWidget(),
                ),
                //////////////////   Bottom Buttons Bar    //////////////////
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 70,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /////////////////  Like   ////////////////
                            BlocBuilder<UserCubit, UserState>(
                                builder: (context, state) {
                              return TextButton(
                                onPressed: () {
                                  if (isFav) {
                                    favCubit.deleteFavourite(place);
                                    isFav = !isFav;
                                  } else {
                                    favCubit.addFavourites(place);
                                    isFav = !isFav;
                                  }

                                  ///////////////////////
                                  ///
                                },
                                style: ButtonStyle(
                                  overlayColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red.withOpacity(.20)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey.withOpacity(0.05)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: BorderSide(
                                            color:
                                                Colors.red.withOpacity(.50))),
                                  ),
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      Size(
                                          MediaQuery.of(context).size.width *
                                              .20,
                                          50)),
                                ),
                                child: isFav
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                              );
                            }),
                            ///////// Spacer between Like & Go //////////
                            const SizedBox(
                              width: 10,
                            ),
                            /////////////////  Go Now   ////////////////
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.white.withOpacity(.20)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        MyColors.myMainColor),
                                fixedSize: MaterialStateProperty.all<Size>(Size(
                                    MediaQuery.of(context).size.width * .70,
                                    50)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                              child: const Text(
                                "Go Now",
                                style: TextStyle(
                                    color: MyColors.myWhite,
                                    fontSize: 20,
                                    fontFamily: "Ubuntu"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: MyColors.myWhite,
                        boxShadow: [
                          BoxShadow(
                            color: MyColors.myGrey.withOpacity(.60),
                            offset: const Offset(-2, -5),
                            spreadRadius: 5,
                            blurRadius: 7.0,
                          )
                        ],
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                    ))
              ],
            );
          }
          return const CircleLoadingWidget();
        },
      ),
    );
  }
}
