import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/models/place_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Place place;
  const DetailsPage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mypagge,
      body: NestedScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(place.nameEn),
                Text(place.descriptionEn),
                Text("Moods " + place.moods.join(" - ")),
                Text(place.seasons.toString()),
              ],
            ),
          ),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              foregroundColor: Colors.amber,
              elevation: 0,
              floating: true,
              pinned: true,
              // snap: true,
              backgroundColor: MyColors.mypagge,
              expandedHeight: MediaQuery.of(context).size.height * .40,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(place.mainImage.url),
                ),
                centerTitle: true,
                title: Text(
                  place.nameEn.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  tooltip: 'Add new entry',
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ];
        },
      ),
    );
  }
}
