import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/data/local/restart.dart';
import 'package:fas7ny/data/local/shared.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String _selectedLang = 'en';

  @override
  initState() {
    super.initState();

    //////////  Check langauage on sharedpre if null it will be "en" else user selected ///////////////
    SharedSetting().getSetting("language").then((langValue) {
      if (langValue.isEmpty && langValue == "empty" && langValue == null) {
        setState(() {
          _selectedLang = langValue;
        });
      } else {
        setState(() {
          _selectedLang = "en";
        });
      }
    });
  }

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
                child: Row(
                  children: [
                    const TitleWidget(titleName: "Langauge"),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: DropdownButton(
                          isExpanded: false,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? newValue) {
                            SharedSetting()
                                .setSetting("language", newValue.toString());
                            setState(() {
                              _selectedLang = newValue ?? 'en';
                            });
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.NO_HEADER,
                              animType: AnimType.BOTTOMSLIDE,
                              title: 'Warning',
                              desc:
                                  'Change Language will be appled after restart application',
                              btnOkOnPress: () {},
                            ).show();
                            RestartWidget.restartApp(context);
                          },
                          value: _selectedLang,
                          items: const <DropdownMenuItem<String>>[
                            DropdownMenuItem<String>(
                              value: "en",
                              child: Text("English"),
                            ),
                            DropdownMenuItem(
                              value: "ar",
                              child: Text("Arabic"),
                            ),
                            DropdownMenuItem(
                              value: "es",
                              child: Text("Spanish"),
                            ),
                            DropdownMenuItem(
                              value: "ru",
                              child: Text("Russian"),
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
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: MyColors.myGrey.withOpacity(0.70),
            //       borderRadius: const BorderRadius.all(
            //         Radius.circular(25.0),
            //       ),
            //     ),
            //     child: Column(
            //       children: [
            //         const Padding(
            //           padding: EdgeInsets.symmetric(vertical: 8),
            //           child: TitleWidget(
            //             titleName: 'Application Color',
            //           ),
            //         ),
            //         ColorPicker(
            //           pickerColor: pickerColor,
            //           onColorChanged: (Color color) {
            //             pickerColor = color;
            //           },
            //           enableAlpha: false,
            //           showLabel: false,
            //           paletteType: PaletteType.rgb,
            //           pickerAreaHeightPercent: 0.0,
            //         ),
            //         ElevatedButton(
            //             onPressed: () {}, child: const Text("submit")),
            //         const SizedBox(
            //           height: 5,
            //         )
            //       ],
            //     ),
            //   ),
            // ),
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: TitleWidget(
                        titleName: 'About Me',
                      ),
                    ),
                    Text("Samer Saied"),
                    Text("+20 10 10 199 177"),
                    Text("samer.saied02@gmail.com"),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            ),

            ///
            ///
            /////////////      About Me    ///////////////////
          ],
        ),
      ),
    );
  }
}
