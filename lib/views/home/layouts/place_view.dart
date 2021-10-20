import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/place_cubit.dart';
import 'package:fas7ny/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<PlaceCubit>(context).getAllPlaces();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fas7ny"),
        backgroundColor: MyColors.mypagge,
        foregroundColor: MyColors.myGrey,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: BlocBuilder<PlaceCubit, PlaceState>(
        builder: (context, state) {
          if (state is PlaceLoadedState) {
            return ListView.builder(
                itemCount: state.places.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title:
                        // Text(BlocProvider.of<PlaceCubit>(context)
                        //     .allplaces[index]
                        //     .fullName),
                        Text(state.places[index].nameEn.toString()),
                  );
                });
          } else if (state is PlaceLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Text("Something went wrong");
        },
      ),
    );
  }
}
