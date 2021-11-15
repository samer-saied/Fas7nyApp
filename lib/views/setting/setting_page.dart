import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color pickerColor = MyColors.myMainColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
        backgroundColor: MyColors.myMainColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///
            ///
            /////////////      Langauge    ///////////////////
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const TitleWidget(titleName: "Langauge"),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DropdownButton(
                          isExpanded: true,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? newValue) {},
                          value: "English",
                          items: const <DropdownMenuItem<String>>[
                            DropdownMenuItem<String>(
                              value: "English",
                              child: Text("English"),
                            ),
                            DropdownMenuItem(
                              value: "Arabic",
                              child: Text("Arabic"),
                            )
                          ]),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: MyColors.myGrey.withOpacity(0.70),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
            ),

            ///
            ///
            /////////////      Color    ///////////////////
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: MyColors.myGrey.withOpacity(0.70),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: TitleWidget(
                        titleName: 'Application Color',
                      ),
                    ),
                    ColorPicker(
                      pickerColor: pickerColor,
                      onColorChanged: (Color color) {
                        pickerColor = color;
                      },
                      enableAlpha: false,
                      showLabel: false,
                      paletteType: PaletteType.rgb,
                      pickerAreaHeightPercent: 0.0,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("submit")),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            ),

            ///
            ///
            /////////////      About Me    ///////////////////
            const TitleWidget(titleName: "About Me"),
          ],
        ),
      ),
    );
  }
}
