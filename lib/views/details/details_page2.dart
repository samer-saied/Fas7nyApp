import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/models/place_model.dart';
import 'package:flutter/material.dart';

class DetailsPlacePage extends StatelessWidget {
  final Place place;

  const DetailsPlacePage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mypagge,
      body: Stack(
        children: [
          ImagePlaceWidget(place: place),
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
                      place: place,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImagePlaceWidget extends StatelessWidget {
  const ImagePlaceWidget({
    Key? key,
    required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Image(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .6,
        fit: BoxFit.cover,
        image: NetworkImage(place.mainImage.url),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 5),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                decoration: BoxDecoration(
                  color: MyColors.mypagge,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back,
                    size: 23,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class PlaceDataWidget extends StatelessWidget {
  final Place place;
  const PlaceDataWidget({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(
        top: 30.0,
        left: 20,
        right: 20,
      ),
      // height: 800,
      decoration: BoxDecoration(
        color: MyColors.mypagge,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlaceListTile(
            titleTxt: place.nameEn,
            addressTxt: place.addressEn,
            rateTxt: place.rate.toString(),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Images",
            style: Theme.of(context).textTheme.caption,
          ),
          PlaceImagesWidget(place: place),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Time To Visit",
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            place.seasons.toString(),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Description",
            style: Theme.of(context).textTheme.caption,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(place.descriptionEn),
          ),
        ],
      ),
    );
  }
}

class PlaceImagesWidget extends StatelessWidget {
  const PlaceImagesWidget({
    Key? key,
    required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: place.images.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 8, top: 8),
              child: Container(
                clipBehavior: Clip.antiAlias,
                child: Image(
                  image: NetworkImage(place.images[index].url),
                  fit: BoxFit.cover,
                ),
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.myGoldRGB,
                ),
              ),
            );
          }),
    );
  }
}

class PlaceListTile extends StatelessWidget {
  final String titleTxt;
  final String addressTxt;
  final String rateTxt;

  const PlaceListTile({
    Key? key,
    required this.titleTxt,
    required this.rateTxt,
    required this.addressTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleTxt,
              style: Theme.of(context).textTheme.caption,
            ),
            RateWidget(
              rateTxt: rateTxt,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_pin,
              color: Colors.red,
              size: 16,
            ),
            Expanded(
              child: Text(
                addressTxt,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            )
          ],
        )
      ],
    );
  }
}

class RateWidget extends StatelessWidget {
  final String rateTxt;
  const RateWidget({Key? key, required this.rateTxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      decoration: BoxDecoration(
        color: MyColors.myDarkGoldRGB,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
          padding: const EdgeInsets.only(left: 3, right: 3, top: 2, bottom: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 18,
                color: MyColors.myWhite,
              ),
              Text(
                "$rateTxt/5",
                style: const TextStyle(
                  color: MyColors.myWhite,
                ),
              ),
            ],
          )),
    );
  }
}
