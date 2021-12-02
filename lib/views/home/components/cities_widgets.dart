import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/home_cubit/home_cubit.dart';
import 'package:fas7ny/cubit/home_cubit/home_state.dart';
import 'package:fas7ny/data/web_services/weather.dart';
import 'package:fas7ny/models/city_model.dart';
import 'package:fas7ny/views/places_for_city/places_for_city.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitiesWidget extends StatelessWidget {
  const CitiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getAllCities();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is CityErrorState) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Dialog Title',
            desc: "Cities can't load, Check Internet Connection ... 🔗",
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        }
      },
      builder: (context, state) {
        var allCities = BlocProvider.of<HomeCubit>(context).allCities;
        if (state is CityLoadedState ||
            BlocProvider.of<HomeCubit>(context).allCities.isNotEmpty) {
          return Column(
            children: [
              const TitleWidget(
                titleName: 'Cities',
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 150,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: allCities.length,
                    itemBuilder: (context, index) {
                      return CityCardWidget(
                        city: allCities[index],
                      );
                    }),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}

class CityCardWidget extends StatelessWidget {
  final City city;
  const CityCardWidget({
    Key? key,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlacesForCity(
                        cityName: city.nameEn,
                      )));
        },
        child: Stack(
          children: [
            ///
            ///
            //////////////    Image  /////////////
            Container(
              clipBehavior: Clip.antiAlias,
              height: 150,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: city.image.url,
                placeholder: (context, url) =>
                    Image.asset("assets/images/loading.gif"),
                errorWidget: (context, url, error) =>
                    Image.asset("assets/images/Error.gif"),
              ),
              margin: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * .25,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: MyColors.myGrey,
                      blurRadius: 10,
                      offset: Offset(5, 5))
                ],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
              ),
            ),

            ///
            ///
            //////////////    Temp & Icon  /////////////
            Positioned(
              right: 0,
              top: 0,
              child: FutureBuilder(
                future: WeatherServices().getCurrentWeather(city.nameEn.trim()),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    Map<String, dynamic> data =
                        snapshot.data as Map<String, dynamic>;
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColors.myDarkGrey.withOpacity(.70),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              data["icon"] != null
                                  ? CachedNetworkImage(
                                      imageUrl: imgTempIconUrl +
                                          data["icon"] +
                                          ".png",
                                      height: 25,
                                    )
                                  : const Icon(
                                      Icons.bubble_chart,
                                      color: Colors.white,
                                    ),
                              getTempWidget(data["temp"]),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),

            ///
            ///
            //////////////    Name of City  /////////////
            Positioned(
              bottom: 0,
              left: 0,
              height: 40,
              child: Container(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      city.nameEn,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  )),
                  color: MyColors.myDarkGrey.withOpacity(.70),
                ),
                margin: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * .25,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getTempWidget(temp) {
    if (temp != null) {
      if (double.parse(temp.toString()) > 0.0) {
        return Text(
          temp.toStringAsFixed(0) + " °C",
          style: const TextStyle(color: Colors.white),
        );
      }
    }
    return const Text("");
  }
}
