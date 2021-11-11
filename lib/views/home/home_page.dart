import 'dart:io';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/views/end_drawer/end_drawer_page.dart';
import 'package:fas7ny/views/favorite/favorite_page.dart';
import 'package:fas7ny/views/search/search_page.dart';
import 'package:fas7ny/views/setting/setting_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/carousel_slider_page.dart';
import 'components/cities_widgets.dart';
import 'components/recommended_widget.dart';
import 'components/yalla_widgets.dart';

///
///
///
//////////   Home Page ---- AppBar + BottomNavigatorBar + which Widget show on main --- ////////
class HomePage extends StatefulWidget {
  int activeIndex = 0;
  final List<Widget> _widgets = [
    const HomeWidgets(),
    SearchPage(),
    const FavoritePage(),
    const SettingPage(),
  ];

  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const EndDrawerAppPage(),
      bottomNavigationBar: appBarWidget(),
      body: widget._widgets.elementAt(widget.activeIndex),
    );
  }

  ///
  ///
  ///
  /// app Bar For Application
  Widget appBarWidget() {
    return ConvexAppBar(
      style: TabStyle.react,
      activeColor: MyColors.myMainColor,
      backgroundColor: MyColors.myWhite,
      color: MyColors.myMainColor,
      items: const [
        TabItem(icon: Icons.home_outlined, title: "Home"),
        TabItem(icon: Icons.search_sharp, title: "Search"),
        TabItem(icon: Icons.favorite_border, title: "Favorite"),
        TabItem(icon: Icons.settings_sharp, title: "Setting")
      ],
      initialActiveIndex: widget.activeIndex,
      onTap: (int i) {
        setState(() {
          widget.activeIndex = i;
        });
      },
    );
  }
}

///
///
///
///////////////  Home Widget //////////////////////////////
class HomeWidgets extends StatelessWidget {
  const HomeWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Platform.isIOS
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppLogoWidget(),
                const CarouselWidget(),
                const SizedBox(
                  height: 10,
                ),
                const CitiesWidget(),
                const YallaNowWidgets(),
                const SizedBox(
                  height: 10,
                ),
                RecommendedWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
