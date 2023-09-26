import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Home/settings/theme_bottom_sheet.dart';
import 'package:untitled2/my_theme.dart';
import 'package:untitled2/providers/app_config_provider.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Theme",
                style: provider.isDark()
                    ? Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyTheme.whiteColor)
                    : Theme.of(context).textTheme.titleSmall),
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              color: provider.isDark() ? MyTheme.blockDark : MyTheme.whiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.isDark() ? "Dark" : "Light",
                      style: provider.isDark()
                          ? Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: MyTheme.whiteColor)
                          : Theme.of(context).textTheme.titleSmall),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
