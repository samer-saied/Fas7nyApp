import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fas7ny/components/list_tiles.dart';
import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/search_cubit/search_cubit.dart';
import 'package:fas7ny/data/repository/search_repository.dart';
import 'package:fas7ny/data/web_services/http_services.dart';
import 'package:fas7ny/views/details/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchRepository(HttpServices())),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: TextFormField(
                cursorColor: MyColors.myWhite,
                autocorrect: false,
                decoration: const InputDecoration(
                    helperStyle: TextStyle(color: MyColors.myDarkGoldRGB),
                    labelStyle: TextStyle(color: MyColors.myDarkGoldRGB),
                    prefixIcon: Icon(
                      Icons.search,
                      color: MyColors.myWhite,
                    ),
                    //  suffixIcon: textEditingController.,
                    hintText: "What do you want to Search?",
                    hintStyle: TextStyle(
                      color: MyColors.myGrey,
                    ),
                    prefixStyle: TextStyle(
                      color: MyColors.myWhite,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    fillColor: MyColors.myWhite),
                style: const TextStyle(
                  color: MyColors.myWhite,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                ),
                controller: textEditingController,
                onFieldSubmitted: (value) {
                  if (value.isEmpty || value.length <= 3) {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.INFO,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Dialog Title',
                      desc: 'Minimim lengh Four caracter',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    ).show();

                    textEditingController.clear();
                  } else {
                    BlocProvider.of<SearchCubit>(context)
                        .getSearchData(textEditingController.text);
                  }
                },
                maxLines: 1,
                cursorHeight: 30,
              ),
              backgroundColor: MyColors.myMainColor,
            ),
            ///////////////////////////////////////////////////////////////////////////
            body: BlocConsumer<SearchCubit, SearchState>(
              listener: (context, state) {
                //////////////////////  implement listener
              },
              builder: (context, state) {
                if (state is SearchLoadedState) {
                  if (state.searchedPlaces.isEmpty ||
                      state.searchedPlaces.isEmpty) {
                    return Center(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              "assets/images/nodata.png",
                              width: MediaQuery.of(context).size.width * 0.50,
                            ),
                            const Text(
                              "Sorry , No Data found ",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.searchedPlaces.length,
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
                          imageUrl: state.searchedPlaces[index].mainImage.url,
                        ),
                        //title: Text(recommendedPlaces[index].nameEn),
                        titleText: state.searchedPlaces[index].nameEn,
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
                              Text(state.searchedPlaces[index].rate.toString() +
                                  "/5"),
                            ],
                          ),
                        ),
                        color: MyColors.myGrey.withOpacity(0.40),
                        description: Text(
                          state.searchedPlaces[index].descriptionEn,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailsPlacePage(
                                  placeId: state.searchedPlaces[index].id),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (state is SearchLoadingState) {
                  // return Center(
                  //   child: Image.asset("assets/images/831.gif"),
                  // );

                  return const CircleLoadingWidget();
                }
                return Center(
                    child: Image.asset(
                  "assets/images/searchImg.png",
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width * .50,
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
