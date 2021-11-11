import 'package:fas7ny/components/image_viewer.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/models/place_model.dart';
import 'package:flutter/material.dart';

class PlaceImageWidget extends StatelessWidget {
  const PlaceImageWidget({
    Key? key,
    required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    print(place.id);
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

class AppBackBtnWidget extends StatelessWidget {
  const AppBackBtnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                decoration: BoxDecoration(
                    color: MyColors.myWhite,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: MyColors.myGrey,
                          offset: Offset(1.2, 1.2),
                          blurRadius: .30,
                          spreadRadius: .30)
                    ]),
                child: const Center(
                  child: Icon(
                    Icons.close,
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
        color: MyColors.myWhite,
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
          Container(
            height: 17,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: false,
                itemCount: place.perfectTimes.length,
                itemBuilder: (context, index) {
                  return Text(place.perfectTimes[index].period);
                }),
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
  PlaceImagesWidget({
    Key? key,
    required this.place,
  }) : super(key: key);

  final Place place;
  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    collectPlaceImage();

    return SizedBox(
      height: 75,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 8, top: 8),
              child: Container(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ImageViewer(images: images, selectedIndex: index),
                      ),
                    );
                  },
                  child: Hero(
                    tag: images[index],
                    child: Image(
                      image: NetworkImage(images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.myGrey,
                ),
              ),
            );
          }),
    );
  }

  void collectPlaceImage() {
    images.add(place.mainImage.url);
    for (var image in place.images) {
      images.add(image.url);
    }
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
        color: MyColors.myMainColor,
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
