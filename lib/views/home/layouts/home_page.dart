import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/views/home/components/carousel_slider_page.dart';
import 'package:fas7ny/views/home/components/cities_widgets.dart';
import 'package:fas7ny/views/home/components/yalla_widgets.dart';
import 'package:fas7ny/views/listview/listview_widget.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: MyColors.mypagge,
        body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AppLogoWidget(),
              SizedBox(
                height: 10,
              ),
              CarouselWidget(),
              SizedBox(
                height: 10,
              ),
              CitiesWidget(),
              YallaNowWidgets(),
              SizedBox(
                height: 10,
              ),
              ListViewWidget(),
            ],
          ),
        ),
      ),
    ));
  }
}
