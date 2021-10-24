import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/home_cubit/home_cubit.dart';
import 'package:fas7ny/cubit/home_cubit/home_state.dart';
import 'package:fas7ny/views/details/components/details_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPlacePage extends StatefulWidget {
  final String place;

  const DetailsPlacePage({Key? key, required this.place}) : super(key: key);

  @override
  State<DetailsPlacePage> createState() => _DetailsPlacePageState();
}

class _DetailsPlacePageState extends State<DetailsPlacePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getPlace(placeId: widget.place);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWhite,
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PlaceLoadedState) {
            return Stack(
              children: [
                PlaceImageWidget(place: state.place),
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const AppBarWidget(),
                          SizedBox(
                            width: 5,
                            height: MediaQuery.of(context).size.height * .35,
                          ),
                          PlaceDataWidget(
                            place: state.place,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const CircleLoadingWidget();
          }
        },
      ),
    );
  }
}
