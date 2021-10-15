import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/home_cubit/home_cubit.dart';
import 'package:fas7ny/cubit/home_cubit/home_state.dart';
import 'package:fas7ny/models/city_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitiesWidget extends StatelessWidget {
  const CitiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getAllCities();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(
          titleName: 'Cities',
        ),
        SizedBox(height: 5),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var allCities = context.watch<HomeCubit>().allCities;
            return Container(
              height: 150,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: allCities.length,
                  itemBuilder: (context, index) {
                    return CityCardWidget(
                      city: allCities[index],
                    );
                  }),
            );
          },
        )
      ],
    );
  }
}

class CityCardWidget extends StatelessWidget {
  final City city;
  CityCardWidget({
    Key? key,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 150,
            child: FancyShimmerImage(
                shimmerBaseColor: MyColors.myGrey,
                shimmerHighlightColor: MyColors.myDarkGrey.withOpacity(0.20),
                shimmerBackColor: MyColors.myWhite,
                boxFit: BoxFit.cover,
                imageUrl: city.image.url),
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
                    city.name,
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
    );
  }
}
