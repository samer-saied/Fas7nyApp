import 'package:fas7ny/components/shared_widgets.dart';
import 'package:flutter/cupertino.dart';

class YallaNowWidgets extends StatelessWidget {
  const YallaNowWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const TitleWidget(
          titleName: 'Yalla Now !',
        ),
        Row(
          children: const [
            YallaWidget(),
            SelectedWidget(),
          ],
        ),
      ],
    );
  }
}

class YallaWidget extends StatelessWidget {
  const YallaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 150,
        child: const Image(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://images.unsplash.com/photo-1610131042652-42d6f3754c51?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=774&q=80")),
        margin: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width * .45,
        decoration: const BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: MyColors.myGrey,
          //     blurRadius: 10,
          //     offset: Offset(5, 5),
          //   )
          // ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0)),
        ),
      ),
    );
  }
}

class SelectedWidget extends StatelessWidget {
  const SelectedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 150,
        child: const Image(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://images.unsplash.com/photo-1604080584084-0668f36c4df5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=775&q=80")),
        margin: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width * .45,
        decoration: const BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: MyColors.myGrey,
          //     blurRadius: 10,
          //     offset: Offset(5, 5),
          //   )
          // ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0)),
        ),
      ),
    );
  }
}
